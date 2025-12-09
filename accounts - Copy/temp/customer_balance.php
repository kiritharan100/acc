 <?php
 ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }

// Default date or user-selected
$as_at = isset($_GET['as_at']) ? $_GET['as_at'] : date('Y-m-d');
$current_only = isset($_GET['current_station']) && $_GET['current_station'] == '1';

// Customers list (not filtered by location)
$customers = mysqli_query($con, "SELECT c_id, customer_name FROM mange_customer WHERE status = 1 AND c_id > 3 ORDER BY customer_name");

// Function with conditional location filter
function get_balance_as_at($con, $c_id, $as_at, $location_id, $current_only = false) {
    $fuel_filter = $current_only ? "AND location_id = '$location_id'" : "";
    $oil_filter  = $current_only ? "AND location = '$location_id'" : "";

    $fuel = mysqli_query($con, "
        SELECT SUM(total_sales - paid_amount) AS due 
        FROM shed_credit_sales 
        WHERE c_id = $c_id AND status = 1 
        AND (total_sales - paid_amount) > 0 
        AND DATE(date_time) <= '$as_at' 
        $fuel_filter
    ");

    $f_due = mysqli_fetch_assoc($fuel)['due'] ?? 0;

    $oil = mysqli_query($con, "
        SELECT SUM(issue_total - paid_amount) AS due 
        FROM oil_sales_master 
        WHERE to_location = $c_id AND issue_status = 1 
        AND (issue_total - paid_amount) > 0 
        AND DATE(issue_date) <= '$as_at' 
        $oil_filter
    ");

    $o_due = mysqli_fetch_assoc($oil)['due'] ?? 0;

    return floatval($f_due) + floatval($o_due);
}

function get_advance_balance($con, $c_id, $as_at) {
    $q = mysqli_query($con, "
        SELECT SUM(credit - debit) AS advance 
        FROM acc_transaction 
        WHERE ca_id = 44 
          AND cus_id = $c_id 
          AND status = 1 
          AND DATE(t_date) <= '$as_at'
    ");
    return floatval(mysqli_fetch_assoc($q)['advance'] ?? 0);
}
?>

<style>
  .form-inline .form-check-inline {
    display: flex;
    align-items: center;
    margin-right: 15px;
  }
  .form-inline .form-check-inline input[type="checkbox"] {
    width: 18px;
    height: 18px;
    margin-right: 6px;
    accent-color: #007bff;
  }
</style>

<div class="content-wrapper">
  <div class="container-fluid">
    <div class="main-header">
      <h4>Customer Balance Summary <small class="text-muted">as at <?= htmlspecialchars($as_at) ?></small></h4>
    </div>

    <div class="card" style='width:80%;'>
      <div class="card-block table-responsive">
        <form method="get" class="form-inline mb-3">
        <div class="form-check form-check-inline">
            <label for="as_at" class="mr-2">As At:</label>
          <input type="date" id="as_at" name="as_at" class="form-control mr-2" value="<?= htmlspecialchars($as_at) ?>" required>

          
            <input type="checkbox" id="current_station" name="current_station" value="1" <?= $current_only ? 'checked' : '' ?>>
            <label for="current_station" class="form-check-label">Current Station Only</label>
         

          <button type="submit" class="btn btn-primary ml-2">View</button>
          <!--<button type="button" id="exportButton" filename="Customer_Balance_Summary_<?= $as_at ?>.xlsx" class="btn btn-primary ml-2">-->
          <!--  <i class="ti-cloud-down"></i> Export-->
          <!--</button>-->
          <button type="button" onclick="printDiv('print_area')" class="btn btn-danger ml-2">
            <i class="fa fa-print"></i> Print
          </button>
        </form> </div>

        <hr>

        <div id="print_area">
          <h3 style="text-align:center; margin-bottom: 5px;">
            <?= $_SESSION['company'] ?><br>
            <small>Customer Balance Summary as at <?= htmlspecialchars($as_at) ?></small><br>
            <small>Generated on <?= date('Y-m-d') ?></small>
          </h3>

          <table id='example122' class="table table-bordered" style="width:100%; border-collapse: collapse;" border="1">
            <thead style="background:#f0f0f0;">
              <tr>
                <th>SN</th>
                <th>Customer Name</th>
                <th class="text-right" style='width:30%;'>Outstanding Balance</th>
                <th class="text-right">Advance Balance</th>
              </tr>
            </thead>
            <tbody>
              <?php
              $grand_total = 0;
              $grand_advance = 0;
              $sn = 1;
              mysqli_data_seek($customers, 0);
              while ($row = mysqli_fetch_assoc($customers)) {
                  $c_id = $row['c_id'];
                  $outstanding = get_balance_as_at($con, $c_id, $as_at, $location_id, $current_only);
                  $advance = get_advance_balance($con, $c_id, $as_at);
                  if ($outstanding == 0 && $advance == 0) continue;

                  $grand_total += $outstanding;
                  $grand_advance += $advance;
              ?>
              <tr>
                <td align='center'><?= $sn++ ?></td>
                <td><?= htmlspecialchars($row['customer_name']) ?></td>
                <td class="text-right"><?= number_format($outstanding, 2) ?></td>
                <td class="text-right"><?= number_format($advance, 2) ?></td>
              </tr>
              <?php } ?>
            </tbody>
            <tfoot style="font-weight: bold;">
              <tr>
                <td colspan="2" class="text-right">Total</td>
                <td class="text-right"><?= number_format($grand_total, 2) ?></td>
                <td class="text-right"><?= number_format($grand_advance, 2) ?></td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
function printDiv(id) {
  const divContents = document.getElementById(id).innerHTML;
  const win = window.open('', '', 'height=900,width=1200');
  win.document.write('<html><head><title>Print</title>');
  win.document.write(`
    <style>
      @media print {
        .dataTables_length,
        .dataTables_filter,
        .dataTables_info,
        .dataTables_paginate {
          display: none !important;
        }
      }
      body {
        font-family: 'Arial', sans-serif;
        margin: 40px;
        font-size: 14px;
        color: #000;
      }
      table {
        width: 80%;
        border-collapse: collapse;
        margin-top: 20px;
      }
      th {
        background: #f0f0f0;
      }
      td.text-right, th.text-right {
        text-align: right;
      }
      h3 {
        margin-bottom: 10px;
        text-align: center;
        text-transform: uppercase;
      }
    </style>
  `);
  win.document.write('</head><body>');
  win.document.write(divContents);
  win.document.write('</body></html>');
  win.document.close();
  win.print();
}
</script>

<?php include 'footer.php'; ?>
