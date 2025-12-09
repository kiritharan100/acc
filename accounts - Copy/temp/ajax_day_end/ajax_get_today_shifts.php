 <?php
include '../../db.php';
include '../../auth.php';

header('Content-Type: application/json');
$location_id = $_REQUEST['location_id'];

// --- Fuel Sales Query ---
$sql = "
    SELECT s.shift_no, s.end_time, s.total_sales, s.total_card_sales, s.total_credit_sales, s.cash_received, s.exces_short,
           o.op_name
    FROM shed_operator_shift s
    LEFT JOIN manage_pump_operator o ON s.operator_id = o.op_id
    WHERE s.open_status = 0 AND day_end = 0 AND s.status = 1 and s.location_id ='$location_id'
    ORDER BY s.shift_no ASC
";

$result = mysqli_query($con, $sql);

if (!$result) {
    echo json_encode(['success' => false, 'html' => '<p>Error: ' . htmlspecialchars(mysqli_error($con)) . '</p>']);
    exit;
}

$rows = [];
$totalSales = $totalCardSales = $totalCreditSales = $totalCashReceived = $totalShortExcess = 0;

while ($row = mysqli_fetch_assoc($result)) {
    $rows[] = $row;
    $totalSales += floatval($row['total_sales']);
    $totalCardSales += floatval($row['total_card_sales']);
    $totalCreditSales += floatval($row['total_credit_sales']);
    $totalCashReceived += floatval($row['cash_received']);
    $totalShortExcess += floatval($row['exces_short']);
}

if (empty($rows)) {
    $fuelSalesHtml = '<p>No fuel shifts found for today.</p>';
} else {
    ob_start();
    ?>
    <!-- <div align='center'>
        <h5>Fuel Sales</h5>
    </div> -->


    

    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Shift No</th>
                <th>Operator Name</th>
                <th>End Time</th>
                <th>Total Sales</th>
                <th>Card Sales</th>
                <th>Credit Sales</th>
                <th>Cash Received</th>
                <th>Short / Excess</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($rows as $row): ?>
            <tr>
                <td><?= htmlspecialchars($row['shift_no']) ?></td>
                <td><?= htmlspecialchars($row['op_name']) ?></td>
                <td><?= date('Y-m-d h:i A', strtotime($row['end_time'])) ?></td>
                <td class="text-right"><?= number_format($row['total_sales'], 2) ?></td>
                <td class="text-right"><?= number_format($row['total_card_sales'], 2) ?></td>
                <td class="text-right"><?= number_format($row['total_credit_sales'], 2) ?></td>
                <td class="text-right"><?= number_format($row['cash_received'], 2) ?></td>
                <td class="text-right"><?= number_format($row['exces_short'], 2) ?></td>
            </tr>
        <?php endforeach; ?>
            <tr style="font-weight: bold; background: #f1f1f1;">
                <td colspan="3" class="text-center">Total</td>
                <td class="text-right"><?= number_format($totalSales, 2); $total_fuel_sales = $totalSales; ?></td>
                <td class="text-right"><?= number_format($totalCardSales, 2) ?></td>
                <td class="text-right"><?= number_format($totalCreditSales, 2) ?></td>
                <td class="text-right"><?= number_format($totalCashReceived, 2) ?></td>
                <td class="text-right"><?= number_format($totalShortExcess, 2) ?></td>
            </tr>
     
    <?php
    $fuelSalesHtml = ob_get_clean();
}
$sqlOil = "SELECT 
    'Oil Sales' AS `Item`,
    IFNULL(o.total_sales, 0) AS `Total Sales`,
    IFNULL(o.credit_sales, 0) AS `Credit Sales`,
    IFNULL(s.card_sales, 0) AS `Card Sales`,
    (IFNULL(o.total_sales, 0) - IFNULL(o.credit_sales, 0) - IFNULL(s.card_sales, 0)) AS `Cash Sales`
FROM 
    (
        SELECT 
            SUM(issue_total) AS total_sales,
            SUM(CASE WHEN to_location > 0 THEN issue_total ELSE 0 END) AS credit_sales
        FROM oil_sales_master
        WHERE day_end = 0 AND issue_status = 1 AND location = '$location_id'
    ) o
LEFT JOIN 
    (
        SELECT 
            SUM(amount) AS card_sales
        FROM shed_card_sales
        WHERE location_id = '$location_id' AND day_end = 0 AND shift_id = 0
    ) s ON 1=1;
 ";


// --- Oil Sales Query ---
// $sqlOil = "
//     SELECT 
//         'Oil Sales' AS `Item`,
//         IFNULL(o.total_sales, 0) AS `Total Sales`,
//         IFNULL(o.credit_sales, 0) AS `Credit Sales`,
//         IFNULL(s.card_sales, 0) AS `Card Sales`,
//         (IFNULL(o.total_sales, 0) - IFNULL(o.credit_sales, 0) - IFNULL(s.card_sales, 0)) AS `Cash Sales`
//     FROM 
//         (
//             SELECT 
//                 SUM(issue_total) AS total_sales,
//                 SUM(CASE WHEN to_location > 0 THEN issue_total ELSE 0 END) AS credit_sales
//             FROM oil_sales_master
//             WHERE day_end = 0 AND issue_status = 1 AND location = '$location_id'
//         ) o,
//         (
//             SELECT 
//                 SUM(amount) AS card_sales
//             FROM shed_card_sales
//             WHERE location_id = '$location_id' AND day_end = 0 AND shift_id = 0
//         ) s;
// ";

$resultOil = mysqli_query($con, $sqlOil);

if (!$resultOil) {
    $oilSalesHtml = '<p>Error loading Oil Sales: ' . htmlspecialchars(mysqli_error($con)) . '</p>';
} else {
    $oilRow = mysqli_fetch_assoc($resultOil);
    ob_start();
 if($totalSales == 0 ){
    ?>
   <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Shift No</th>
                <th>Operator Name</th>
                <th>End Time</th>
                <th>Total Sales</th>
                <th>Card Sales</th>
                <th>Credit Sales</th>
                <th>Cash Received</th>
                <th>Short / Excess</th>
            </tr>
        </thead>
<?php } ?>



 
            <tr>
                <td  colspan='3' align='center'><?= htmlspecialchars($oilRow['Item']) ?></td>
                <td class="text-right"><?= number_format($oilRow['Total Sales'], 2) ?></td>
                     <td class="text-right"><?= number_format($oilRow['Card Sales'], 2) ?></td>
                <td class="text-right"><?= number_format($oilRow['Credit Sales'], 2) ?></td>
               <?php
$cashSales = $oilRow['Cash Sales'];
$bgClass = $cashSales < 0 ? 'bg-danger text-white' : '';
?>
<td class="text-right <?= $bgClass ?>">
    <?= number_format($cashSales, 2) ?>
</td>
            </tr>
             <?php
    
                 $totalSales += $oilRow['Total Sales'];
    $totalCardSales += $oilRow['Card Sales'];
    $totalCreditSales += $oilRow['Credit Sales'];
    $totalCashReceived += $oilRow['Cash Sales'];
    // $totalShortExcess += floatval($row['exces_short']);

 
             
             ?>

            <tr style="font-weight: bold; background: #f1f1f1;">
                <td colspan="3" class="text-center">Total</td>
                <td class="text-right"><?= number_format($totalSales, 2) ?></td>
                <td class="text-right"><?= number_format($totalCardSales, 2) ?></td>
                <td class="text-right"><?= number_format($totalCreditSales, 2) ?></td>
                <td class="text-right"><?= number_format($totalCashReceived, 2) ?></td>
                <td class="text-right"><?= number_format($totalShortExcess, 2) ?></td>
            </tr> 
        </tbody>
    </table>

<input type='hidden' name='fuel_sales' id='fuel_sales' value='<?php echo $total_fuel_sales;?>'>
<input type='hidden' name='oil_sales' id='oil_sales' value='<?php echo $oilRow['Total Sales'];?>'>
<input type='hidden' name='card_sales' id='card_sales'  value='<?php echo $totalCardSales; ?>'>
<input type='hidden' name='credit_sales' id='credit_sales' value='<?php echo $totalCreditSales; ?>'>
<input type='hidden' name='credit_sales' id='credit_sales' value='<?php echo $totalCreditSales; ?>'>
<input type='hidden' name='short_excess' id='short_excess' value='<?php echo $totalShortExcess; ?>'>

<input type='hidden' name='total_cash'  id='total_cash' value='<?php echo $totalCashReceived; ?>'>

                         <!-- Total Day End Cash   <input type='number' step='0.01'  class="form-control" name='day_end_cash' id='day_end_cash' value=''>
                            <input type='number' readonly name='day_end_short' class="form-control" id='day_end_short' value=''>  -->
<div class="row mb-3">
  <div class="col-md-4">
   
  </div>
  <div class="col-md-4">
    <label for="day_end_cash" class="form-label">Total Day End Cash</label>
<input type="number" step="0.01" min='0' class="form-control" name="day_end_cash" id="day_end_cash"
       style="text-align:center; font-size:18px;" 
       placeholder="Enter Total Cash for settlement" value="<?php echo $totalCashReceived; ?>">  </div>
  
  <div class="col-md-4">
    <label for="day_end_short" class="form-label">Day End Short/Excess</label>
    <input type="number"  style="text-align:center; font-size:18px;"  readonly class="form-control" name="day_end_short" id="day_end_short" style='text-align:right;' value="">
  </div>

   
</div>
 
<hr>

<div class="row mb-3">
  <div class="col-md-6">
                            <?php
                            // Sample MySQL query (assumes connection is already made)
                            $query = "SELECT `grn_id`, `invoice_no`, `grn_total` 
                                    FROM `oil_grn_master` 
                                    WHERE day_end = 0 AND location = '$location_id' and grn_status = '1'  ";

                            $result = mysqli_query($conn, $query);
                            ?>
<h5> Oil Purchase </h5>
                <table class="table table-bordered table-hover" Style ='padding-right:20px; padding-left:20px;'>
                    <thead class="table-dark">
                        <tr>
                            <th style="width: 60px;">No</th>
                            <th>Invoice Number</th>
                            <th class="text-end">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $grand_total = 0;
                        $no = 1;
                        while ($row = mysqli_fetch_assoc($result)) {
                             $grand_total += $row['grn_total'];  
                            echo "<tr>";
                            echo "<td>{$no}</td>";
                            echo "<td>" . htmlspecialchars($row['invoice_no']) . "</td>";
                            echo "<td class='text-end' align='right'>" . number_format($row['grn_total'], 2) . "</td>";
                            echo "</tr>";
                            $no++;
                        }
                        ?>
                        <tfoot>
        <tr class="table-secondary fw-bold">
            <td colspan="2" class="text-end">Grand Total</td>
            <td class="text-end" align='right'><b><?= number_format($grand_total, 2) ?></b></td>
        </tr>
    </tfoot>
                    </tbody>
                    <input type='hidden' name='oil_purchase' id='oil_purchase' value='<?php echo $grand_total; ?>'>

                </table>

  </div>
  
  <div class="col-md-6">
<?php
// Sample MySQL query (assumes DB connection is $conn)
$query = "SELECT `Invoice_no`, `total_invoice` ,p.p_name FROM fuel_purchase_master f
JOIN product_master p ON f.p_id = p.p_id
WHERE f.day_end = 0 and f.status = 1 and f.location_id ='$location_id';
";
$result = mysqli_query($conn, $query);

$no = 1;
$grand_total = 0;
?>
<h5> Fuel Purchase </h5>
<table class="table table-bordered table-hover" Style ='padding-right:20px; padding-left:20px;'>
    <thead class="table-dark">
        <tr>
            <th style="width: 60px;">No</th>
          
            <th>Invoice Number</th>
              <th>Fuel</th>
            <th class="text-end">Total Invoice</th>
        </tr>
    </thead>
    <tbody>
        <?php while ($row = mysqli_fetch_assoc($result)) : ?>
            <tr>
                <td><?= $no++ ?></td>
                <td><?= htmlspecialchars($row['Invoice_no']) ?></td>
                <td><?= htmlspecialchars($row['p_name']) ?></td>
                <td class="text-end" align='right'><?= number_format($row['total_invoice'], 2) ?></td>
            </tr>
            <?php $grand_total += $row['total_invoice']; ?>
        <?php endwhile; ?>
    </tbody>
    <tfoot>
        <tr class="table-secondary fw-bold">
            <td colspan="3" class="text-end">Grand Total</td>
            <td class="text-end" align='right'><b><?= number_format($grand_total, 2) ?></b></td>
        </tr>
    </tfoot>
</table>
<input type='hidden' name='fuel_purchase' id='fuel_purchase' value='<?php echo $grand_total; ?>'>

  </div>
</div>

    <?php

  
    $oilSalesHtml = ob_get_clean();
}
?>



<?php
// Combine both tables
$html = $fuelSalesHtml . $oilSalesHtml;

echo json_encode(['success' => true, 'html' => $html]);


?>
