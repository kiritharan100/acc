<?php
include 'header.php';
$day_end_id = $_REQUEST['serial']; 
$location_id = $location_id;
$user_id = $user_id;

$date_today = date('Y-m-d');
$first_day_of_month = date('Y-m-01');

// Date filter
$start_date = isset($_GET['start_date']) ? $_GET['start_date'] : $first_day_of_month;
$end_date   = isset($_GET['end_date']) ? $_GET['end_date'] : $date_today;

$start_datetime = $start_date . ' 00:00:00';
$end_datetime   = $end_date . ' 23:59:59';

// Get fuel products
$product_q = mysqli_query($con, "SELECT p_id, p_name, vat_rate FROM product_master WHERE status = 1 AND p_cat = 'Fuel'");

// Get suppliers
$supplier_q = mysqli_query($con, "SELECT sup_id, supplier_name FROM manage_supplier WHERE status = 1");

// Get purchases

if(isset($_REQUEST['serial'])){

  $purchase_q = mysqli_query($con, "
  SELECT f.*, s.supplier_name, p.p_name
  FROM fuel_purchase_master f
  JOIN manage_supplier s ON f.supplier_id = s.sup_id
  JOIN product_master p ON f.p_id = p.p_id
  WHERE f.location_id = $location_id
    AND f.day_end = $day_end_id
  ORDER BY f.pur_id DESC
");


} else {
$purchase_q = mysqli_query($con, "
  SELECT f.*, s.supplier_name, p.p_name
  FROM fuel_purchase_master f
  JOIN manage_supplier s ON f.supplier_id = s.sup_id
  JOIN product_master p ON f.p_id = p.p_id
  WHERE f.location_id = $location_id
    AND f.purchase_date BETWEEN '$start_date' AND '$end_date'
  ORDER BY f.pur_id DESC
");
}
// Next `inv_id`
$next_inv_id_q = mysqli_query($con, "SELECT MAX(inv_id) + 1 AS next_inv_id FROM fuel_purchase_master WHERE location_id = $location_id");
$next_inv_id = mysqli_fetch_assoc($next_inv_id_q)['next_inv_id'] ?? 1;
?>
 <br>

<div class="content-wrapper">
  <div class="container-fluid mt-3">
    <h4 class="mb-3">Fuel Purchases</h4>

    <div class="card">
      <div class="card-block">
        <form method="get" class="form-inline mb-3">
                                   <?php if(isset($_REQUEST['serial'])){ echo " <a href='oil_grn_master.php'> <button class='btn btn-success'>Show All  </button></a>";} else { ?>

          <label for="start_date">Start Date:&nbsp;</label>
          <input type="date" name="start_date" class="form-control mr-3" value="<?= htmlspecialchars($start_date) ?>" required>
          <label for="end_date">End Date:&nbsp;</label>
          <input type="date" name="end_date" class="form-control mr-3" value="<?= htmlspecialchars($end_date) ?>" required>
          <button type="submit" class="btn btn-primary mr-2">Filter</button>
          <!-- <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addPurchaseModal">Add Purchase</button> -->
          <?php } ?>
                       <button type='button' id="exportButton" filename='<?php echo "FUEL_PURCHASE_".$start_date."_".$end_date; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>

        </form>
        <hr>

        <div class="table-responsive">
          <table id="example" class="table table-bordered">
            <thead>
              <tr>
                <th>#</th>
                
                <th>Purchase Date</th>
                <th>Invoice No</th>
                <th>Supplier</th>
                <th>Product</th>
                <th>Qty</th>
                <th>Sales Price</th>
                <th>VAT Amount</th>
                <th>Total Invoice</th>
                <th>Day End</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <?php $count = 1;
              $total_purchase = 0;
              while ($row = mysqli_fetch_assoc($purchase_q)):
                $datetime_created = strtotime($row['created_at']);
                $can_cancel = (time() - $datetime_created) <= 43200;
                $is_cancelled = $row['status'] == 0;

                if($row['status'] == '1'){
                    $total_purchase += $row['total_invoice'];
                }

                $row_style = $is_cancelled ? 'class="table-danger cancelled-row"' : '';
                $cancel_button = $is_cancelled
                  ? '<span class="text-danger">Cancelled</span>'
                  : ($can_cancel
                      ? "<button class='btn btn-danger btn-sm py-0 cancelPurchaseBtn' style='padding: 2px 8px; font-size: 12px;'  data-id='{$row['pur_id']}'>Cancel</button>"
                      : '<span class="text-muted">*</span>');
                $amount_display = $is_cancelled
                  ? '<span style="text-decoration: line-through; color: #a94442;">' . number_format($row['total_invoice'], 2) . '</span>'
                  : '<span class="sale-amount" data-value="' . $row['total_invoice'] . '">' . number_format($row['total_invoice'], 2) . '</span>';
              ?>
                <tr <?= $row_style ?>>
                  <td><?= $count++ ?></td>
                  <td><?= date('Y-m-d', strtotime($row['purchase_date'])) ?></td>
                  <td><?= htmlspecialchars($row['Invoice_no']) ?></td>
                  
                  <td><?= htmlspecialchars($row['supplier_name']) ?></td>
                  <td><?= htmlspecialchars($row['p_name']) ?></td>
                  <td align='center'><?= htmlspecialchars($row['quantity']) ?></td>
                  <td  align='center'><?= number_format($row['rate'], 2) ?></td>
                  <td  align='right'><?= number_format($row['vat_amount'], 2) ?></td>
                  <td  align='right' ><?= $amount_display ?></td>
                  <td  align='center'><?= htmlspecialchars($row['day_end']) ?></td>
                  <td  align='center'><?= $cancel_button ?></td>
                </tr>
              <?php endwhile; ?>
            </tbody>
          </table>
          <div align='right'>
            <h3>
               Total Purchase: <?php echo number_format($total_purchase,2); ?>
            </h3>
          </div>        </div>
      </div>
    </div>
  </div>
</div>

<!-- Add Purchase Modal -->
<div class="modal fade" id="addPurchaseModal" tabindex="-1">
  <div class="modal-dialog modal-md"><!-- medium width -->
    <form method="POST" id="purchaseForm">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Add Fuel Purchase</h5>
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>

        <div class="modal-body">
          <input type="hidden" name="inv_id" value="<?= $next_inv_id ?>">
          <input type="hidden" name="location_id" value="<?= $location_id ?>">

          <div class="container-fluid">
            <div class="row mb-2">
              <label class="col-md-4 col-form-label text-right">Purchase Date</label>
              <div class="col-md-8">
                <input type="date" name="purchase_date" value="<?= $date_today ?>" class="form-control" required style="padding:5px" min="<?= date('Y-m-d', strtotime('-2 days')) ?>" max="<?= $date_today ?>">
              </div>
            </div>

            <div class="row mb-2">
              <label class="col-md-4 col-form-label text-right">Invoice Number</label>
              <div class="col-md-8">
                <input type="text" name="invoice_no" class="form-control" required style="padding:5px">
              </div>
            </div>

            <div class="row mb-2">
              <label class="col-md-4 col-form-label text-right">Supplier</label>
              <div class="col-md-8">
                <select name="supplier_id" class="form-control" required style="padding:5px">
                  <?php while ($sup = mysqli_fetch_assoc($supplier_q)): ?>
                    <option value="<?= $sup['sup_id'] ?>" <?= $sup['sup_id'] == 1 ? 'selected' : '' ?>><?= htmlspecialchars($sup['supplier_name']) ?></option>
                  <?php endwhile; ?>
                </select>
              </div>
            </div>

            <div class="row mb-2">
              <label class="col-md-4 col-form-label text-right">Product</label>
              <div class="col-md-8">
                <select name="p_id" class="form-control" id="productSelect" required style="padding:5px">
                  <option value="">Select</option>
                  <?php while ($prod = mysqli_fetch_assoc($product_q)): ?>
                    <option value="<?= $prod['p_id'] ?>" data-vat="<?= $prod['vat_rate'] ?>"><?= htmlspecialchars($prod['p_name']) ?></option>
                  <?php endwhile; ?>
                </select>
              </div>
            </div>

            <div class="row mb-2">
              <label class="col-md-4 col-form-label text-right">Quantity</label>
              <div class="col-md-8">
                <input type="number" name="quantity" step="0.001" class="form-control" required style="padding:5px">
              </div>
            </div>

            <div class="row mb-2">
              <label class="col-md-4 col-form-label text-right">Total Invoice</label>
              <div class="col-md-8">
                <input type="number" name="total_invoice" step="0.01" class="form-control" required id="totalInvoice" style="padding:5px">
              </div>
            </div>

            <div class="row mb-2">
              <label class="col-md-4 col-form-label text-right">VAT Amount (Auto)</label>
              <div class="col-md-8">
                <input type="number" name="vat_amount" step="0.01" class="form-control" id="vatAmount" style="padding:5px">
              </div>
            </div>

            <div class="row mb-2">
              <label class="col-md-4 col-form-label text-right">Sales Price (per unit)</label>
              <div class="col-md-8">
                <input type="number" name="rate" step="0.01" class="form-control" required style="padding:5px">
              </div>
            </div>
          </div> <!-- /.container-fluid -->
        </div>

        <div class="modal-footer">
          <button class="btn btn-primary">Save</button>
          <button class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        </div>
      </div>
    </form>
  </div>
</div>


<!-- Scripts -->
<script>
$(document).ready(function () {
  $('#example').DataTable({ pageLength: 50 });

  const productSelect = document.getElementById('productSelect');
  const totalInvoiceInput = document.getElementById('totalInvoice');
  const vatAmountInput = document.getElementById('vatAmount');

  function calculateVAT() {
    const selected = productSelect.options[productSelect.selectedIndex];
    const vatRate = parseFloat(selected.getAttribute('data-vat')) || 0;
    const totalInvoice = parseFloat(totalInvoiceInput.value) || 0;

    if (vatRate && totalInvoice) {
      const vat = (totalInvoice / (100 + vatRate)) * vatRate;
      vatAmountInput.value = vat.toFixed(2);
    } else {
      vatAmountInput.value = '';
    }
  }

  productSelect.addEventListener('change', calculateVAT);
  totalInvoiceInput.addEventListener('input', calculateVAT);

  $('#purchaseForm').on('submit', function (e) {
    e.preventDefault();
    const formData = new FormData(this);

    fetch('ajax/ajax_add_fuel_purchase.php', {
      method: 'POST',
      body: formData
    })
    .then(res => res.json())
    .then(data => {
      if (data.success) {
        Swal.fire({ icon: 'success', title: 'Saved', text: 'Fuel purchase recorded!', timer: 2000, showConfirmButton: false })
          .then(() => location.reload());
      } else {
        Swal.fire({ icon: 'error', title: 'Error', text: data.error || 'Failed to save' });
      }
    });
  });

  $('.cancelPurchaseBtn').on('click', function () {
    const id = $(this).data('id');
    Swal.fire({
      title: 'Cancel Purchase?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, cancel it!'
    }).then(result => {
      if (result.isConfirmed) {
        fetch('ajax/ajax_cancel_purchase.php', {
          method: 'POST',
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          body: 'pur_id=' + id
        })
        .then(res => res.json())
        .then(data => {
          if (data.success) {
            Swal.fire('Cancelled!', '', 'success').then(() => location.reload());
          } else {
            Swal.fire('Error!', data.error, 'error');
          }
        });
      }
    });
  });
});
</script>

<?php include 'footer.php'; ?>
