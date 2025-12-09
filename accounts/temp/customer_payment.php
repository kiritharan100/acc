<?php
include("header.php");
$banks = mysqli_query($con, "SELECT ca_id, ca_name FROM acc_chart_of_accounts WHERE ca_group='Cash in Hand' ORDER BY ca_name ASC");
$today = date('Y-m-d');
$start_date = isset($_GET['start_date']) ? $_GET['start_date'] : date('Y-m-01', strtotime('-1 month'));
$end_date   = isset($_GET['end_date']) ? $_GET['end_date'] : date('Y-m-t', strtotime('-0 month'));


?>

<div class="content-wrapper">
  <div class="container-fluid">
    <div class="main-header">
      <h4 class="mb-0">Customer Payment</h4>
    </div>

    <div class="card">
      <div class="card-block">
         <form method="get" class="form-inline mb-3">
          <label class="mr-2">From:</label>
          <input type="date" name="start_date" class="form-control mr-3" value="<?= $start_date ?>" required>
          <label class="mr-2">To:</label>
          <input type="date" name="end_date" class="form-control mr-3" value="<?= $end_date ?>" required>
          <button type="submit" class="btn btn-info">Filter</button>
          <button class="btn btn-primary float-right ml-auto" type="button" onclick="openPaymentModal()">New Payment</button>
        </form>
<hr>

         <table  id='example' class="table table-bordered table-hover">
          <thead>
            <tr>
              <th>#</th>
              <th>Receipt No</th>
              <th>Receipt Date</th>
              <th>Customer</th>
              <th>Cheque No</th>
              <th>Amount</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
            $query = "
              SELECT cp.*, c.customer_name 
              FROM acc_customer_payment cp
              LEFT JOIN mange_customer c ON cp.c_id = c.c_id
              WHERE cp.rec_date BETWEEN '$start_date' AND '$end_date' AND location_id = '$location_id'
              ORDER BY cp.rec_date DESC
            ";
            $res = mysqli_query($con, $query);
            $i = 1;
            while ($row = mysqli_fetch_assoc($res)) {
                $rec_amount_formatted = number_format($row['rec_amount'], 2);
              echo "<tr>
                      <td>{$i}</td>
                      <td>{$row['receipt_no']}</td>
                      <td>{$row['rec_date']}</td>
                      <td>{$row['customer_name']}</td>
                      <td align='center'>{$row['cheque_no']}</td>  
                           <td align='right'>{$rec_amount_formatted}</td>
                      <td>
                        <div class='dropdown'>
                          <button class='btn btn-secondary dropdown-toggle btn-sm' type='button' data-toggle='dropdown'>
                            Action
                          </button>
                          <div class='dropdown-menu'>
                           <a class='dropdown-item' href=\"javascript:void(0)\" onclick=\"viewReceipt({$row['cp_id']})\">View</a>
                            <a class='dropdown-item text-danger' href='#'>Cancel</a>
                          </div>
                        </div>
                      </td>
                    </tr>";
              $i++;
            }
            ?>
          </tbody>
        </table>
        <!-- Table for listing customer payments (View/Edit/Delete - to be implemented later) -->
      </div>
    </div>
  </div>
</div>


<!-- View Modal -->

<div class="modal fade" id="viewModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Customer Payment Details</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body" id="viewContent">
        <!-- Content loaded via AJAX -->
      </div>
    </div>
  </div>
</div>


<!-- Payment Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-xl" role="document" style=' max-width: 900px;'>
    <div class="modal-content">
      <form id="paymentForm" class="processing_form">
        <div class="modal-header">
          <h5 class="modal-title">Record Customer Payment</h5>
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        <div class="modal-body">
          <div class="row">

           
            <div class="col-md-4">
              <label>Customer</label><br>
              <select name="customer_id" id="customer_id" class="form-control select2"  style='width:280px;'>
                <option value="">Select Customer</option>
              </select>
            </div>

            <div class="col-md-2">
            <label>Deposit To</label>
            <select name="ca_id" id="bank_account" class="form-control" disabled required>
                <option value="">-- Select Bank --</option>
                <?php
                while ($b = mysqli_fetch_assoc($banks)) {
                $selected = ($b['ca_id'] == 1) ? 'selected' : '';
                echo "<option value=\"{$b['ca_id']}\" $selected>{$b['ca_name']}</option>";
                }
                ?>
            </select>
            </div>

            <div class="col-md-2">
              <label>Receipt Date</label>
              <input type="date" name="rec_date" class="form-control" value="<?= date('Y-m-d') ?>">
            </div>

            <div class="col-md-2">
              <label>Cheque No</label>
              <input type="text" name="cheque_no" class="form-control" value="" required>
              <input type="hidden" name="location_id" value="<?php echo $location_id;?>">
            </div>




          </div>

          <div class="row mt-3">
            <!-- <div class="col-md-6">
             ssssssssssssssss
            </div> -->
            <div class="col-md-6">
              <label>Memo</label>
              <input type="text" name="memo" class="form-control">
            </div>
          </div>

          <div class="row mt-4">
            <div class="col-md-12"> <hr>
              <table class="table table-bordered" id="invoiceTable">
        <thead>
  <tr>
    <th>#</th>
    <th>Invoice #</th>
    <th style='width:100px;'>Invoice Date</th>
    <th>Type</th>
    <th>Supply By</th> 
    <th>Order No</th> 
    <th>Vehicle No</th> 
 
    <th style='width:100px;'>Bill Amount</th>
    <th style='width:100px;'>Amount Due</th>
    <th style='width:150px;'>Pay Amount</th>
  </tr>
</thead>
                <tbody></tbody>
                <tfoot>
                  <tr>
                    <th colspan="9" class="text-right">Total</th>
                    <th><input type="text" name="total_paid" id="total_paid" class="form-control text-right" readonly></th>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>

        <div class="modal-footer">
          <button type="submit" class="btn btn-success processing_button1">Save</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
function viewReceipt(id) {
  $('#viewContent').html('<p class="text-center"><i class="fa fa-spinner fa-spin"></i> Loading...</p>');
  $('#viewModal').modal('show');
  $.get('cus_payment/get_customer_payment_view.php', { id }, function(res) {
    $('#viewContent').html(res);
  });
}
</script>

<script>
  $('#bank_account').on('change', function () {
  const selectedBank = $(this).val();
  const customerId = $('#customer_id').val();

  if (selectedBank == '44' && customerId) {
    // AJAX to get advance balance
    $.post('cus_payment/get_customer_advance.php', { customer_id: customerId }, function (advance) {
      $('#total_paid').val(parseFloat(advance).toFixed(2));
      $('#total_paid').prop('max', parseFloat(advance));
    });
  } else {
    $('#total_paid').val('').removeAttr('max');
    updateTotal();
  }
});





function openPaymentModal() {
  $('#paymentModal').modal('show');
  $('#paymentForm')[0].reset();
  $('#customer_id').val('').trigger('change');
  $('#invoiceTable tbody').html('');
  $('#total_paid').val('0.00');
}

// $('#customer_id').on('select2:select', function (e) {
//   $('#bank_account').prop('disabled', false); // Enable the bank field
// });



$('#customer_id').select2({
  ajax: {
    url: 'cus_payment/fetch_customers_with_outstanding.php',
    dataType: 'json',
    delay: 250,
    processResults: function(data) {
      return { results: data };
    },
    cache: true
  },
  placeholder: 'Select customer',
   dropdownParent: $('#paymentModal')
});


$('#customer_id').on('change', function () {
      $('#bank_account').prop('disabled', false); // Enable the bank field
  const customerId = $(this).val();
  const locationId = <?= json_encode($location_id) ?>;  
  
  
 $.get('cus_payment/fetch_customer_outstanding_bills.php', { c_id: customerId }, function (res) {
  if (res.error) {
    notify('danger', 'Error', res.error);
    $('#invoiceTable tbody').html('');
    return;
  }

  const data = res;
  let html = '', total = 0;

  data.forEach((bill, i) => {
    const rowClass = bill.loc_id != locationId ? 'style="background-color: #f8d7da;"' : '';
    html += `
      <tr ${rowClass}>
        <td><input type="checkbox" class="pay_check" data-index="${i}"></td>
        <td>${bill.invoice_no}<input type="hidden" name="inv_id[]" value="${bill.inv_id}">
        <input type="hidden" name="loc_id[]" value="${bill.loc_id}">
        <input type="hidden" name="inv_type[]" value="${bill.inv_type}"></td>
        <td>${bill.date}</td>
        <td>${bill.inv_type}</td>
        <td>${bill.supply_by || ''}</td>
        <td>${bill.order_no || ''}</td>
        <td>${bill.vehicle_no || ''}</td>
        <td class="text-right">${parseFloat(bill.org_amount).toFixed(2)}</td>
        <td class="text-right">${parseFloat(bill.amount_due).toFixed(2)}</td>
        <td><input type="text" name="amount[]" class="form-control text-right pay_input" data-index="${i}" value=""></td>
      </tr>`;
  });

  $('#invoiceTable tbody').html(html);
  bindInvoiceInputs();
}).fail(function(xhr) {
  notify('danger', 'Server Error', 'Something went wrong while loading customer bills.');
});

  
  
  
  
});





// $('#customer_id').on('change', function() {
//   const customerId = $(this).val();
//   $.get('cus_payment/fetch_customer_outstanding_bills.php', { c_id: customerId }, function(res) {
//     const data = JSON.parse(res);
//     let html = '', total = 0;
//     data.forEach((bill, i) => {
//       html += `
//         <tr>
//           <td><input type="checkbox" class="pay_check" data-index="${i}"></td>
//           <td>${bill.invoice_no}<input type="hidden" name="inv_id[]" value="${bill.inv_id}">
//           <input type="hidden" name="loc_id[]" value="${bill.loc_id}">
//           <input type="hidden" name="inv_type[]" value="${bill.inv_type}"></td>
//           <td>${bill.date}</td>
//           <td>${bill.inv_type}</td>
//           <td>${bill.supply_by || ''}</td>  
//           <td class="text-right">${parseFloat(bill.amount_due).toFixed(2)}</td>
//           <td><input type="text" name="amount[]" class="form-control text-right pay_input" data-index="${i}" value=""></td>
//         </tr>`;
//     });
//     $('#invoiceTable tbody').html(html);
//     bindInvoiceInputs();
//   });
// });

function bindInvoiceInputs() {
  $('.pay_check').on('change', function() {
    const idx = $(this).data('index');
    const amt = parseFloat($(this).closest('tr').find('td:eq(8)').text().replace(/,/g, ''));
    if ($(this).is(':checked')) {
      $(`input.pay_input[data-index='${idx}']`).val(amt.toFixed(2));
    } else {
      $(`input.pay_input[data-index='${idx}']`).val('');
    }
    updateTotal();
  });

  $('.pay_input').on('input', function() {
    updateTotal();
  });
}


function updateTotal() {
  let total = 0;
  $('.pay_input').each(function() {
    const val = parseFloat($(this).val());
    if (!isNaN(val)) total += val;
  });
  $('#total_paid').val(total.toFixed(2));
}
</script>

<script>
$('#paymentForm').on('submit', function(e) {
  e.preventDefault();
const selectedBank = $('#bank_account').val();  
    const totalPaidInput = $('#total_paid');
  const entered = parseFloat(totalPaidInput.val()) || 0;
  const max = parseFloat(totalPaidInput.prop('max')) || 0;
    if (selectedBank == '44' && entered > max) {
      
    notify('danger', 'Validation Error', `Entered amount (${entered.toFixed(2)}) exceeds available advance (${max.toFixed(2)}).`);
  $('.processing_button1').prop('disabled', false).html('Save');
    return;
  }
  
    var total_value = document.getElementById('total_paid').value;
if (total_value === '' || parseFloat(total_value) === 0) {
  notify('danger', 'Validation Error', 'Check advance amount or issue in total value. Close and resubmit this modal.');
  return;
}


  const form = $(this);
  const button = form.find('.processing_button1');
  button.prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Saving...');

  $.ajax({
    type: 'POST',
    url: 'cus_payment/save_customer_payment.php',
    data: form.serialize(),
    dataType: 'json',
    success: function(res) {
      if (res.status === 'success') {
        notify('success', 'Success', res.message);
        $('#paymentModal').modal('hide');
        setTimeout(() => location.reload(), 1000);
      } else {
        notify('danger', 'Error', res.message);
      }
    },
    error: function(xhr) {
      notify('danger', 'Server Error', 'Could not process the request.');
    },
    complete: function() {
      button.prop('disabled', false).html('Save');
    }
  });
});
</script>



<?php include("footer.php"); ?>
