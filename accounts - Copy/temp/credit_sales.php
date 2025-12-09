<?php
include 'header.php';
$day_end_id = $_REQUEST['serial'];
$location_id = $location_id; // from session/header
$user_id = $user_id;

// Default date filter: today
$start_date = isset($_GET['start_date']) ? $_GET['start_date'] : date('Y-m-d');
$end_date   = isset($_GET['end_date']) ? $_GET['end_date'] : date('Y-m-d');
$start_datetime = $start_date . ' 00:00:00';
$end_datetime = $end_date . ' 23:59:59';

// Fetch customers for dropdown
$customers_q = mysqli_query($con, "SELECT c_id, customer_name, max_limit FROM mange_customer WHERE status=1 and c_id > 0 ORDER BY customer_name");

// Fetch open shifts for location
$shifts_q = mysqli_query($con, "
    SELECT s.shift_id, o.op_name 
    FROM shed_operator_shift s
    JOIN manage_pump_operator o ON s.operator_id = o.op_id
    WHERE s.location_id = $location_id AND s.open_status = 1
    ORDER BY o.op_name
");

// Fetch today's credit sales filtered by date range

if(isset($_REQUEST['serial'])){
$sales_q = mysqli_query($con, "
    SELECT cs.cs_id, cs.date_time, cs.ref_no ,cs.vehicle_no, cs.total_sales, cs.status, c.customer_name, o.op_name ,cs.inv_id,cs.invoice_no,cs.day_end
    FROM shed_credit_sales cs
    JOIN mange_customer c ON cs.c_id = c.c_id
    LEFT JOIN shed_operator_shift s ON cs.shift_id = s.shift_id
    LEFT JOIN manage_pump_operator o ON s.operator_id = o.op_id
    WHERE cs.location_id = $location_id
      AND cs.day_end = '$day_end_id'
    ORDER BY cs.date_time DESC
"); 
} else {
$sales_q = mysqli_query($con, "
    SELECT cs.cs_id, cs.date_time, cs.ref_no ,cs.vehicle_no, cs.total_sales, cs.status, c.customer_name, o.op_name ,cs.inv_id,cs.invoice_no,cs.day_end
    FROM shed_credit_sales cs
    JOIN mange_customer c ON cs.c_id = c.c_id
    LEFT JOIN shed_operator_shift s ON cs.shift_id = s.shift_id
    LEFT JOIN manage_pump_operator o ON s.operator_id = o.op_id
    WHERE cs.location_id = $location_id
      AND cs.date_time BETWEEN '$start_datetime' AND '$end_datetime'
    ORDER BY cs.date_time DESC
"); 
}

?>

<div class="content-wrapper">
  <div class="container-fluid">

    <div class="main-header">
      <h4>Customer Credit Sales <?php if(isset($_REQUEST['serial'])){ echo $_REQUEST['date'];} ?></h4>
    </div>

    <!-- Filter Form -->

    <div class="card">
            <div class="card-block">

    <form method="get" class="form-inline mb-3">
                               <?php if(isset($_REQUEST['serial'])){ echo " <a href='oil_grn_master.php'> <button class='btn btn-success'>Show All  </button></a>";} else { ?>

      <label for="start_date">Start Date:&nbsp;</label>
      <input type="date" name="start_date" class="form-control mr-3" value="<?=htmlspecialchars($start_date)?>" required>
      <label for="end_date">End Date:&nbsp;</label>
      <input type="date" name="end_date" class="form-control mr-3" value="<?=htmlspecialchars($end_date)?>" required>
      <button type="submit" class="btn btn-primary mr-3">Filter</button>

      <!-- <button type="button" id='addProductRowBtn' class="btn btn-success" data-toggle="modal" data-target="#addCreditSaleModal">
        Add Credit Sale
      </button> -->
<?php } ?>
      <!-- <button type="button" class="btn btn-primary ml-auto" id="operatorSummaryBtn">Operator Summary</button> -->
         <button type='button' id="exportButton" filename='<?php echo "CREDIT_SALES_".$start_date."_".$end_date; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
    </form>
<hr>
    <!-- Credit Sales Table -->
    <div class="table-responsive">
      <!-- <table id="creditSalesTable" class="table table-bordered table-hover" style="width:100%"> -->
      <table id="example" class="table table-bordered table-hover" style="width:100%">
        <thead>
          <tr>
            <th>#</th>
            <th>ID</th>
       
            <th>Date & Time</th>
              <th>Order No</th>
              <th>Invoice No</th>
              <th>Vehicle No</th>
            <th>Customer</th>
          
            <th>Total Sales</th>
            <th>Operator</th>
            <th>Day End</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $count = 1;
           $sum_total = 0;
          while($sale = mysqli_fetch_assoc($sales_q)) {

            if($sale['status'] == 1){ $sum_total += $sale['total_sales']; }
    $is_cancelled = $sale['status'] == 0;
    $row_style = $is_cancelled ? 'class="table-danger cancelled-row"' : '';
    $cancel_button = $is_cancelled
        ? '<span  >Cancelled</span>'
        : "<button class='btn btn-danger btn-sm py-0 cancel-sale-btn' style='padding: 2px 8px; font-size: 12px;' data-sale-id='{$sale['cs_id']}'>Cancel</button>";
  $amount_display = $is_cancelled
    ? '<span style="text-decoration: line-through; color: #a94442;">' . number_format($sale['total_sales'], 2) . '</span>'
    : '<span class="sale-amount" data-value="' . $sale['total_sales'] . '">' . number_format($sale['total_sales'], 2) . '</span>';




            $status_text = $sale['status'] == 1 ? 'Open' : 'Closed';
            echo "<tr $row_style >";
            echo "<td align='center'>{$count}</td>";
               echo "<td align='center'>" . htmlspecialchars($sale['inv_id']) . "</td>";
            echo "<td align='center'>" . date('Y-m-d H:i', strtotime($sale['date_time'])) . "</td>";
            echo "<td align='center'>" . htmlspecialchars($sale['ref_no']) . "</td>";
            echo "<td align='center'>" . htmlspecialchars($sale['invoice_no']) . "</td>";
            echo "<td align='center'>" . htmlspecialchars($sale['vehicle_no']) . "</td>";
             echo "<td>" . htmlspecialchars($sale['customer_name']) . "</td>";
           
                echo "<td align='right'>{$amount_display}</td>";
            // echo "<td align='right'>" . number_format($sale['total_sales'], 2) . "</td>";
            echo "<td>" . htmlspecialchars($sale['op_name'] ?? '') . "</td>";
            // echo "<td>" . $status_text . "</td>";
            echo "<td align='center'>" . htmlspecialchars($sale['day_end']) . "</td>";
                echo "<td align='center'>$cancel_button</td>";
            echo "</tr>";
            $count++;
          }
          ?>
        </tbody>
      </table>
    </div>
    <div align='right'>
      <h4>Total Credit Sales  <?php echo number_format($sum_total, 2); ?></h4>
        </div>


  </div>
  </div>
  </div>
</div>


<div class="modal fade" id="operatorSummaryModal" tabindex="-1" role="dialog" aria-labelledby="operatorSummaryModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="operatorSummaryModalLabel">Operator Wise Summary</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="operatorSummaryContent">
        Loading...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- Add Credit Sale Modal -->
<div class="modal fade" id="addCreditSaleModal" tabindex="-1" role="dialog" aria-labelledby="addCreditSaleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-m" style='min-width: 800px;' role="document">
    <form id="addCreditSaleForm" method="POST" autocomplete="off">
      <input type="hidden" name="action" value="add_credit_sale">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addCreditSaleModalLabel">Add Fuel Order Sales</h5>
          
        </div>
        <div class="modal-body">
<table width='100%'>
    <tr>
        <td   width='25%' align='right'>Customer :</td> 
        <td colspan='2'  >  <select id="customer_id" name="customer_id"  class="form-control" required  style="width: 100%">
                <option value="">Select Customer</option>
                <?php while($customer = mysqli_fetch_assoc($customers_q)) { ?>
                  <option value="<?= $customer['c_id'] ?>" data-maxlimit="<?= $customer['max_limit'] ?>">
                    <?= htmlspecialchars($customer['customer_name']) ?>
                  </option>
                <?php } ?>
              </select>
            </td> 
        
    </tr>
    <tr>
         <td   align='right'>Vehicle Number :</td>  
         <td>   <input type="text" name="vehicle_no" id="vehicle_no" class="form-control" placeholder="Vehicle number" required></td>
          <td width='15%' align='right'>Shift :</td> 
        <td width='30%'><input type="hidden" name="location_id" value="<?= htmlspecialchars($location_id) ?>">
              <select id="shift_id_modal" name="shift_id" class="form-control" required>
                <option value="">Select Shift</option>
                <?php 
                // Reset shifts_q pointer
                mysqli_data_seek($shifts_q, 0);
                while($shift = mysqli_fetch_assoc($shifts_q)) { ?>
                  <option value="<?= $shift['shift_id'] ?>">
                    <?= htmlspecialchars($shift['op_name']) ?>
                  </option>
                <?php } ?>
                <!-- <option value="0">Oil Sales</option> -->
              </select>
        </td> 
    </tr>
    <tr>
      <td colspan='2' align='center'>
<small id="maxLimitHelp" class="form-text text-muted">
  <strong>Max Limit:</strong> <span id="customerMaxLimit" style="color: red; font-size:20px;"><strong>N/A</strong></span>
</small>   
      </td>
      <td   align='right'>Order No :</td> 
      <td>
        <input type="text" name="order_no" id="order_no" class="form-control" placeholder="Order Number" required>
      </td>

                </tr>

                  <tr>
      <td colspan='2' align='center'>
 
      </td>
      <td   align='right'>Invoice No :</td> 
      <td>
        <input type="text" name="invoice_no" id="invoice_no" class="form-control" placeholder="Invoice Number" required>
      </td>

                </tr>
                
</table>
          <div class="form-row">
            <div class="form-group col-md-6">
          </div>

            

           
 

          
          <div id="productsContainer">
            
            <table class="table table-sm table-bordered" id="productsTable">
              <thead>
                <tr>
                  <th style='width:220px;'>Product</th>
                  <th style='width:80px;'>Quantity</th>
                  <th>Rate  </th>
                  <th>Line Total</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody id="productsBody">
                <!-- product rows inserted here -->
              </tbody>
            </table>
            <button type="button" id="addProductRow" class="btn btn-sm btn-secondary mb-2">Add Product</button>
          </div>

          <div class="text-right font-weight-bold">
            Total: <span id="totalSaleAmount">0.00</span>
          </div>



        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary processing">Save Credit Sale</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- Operator Summary Modal -->


<script>
$(document).ready(function(){

  $('#customer_id').change(function() {
    var maxLimit = $(this).find(':selected').data('maxlimit') || 'N/A';
    $('#customerMaxLimit').text(maxLimit);
  });


    $('#shift_id_modal').change(function() {
     addProductRow();
  });

  // Products and price fetch logic
  $('#addProductRow').click(function(){
    addProductRow();
  });

  function addProductRow() {
    $.ajax({
      url: 'ajax_credit_sales/ajax_get_fuel_products.php',
      method: 'GET',
      dataType: 'json',
      success: function(products){
        var options = '<option value="">Select Product</option>';
        products.forEach(function(product){
          options += `<option value="${product.p_id}" data-pcat="${product.p_cat}">${product.p_name}  </option>`;
        });
        var rowId = Date.now();
        var row = `
          <tr data-rowid="${rowId}">
            <td>
              <select name="products[p_id][]" class="form-control product-select" required>
                ${options}
              </select>
            </td>
            <td style='width:120px;'>
              <input type="number" name="products[qty][]" class="form-control qty-input" min="0" step="0.001" required  >
            </td>
            <td>
              <input type="text" style='text-align:right;' readonly name="products[rate][]" class="form-control rate-input" value="0.00" >
            </td>
            <td>
              <input type="text" style='text-align:right;' readonly name="products[line_total][]" class="form-control line-total-input" value="0.00">
            </td>
            <td>
              <button type="button" class="btn btn-danger btn-sm remove-product-row">&times;</button>
            </td>
          </tr>
        `;
        $('#productsBody').append(row);
      }
    });
  }

  // Remove product row
  $('#productsBody').on('click', '.remove-product-row', function(){
    $(this).closest('tr').remove();
    calculateTotal();
  });

  // Fetch price based on product and date
  $('#productsBody').on('change', '.product-select', function(){
    var productId = $(this).val();
    var row = $(this).closest('tr');
    if(productId){
      // Fetch price for product and selected date
      $.ajax({
        url: 'ajax_credit_sales/ajax_get_product_price.php',
        method: 'POST',
        data: { p_id: productId, date: $('#addCreditSaleForm').find('input[name="date"]').val() || '<?=date("Y-m-d")?>' },
        dataType: 'json',
        success: function(res){
          if(res && res.new_price){
            row.find('.rate-input').val(parseFloat(res.new_price).toFixed(2));
                        const rateInput = row.find('.rate-input');
                         if (rateInput.val() !== '0.00') {
                                rateInput.prop('readonly', true);
                            } else {
                                rateInput.prop('readonly', false);
                            }
                        
            updateLineTotal(row);
          } else {
            row.find('.rate-input').val('0.00');
                         const rateInput = row.find('.rate-input');
                        if (rateInput.val() === '0.00') {
                            rateInput.prop('readonly', false);
                        }

            updateLineTotal(row);
          }
        }
      });
    } else {
      row.find('.rate-input').val('0.00');
      updateLineTotal(row);
    }
  });

  // Update line total on qty or rate change
  $('#productsBody').on('input', '.qty-input, .rate-input', function(){
    var row = $(this).closest('tr');
    updateLineTotal(row);
  });

  function updateLineTotal(row){
    var qty = parseFloat(row.find('.qty-input').val()) || 0;
    var rate = parseFloat(row.find('.rate-input').val()) || 0;
    var lineTotal = qty * rate;
    row.find('.line-total-input').val(lineTotal.toFixed(2));
    calculateTotal();
  }

  function calculateTotal(){
    var total = 0;
    $('.line-total-input').each(function(){
      total += parseFloat($(this).val()) || 0;
    });
    $('#totalSaleAmount').text(total.toFixed(2));
  }

  // Submit credit sale form
  $('#addCreditSaleForm').submit(function(e){
    e.preventDefault();
    var formData = $(this).serialize();
    $.ajax({
      url: 'ajax_credit_sales/ajax_add_credit_sale.php',
      type: 'POST',
      data: formData,
                            success: function(response) {
                        if (response.success) {

                            notify('success', 'Credit sale added successfully!'); 
                            
                            setTimeout(function() {
                                  window.location.href = 'credit_sales.php';  // Redirect to credit_sales.php
                              }, 2000);
                        } else if (response.error) {
                            alert('Error saving credit sale: ' + response.error);
                            console.error('Backend error:', response.error);
                        } else {
                            alert('Unexpected response from server.');
                        }
                        },
                        error: function(xhr, status, error) {
                        alert('AJAX error: ' + error);
                        console.error(xhr.responseText);
                        }
    });
  });




 
  


  
    $('#example').DataTable({
        "pageLength": 50
    });
});



$(document).ready(function () {
    $('#operatorSummaryBtn').click(function () {
        $('#operatorSummaryContent').html('Loading...');
        $('#operatorSummaryModal').modal('show');

        $.ajax({
            url: 'ajax_credit_sales/ajax_operator_summary.php',
            type: 'POST',
            data: {
                location_id: <?= $location_id ?>,
                start: '<?= $start_datetime ?>',
                end: '<?= $end_datetime ?>'
            },
            success: function (data) {
                $('#operatorSummaryContent').html(data);
            },
            error: function () {
                $('#operatorSummaryContent').html('<div class="alert alert-danger">Failed to load summary.</div>');
            }
        });
    });
});



//cancel Sales 

 $(document).ready(function () {
    // Handle cancel button click
    $('.cancel-sale-btn').click(function () {
        var saleId = $(this).data('sale-id'); // Get the sale ID from the data attribute

        Swal.fire({
            title: 'Are you sure?',
            text: "You are about to cancel this sale!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, cancel it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'ajax_credit_sales/ajax_cancel_credit_sale.php', // Path to cancel script
                    type: 'POST',
                    data: { sale_id: saleId },
                    success: function(response) {
                        try {
                            var data = JSON.parse(response); // Parse the response
                            if (data.success) {
                                Swal.fire('Cancelled!', 'The credit sale has been cancelled.', 'success'); // Success message
                                setTimeout(function () {
                                    window.location.href = window.location.href; // Reload the page after 2 seconds
                                }, 2000);
                            } else if (data.error) {
                                Swal.fire('Error!', data.error, 'error'); // Show error message
                            }
                        } catch (e) {
                            Swal.fire('Error!', 'There was an issue processing the request. Please try again.', 'error');
                            console.error('Error parsing response:', e);
                        }
                    },
                    error: function(xhr, status, error) {
                        Swal.fire('Error!', 'Unable to cancel the sale. Please try again.', 'error');
                        console.error('AJAX error:', error);
                    }
                });
            }
        });
    });
});



</script>

<?php include 'footer.php'; ?>

<script>
    $(document).ready(function() {
        $('#customer_id').select2({
  dropdownParent: $('#addCreditSaleModal')
});

  });



 document.getElementById('addCreditSaleForm').addEventListener('submit', function(event) {
    const form = this;

    // Validate form
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
      form.classList.add('was-validated');
      return;
    }

    // Get the submit button by class
    const button = form.querySelector('button.processing');
    if (button) {
      button.disabled = true;
      button.innerHTML = 'Please wait <i class="fa fa-gear fa-spin" style="font-size:24px"></i>';
    }
  });
</script>
