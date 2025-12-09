<?php
include("header.php");

$payees = mysqli_query($con, "SELECT DISTINCT supplier_name as ca_name,sup_id FROM manage_supplier WHERE status=1 ORDER BY supplier_name");



$banks = mysqli_query($con, "SELECT ca_id, ca_name FROM acc_chart_of_accounts WHERE ca_group='Cash in Hand' AND ca_id != 44  ORDER BY ca_name ASC");
// $start_date = isset($_GET['start_date']) ? $_GET['start_date'] : date('Y-m-1');
$start_date = isset($_GET['start_date']) ? $_GET['start_date'] : date('Y-m-d', strtotime('-31 days')); // 29 days ago (so total 30 days including today)
$end_date   = isset($_GET['end_date']) ? $_GET['end_date'] : date('Y-m-t');

$start_datetime = $start_date . ' 00:00:00';
$end_datetime = $end_date . ' 23:59:59';

?>

<div class="content-wrapper">
  <div class="container-fluid">
    <div class="main-header">
      <h5>ACCOUNTS | <?php echo $client_name; ?> | CHEQUES</h5>
    </div>

    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-block">
            <div align='right'>

             <form method="get" class="form-inline mb-3">
      <label for="start_date">Start Date:&nbsp;</label>
    <input type="date" name="start_date" class="form-control mr-3" value="<?= htmlspecialchars($start_date) ?>" required>
      <label for="end_date">End Date:&nbsp;</label>
      <input type="date" name="end_date" class="form-control mr-3" value="<?=htmlspecialchars($end_date)?>" required>
      <button type="submit" class="btn btn-primary mr-3">Filter</button>


                <button type="button" class="btn btn-success" onclick="openChequeModal()">+ Write Cheque</button>
                  <button type='button' id="exportButton" filename='<?php echo "Cheque_Payment_".$start_date."_".$end_date; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
    </form>  
              <!-- <button class="btn btn-success" data-toggle="modal" data-target="#chequeModal" onclick="openChequeModal()">+ Write Cheque</button> -->
            </div>
            <hr>
                <table id="example" class="table table-bordered table-striped table-sm">
              <thead class="thead-dark">
                <tr>
                  <th>#</th>
                  <th>Ref No</th>
                  <th>Date</th>
                  <th>Cheque No</th>
                  <th>Paid From Account</th>
                  <th>Paid To</th>
                  <th>Amount</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $count = 1;
                $total_active = 0;
                $cheques = mysqli_query($con, "SELECT c.*, coa.ca_name AS from_account, s.supplier_name
                  FROM acc_cheque c
                  LEFT JOIN acc_chart_of_accounts coa ON c.cr_acc_id = coa.ca_id
                  LEFT JOIN manage_supplier s ON c.supplier_id = s.sup_id
                  WHERE c.ch_date BETWEEN '$start_datetime' AND '$end_datetime'   AND c.location_id = '$location_id'
                  ORDER BY c.ch_id DESC LIMIT 100");

                while ($row = mysqli_fetch_assoc($cheques)) {
                    $is_cancelled = $row['status'] == 0;
                    $row_style = $is_cancelled ? 'class="table-danger cancelled-row"' : '';

                    $ch_id = $row['ch_id'];
                    $posted_accounts = mysqli_query($con, "SELECT d.dr_acc_id, a.ca_name 
                      FROM acc_cheque_detail d 
                      LEFT JOIN acc_chart_of_accounts a ON d.dr_acc_id = a.ca_id
                      WHERE d.ch_id = '$ch_id'");

                    $names = [];
                    while ($pa = mysqli_fetch_assoc($posted_accounts)) {
                        $names[] = $pa['ca_name'];
                    }

                    $supplier_note = ($row['supplier_id'] > 0 && $row['supplier_name']) ? " : " . $row['supplier_name'] : "";
                    $posted_to = count($names) == 1 ? $names[0] . $supplier_note : "- Split -$supplier_note";

                    $total = number_format($row['sub_total'], 2);
                    if (!$is_cancelled) {
                        $total_active += $row['sub_total'];
                    }

                    echo "<tr $row_style>
                          <td align='center'>{$count}</td>
                             <td align='center'>CH{$row['loc_no']}</td>
                          <td>{$row['ch_date']}</td>
                             <td>{$row['cheque_number']}</td>
                          <td>{$row['from_account']}</td>
                       
                          <td>{$posted_to}</td>
                          <td align='right'>{$total}</td>
                          <td align='center'>" . ($row['status'] == 1 ? 'Posted' : 'Cancelled') . "</td>
                          <td align='center'><button class='btn btn-primary btn-sm' style='padding: 2px 8px; font-size: 12px;' onclick='editCheque({$row['ch_id']})'>Edit</button></td>
                        </tr>";
                    $count++;
                }
                ?>
              </tbody>
            </table>

            <div class="text-right font-weight-bold mt-2">
              Total   Payments: <?= number_format($total_active, 2) ?>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="chequeModal" tabindex="-1" role="dialog" aria-labelledby="chequeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document" style=' max-width: 1140px;'> <!-- Correct: modal-xl -->
     
    <form method="post" id="chequeForm" class="processing_form">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="chequeModalLabel">Write Cheque</h5>
          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button> -->
        </div>

        <div class="modal-body">
          <div class="row">
            <div class="col-md-4">
              <div class="form-group">
                <label>Payee</label>
                <select name="payee" id="payee" class="form-control select2_single"  >
                  <option value="">-- Select Payee --</option>
                  <?php while ($p = mysqli_fetch_assoc($payees)) echo "<option value=\"{$p['sup_id']}\">{$p['ca_name']}</option>"; ?>
                </select>
                <input type="hidden" name="location_id" value="<?= $location_id ?>">
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label>Bank Account</label>
                <select name="bank_account" id="bank_account" class="form-control" required>
                  <option value="">-- Select Bank --</option>
                  <?php while ($b = mysqli_fetch_assoc($banks)) echo "<option value=\"{$b['ca_id']}\">{$b['ca_name']}</option>"; ?>
                </select>
              </div>
            </div>
            <div class="col-md-2">
              <div class="form-group">
                <label>Cheque No.</label>
                <input type="text" id="cheque_number" name="cheque_number" class="form-control" required>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label>Date</label>
                <input type="date" name="payment_date" class="form-control" value="<?php echo date('Y-m-d'); ?>" required>
              </div>
            </div>
          </div>
<br>
          <table class="table table-bordered" id="cheque_lines">
            <thead>
              <tr>
                <th width="5%">#</th>
                <th width="25%">Category</th>
                <th>Description</th>
                <th width="15%">Amount</th>
                <th width="5%"></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td><select name="category[]" class="form-control select2_account"><option value=''>-- Select Account --</option></select></td>
                <td><input type="text" name="description[]" class="form-control"></td>
                <td><input style='text-align:right;' type="number" step="0.01" name="amount[]" class="form-control"></td>
                <td><button type="button" class="btn btn-danger btn-sm" onclick="removeRow(this)">&times;</button></td>
              </tr>
            </tbody>
          </table>

          <button type="button" class="btn btn-secondary btn-sm" onclick="addChequeLine()">+ Add Line</button>

          <div class="form-group mt-3">
            <label>Memo</label>
            <textarea name="memo" class="form-control"></textarea>
          </div>

        </div>
        <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-success processing_button">Save Cheque</button>
        </div>
      </div>
    </form>
  </div>
</div>

<script>
$(document).ready(function() {
  loadAccounts();
});

function loadAccounts() {
  $.ajax({
    url: 'ajax/fetch_account_list.php',
    method: 'GET',
    success: function(response) {
      $('.select2_account').each(function() {
        const current = $(this).val();
        $(this).html(response).val(current).trigger('change');
      });
    }
  });
}

 function openChequeModal() {
  // Clear form fields manually instead of form.reset()
//   $('#chequeForm').find("input[type=text], input[type=date], input[type=number], textarea").val('');
$('#chequeForm').find("input[type=text], input[type=number], textarea").val('');
  $('#chequeForm').find("select").val('').trigger('change');

  // Reset lines
  $('#cheque_lines tbody').html(`<tr>
    <td>1</td>
    <td><select style='width:300px;' name='category[]' class='form-control select2_account'><option value=''>-- Select Account --</option></select></td>
    <td><input type='text' name='description[]' class='form-control'></td>
    <td><input type='number' style='text-align:right;' step='0.01' name='amount[]' class='form-control'></td>
    <td><button type='button' class='btn btn-danger btn-sm' onclick='removeRow(this)'>&times;</button></td>
  </tr>`);

  // Load accounts AFTER DOM is updated
  setTimeout(() => {
    loadAccounts();
    $('.select2_account').select2();
  }, 100);
$('#chequeModal').modal('show');
//   $('#chequeModal').modal('show');
}


function addChequeLine() {
  const index = $('#cheque_lines tbody tr').length + 1;
  const row = `<tr>
    <td>${index}</td>
    <td><select name='category[]' class='form-control select2_account'><option value=''>-- Select Account --</option></select></td>
    <td><input type='text' name='description[]' class='form-control'></td>
    <td><input type='number' step='0.01' name='amount[]' class='form-control'></td>
    <td><button type='button' class='btn btn-danger btn-sm' onclick='removeRow(this)'>&times;</button></td>
  </tr>`;
  $('#cheque_lines tbody').append(row);
  loadAccounts();
  //$('.select2_account').last().select2();
      $('.select2_account').last().select2({
      dropdownParent: $('#chequeModal')
      });
}

function removeRow(btn) {
  $(btn).closest('tr').remove();
  $('#cheque_lines tbody tr').each((i, tr) => $(tr).find('td:first').text(i + 1));
}

// function editCheque(id) {
//   alert('Edit cheque ID: ' + id);
// }

$('#chequeForm').on('submit', function(e) {
  e.preventDefault(); // Prevent default submission
  const form = this;
  const formData = new FormData(form);

  fetch('ajax/save_cheque.php', {
    method: 'POST',
    body: formData
  })
  .then(res => res.text())
  .then(data => {
    notify('success', 'Saved', data);
    setTimeout(() => location.reload(), 1000);
  })
  .catch(err => {
    notify('danger', 'Error', err);
  });
});
$('#chequeModal').on('shown.bs.modal', function () {
  $('.select2_account').select2({
    dropdownParent: $('#chequeModal')
  });
});

$(document).ready(function() {
   $('#example').DataTable({
        "pageLength": 50
    });
});


$('#payee').on('change', function () {
  const payeeSelected = $(this).val();
  if (payeeSelected) {
    // Set first row's category to Trade Creditors (ca_id = 9)
    const firstCategory = $('#cheque_lines tbody select.select2_account').first();
    firstCategory.val('9').trigger('change');
  }
});

$('#bank_account').on('change', function () {
  const bankId = $(this).val();
  if (bankId) {
    $.ajax({
      url: 'ajax/get_next_cheque_number.php',
      method: 'GET',
      data: { bank_id: bankId },
      success: function (response) {
        $('#cheque_number').val(response);
      }
    });
  } else {
    $('#cheque_number').val('');
  }
});

</script>

<script>
  //edit cheque 

  function editCheque(ch_id) {
  $.ajax({
    url: 'ajax/get_cheque_details.php',
    method: 'GET',
    data: { ch_id },
    success: function(response) {
      const data = JSON.parse(response);

      if (!data || !data.cheque) {
        notify('danger', 'Error', 'Cheque not found.');
        return;
      }

      const cheque = data.cheque;
      const lines = data.details;
      const isCancelled = cheque.status == 0;

      // Fill form fields
      $('#cheque_number').val(cheque.cheque_number);
      $('#payment_date').val(cheque.ch_date);
      $('#bank_account').val(cheque.cr_acc_id).trigger('change');
      $('#payee').val(cheque.supplier_id).trigger('change');
      $('textarea[name="memo"]').val(cheque.memo);

      // Render lines
      $('#cheque_lines tbody').html('');
      lines.forEach((line, i) => {
        const row = `<tr>
          <td>${i + 1}</td>
          <td><select name='category[]' class='form-control select2_account'><option value=''>-- Select Account --</option></select></td>
          <td><input type='text' name='description[]' class='form-control' value='${line.description}'></td>
          <td><input type='number' style='text-align:right;' step='0.01' name='amount[]' class='form-control' value='${line.amount}'></td>
          <td><button type='button' class='btn btn-danger btn-sm' onclick='removeRow(this)'>&times;</button></td>
        </tr>`;
        $('#cheque_lines tbody').append(row);
      });
      loadAccounts();
      setTimeout(() => {
        $('.select2_account').each((index, el) => {
          $(el).val(lines[index].dr_acc_id).trigger('change');
        });
      }, 150);

      $('#chequeForm').append(`<input type='hidden' name='ch_id' value='${cheque.ch_id}'>`);

      if (isCancelled) {
        $('#chequeForm input, #chequeForm select, #chequeForm textarea').prop('disabled', true);
        $('#chequeForm .modal-footer').hide();
        if (!$('#cancelledAlert').length) {
          $('.modal-body').prepend('<div id="cancelledAlert" class="alert alert-danger">This cheque is cancelled and cannot be edited.</div>');
        }
      } else {
        $('#chequeForm input, #chequeForm select, #chequeForm textarea').prop('disabled', false);
        $('#chequeForm .modal-footer').show();
        $('#cancelledAlert').remove();
        if (!$('#deleteBtn').length) {
          $('.modal-footer').prepend(`<button type="button" id="deleteBtn" class="btn btn-danger mr-auto">Delete</button>`);
          $('#deleteBtn').on('click', function() {
            Swal.fire({
              title: 'Are you sure?',
              text: "This will cancel the cheque.",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#d33',
              confirmButtonText: 'Yes, cancel it!'
            }).then((result) => {
              if (result.isConfirmed) {
                $.post('ajax/delete_cheque.php', { ch_id }, function(resp) {
                  notify('success', 'Cancelled', resp);
                  setTimeout(() => location.reload(), 1200);
                });
              }
            });
          });
        }
      }

      $('#chequeModal').modal('show');
    }
  });
}


  </script>
 


<?php include("footer.php"); ?>