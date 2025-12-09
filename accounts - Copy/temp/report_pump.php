<?php
include 'header.php';

$day_end = isset($_GET['day_end']) ? $_GET['day_end'] : '';
//  $day_end = isset($_GET['day_end']) ? $_GET['day_end'] : '';

if ($day_end !== '') {
    // Fetch date range from day_end_process
    $range_sql = "SELECT 
                    MIN(date_ended) AS from_date,
                    MAX(date_ended) AS to_date 
                  FROM day_end_process 
                  WHERE location_id = '$location_id' AND serial_no = '$day_end'";
    
    $range_res = mysqli_query($con, $range_sql);
    $range_row = mysqli_fetch_assoc($range_res);

    $from_date = $range_row['from_date'] ?? date('Y-m-d');
    $to_date = $range_row['to_date'] ?? date('Y-m-d');
} else {
    // Fallback to manual entry or default current date
    $from_date = isset($_GET['from']) ? $_GET['from'] : date('Y-m-d');
    $to_date   = isset($_GET['to']) ? $_GET['to'] : date('Y-m-d');
}


$where = "sos.location_id = '$location_id' AND sos.status = 1";
if ($day_end !== '') {
    $where .= " AND sos.day_end = '$day_end'";
} else {
    $where .= " AND DATE(sos.end_time) BETWEEN '$from_date' AND '$to_date'";
}

$query = "
SELECT spa.*, sos.shift_no, sos.end_time, mp.pump_name, pm.p_name,mpo.op_name
FROM shed_pump_assign spa
JOIN shed_operator_shift sos ON spa.shift_id = sos.shift_id
JOIN manage_pump_operator mpo ON mpo.op_id = sos.operator_id
JOIN manage_pump mp ON spa.pump_id = mp.id
JOIN product_master pm ON spa.product_id = pm.p_id
WHERE $where AND spa.status = 1 AND mp.status = 1 AND pm.status = 1
ORDER BY mp.pump_name, sos.shift_no
";

$result = mysqli_query($con, $query);
?>


<style>
 .bg-infox {
  background-color:rgb(222, 224, 227) !important; /* Bootstrap 5 "info" blue */
  color: black !important;
}
 

    @media print {
  .card {
    margin-top: -100px; /* Adjust the value as needed */
  }
   body {
    zoom: 80%;  /* Optional: works in most browsers like Chrome */
  }
  
}



</style>
<div class="content-wrapper">
  <div class="container-fluid">
    <div class="main-header no-print">
      <h4>Daily Sales Reconciliation <?php echo $from_date."-".$to_date; ?> </h4>
    </div>

    


 <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-block">
            <div class='no-print'>
    <!-- Pump Sales Table -->
     <form method="get" class="form-inline mb-3">
      <div class="form-group mr-2">
        <label>Day End No: </label>
        <input type="number" name="day_end" class="form-control ml-2" value="<?= htmlspecialchars($day_end) ?>">
        
      </div>
 

      <button type="submit" class="btn btn-primary">Load Report</button>
      <button onclick="window.print()" class="btn btn-primary"> <i class="fa fa-print" aria-hidden="true"></i> Print</button>
    </form>
    <hr>
    </div>
    <?php $dayx =  $_REQUEST['day_end'] ?? 0;
    
    if($dayx > 0 ){ ?>

<div align='center'> <h4><?php echo $_SESSION['company']; ?></h4>
    <h5>  Daily Sales Reconciliation <?php echo $to_date;?></h5>

    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>Shift No</th>
           
          <th>Pump Name</th>
          <th>Operator</th>
          <th>Opening Reading</th>
          <th>Closing Reading</th>
          <th>Net Reading</th>
          <th>Test Fuel</th>
          <th>Sold Unit</th>
          <th>Price</th>
          <th>Total Value</th>
        </tr>
      </thead>
      <tbody>
        <?php
        $total_sales = 0;
        $total_unit = 0;
        mysqli_data_seek($result, 0);
        while ($row = mysqli_fetch_assoc($result)):
          $net_reading = $row['closing_reading'] - $row['opening_reading'];
          $sales_unit = $row['fuel_sales'];
          $total_value = $sales_unit * $row['sales_price'];
          $avg_price = $sales_unit > 0 ? $total_value / $sales_unit : 0;
          $total_sales += $total_value;
          $total_unit += $sales_unit;
          if($net_reading > 0 ){
        ?>
          <tr>
            <td><?= $row['shift_no'] ?></td>
            
            <td><?= $row['pump_name'] ?></td>
            <td class="text-center"><?= $row['op_name'] ?></td>
            <td class="text-right"><?= number_format($row['opening_reading'], 2) ?></td>
            <td class="text-right"><?= number_format($row['closing_reading'], 2) ?></td>
            <td class="text-right"><?= number_format($net_reading, 2) ?></td>
            <td class="text-right"><?= number_format($row['total_test_reading'], 2) ?></td>
            <td class="text-right"><?= number_format($sales_unit, 2) ?></td>
            <td class="text-right"><?= number_format($avg_price, 2) ?></td>
            <td class="text-right"><?= number_format($total_value, 2) ?></td>
          </tr>
        <?php } endwhile; ?>
      </tbody>
      <tfoot>
        <tr class="font-weight-bold bg-infox text-black">
          <td colspan="9" class="text-right">Total Fuel Sales </td>
     
          <td class="text-right"><?= number_format($total_sales, 2) ?></td>
        </tr>
      </tfoot>
    </table>

    <!-- Oil Sales Summary -->






  <h5 class="mt-4">Oil Sales Summary</h5>
<table class="table table-bordered table-striped">
  <thead>
    <tr class="table-secondary">
      <th>Item Name</th>
      <th>Sales Price</th>
      <th>Opening Stock</th>
      <th>Purchase Qty</th>
      <th>Adjustment</th>
      <th>Sales Qty</th>
      <th>Closing Stock</th>
      <th>Sales Value</th>
    </tr>
  </thead>
  <tbody>
    <?php
  
 $oil_query = "
  SELECT 
    pm.p_name,
    os.sales_price,

    -- Opening stock calculation
    (
     IFNULL(opening.total_purchase, 0) -
      IFNULL(adj_before.adj_qty, 0) -
     IFNULL(issue_before.issued_qty, 0)
    ) AS opening,

    -- Purchases on the day_end date
    IFNULL(purchase.purchase_qty, 0) AS purchase,

    -- Issued on the day_end
    IFNULL(issue_day.issued_qty, 0) AS issued,

    -- Adjustments on the day_end
    IFNULL(adj_day.adj_qty, 0) AS adjusted,

    -- Closing stock
    (
      IFNULL(opening.total_purchase, 0) +
      IFNULL(purchase.purchase_qty, 0) -
      IFNULL(adj_before.adj_qty, 0) -
      IFNULL(adj_day.adj_qty, 0) -
      IFNULL(issue_before.issued_qty, 0) -
      IFNULL(issue_day.issued_qty, 0)
    ) AS closing

  FROM product_master pm
  JOIN oil_stock os ON pm.p_id = os.s_id AND os.grn_status = 1  

  -- Opening purchases before the day
  LEFT JOIN (
    SELECT s_id, sales_price, SUM(purchase_qty) AS total_purchase
    FROM oil_stock
    WHERE DATE(batch_date) < '$from_date' AND grn_status = 1 
    GROUP BY s_id, sales_price
  ) AS opening ON opening.s_id = os.s_id AND opening.sales_price = os.sales_price

  -- Purchases on the day
  LEFT JOIN (
    SELECT s_id, sales_price, SUM(purchase_qty) AS purchase_qty
    FROM oil_stock
    WHERE DATE(batch_date) = '$from_date' AND grn_status = 1 
    GROUP BY s_id, sales_price
  ) AS purchase ON purchase.s_id = os.s_id AND purchase.sales_price = os.sales_price

  -- Issued on the day_end
  LEFT JOIN (
    SELECT os.s_id, os.sales_price, SUM(osd.issue_qty) AS issued_qty
    FROM oil_sales_detail osd
    JOIN oil_sales_master osm ON osd.iss_id = osm.iss_id AND osd.status = 1
    JOIN oil_stock os ON os.batch_id = osd.batch_id
    WHERE osm.issue_date = '$from_date'
    GROUP BY os.s_id, os.sales_price
  ) AS issue_day ON issue_day.s_id = os.s_id AND issue_day.sales_price = os.sales_price

  -- Issued before the day_end
  LEFT JOIN (
    SELECT os.s_id, os.sales_price, SUM(osd.issue_qty) AS issued_qty
    FROM oil_sales_detail osd
    JOIN oil_sales_master osm ON osd.iss_id = osm.iss_id AND osd.status = 1
    JOIN oil_stock os ON os.batch_id = osd.batch_id
    WHERE osm.issue_date < '$from_date'
    GROUP BY os.s_id, os.sales_price
  ) AS issue_before ON issue_before.s_id = os.s_id AND issue_before.sales_price = os.sales_price

  -- Adjustment on the day
  LEFT JOIN (
    SELECT os.s_id, os.sales_price, SUM(osa.adj_qty) AS adj_qty
    FROM oil_stock_adjustment osa
    JOIN oil_stock os ON osa.batch_id = os.batch_id
    WHERE DATE(osa.adj_on) = '$from_date'
    GROUP BY os.s_id, os.sales_price
  ) AS adj_day ON adj_day.s_id = os.s_id AND adj_day.sales_price = os.sales_price

  -- Adjustment before the day
  LEFT JOIN (
    SELECT os.s_id, os.sales_price, SUM(osa.adj_qty) AS adj_qty
    FROM oil_stock_adjustment osa
    JOIN oil_stock os ON osa.batch_id = os.batch_id
    WHERE DATE(osa.adj_on) < '$from_date'
    GROUP BY os.s_id, os.sales_price
  ) AS adj_before ON adj_before.s_id = os.s_id AND adj_before.sales_price = os.sales_price

  WHERE pm.status = 1
  GROUP BY pm.p_id, os.sales_price
 HAVING opening != 0 OR purchase != 0 OR issued != 0 OR adjusted != 0 OR closing != 0
 ORDER BY pm.p_name
";

 
// $oil_query = "
//   SELECT 
//     pm.p_name,
//     os.sales_price,

//     -- Opening stock calculation
//     (
//       IFNULL(opening.total_purchase, 0) -
//       IFNULL(adj_before.adj_qty, 0) -
//       IFNULL(issue_before.issued_qty, 0)
//     ) AS opening,

//     -- Purchases on the day_end date
//     IFNULL(purchase.purchase_qty, 0) AS purchase,

//     -- Issued on the day_end
//     IFNULL(issue_day.issued_qty, 0) AS issued,

//     -- Adjustments on the day_end
//     IFNULL(adj_day.adj_qty, 0) AS adjusted,

//     -- Closing stock
//     (
//       IFNULL(opening.total_purchase, 0) +
//       IFNULL(purchase.purchase_qty, 0) -
//       IFNULL(adj_before.adj_qty, 0) -
//       IFNULL(adj_day.adj_qty, 0) -
//       IFNULL(issue_before.issued_qty, 0) -
//       IFNULL(issue_day.issued_qty, 0)
//     ) AS closing

//   FROM product_master pm
//   JOIN oil_stock os ON pm.p_id = os.s_id AND os.grn_status = 1  

//   -- Opening purchases before the day
//   LEFT JOIN (
//     SELECT s_id, sales_price, SUM(purchase_qty) AS total_purchase
//     FROM oil_stock
//     WHERE DATE(batch_date) < '$from_date' AND grn_status = 1 
//     GROUP BY s_id, sales_price
//   ) AS opening ON opening.s_id = os.s_id AND opening.sales_price = os.sales_price

//   -- Purchases on the day
//   LEFT JOIN (
//     SELECT s_id, sales_price, SUM(purchase_qty) AS purchase_qty
//     FROM oil_stock
//     WHERE DATE(batch_date) = '$from_date' AND grn_status = 1 
//     GROUP BY s_id, sales_price
//   ) AS purchase ON purchase.s_id = os.s_id AND purchase.sales_price = os.sales_price

//   -- Issued on the day_end
//   LEFT JOIN (
//     SELECT os.s_id, os.sales_price, SUM(osd.issue_qty) AS issued_qty
//     FROM oil_sales_detail osd
//     JOIN oil_sales_master osm ON osd.iss_id = osm.iss_id
//     JOIN oil_stock os ON os.batch_id = osd.batch_id
//     WHERE osm.day_end = '$day_end'
//     GROUP BY os.s_id, os.sales_price
//   ) AS issue_day ON issue_day.s_id = os.s_id AND issue_day.sales_price = os.sales_price

//   -- Issued before the day_end
//   LEFT JOIN (
//     SELECT os.s_id, os.sales_price, SUM(osd.issue_qty) AS issued_qty
//     FROM oil_sales_detail osd
//     JOIN oil_sales_master osm ON osd.iss_id = osm.iss_id
//     JOIN oil_stock os ON os.batch_id = osd.batch_id
//     WHERE osm.day_end < '$day_end'
//     GROUP BY os.s_id, os.sales_price
//   ) AS issue_before ON issue_before.s_id = os.s_id AND issue_before.sales_price = os.sales_price

//   -- Adjustment on the day
//   LEFT JOIN (
//     SELECT os.s_id, os.sales_price, SUM(osa.adj_qty) AS adj_qty
//     FROM oil_stock_adjustment osa
//     JOIN oil_stock os ON osa.batch_id = os.batch_id
//     WHERE DATE(osa.adj_on) = '$from_date'
//     GROUP BY os.s_id, os.sales_price
//   ) AS adj_day ON adj_day.s_id = os.s_id AND adj_day.sales_price = os.sales_price

//   -- Adjustment before the day
//   LEFT JOIN (
//     SELECT os.s_id, os.sales_price, SUM(osa.adj_qty) AS adj_qty
//     FROM oil_stock_adjustment osa
//     JOIN oil_stock os ON osa.batch_id = os.batch_id
//     WHERE DATE(osa.adj_on) < '$from_date'
//     GROUP BY os.s_id, os.sales_price
//   ) AS adj_before ON adj_before.s_id = os.s_id AND adj_before.sales_price = os.sales_price

//   WHERE pm.status = 1
//   GROUP BY pm.p_id, os.sales_price
//   HAVING opening != 0 OR purchase != 0 OR issued != 0 OR adjusted != 0 OR closing != 0
// ";




//    $oil_query = "
//   SELECT 
//     pm.p_name,
//     os.sales_price,
//     IFNULL(SUM(CASE WHEN DATE(os.batch_date) < '$from_date' THEN os.purchase_qty ELSE 0 END), 0) AS opening,
//     IFNULL(SUM(CASE WHEN DATE(os.batch_date) BETWEEN '$from_date' AND '$to_date' THEN os.purchase_qty ELSE 0 END), 0) AS purchase,
//     IFNULL(SUM(osd.issue_qty), 0) AS issued,
//     IFNULL(SUM(oil_stock_adjustment.adj_qty), 0) AS adjusted,
//     (
//       IFNULL(SUM(CASE WHEN osm.day_end < '$day_end' THEN os.purchase_qty ELSE 0 END), 0) +
//       IFNULL(SUM(CASE WHEN osm.day_end = '$day_end' THEN os.purchase_qty ELSE 0 END), 0) +
//       IFNULL(SUM(oil_stock_adjustment.adj_qty), 0) -
//       IFNULL(SUM(osd.issue_qty), 0)
//     ) AS closing
//   FROM product_master pm
//   JOIN oil_stock os ON pm.p_id = os.s_id
//   LEFT JOIN oil_sales_detail osd ON os.batch_id = osd.batch_id
//   LEFT JOIN oil_sales_master osm ON osd.iss_id = osm.iss_id
//   LEFT JOIN oil_stock_adjustment ON os.batch_id = oil_stock_adjustment.batch_id
//   WHERE os.grn_status = 1 
//     AND pm.status = 1 
//     AND (osm.day_end = '$day_end' OR osm.day_end IS NULL)
//   GROUP BY pm.p_id, os.sales_price
// ";

//  $oil_query = "
//   SELECT 
//     pm.p_name,
//     os.sales_price,
//     IFNULL(SUM(CASE WHEN DATE(os.batch_date) < '$from_date' THEN os.purchase_qty ELSE 0 END), 0) AS opening,
//     IFNULL(SUM(CASE WHEN DATE(os.batch_date) BETWEEN '$from_date' AND '$to_date' THEN os.purchase_qty ELSE 0 END), 0) AS purchase,
//     IFNULL(SUM(osd.issue_qty), 0) AS issued,
//     IFNULL(SUM(oil_stock_adjustment.adj_qty), 0) AS adjusted,
//     (
//       IFNULL(SUM(CASE WHEN DATE(os.batch_date) < '$from_date' THEN os.purchase_qty ELSE 0 END), 0) +
//       IFNULL(SUM(CASE WHEN DATE(os.batch_date) BETWEEN '$from_date' AND '$to_date' THEN os.purchase_qty ELSE 0 END), 0) +
//       IFNULL(SUM(oil_stock_adjustment.adj_qty), 0) -
//       IFNULL(SUM(osd.issue_qty), 0)
//     ) AS closing
//   FROM product_master pm
//   JOIN oil_stock os ON pm.p_id = os.s_id
//   LEFT JOIN oil_sales_detail osd ON os.batch_id = osd.batch_id
//   LEFT JOIN oil_stock_adjustment ON os.batch_id = oil_stock_adjustment.batch_id
//   WHERE os.grn_status = 1 
//     AND pm.status = 1 
//     AND DATE(os.batch_date) <= '$to_date'
//   GROUP BY pm.p_id, os.sales_price
// ";



    $res_oil = mysqli_query($con, $oil_query);
    if (!$res_oil) {
    die("Oil Query Error: " . mysqli_error($con) . "<br><pre>$oil_query</pre>");
}

    $total_oil_sales = 0;
    while ($oil = mysqli_fetch_assoc($res_oil)) {
        $sales_qty = $oil['issued'];
        $sales_value = $sales_qty * $oil['sales_price'];
        $total_oil_sales += $sales_value;
    ?>
    <tr>
      <td><?= $oil['p_name'] ?></td>
      <td class="text-center"><?= number_format($oil['sales_price'], 2) ?></td>
      <td class="text-center"><?= number_format($oil['opening'], 2) ?></td>
      <td class="text-center"><?= number_format($oil['purchase'], 2) ?></td>
      <td class="text-center"><?= number_format($oil['adjusted'], 2) ?></td>
      <td class="text-center"><?= number_format($sales_qty, 2) ?></td>
      <td class="text-center"><?= number_format($oil['closing'], 2) ?></td>
      <td class="text-right"><?= number_format($sales_value, 2) ?></td>
    </tr>
    <?php } ?>
  </tbody>
  <tfoot>
    <tr class="bg-infox text-black font-weight-bold">
      <td colspan="7" class="text-right">Total Oil Sales</td>
      <td class="text-right"><?= number_format($total_oil_sales, 2) ?></td>
    </tr>
  </tfoot>
</table>

<table class="table table-bordered table-striped">
<tfoot>
    <tr class="bg-infox text-black font-weight-bold">
      <td colspan="7" class="text-right">Total Oil Sales + Fuel Sales </td>
      <td class="text-right" style='width:180px;'><?= number_format($total_sales+$total_oil_sales, 2) ?></td>
    </tr>
  </tfoot>
</table>


   <?php
$detail_query = "SELECT shift_no, end_time, total_sales, cash_received, total_card_sales, total_credit_sales, exces_short, day_end ,mpo.op_name
                 FROM shed_operator_shift  
                 LEFT JOIN manage_pump_operator mpo ON mpo.op_id = shed_operator_shift.operator_id
                 WHERE shed_operator_shift.location_id = '$location_id' AND shed_operator_shift.status = 1 
                  ";

if ($day_end !== '') {
    $detail_query .= " AND day_end = '$day_end'";
} else {
    $detail_query .= " AND DATE(end_time) BETWEEN '$from_date' AND '$to_date'";
}

$detail_query .= " ORDER BY shift_no ASC";
$detail_result = mysqli_query($con, $detail_query);

$total_sales = $cash_sales = $card_sales = $credit_sales = $excess_short = 0;
$used_day_end = null;
?>

<h5 class="mt-4">Sales Summary by Shift</h5>
<table class="table table-bordered table-striped">
  <thead>
    <tr class="table-secondary">
      <th>Shift No</th>
     
      <th>Total Sales</th>
      <th>Cash Sales</th>
      <th>Card Sales</th>
      <th>Credit Sales</th>
      <th>Excess / Short</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = mysqli_fetch_assoc($detail_result)):
      $total_sales   += $row['total_sales'];
      $cash_sales    += $row['cash_received'];
      $card_sales    += $row['total_card_sales'];
      $credit_sales  += $row['total_credit_sales'];
      $excess_short  += $row['exces_short'];
      $used_day_end   = $row['day_end']; // store last day_end for reference
    ?>
    <tr>
      <td class="text-center"><?= $row['shift_no'].' : '.$row['op_name'] ?></td>
   
      <td class="text-right"><?= number_format($row['total_sales'], 2) ?></td>
      <td class="text-right"><?= number_format($row['cash_received'], 2) ?></td>
      <td class="text-right"><?= number_format($row['total_card_sales'], 2) ?></td>
      <td class="text-right"><?= number_format($row['total_credit_sales'], 2) ?></td>
      <td class="text-right"><?= number_format($row['exces_short'], 2) ?></td>
    </tr>
    <?php endwhile; ?>
  </tbody>
  <tfoot>
    <?php
    // Fetch day_end_process values
      $compare_sql = "SELECT * FROM day_end_process WHERE location_id = '$location_id' AND serial_no = '$day_end'";
   

    $compare_result = mysqli_query($con, $compare_sql);
    $compare = mysqli_fetch_assoc($compare_result);

    $oil_diff_cash   = ($compare['total_cash_settled']    ?? 0) - $cash_sales;
    $oil_diff_card   = ($compare['total_card_settled']    ?? 0) - $card_sales;
    $oil_diff_credit = ($compare['total_credit_settle']   ?? 0) - $credit_sales;
    $oil_diff_short  = ($compare['oil_short_excess']      ?? 0);

    // Recalculate totals including oil adjustments
    $final_total_sales  = $total_sales + ($compare['oil_sales'] ?? 0);
    $final_cash         = $cash_sales + $oil_diff_cash;
    $final_card         = $card_sales + $oil_diff_card;
    $final_credit       = $credit_sales + $oil_diff_credit;
    $final_short        = $excess_short + $oil_diff_short;
    ?>
    <!-- Difference Row -->
    <tr class="table-warning ">
      <td  class="text-center">Oil</td>
    
      <td class="text-right"><?= number_format(($compare['oil_sales'] ?? 0), 2) ?></td>
      <td class="text-right"><?= number_format($oil_diff_cash, 2) ?></td>
      <td class="text-right"><?= number_format($oil_diff_card, 2) ?></td>
      <td class="text-right"><?= number_format($oil_diff_credit, 2) ?></td>
      <td class="text-right"><?= number_format($oil_diff_short, 2) ?></td>
    </tr>

    <!-- Final Total Row -->
    <tr class="bg-infox text-black font-weight-bold">
      <td  class="text-right">Total  </td>
      <td class="text-right"><?= number_format($final_total_sales, 2) ?></td>
      <td class="text-right"><?= number_format($final_cash, 2) ?></td>
      <td class="text-right"><?= number_format($final_card, 2) ?></td>
      <td class="text-right"><?= number_format($final_credit, 2) ?></td>
      <td class="text-right"><?= number_format($final_short, 2) ?></td>
    </tr>
  </tfoot>
</table>




   <?php  }?>



  </div>
  </div>
  </div>
  </div>
</div>

<script>
  document.querySelector('[name="day_end"]').addEventListener('input', function () {
    document.getElementById('date-range').style.display = this.value.trim() === '' ? 'block' : 'none';
  });
</script>




<?php include 'footer.php'; ?>
