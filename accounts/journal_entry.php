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

$start_date = _normalizeDateToSqlLocal($start_date_input) ?: date('Y-m-d', strtotime('-30 days'));
$end_date   = _normalizeDateToSqlLocal($end_date_input)   ?: date('Y-m-d');

$start_datetime = $start_date . ' 00:00:00';
$end_datetime   = $end_date . ' 23:59:59';

$journals = mysqli_query($con, "
  SELECT * FROM accounts_journal 
  WHERE journal_date BETWEEN '$start_datetime' AND '$end_datetime'  AND location_id = '$location_id' $status_filter
  ORDER BY id DESC LIMIT 100
");

?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h5>Accounts | Journal Entries</h5>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card card-block">
                    <form class="form-inline mb-3" method="get" action="">
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
                        <div class="input-group datepicker-group" style="width:120px;display:inline-flex;">
                            <input type="checkbox" class="form-control" name="show_deleted" value="1"
                                <?= isset($_GET['show_deleted']) && $_GET['show_deleted'] == '1' ? 'checked' : '' ?>>
                        </div>&nbsp;


                        <button type="submit" class="btn btn-primary">Filter</button>
                        <button type="button" class="btn btn-success ml-auto" onclick="openJournalModal()">+ Add
                            Journal</button>
                        <button type='button' id="exportButton"
                            filename='<?php echo "Journal_list_".$start_date."_".$end_date; ?>.xlsx'
                            class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>

                    </form>
                    <hr>
                    <table id="example" class="table table-bordered table-sm">
                        <thead class="thead-dark">
                            <tr>
                                <th width='20px'>#</th>
                                <th width='80px' >Journal Date</th>
                                <th width='80px'>Ref No</th>
                                
                                <th>Memo</th>
                                
                                <th width='100px' >Amount</th>
                                <th width='60px'>Status</th>
                                <th width='80px' >Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
              $count = 1;
              while ($j = mysqli_fetch_assoc($journals)) {
                $style = $j['status'] == 0 ? "class='table-danger cancelled-row'" : "";
                echo "<tr $style>
                  <td>{$count}</td> 
                  <td>{$j['journal_date']}</td>
                  <td align='center'><a class='dropdown-item' href='#' onclick='viewJournal({$j['id']})'>
                  J{$j['loc_no']} </a></td>
                  
                  <td>{$j['memo']}</td> 
                  <td align='right'>".number_format($j['total_credit'], 2)."</td>
                  <td align='center'>".($j['status'] ? 'Posted' : 'Cancelled')."</td>
                  <td>
                    <div class='dropdown'>
                      <button class='btn btn-outline-primary btn-sm dropdown-toggle' type='button' id='act{$j['id']}' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                        <i class='fa fa-cog'></i> Action
                      </button>
                      <div class='dropdown-menu' aria-labelledby='act{$j['id']}'>
                        <a class='dropdown-item' href='#' onclick='viewJournal({$j['id']})'>
                          <i class='fa fa-eye text-info'></i> View Journal
                        </a>
                        <a class='dropdown-item' href='#' onclick='editJournal({$j['id']})'>
                          <i class='fa fa-edit text-primary'></i> Edit Journal
                        </a>";
                  if ($j['status'] == 1) {    
                        echo "<a class='dropdown-item' href='#' onclick='deleteJournal({$j['id']})'>
                          <i class='fa fa-trash text-danger'></i> Cancel Journal
                        </a>";
                    }
                    if($j['status'] == 0) {
                        echo "<a class='dropdown-item' href='#' onclick='RestoreJournal({$j['id']})'>
                          <i class='fa fa-undo text-success'></i> Restore Journal
                        </a>";
                    }
                      echo "</div>
                    </div>
                  </td>
                </tr>";
                $count++;
              }
              ?>
                        </tbody>
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
                                <th style='width:120px;'>VAT</th>
                                <th style='width:120px;'>VAT Value</th>
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
let accountOptions = "";
let contactOptions = "";
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
    loadAccountsOnce(); // <-- call the new function here

    $('#journalModal').modal('show');
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
            `<select name="vat_id[]" class="form-control vat-select" style="width:120px;">${window.vatOptions || ''}</select>`;
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
    <td><input type="number" step="0.01" min="0" name="debit[]" style="width:150px;" class="form-control text-right" oninput="clearOpposite(this, 'credit'); updateTotals(); updateVatValue(this);"></td>
    <td><input type="number" step="0.01" min="0" name="credit[]" style="width:150px;" class="form-control text-right" oninput="clearOpposite(this, 'debit'); updateTotals(); updateVatValue(this);"></td>
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
    $('input[name="debit[]"]').each((i, el) => totalDebit += parseFloat(el.value) || 0);
    $('input[name="credit[]"]').each((i, el) => totalCredit += parseFloat(el.value) || 0);
    $('#total_debit').val(totalDebit.toFixed(2));
    $('#total_credit').val(totalCredit.toFixed(2));
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
    const debit = parseFloat($row.find('input[name="debit[]"]').val()) || 0;
    const credit = parseFloat($row.find('input[name="credit[]"]').val()) || 0;
    const vatId = $row.find('.vat-select').val();
    const rate = window.vatRates && vatId ? (parseFloat(window.vatRates[vatId]) || 0) : 0;
    const vatValue = ((debit + credit) * rate / 100).toFixed(2);
    $row.find('.vat-value').val(vatValue);
}

// Store session-level skip choices and transient suppress flags
window.vatPromptSkip = window.vatPromptSkip || {};
window.vatChangeSuppress = window.vatChangeSuppress || {};

// Save the user's choice to the server
function saveVatUpdate(ca_id, newVatId, dontAsk, answer) {
    $.post('ajax/update_vat_for_account.php', {
        ca_id: ca_id,
        new_vat_id: newVatId,
        user_answer: answer,
        dont_ask: dontAsk
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

    const defaultVat = $ca.find('option:selected').data('vat-id');
    const newVat = $vatSelect.val();
    if (String(defaultVat) === String(newVat)) return; // nothing changed

    // respect programmatic suppress flag
    if (window.vatChangeSuppress[ca_id]) {
        delete window.vatChangeSuppress[ca_id];
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
        const dontAsk = (document.getElementById('swalDontAsk') && document.getElementById('swalDontAsk').checked) ? 1 : 0;
        if (result.isConfirmed) {
            if (dontAsk) window.vatPromptSkip[ca_id] = true;
            saveVatUpdate(ca_id, newVat, dontAsk, 'yes');
        } else {
            // user declined: still notify server and revert to default
            saveVatUpdate(ca_id, newVat, dontAsk, 'no');
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
            setTimeout(() => location.reload(), 800);
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
            $('#viewDate').text(j.journal_date || '');
            $('#viewMemo').text(j.memo || '');

            let tDr = 0,
                tCr = 0;
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
                    const vatValue = ((parseFloat(line.debit_vat) || 0) + (parseFloat(line
                        .credit_vat) || 0)).toFixed(2);
                    vatCols = `<td>${vatName}</td><td class="text-right">${vatValue}</td>`;
                }

                const tr = `
          <tr>
            <td>${idx + 1}</td>
            <td>${acc}</td>
            <td>${desc}</td>
            ${window.isVatRegistered ? vatCols : ''}
            <td class="text-right">${dr.toFixed(2)}</td>
            <td class="text-right">${cr.toFixed(2)}</td>
                        <td>${line.contact_display || ''}</td>
                    </tr>`;
                $tbody.append(tr);
            });

            $('#viewTotalDebit').text(tDr.toFixed(2));
            $('#viewTotalCredit').text(tCr.toFixed(2));
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

    let totalDr = parseFloat($('#total_debit').val()) || 0;
    let totalCr = parseFloat($('#total_credit').val()) || 0;
    if (totalDr === 0 && totalCr === 0) {
    notify('danger', 'Missing Amount', 'Please fill the amount before save.');
    return;
    }
    if (totalDr !== totalCr) {
    notify('danger', 'Mismatch', 'Debit and Credit must balance.');
    return;
    }



    attachProcessingForm();
    const formData = new FormData(this);


    $.ajax({
        url: 'journal/save_journal.php',
        method: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(resp) {
            if (resp.toLowerCase().includes("saved")) {
                notify('success', 'Saved', resp);
                $('#journalModal').modal('hide');
                setTimeout(() => location.reload(), 800);
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
    if (parseFloat(currentInput.value) > 0) {
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
                $row.find('input[name="debit[]"]').val(line.debit);
                $row.find('input[name="credit[]"]').val(line.credit);
                totalDr += parseFloat(line.debit) || 0;
                totalCr += parseFloat(line.credit) || 0;
                // VAT select and value
                if (window.isVatRegistered) {
                    if (line.vat_id) {
                        $row.find('.vat-select').val(String(line.vat_id)).trigger('change');
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
window.isVatRegistered = <?= ($is_vat_registered == 1 ? 'true' : 'false') ?>;
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
                    <div class="col-md-8"><b>Memo:</b> <span id="viewMemo"></span></div>
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
                            <tr>
                                <td colspan="<?php echo ($is_vat_registered == 1) ? '4' : '2'; ?>" class="text-right">
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