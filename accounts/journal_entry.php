<?php include("header.php");

// Normalize incoming filter dates (UI provides DD-MM-YYYY)
function _normalizeDateToSqlLocal($dateStr) {
  $dateStr = trim((string)$dateStr);
  if ($dateStr === '') return null;
  $dt = DateTime::createFromFormat('d-m-Y', $dateStr);
  if ($dt instanceof DateTime) return $dt->format('Y-m-d');
  $dt = DateTime::createFromFormat('d/m/Y', $dateStr);
  if ($dt instanceof DateTime) return $dt->format('Y-m-d');
  $ts = strtotime($dateStr);
  return $ts ? date('Y-m-d', $ts) : null;
}

$start_date_input = save_date($_GET['start_date'] ?? '');
$end_date_input   = save_date($_GET['end_date'] ?? '');
$show_deleted = isset($_GET['show_deleted']) && $_GET['show_deleted'] == '1';
    if($show_deleted == 1) {
    $status_filter = "AND status = 0";
    } else {
      $status_filter = "AND status = 1";
    }  

$periods = get_accounting_periods($con, $location_id);
$latest_period = $periods[0] ?? null;
$period_cookie = get_period_cookie_selection($location_id);

$start_date = _normalizeDateToSqlLocal($start_date_input);
$end_date   = _normalizeDateToSqlLocal($end_date_input);

if (!$start_date && !$end_date && $period_cookie) {
    $cookie_start = _normalizeDateToSqlLocal($period_cookie['start'] ?? '');
    $cookie_end = _normalizeDateToSqlLocal($period_cookie['end'] ?? '');
    if ($cookie_start) {
        $start_date = $cookie_start;
    }
    if ($cookie_end) {
        $end_date = $cookie_end;
    }
}

if (!$start_date && !$end_date && $latest_period) {
    $start_date = date('Y-m-d', strtotime($latest_period['perid_from']));
    $end_date = date('Y-m-d', strtotime($latest_period['period_to']));
}
if (!$start_date) {
    $start_date = date('Y-m-d', strtotime('-30 days'));
}
if (!$end_date) {
    $end_date = date('Y-m-d');
}

$start_datetime = $start_date . ' 00:00:00';
$end_datetime   = $end_date . ' 23:59:59';

$transaction_date_cookie = '';
if (!empty($_COOKIE['transaction_date'])) {
    $dt = DateTime::createFromFormat('Y-m-d', $_COOKIE['transaction_date']);
    if ($dt) {
        $transaction_date_cookie = $dt->format('d-m-Y');
    }
}

$journals = mysqli_query($con, "
  SELECT j.*,
    EXISTS(
      SELECT 1 FROM accounts_transaction t 
      WHERE t.source = 'J' AND t.source_id = j.id AND t.vat_filed_status = 1
      LIMIT 1
    ) AS has_filed_vat
  FROM accounts_journal j
  WHERE journal_date BETWEEN '$start_datetime' AND '$end_datetime'  AND location_id = '$location_id' $status_filter
  ORDER BY id DESC LIMIT 100
");

// VAT prompt suppression list (Do Not Ask Again)
$vat_do_not_ask = [];
$vat_request_table_exists = false;
$vatCheck = mysqli_query($con, "SHOW TABLES LIKE 'accounts_vat_change_request'");
if ($vatCheck && mysqli_num_rows($vatCheck) > 0) {
    $vat_request_table_exists = true;
    $vatSupp = mysqli_query($con, "SELECT ca_id FROM accounts_vat_change_request WHERE location_id = '$location_id'");
    if ($vatSupp) {
        while ($row = mysqli_fetch_assoc($vatSupp)) {
            $vat_do_not_ask[] = (int)$row['ca_id'];
        }
    }
}

$period_select_value = 'custom';
$cookie_selection = null;
$valid_cookie_selection = false;
if ($period_cookie && empty($start_date_input) && empty($end_date_input)) {
    $cookie_selection = $period_cookie['selection'] ?? null;
}
if ($cookie_selection === 'custom' || $cookie_selection === 'current') {
    $valid_cookie_selection = true;
}
if ($cookie_selection && !$valid_cookie_selection) {
    foreach ($periods as $p) {
        if ($cookie_selection === 'period_' . $p['id']) {
            $valid_cookie_selection = true;
            break;
        }
    }
}
if ($valid_cookie_selection && $cookie_selection) {
    $period_select_value = $cookie_selection;
} else {
    if ($latest_period && empty($start_date_input) && empty($end_date_input)) {
        $period_select_value = 'current';
    }
    foreach ($periods as $idx => $p) {
        $p_start = date('Y-m-d', strtotime($p['perid_from']));
        $p_end = date('Y-m-d', strtotime($p['period_to']));
        if ($p_start === $start_date && $p_end === $end_date) {
            $period_select_value = ($idx === 0) ? 'current' : 'period_' . $p['id'];
            break;
        }
    }
}

?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h5>Accounts | Journal Entries</h5>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card card-block">
                    <form id="journalFilterForm" class="form-inline mb-3" method="get" action="">
                        <label>Period</label>&nbsp;
                        <div class="input-group datepicker-group" style="width:240px;display:inline-flex;">
                            <select id="accountingPeriodSelect" class="form-control">
                                <?php
                                $custom_start = $latest_period ? date('d-m-Y', strtotime($latest_period['perid_from'])) : '';
                                $custom_end = $latest_period ? date('d-m-Y', strtotime($latest_period['period_to'])) : '';
                                ?>
                                <option value="custom" data-start="<?= htmlspecialchars($custom_start) ?>"
                                    data-end="<?= htmlspecialchars($custom_end) ?>"
                                    <?= $period_select_value === 'custom' ? 'selected' : '' ?>>
                                    Custom
                                </option>
                                <?php if ($latest_period): ?>
                                <?php
                                $current_label = date('d/m/Y', strtotime($latest_period['perid_from'])) . ' - ' . date('d/m/Y', strtotime($latest_period['period_to']));
                                ?>
                                <option value="current" data-start="<?= htmlspecialchars($custom_start) ?>"
                                    data-end="<?= htmlspecialchars($custom_end) ?>"
                                    <?= $period_select_value === 'current' ? 'selected' : '' ?>>
                                    Current <?= htmlspecialchars($current_label) ?>
                                </option>
                                <?php endif; ?>
                                <?php foreach ($periods as $idx => $p): ?>
                                <?php if ($idx === 0) continue; ?>
                                <?php
                                    $label = date('d/m/Y', strtotime($p['perid_from'])) . ' - ' . date('d/m/Y', strtotime($p['period_to']));
                                    $val = 'period_' . $p['id'];
                                    $p_start = date('d-m-Y', strtotime($p['perid_from']));
                                    $p_end = date('d-m-Y', strtotime($p['period_to']));
                                    ?>
                                <option value="<?= htmlspecialchars($val) ?>"
                                    data-start="<?= htmlspecialchars($p_start) ?>"
                                    data-end="<?= htmlspecialchars($p_end) ?>"
                                    <?= $period_select_value === $val ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($label) ?>
                                </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        &nbsp;&nbsp;
                        <label>Start Date</label>&nbsp;
                        <div class="input-group datepicker-group" style="width:120px;display:inline-flex;">
                            <input type="text" class="form-control date_input" name="start_date"
                                value="<?= date('d-m-Y', strtotime($start_date)) ?>" placeholder="DD-MM-YYYY"
                                maxlength="10">
                        </div>
                        &nbsp;&nbsp;
                        <label>End Date</label>&nbsp;
                        <div class="input-group datepicker-group" style="width:120px;display:inline-flex;">
                            <input type="text" class="form-control date_input" name="end_date"
                                value="<?= date('d-m-Y', strtotime($end_date)) ?>" placeholder="DD-MM-YYYY"
                                maxlength="10">
                        </div>&nbsp;

                        <label>Show Deleted Journal</label>&nbsp;
                        <div class="input-group datepicker-group" style="width:30px;display:inline-flex;">
                            <input type="checkbox" class="form-control" name="show_deleted" value="1"
                                style='width:20px;'
                                <?= isset($_GET['show_deleted']) && $_GET['show_deleted'] == '1' ? 'checked' : '' ?>>
                        </div>&nbsp;


                        <button type="button" class="btn btn-primary ml-auto" onclick="openJournalModal()">+ Add
                            Journal</button>
                        <button type='button' id="exportButton"
                            filename='<?php echo "Journal_list_".$start_date."_".$end_date; ?>.xlsx'
                            class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
                        <button type="button" class="btn btn-primary" onclick="bulkDeleteJournals()">Delete</button>

                    </form>
                    <hr>
                    <table id="example" class="table table-bordered table-sm">
                        <thead class="thead-dark">
                            <tr>
                                <th width='30px'><input type="checkbox" id="selectAllJournals"></th>
                                <th width='20px'>#</th>
                                <th width='80px'>Journal Date</th>
                                <th width='80px'>Ref No</th>

                                <th>Memo</th>

                                <th width='100px'>Amount</th>
                                <th width='60px'>Status</th>
                                <th width='80px'>Action</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Journal Modal -->
<div class="modal fade" id="journalModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-xl" role="document" style=' max-width: 1340px;'>
        <form id="journalForm" class="processing_form">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Journal Entry</h5>
                </div>
                <div class="modal-body">
                    <div id="copyWarning" class="alert alert-warning d-none" role="alert">
                        This is a copy of the selected journal. Saving will create a new transaction.
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-3">
                            <label>Date</label>
                            <div class="input-group datepicker-group">
                                <input type="text" style='width:120px;' name="journal_date"
                                    class="form-control date_input"
                                    value="<?= isset($_COOKIE['transaction_date']) && $_COOKIE['transaction_date'] ? date('d-m-Y', strtotime($_COOKIE['transaction_date'])) : date('d-m-Y') ?>"
                                    placeholder="DD-MM-YYYY" maxlength="10">

                            </div>
                        </div>
                        <div class="col-md-9"><label>Memo</label><input type="text" required name="memo"
                                class="form-control">
                            <input type="hidden" name="location_id" value="<?= $location_id ?>">
                        </div>
                    </div><br>
                    <table class="table table-bordered" id="journal_lines">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Category</th>
                                <th style='width:300px;'>Description</th>
                                <?php if ($is_vat_registered == 1): ?>
                                <th style='width:90px;'>VAT</th>
                                <th style='width:160px;'>VAT Value</th>
                                <?php endif; ?>
                                <th style='width:150px;'>Debit
                                    <?php if ($is_vat_registered == 1){ echo "(With VAT)"; } ?>
                                </th>
                                <th style='width:150px;'>Credit
                                    <?php if ($is_vat_registered == 1){ echo "(With VAT)"; } ?> </th>
                                <th>Contact</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr>
                                <td colspan="<?php echo ($is_vat_registered == 1) ? '5' : '3'; ?>" align="right">
                                    <b>Total</b>
                                </td>
                                <td><input type="text" readonly class="form-control text-right" id="total_debit"></td>
                                <td><input type="text" readonly class="form-control text-right" id="total_credit"></td>

                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="addJournalLine()">+ Add
                        Line</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success processing_button">Save Journal</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
// Style for last saved highlight + totals
const style = document.createElement('style');
style.innerHTML = `
.recent-save { background-color: #B6FCB8 !important; transition: background-color 5s ease; }
.total-row { background-color: #B3C6F2 !important; font-weight: bold; }
.total-row td { font-weight: bold !important; }
`;
document.head.appendChild(style);

let accountOptions = "";
let contactOptions = "";
let lastSavedJournalId = null;

function getPeriodCookieKey() {
    if (!window.currentLocationId) return null;
    return 'acc_period_' + String(window.currentLocationId);
}

function setPeriodCookie(selection, start, end) {
    const key = getPeriodCookieKey();
    if (!key) return;
    const maxAge = 60 * 60 * 24 * 180; // 6 months
    const val = encodeURIComponent(selection || 'custom') + '|' +
        encodeURIComponent(start || '') + '|' + encodeURIComponent(end || '');
    document.cookie = `${key}=${val}; path=/; max-age=${maxAge}`;
}

function saveCurrentPeriodCookie() {
    const selection = $('#accountingPeriodSelect').val() || 'custom';
    const start = $('input[name="start_date"]').val() || '';
    const end = $('input[name="end_date"]').val() || '';
    setPeriodCookie(selection, start, end);
}

function parseAmount(val) {
    if (val === undefined || val === null) return 0;
    const num = parseFloat(String(val).replace(/,/g, ''));
    return isNaN(num) ? 0 : num;
}

function formatAmountField(input) {
    const raw = (input.value || '').trim();
    if (raw === '') {
        input.value = '';
        return;
    }
    const num = parseAmount(raw);
    if (isNaN(num)) {
        input.value = '';
    } else {
        input.value = num.toLocaleString('en-US', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    }
}

function setAmount($input, value) {
    const num = parseAmount(value);
    if (isNaN(num) || num === 0) {
        $input.val('');
        return;
    }
    $input.val(num.toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    }));
}

// Temporarily normalize amount fields (debit/credit/VAT value) for submission, then restore UI values
function normalizeAmountsForSubmit() {
    const backups = [];
    $('.amount-input, .vat-value').each(function() {
        const prev = $(this).val();
        backups.push({
            el: this,
            val: prev
        });
        const raw = (prev || '').trim();
        if (raw === '') {
            $(this).val('');
            return;
        }
        const num = parseAmount(raw);
        if (isNaN(num)) {
            $(this).val('');
        } else {
            $(this).val(num.toFixed(2));
        }
    });
    return function restore() {
        backups.forEach(({
            el,
            val
        }) => $(el).val(val));
    };
}

// DataTable ordering: Journal Date desc
$(function() {
    let periodApplying = false;
    const journalTable = $('#example').DataTable({
        processing: true,
        serverSide: true,
        searching: true,
        lengthMenu: [
            [25, 50, 100, 500],
            [25, 50, 100, 500]
        ],
        pageLength: 25,
        order: [
            [2, 'desc']
        ],
        columnDefs: [{
            orderable: false,
            targets: [0, 7]
        }],
        ajax: {
            url: 'ajax/list_journals.php',
            type: 'POST',
            data: function(d) {
                d.start_date = $('input[name="start_date"]').val();
                d.end_date = $('input[name="end_date"]').val();
                d.show_deleted = $('input[name="show_deleted"]').is(':checked') ? 1 : 0;
            }
        },
        drawCallback: function() {
            $('#selectAllJournals').prop('checked', false);
        },
        createdRow: function(row) {
            const id = $(row).find('.journal-select').val();
            if (lastSavedJournalId && String(id) === String(lastSavedJournalId)) {
                $(row).addClass('recent-save');
                setTimeout(() => $(row).removeClass('recent-save'), 5000);
            }
        }
    });

    $('#selectAllJournals').on('change', function() {
        const checked = $(this).is(':checked');
        $('.journal-select:not(:disabled)').prop('checked', checked);
    });

    function reloadJournalTable() {
        journalTable.ajax.reload();
    }

    $('#journalFilterForm').on('submit', function(e) {
        e.preventDefault();
        reloadJournalTable();
    });

    $('#accountingPeriodSelect').on('change', function() {
        const $opt = $(this).find('option:selected');
        const start = $opt.data('start');
        const end = $opt.data('end');
        if (start) $('input[name="start_date"]').val(start);
        if (end) $('input[name="end_date"]').val(end);
        periodApplying = true;
        $('#journalFilterForm input[name="start_date"]').trigger('change');
        $('#journalFilterForm input[name="end_date"]').trigger('change');
        periodApplying = false;
        saveCurrentPeriodCookie();
    });

    $('#journalFilterForm input[name="start_date"], #journalFilterForm input[name="end_date"]').on(
        'change blur',
        function() {
            if (!periodApplying) {
                $('#accountingPeriodSelect').val('custom');
            }
            saveCurrentPeriodCookie();
            reloadJournalTable();
        }
    );

    saveCurrentPeriodCookie();
    $('#journalFilterForm input[name="show_deleted"]').on('change', reloadJournalTable);

    // Format amount fields on blur/change
    $(document).on('blur', '.amount-input', function() {
        formatAmountField(this);
        updateTotals();
        updateVatValue(this);
    });
    $(document).on('change', '.amount-input', function() {
        formatAmountField(this);
        updateTotals();
        updateVatValue(this);
    });
});
// function openJournalModal() {
//   $('#journalForm')[0].reset();
//   $('#journalForm input[name=id]').remove();
//   $('#journal_lines tbody').html('');
//   addJournalLine(); addJournalLine();
//   loadAccounts();
//   $('#journalModal').modal('show');
// }
function openJournalModal() {
    $('#journalForm')[0].reset();
    $('#journalForm input[name=id]').remove();
    $('#journal_lines tbody').html('');
    $('#copyWarning').addClass('d-none');
    loadAccountsOnce(); // <-- call the new function here

    $('#journalModal').modal('show');
}

function bulkDeleteJournals() {
    const ids = $('.journal-select:checked').map(function() {
        return $(this).val();
    }).get();
    if (ids.length === 0) {
        notify('info', 'No journals selected', 'Please select at least one journal to delete.');
        return;
    }

    Swal.fire({
        title: 'Delete selected journals?',
        html: 'This will cancel the selected journals.<br><small>Note: Filed journals cannot be deleted.</small>',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        confirmButtonText: 'Yes, delete',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (!result.isConfirmed) return;

        const requests = ids.map(id => $.post('journal/delete_journal.php', {
            id
        }));
        $.when.apply($, requests).done(function() {
            notify('success', 'Deleted', 'Selected journals deleted.');
            $('#example').DataTable().ajax.reload();
        }).fail(function() {
            notify('danger', 'Error', 'Failed to delete one or more journals.');
        });
    });
}




function addJournalLine(selectedAccountId = '') {
    const index = $('#journal_lines tbody tr').length + 1;
    let options = '';
    if (accountOptions.trim() === '') {
        options = `<option value="">-- No accounts loaded --</option>`;
    } else {
        const $temp = $('<select>' + accountOptions + '</select>');
        $temp.find('option').each(function() {
            if ($(this).val() == selectedAccountId) {
                $(this).attr('selected', true);
            }
        });
        options = $temp.html();
    }
    let vatDropdown = '';
    let vatValueCell = '';





    if (window.isVatRegistered) {
        vatDropdown =
            `<select name="vat_id[]" class="form-control vat-select" style="width:90px;">${window.vatOptions || ''}</select>`;
        vatValueCell = `<td><input type="text" class="form-control vat-value text-right" readonly value="0.00"></td>`;
    }
    const row = `<tr>
    <td>${index}</td>
    <td>
      <select name="category[]" class="form-control select2_account" style="width:350px;">
        ${options}
      </select>
    </td>
    <td><input type="text" name="description[]" class="form-control"></td>
    ${(window.isVatRegistered ? `<td>${vatDropdown}</td>${vatValueCell}` : '')}
    <td><input type="text" name="debit[]" style="width:150px;" class="form-control text-right amount-input" oninput="clearOpposite(this, 'credit'); updateTotals(); updateVatValue(this);"></td>
    <td><input type="text" name="credit[]" style="width:150px;" class="form-control text-right amount-input" oninput="clearOpposite(this, 'debit'); updateTotals(); updateVatValue(this);"></td>
      <td>
        <select name="contact_id[]" class="form-control select2_contact" style="width:200px;">
          ${contactOptions}
        </select>
      </td>
    <td><button type="button" class="btn btn-danger btn-sm" onclick="$(this).closest('tr').remove();updateTotals();">&times;</button></td>
  </tr>`;
    $('#journal_lines tbody').append(row);
    $('#journal_lines tbody tr:last .select2_account').select2({
        dropdownParent: $('#journalModal')
    });
    $('#journal_lines tbody tr:last .select2_contact').select2({
        dropdownParent: $('#journalModal')
    });
    // bind account -> contact sync and apply initial filter
    const $newRow = $('#journal_lines tbody tr:last');
    bindAccountContactSync($newRow);
    filterContactOptionsForRow($newRow);
    if (window.isVatRegistered) {
        $('#journal_lines tbody tr:last .vat-select').val('1');
        $('#journal_lines tbody tr:last .vat-select').on('change', function() {
            const $vat = $(this);
            handleVatChange($vat);
            updateVatValue(this);
        });
    }




}








function updateTotals() {
    let totalDebit = 0,
        totalCredit = 0;
    $('input[name="debit[]"]').each((i, el) => totalDebit += parseAmount(el.value));
    $('input[name="credit[]"]').each((i, el) => totalCredit += parseAmount(el.value));
    $('#total_debit').val(totalDebit.toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    }));
    $('#total_credit').val(totalCredit.toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    }));
}




function loadAccountsOnce() {
    // load accounts -> vat (if needed) -> contacts -> then add initial lines
    $.get('ajax/fetch_account_list.php', function(resp) {
        accountOptions = resp;
        const afterVat = function() {
            $.get('ajax/fetch_contacts.php', function(contactResp) {
                contactOptions = contactResp;
                if (window.isVatRegistered) {
                    addJournalLine();
                    addJournalLine();
                } else {
                    addJournalLine();
                    addJournalLine();
                }
            });
        };
        if (window.isVatRegistered) {
            $.get('ajax/fetch_vat_options.php', function(vatResp) {
                window.vatOptions = vatResp;
                loadVatRatesFromOptions();
                afterVat();
            });
        } else {
            afterVat();
        }
    });

}


// Ensure account and VAT options are loaded before populating edit/view
function ensureOptionsLoaded(callback) {
    const needAccounts = (accountOptions.trim() === '');
    const needVat = (window.isVatRegistered && (!window.vatOptions || (window.vatOptions.trim() === '')));
    const needContacts = (contactOptions.trim() === '');

    if (needAccounts) {
        $.get('ajax/fetch_account_list.php', function(resp) {
            accountOptions = resp;
            if (needVat) {
                $.get('ajax/fetch_vat_options.php', function(vatResp) {
                    window.vatOptions = vatResp;
                    loadVatRatesFromOptions();
                    if (needContacts) {
                        $.get('ajax/fetch_contacts.php', function(contactResp) {
                            contactOptions = contactResp;
                            if (typeof callback === 'function') callback();
                        });
                    } else {
                        if (typeof callback === 'function') callback();
                    }
                });
            } else {
                if (needContacts) {
                    $.get('ajax/fetch_contacts.php', function(contactResp) {
                        contactOptions = contactResp;
                        if (typeof callback === 'function') callback();
                    });
                } else {
                    if (typeof callback === 'function') callback();
                }
            }
        });
    } else if (needVat) {
        $.get('ajax/fetch_vat_options.php', function(vatResp) {
            window.vatOptions = vatResp;
            loadVatRatesFromOptions();
            if (needContacts) {
                $.get('ajax/fetch_contacts.php', function(contactResp) {
                    contactOptions = contactResp;
                    if (typeof callback === 'function') callback();
                });
            } else {
                if (typeof callback === 'function') callback();
            }
        });
    } else {
        if (needContacts) {
            $.get('ajax/fetch_contacts.php', function(contactResp) {
                contactOptions = contactResp;
                if (typeof callback === 'function') callback();
            });
        } else {
            if (typeof callback === 'function') callback();
        }
    }
}

// Load contacts helper
function loadContacts(cb) {
    $.get('ajax/fetch_contacts.php', function(resp) {
        contactOptions = resp || '';
        if (typeof cb === 'function') cb();
    }).fail(function() {
        contactOptions = "<option value=''>-- No contacts --</option>";
        if (typeof cb === 'function') cb();
    });
}

function loadVatRatesFromOptions() {
    window.vatRates = {};
    const $temp = $('<div>' + window.vatOptions + '</div>');
    $temp.find('option').each(function() {
        const vatId = $(this).val();
        const percentage = $(this).data('percentage');
        if (vatId && percentage !== undefined) {
            window.vatRates[vatId] = parseFloat(percentage);
        }
    });
}

function updateVatValue(input) {
    const $row = $(input).closest('tr');
    const debit = parseAmount($row.find('input[name="debit[]"]').val());
    const credit = parseAmount($row.find('input[name="credit[]"]').val());
    const vatId = $row.find('.vat-select').val();
    const rate = window.vatRates && vatId ? (parseFloat(window.vatRates[vatId]) || 0) : 0;
    const vatValue = (debit + credit) * rate / 100;
    if (vatValue === 0) {
        $row.find('.vat-value').val('');
    } else {
        $row.find('.vat-value').val(vatValue.toLocaleString('en-US', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        }));
    }
}

// Set VAT on a row without triggering the change prompt
function setVatSilently($row, caId, vatId) {
    if (!vatId) return;
    window.vatChangeSuppress = window.vatChangeSuppress || {};
    window.vatChangeSuppress[caId] = true;
    $row.find('.vat-select').val(String(vatId));
    try {
        $row.find('.vat-select').trigger('change.select2');
    } catch (e) {
        $row.find('.vat-select').trigger('change');
    }
}

// Store session-level skip choices and transient suppress flags
window.vatPromptSkip = window.vatPromptSkip || {};
window.vatChangeSuppress = window.vatChangeSuppress || {};
window.vatDoNotAskList = window.vatDoNotAskList || {};

// Save the user's choice to the server
function saveVatUpdate(ca_id, newVatId, dontAsk, answer) {
    $.post('ajax/update_vat_for_account.php', {
        ca_id: ca_id,
        new_vat_id: newVatId,
        user_answer: answer,
        dont_ask: dontAsk,
        location_id: window.currentLocationId
    }, function(resp) {
        console.log('VAT update response:', resp);
    }).fail(function() {
        console.error('Failed to send VAT update');
    });
}

// Handle VAT select change for a row: prompt and optionally persist
function handleVatChange($vatSelect) {
    if (!$vatSelect || $vatSelect.length === 0) return;
    const $row = $vatSelect.closest('tr');
    const $ca = $row.find('select[name="category[]"]');
    const ca_id = $ca.val();
    if (!ca_id) return; // no account selected

    const selectedOption = $ca.find('option:selected');
    const nature = (selectedOption.data('coa-nature') || '').toString().toLowerCase();
    const shouldPrompt = (nature === 'income' || nature === 'expenses');
    const defaultVat = selectedOption.data('vat-id');
    const newVat = $vatSelect.val();

    if (!shouldPrompt) {
        return; // only prompt for Income or Expenses accounts
    }

    if (String(defaultVat) === String(newVat)) return; // nothing changed

    // respect programmatic suppress flag
    if (window.vatChangeSuppress[ca_id]) {
        delete window.vatChangeSuppress[ca_id];
        return;
    }

    // Persisted "Do not ask again" for this account/location
    if (window.vatDoNotAskList[ca_id]) {
        window.vatChangeSuppress[ca_id] = true;
        $vatSelect.val(defaultVat);
        try {
            $vatSelect.trigger('change.select2');
        } catch (e) {
            $vatSelect.trigger('change');
        }
        return;
    }

    // if user chose not to be asked for this ca_id in this session, persist silently
    if (window.vatPromptSkip[ca_id]) {
        saveVatUpdate(ca_id, newVat, 1, 'yes');
        return;
    }

    Swal.fire({
        title: 'VAT Category Changed',
        html: 'Do you want to update this VAT category for this Chart of Account?<br><br>' +
            '<label style="font-weight:normal"><input type="checkbox" id="swalDontAsk"> Do not ask again</label>',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
        reverseButtons: true,
        width: 520
    }).then((result) => {
        const dontAsk = (document.getElementById('swalDontAsk') && document.getElementById('swalDontAsk')
            .checked) ? 1 : 0;
        if (result.isConfirmed) {
            if (dontAsk) window.vatPromptSkip[ca_id] = true;
            window.vatDoNotAskList[ca_id] = true;
            saveVatUpdate(ca_id, newVat, dontAsk, 'yes');
        } else {
            // user declined: still notify server and revert to default
            saveVatUpdate(ca_id, newVat, dontAsk, 'no');
            if (dontAsk) window.vatDoNotAskList[ca_id] = true;
            window.vatChangeSuppress[ca_id] = true;
            $vatSelect.val(defaultVat);
            try {
                $vatSelect.trigger('change.select2');
            } catch (e) {
                $vatSelect.trigger('change');
            }
        }
    });
}

function deleteJournal(id) {
    if (!confirm('Are you sure you want to delete this journal? .')) return;
    $.post('journal/delete_journal.php', {
        id
    }, function(resp) {
        if (resp.toLowerCase().includes("cancelled")) {
            notify('success', 'Deleted', resp);
            if ($.fn.DataTable.isDataTable('#example')) {
                $('#example').DataTable().ajax.reload();
            } else {
                setTimeout(() => location.reload(), 800);
            }
        } else {
            notify('danger', 'Error', resp);
        }
    }).fail(function() {
        notify('danger', 'Error', 'Server error occurred.');
    });
}

function RestoreJournal(id) {
    if (!confirm('Are you sure you want to restore this journal? .')) return;
    $.post('journal/restore_journal.php', {
        id
    }, function(resp) {
        if (resp.toLowerCase().includes("restored")) {
            notify('success', 'Restored', resp);
            setTimeout(() => location.reload(), 800);
        } else {
            notify('danger', 'Error', resp);
        }
    }).fail(function() {
        notify('danger', 'Error', 'Server error occurred.');
    });
}

function viewJournal(id) {
    // Clear existing
    const $tbody = $('#viewJournalTable tbody');
    $tbody.empty();
    $('#viewTotalDebit').text('0.00');
    $('#viewTotalCredit').text('0.00');
    $('#viewRefNo').text('');
    $('#viewDate').text('');
    $('#viewMemo').text('');

    $.get('journal/get_journal_details.php', {
        id
    }, function(res) {
        if (res && res.journal) {
            const j = res.journal;
            const lines = res.details || [];

            $('#viewRefNo').text(j.loc_no ? `(J${j.loc_no})` : '');
            $('#viewDate').text(j.journal_date ?
                `${j.journal_date}${j.loc_no ? ' | Journal No: J' + j.loc_no : ''}` : '');
            $('#viewMemo').text(j.memo || '');
            if (j.pdf_url) {
                $('#viewJournalPdf').attr('href', j.pdf_url).removeClass('disabled');
            } else {
                $('#viewJournalPdf').attr('href', '#').addClass('disabled');
            }

            let tDr = 0,
                tCr = 0;
            const fmt = (val) => {
                const num = parseFloat(val);
                if (!num || num === 0) return '';
                return num.toLocaleString('en-US', {
                    minimumFractionDigits: 2,
                    maximumFractionDigits: 2
                });
            };
            lines.forEach((line, idx) => {
                const acc = line.account_name || line.ca_id;
                const desc = line.description || '';
                const dr = parseFloat(line.debit) || 0;
                const cr = parseFloat(line.credit) || 0;
                tDr += dr;
                tCr += cr;

                let vatCols = '';
                if (window.isVatRegistered) {
                    const vatName = line.vat_name ?
                        `${line.vat_name}${line.vat_percentage ? ' ('+line.vat_percentage+'%)' : ''}` :
                        '-';
                    const vatValue = (parseFloat(line.debit_vat) || 0) + (parseFloat(line.credit_vat) ||
                        0);
                    vatCols = `<td>${vatName}</td><td class="text-right">${fmt(vatValue)}</td>`;
                }

                const tr = `
          <tr>
            <td>${idx + 1}</td>
            <td>${acc}</td>
            <td>${desc}</td>
            ${window.isVatRegistered ? vatCols : ''}
            <td class="text-right">${fmt(dr)}</td>
            <td class="text-right">${fmt(cr)}</td>
                        <td>${line.contact_display || ''}</td>
                    </tr>`;
                $tbody.append(tr);
            });

            $('#viewTotalDebit').text(fmt(tDr));
            $('#viewTotalCredit').text(fmt(tCr));
            $('#viewJournalModal').modal('show');
        } else {
            notify('danger', 'Error', 'Unable to load journal.');
        }
    }).fail(function() {
        notify('danger', 'Error', 'Unable to load journal.');
    });
}

$('#journalForm').on('submit', function(e) {
    e.preventDefault();

    // Per-row contact validation: if an account requires a contact (Customer/Supplier), ensure contact is selected and matches type
    let invalid = null;
    $('#journal_lines tbody tr').each(function(idx, tr) {
        const $tr = $(tr);

        const accountVal = $tr.find('select[name="category[]"]').val();
        const debit = parseFloat($tr.find('input[name="debit[]"]').val()) || 0;
        const credit = parseFloat($tr.find('input[name="credit[]"]').val()) || 0;

        // Require account when amount entered
        if ((debit > 0 || credit > 0) && (!accountVal || String(accountVal).trim() === '')) {
            invalid = {
                row: idx + 1,
                reason: 'Account is required when amount is entered.'
            };
            return false; // break
        }


        const required = $tr.find('select[name="category[]"] option:selected').data('contact-required');
        const vatId = $tr.find('select[name="category[]"] option:selected').data('vat-id');


        if (required && String(required).trim() !== '') {
            const need = String(required).toLowerCase();
            const $contact = $tr.find('select[name="contact_id[]"]');
            const sel = $contact.val();
            if (!sel) {
                invalid = {
                    row: idx + 1,
                    reason: 'Contact required (' + required + ')'
                };
                return false; // break
            }
            const optType = $contact.find('option:selected').data('contact_type');
            if (!optType || String(optType).toLowerCase() !== need) {
                invalid = {
                    row: idx + 1,
                    reason: 'Selected contact type does not match required type (' + required + ')'
                };
                return false;
            }
        }
    });

    if (invalid) {
        notify('danger', 'Contact Invalid', `Row ${invalid.row}: ${invalid.reason}`);
        return;
    }

    // if ($('#total_debit').val() !== $('#total_credit').val()) {
    //     notify('danger', 'Mismatch', 'Debit and Credit must balance.');
    //     return;
    // }

    let totalDr = parseAmount($('#total_debit').val());
    let totalCr = parseAmount($('#total_credit').val());
    if (totalDr === 0 && totalCr === 0) {
        notify('danger', 'Missing Amount', 'Please fill the amount before save.');
        return;
    }
    if (totalDr !== totalCr) {
        notify('danger', 'Mismatch', 'Debit and Credit must balance.');
        return;
    }



    attachProcessingForm();
    // Normalize amount and VAT fields before send, then restore after building FormData
    const restoreAmounts = normalizeAmountsForSubmit();
    const formData = new FormData(this);
    restoreAmounts();

    $.ajax({
        url: 'journal/save_journal.php',
        method: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(resp) {
            if (resp.toLowerCase().includes("saved")) {
                const parts = resp.split('|');
                lastSavedJournalId = parts[1] ? parts[1].trim() : null;
                notify('success', 'Saved', 'Journal saved');
                $('#journalModal').modal('hide');
                // Refresh table via AJAX instead of full reload
                if ($.fn.DataTable.isDataTable('#example')) {
                    $('#example').DataTable().ajax.reload();
                }
                $('.processing_button').prop('disabled', false).html('Save Journal');
            } else {
                notify('danger', 'Error', resp);
                $('.processing_button').prop('disabled', false).html('Save Journal');
            }
        },
        error: function(xhr) {
            notify('danger', 'Error', 'Server error occurred.');
            $('.processing_button').prop('disabled', false).html('Save Journal');
        }
    });




    //   $.post('ajax/save_journal.php', formData, function(resp) {
    //     notify('success', 'Saved', resp);
    //     setTimeout(() => location.reload(), 1000);
    //   });
});


function clearOpposite(currentInput, targetName) {
    const row = $(currentInput).closest('tr');
    const target = row.find(`input[name="${targetName}[]"]`);
    if (parseAmount(currentInput.value) > 0) {
        target.val('');
    }
}



function editJournal(id) {
    $.get('journal/get_journal_details.php', {
        id
    }, function(res) {
        const data = (typeof res === 'string') ? JSON.parse(res) : res;
        if (!data.journal) {
            notify('danger', 'Error', 'Journal not found.');
            return;
        }

        const j = data.journal;
        const lines = data.details || [];

        // Reset form and open modal
        $('#journalForm')[0].reset();
        $('#journalForm input[name=id]').remove();
        $('#journal_lines tbody').html('');
        $('#copyWarning').addClass('d-none');
        $('input[name="journal_date"]').val(j.journal_date);
        $('input[name="memo"]').val(j.memo);
        $('#journalModal').modal('show');

        ensureOptionsLoaded(function() {
            let totalDr = 0,
                totalCr = 0;
            lines.forEach((line) => {
                addJournalLine(line.ca_id);
                const $row = $('#journal_lines tbody tr').last();
                // Select account and set fields
                $row.find('select[name="category[]"]').val(String(line.ca_id)).trigger(
                    'change');
                $row.find('input[name="description[]"]').val(line.description || '');
                setAmount($row.find('input[name="debit[]"]'), line.debit);
                setAmount($row.find('input[name="credit[]"]'), line.credit);
                totalDr += parseFloat(line.debit) || 0;
                totalCr += parseFloat(line.credit) || 0;
                // VAT select and value
                if (window.isVatRegistered) {
                    if (line.vat_id) {
                        setVatSilently($row, line.ca_id, line.vat_id);
                    }
                    updateVatValue($row.find('input[name="debit[]"]').get(0));
                }
                // Set contact if present
                if (line.contact_id) {
                    // filter contact options for this row first
                    filterContactOptionsForRow($row);
                    $row.find('select[name="contact_id[]"]').val(String(line.contact_id))
                        .trigger('change');
                }
            });
            $('#total_debit').val(totalDr.toFixed(2));
            $('#total_credit').val(totalCr.toFixed(2));

            // Set hidden id
            $('#journalForm').append(`<input type="hidden" name="id" value="${j.id}">`);

            // Enable/disable based on status
            if (j.status == 0) {
                $('#journalForm input, #journalForm select, #journalForm textarea').prop('disabled',
                    true);
                $('#journalForm .modal-footer').hide();
                if (!$('#cancelledAlert').length) {
                    $('.modal-body').prepend(
                        '<div id="cancelledAlert" class="alert alert-danger">This journal is cancelled and cannot be edited.</div>'
                    );
                }
            } else {
                $('#journalForm input, #journalForm select, #journalForm textarea').prop('disabled',
                    false);
                $('#journalForm .modal-footer').show();
                $('#cancelledAlert').remove();
                if (!$('#deleteJournalBtn').length) {
                    $('.modal-footer').prepend(
                        `<button type="button" id="deleteJournalBtn" class="btn btn-danger mr-auto">Delete</button>`
                    );
                    $('#deleteJournalBtn').on('click', function() {
                        Swal.fire({
                            title: 'Are you sure?',
                            text: "This will cancel the journal.",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#d33',
                            confirmButtonText: 'Yes, cancel it!'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.post('journal/delete_journal.php', {
                                    id: j.id
                                }, function(resp) {
                                    notify('success', 'Cancelled', resp);
                                    setTimeout(() => location.reload(), 1200);
                                });
                            }
                        });
                    });
                }
            }
        });
    });
}



function copyJournal(id) {
    $.get('journal/get_journal_details.php', {
        id
    }, function(res) {
        const data = (typeof res === 'string') ? JSON.parse(res) : res;
        if (!data.journal) {
            notify('danger', 'Error', 'Journal not found.');
            return;
        }

        const j = data.journal;
        const lines = data.details || [];

        // Reset form and open modal for copy
        $('#journalForm')[0].reset();
        $('#journalForm input[name=id]').remove();
        $('#journal_lines tbody').html('');
        $('#copyWarning').removeClass('d-none');

        // Use cookie date if available, else original journal date
        const copyDate = window.transactionDateFromCookie && window.transactionDateFromCookie.length > 0 ?
            window.transactionDateFromCookie :
            (j.journal_date || '');
        $('input[name="journal_date"]').val(copyDate);
        $('input[name="memo"]').val(j.memo);
        $('#journalModal').modal('show');

        // Ensure options are loaded before populating lines
        ensureOptionsLoaded(function() {
            let totalDr = 0,
                totalCr = 0;
            lines.forEach((line) => {
                addJournalLine(line.ca_id);
                const $row = $('#journal_lines tbody tr').last();
                // Select account and set fields
                $row.find('select[name="category[]"]').val(String(line.ca_id)).trigger(
                    'change');
                $row.find('input[name="description[]"]').val(line.description || '');
                setAmount($row.find('input[name="debit[]"]'), line.debit);
                setAmount($row.find('input[name="credit[]"]'), line.credit);
                totalDr += parseFloat(line.debit) || 0;
                totalCr += parseFloat(line.credit) || 0;
                // VAT select and value
                if (window.isVatRegistered) {
                    if (line.vat_id) {
                        setVatSilently($row, line.ca_id, line.vat_id);
                    }
                    updateVatValue($row.find('input[name="debit[]"]').get(0));
                }
                // Set contact if present
                if (line.contact_id) {
                    filterContactOptionsForRow($row);
                    $row.find('select[name="contact_id[]"]').val(String(line.contact_id))
                        .trigger('change');
                }
            });
            $('#total_debit').val(totalDr.toFixed(2));
            $('#total_credit').val(totalCr.toFixed(2));

            // Ensure form is editable and no delete/cancel overlays
            $('#journalForm input, #journalForm select, #journalForm textarea').prop('disabled', false);
            $('#journalForm .modal-footer').show();
            $('#cancelledAlert').remove();
            $('#deleteJournalBtn').remove();
        });
    });
}


// Filter contact select options in a row according to account's data-contact-required
function filterContactOptionsForRow($row) {
    const required = $row.find('select[name="category[]"] option:selected').data('contact-required');
    const vatId = $row.find('select[name="category[]"] option:selected').data('vat-id');

    const $contact = $row.find('select[name="contact_id[]"]');


    //based on vat id  change the vat select options as seleted 
    const $vat = $row.find('select[name="vat_id[]"]');
    if (vatId) {
        $vat.val(String(vatId));
        try {
            $vat.trigger('change.select2');
        } catch (e) {}
    }

    // If contactOptions is empty we do nothing (will be handled elsewhere)
    if (!contactOptions) return;

    // Enable all first
    $contact.find('option').prop('disabled', false).show();

    if (!required || required === '' || required === null) {
        // No restriction
        $contact.prop('required', false);
    } else {
        const need = String(required).toLowerCase();
        $contact.prop('required', true);
        $contact.find('option').each(function() {
            const optType = $(this).data('contact_type');
            if (!optType) {
                // hide options without type (like the placeholder)
                $(this).prop('disabled', true).hide();
            } else if (String(optType).toLowerCase() !== need) {
                $(this).prop('disabled', true).hide();
            } else {
                $(this).prop('disabled', false).show();
            }
        });
    }

    // Refresh select2 to reflect disabled/hidden options
    try {
        $contact.trigger('change.select2');
    } catch (e) {}
}

// Called when account select changes
function bindAccountContactSync($row) {
    $row.find('select[name="category[]"]').off('change.contactSync').on('change.contactSync', function() {
        filterContactOptionsForRow($row);
        // clear or reset contact value when account changed
        const $contact = $row.find('select[name="contact_id[]"]');
        $contact.val('');
        try {
            $contact.trigger('change.select2');
        } catch (e) {}
    });
}

$(document).ready(function() {
    // openJournalModal();

});
window.vatDoNotAskList = <?= json_encode((object)array_fill_keys($vat_do_not_ask, true)) ?>;
window.currentLocationId = <?= (int)$location_id ?>;
window.isVatRegistered = <?= ($is_vat_registered == 1 ? 'true' : 'false') ?>;
window.transactionDateFromCookie = "<?= $transaction_date_cookie ?>";
</script>

<!-- View Journal Modal -->
<div class="modal fade" id="viewJournalModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">View Journal <span id="viewRefNo" class="text-muted"></span></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row mb-2">
                    <div class="col-md-4"><b>Date:</b> <span id="viewDate"></span></div>
                    <div class="col-md-5"><b>Memo:</b> <span id="viewMemo"></span></div>
                    <div class="col-md-3 text-right">
                        <a id="viewJournalPdf" href="#" target="_blank" class="btn btn-outline-primary btn-sm">
                            <i class="fa fa-file-pdf-o"></i> PDF
                        </a>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered table-sm" id="viewJournalTable">
                        <thead class="thead-light">
                            <tr>
                                <th>#</th>
                                <th>Account</th>
                                <th>Description</th>
                                <?php if ($is_vat_registered == 1): ?>
                                <th>VAT</th>
                                <th>VAT Value</th>
                                <?php endif; ?>
                                <th class="text-right">Debit</th>
                                <th class="text-right">Credit</th>
                                <th>Contact</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr class="total-row">
                                <td colspan="<?php echo ($is_vat_registered == 1) ? '5' : '3'; ?>" class="text-center">
                                    <b>Total</b>
                                </td>
                                <td class="text-right" id="viewTotalDebit">0.00</td>
                                <td class="text-right" id="viewTotalCredit">0.00</td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<?php include("footer.php"); ?>