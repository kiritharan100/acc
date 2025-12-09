 <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    } ?>
<style>
     @media print {
  .card {
    margin-top: -100px; /* Adjust the value as needed */
    margin-left: -8px; /* Adjust the value as needed */
        }}
  @media print {
    .no-print { display: none !important; }
    .print-only { display: block !important; }
  }
  @media screen {
    .print-only { display: none !important; }
  }
  table {
    width: 100%;
    border-collapse: collapse;
    font-family: 'Arial Narrow', Arial, sans-serif;
    font-size: 16px;
  }
  th, td {
    border: 1px solid #999;
    padding: 4px 8px;
    text-align: left;
  }
  th {
    background: #f4f4f4;
    text-align: center;
  }
  .text-center { text-align: center; }
  .text-right { text-align: right; }
</style>

<?php
$selected_date = isset($_GET['date']) ? $_GET['date'] : date('Y-m-d');
$from_month_start = date('Y-m-01', strtotime($selected_date));
$yesterday = date('Y-m-d', strtotime($selected_date . ' -1 day'));
$tomorow = date('Y-m-d', strtotime($selected_date . ' +1 day'));


include 'ajax/your_data_processing_script.php'; // this should include logic to populate: 
$opening_stck_value_today = getOpeningStockValue($con, $location_id, $selected_date);
$closing_stock_today = getClosingStockValue($con, $location_id, $selected_date);
$opening_stck_value = getOpeningStockValue($con, $location_id, $from_month_start);
$purchase_today = getPurchaseValueByDate($con, $location_id, $selected_date);
 $purchase_upto_yesterday = getPurchaseValueUpToYesterday($con, $location_id, $from_month_start, $yesterday);

 $adj_today_value = getAdjustmentToday($con, $location_id, $selected_date);
$adj_yest_value = getAdjustmentUpToYesterday($con, $location_id, $from_month_start, $yesterday);

$price_change_today = getPriceChangeAdjustmentToday($con, $location_id, $selected_date);
$price_change_yesterday = getPriceChangeAdjustmentUpToYesterday($con, $location_id, $from_month_start, $yesterday);


    $stock_ready_yesterday = $opening_stck_value + $purchase_upto_yesterday + $adj_yest_value + $price_change_yesterday;
   $stock_ready_today =  $opening_stck_value_today + $purchase_today + $adj_today_value+ $price_change_today;
   $value_end_today = $opening_stck_value+$purchase_upto_yesterday+$purchase_today+$adj_today_value+$adj_yest_value+$price_change_today+$price_change_yesterday;


   $card_sales_today = getCardSalesToday($con, $location_id, $selected_date);
$card_sales_upto_yesterday = getCardSalesUpToYesterday($con, $location_id, $from_month_start, $yesterday);
$total_card_sales = $card_sales_today + $card_sales_upto_yesterday;


$credit_sales_today = getCreditSalesTodayByCategory($con, $location_id, $selected_date, 11);
$credit_sales_yd = getCreditSalesUpToYesterdayByCategory($con, $location_id, $from_month_start, $yesterday, 11);
$credit_sales_total =  $credit_sales_today+$credit_sales_yd;

$vehicle_section_today = getCreditSalesTodayByCategory($con, $location_id, $selected_date, 14);
$vehicle_section_yt = getCreditSalesUpToYesterdayByCategory($con, $location_id, $from_month_start, $yesterday, 14);
$vehicle_section_total = $vehicle_section_today+$vehicle_section_yt;


$Other_Needs = getCreditSalesTodayByCategory($con, $location_id, $selected_date, 15);
$Other_Needs_yt = getCreditSalesUpToYesterdayByCategory($con, $location_id, $from_month_start, $yesterday, 15);
$Other_Needs_total = $Other_Needs+$Other_Needs_yt;

$mpcs_branch = getCreditSalesTodayByCategory($con, $location_id, $selected_date, 13);
$mpcs_branch_yt = getCreditSalesUpToYesterdayByCategory($con, $location_id, $from_month_start, $yesterday, 13);
$mpcs_branch_total = $mpcs_branch+$mpcs_branch_yt;

$cash_today = getCashSalesToday($con, $location_id, $selected_date);
$cash_yesterday = getCashSalesUpToYesterday($con, $location_id, $from_month_start, $yesterday);
$total_cash_sales = $cash_today + $cash_yesterday;

$total_sales_yesterday = 
    $cash_yesterday + 
    $card_sales_upto_yesterday + 
    $credit_sales_yd + 
    $vehicle_section_yt + 
    $Other_Needs_yt + 
    $mpcs_branch_yt;

$total_sales_today = 
    $cash_today + 
    $card_sales_today + 
    $credit_sales_today + 
    $vehicle_section_today + 
    $Other_Needs + 
    $mpcs_branch;

$total_sales_combined = $total_sales_yesterday + $total_sales_today;


?>

<div class="content-wrapper" >
  <div class="container-fluid" >
          <div class="row" >
         <div class="col-sm-12"  >
            <div class="card" style='padding:50px;'>
    <div class="row no-print">
      
      <div class="col-sm-12" >
        <form method="GET" class="form-inline float-right">
          <label class="mr-2">Select Date:</label>
           <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
                                        echo "<input type='hidden' name='module' value='report'>";  }?>
          <input type="date" name="date" value="<?= $selected_date ?>" required class="form-control mr-2">
          <button type="submit" class="btn btn-success">Search</button>
          <button type="button" class="btn btn-primary ml-2" onclick="window.print()">Print</button>
        </form>
        <hr>
      </div>
    </div>
<div align='right'> <h4>F 15</h4> </div>
      <div align='center'>
         <h4 class="mt-4"><?= $_SESSION['company'] ?> <br> <?= $client_name; ?> - <?= $reg_no; ?>  </h4>
           Sales and Stock Balance as at <?= date('d-m-Y', strtotime($selected_date)) ?> 
      </div>

    <table>
      <thead>
        <tr>
          <th font-weight-bold>Description</th>
          <th class="text-center" style='width:150px;'>Total up to Yesterday <br> Rs.</th>
          <th class="tex-center" style='width:150px;'>Today <br> Rs.</th>
          <th class="text-center" style='width:150px;'>Total up to Today <br> Rs.</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Opening Stock</td>
          <td class="text-right"><?= number_format($opening_stck_value, 2) ?></td>
          <td class="text-right"><?= number_format($opening_stck_value_today, 2) ?></td>
          <td class="text-right"><?= number_format($opening_stck_value, 2) ?></td>
        </tr>
        <tr>
          <td>Purchase</td>
          <td class="text-right"><?= number_format($purchase_upto_yesterday, 2) ?></td>
          <td class="text-right"><?= number_format($purchase_today, 2) ?></td>
          <td class="text-right"><?= number_format($purchase_upto_yesterday+$purchase_today, 2) ?></td>
        </tr>
        <tr>
          <td>Adjustment</td>
          <td class="text-right"><?= number_format($adj_yest_value, 2) ?></td>
          <td class="text-right"><?= number_format($adj_today_value, 2) ?></td>
          <td class="text-right"><?= number_format($adj_today_value+$adj_yest_value, 2) ?></td>
        </tr>
        <tr>
          <td>Price change adjustment</td>
            <td class="text-right"><?= number_format($price_change_yesterday, 2) ?></td>
          <td class="text-right"><?= number_format($price_change_today, 2) ?></td>
          <td class="text-right"><?= number_format($price_change_today+$price_change_yesterday, 2) ?></td>     
        </tr>
       <tr>
            <td><b>Stock ready to sales</b></td>
            <td class="text-right font-weight-bold"><?= number_format($stock_ready_yesterday, 2) ?></td>
            <td class="text-right font-weight-bold"><?= number_format($stock_ready_today  , 2) ?></td>
            <td class="text-right font-weight-bold"><?= number_format( $value_end_today , 2) ?></td>
            </tr>

             <tr>
          <td>Sales </td>
            <td class="text-right"> </td>
          <td class="text-right"> </td>
          <td class="text-right"> </td>     
        </tr>
        
         <tr>
          <td>Cash Sales</td>
            <td class="text-right"><?= number_format($cash_yesterday, 2) ?></td>
          <td class="text-right"><?= number_format($cash_today, 2) ?></td>
          <td class="text-right"><?= number_format($total_cash_sales, 2) ?></td>     
        </tr>


        <tr>
          <td>Card Sales</td>
            <td class="text-right"><?= number_format($card_sales_upto_yesterday, 2) ?></td>
          <td class="text-right"><?= number_format($card_sales_today, 2) ?></td>
          <td class="text-right"><?= number_format($total_card_sales, 2) ?></td>     
        </tr>
        <tr>
          <td>Credit Sales </td>
             <td class="text-right"><?= number_format($credit_sales_yd, 2) ?></td>
            <td class="text-right"><?= number_format($credit_sales_today, 2) ?></td>
          <td class="text-right"><?= number_format($credit_sales_total, 2) ?></td>     
        </tr>
         <tr>
          <td>MPCS Vehicle Section</td>
            <td class="text-right"><?= number_format($vehicle_section_yt, 2) ?></td>
          <td class="text-right"><?= number_format($vehicle_section_today, 2) ?></td>
          <td class="text-right"><?= number_format($vehicle_section_total, 2) ?></td>     
        </tr>
        <tr>
          <td>MPCS Other Needs</td>
            <td class="text-right"><?= number_format($Other_Needs_yt, 2) ?></td>
          <td class="text-right"><?= number_format($Other_Needs, 2) ?></td>
          <td class="text-right"><?= number_format($Other_Needs_total, 2) ?></td>     
        </tr>

        <tr>
          <td>MPCS Branches</td>
            <td class="text-right"><?= number_format($mpcs_branch_yt, 2) ?></td>
          <td class="text-right"><?= number_format($mpcs_branch, 2) ?></td>
          <td class="text-right"><?= number_format($mpcs_branch_total, 2) ?></td>     
        </tr>


            <tr>
            <td><b>Total Sales</b></td>
            <td class="text-right font-weight-bold"><?= number_format($total_sales_yesterday, 2) ?></td>
            <td class="text-right font-weight-bold"><?= number_format($total_sales_today, 2) ?></td>
            <td class="text-right font-weight-bold"><?= number_format($total_sales_combined, 2) ?></td>
            </tr>

            <tr>
            <td>.</td>
            <td class="text-right font-weight-bold"> </td>
            <td class="text-right font-weight-bold"> </td>
            <td class="text-right font-weight-bold"> </td>
            </tr>


            <tr>
            <td><b>Total Sales</b></td>
            <td class="text-right  "><?= number_format($total_sales_yesterday, 2) ?></td>
            <td class="text-right "><?= number_format($total_sales_today, 2) ?></td>
            <td class="text-right  "><?= number_format($total_sales_combined, 2) ?></td>
            </tr>

            <tr>
            <td><b>Closing Stock</b></td>
            <td class="text-right  "><?= number_format($opening_stck_value_today, 2) ?></td>
            <td class="text-right "><?= number_format($closing_stock_today, 2) ?></td>
            <td class="text-right  "><?= number_format($closing_stock_today, 2) ?></td>
            </tr>
            <tr>
            <td><b>Total</b></td>
            <td class="text-right font-weight-bold "><?= number_format($opening_stck_value_today+$total_sales_yesterday, 2) ?></td>
            <td class="text-right font-weight-bold "><?= number_format($closing_stock_today+$total_sales_today, 2) ?></td>
            <td class="text-right font-weight-bold "><?= number_format($closing_stock_today+$total_sales_combined, 2) ?></td>
            </tr>






      </tbody>
    </table>

    <div id="footer_section" style="margin-top: 10px; font-size: 14px;">
     <p style="margin-bottom: 30px;">
        <em>
        <b>    "I confirm that all the transactions in this statement are correct and the stock shown is under my control." </b>
        </em>
    </p>
    <table style="width:100%; border: none;">
        <tr>
            <td style="border:none;">
                <strong>Date:</strong> <?= date('d-m-Y') ?>
            </td>
            <td style="border:none; text-align: right;">
                  ____________________________
            </td>
        </tr>
        <tr>
            <td style="border:none;"></td>
            <td style="border:none; text-align: right;"><strong>Manager</strong></td>
        </tr>
    </table>
</div>
  </div>
</div>

<?php include 'footer.php'; ?>
