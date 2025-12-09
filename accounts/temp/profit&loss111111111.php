 <?php
 
     if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../report/header.php';
    } else {
        include 'header.php';
    }

$from_date = isset($_GET['from']) ? $_GET['from'] : date('Y-m-01', strtotime('first day of last month'));
$to_date = isset($_GET['to']) ? $_GET['to'] : date('Y-m-t', strtotime('last day of last month'));
 $g_profit = 0;
function getBalanceAsAt($ca_id, $to) {
  global $con;
   global $con, $location_id;
  $sql = "SELECT IFNULL(SUM(debit), 0) AS total_debit, IFNULL(SUM(credit), 0) AS total_credit FROM acc_transaction WHERE ca_id = $ca_id AND t_date <= '$to' AND status = 1 AND location_id = '$location_id'";
  $res = mysqli_query($con, $sql);
  $row = mysqli_fetch_assoc($res);
  return floatval($row['total_debit']) - floatval($row['total_credit']);
}

function getAmount($ca_id, $field, $from, $to) {
  global $con;
  global $con, $location_id;
  $sql = "SELECT SUM($field) as total FROM acc_transaction WHERE ca_id = $ca_id AND t_date BETWEEN '$from' AND '$to' AND status = 1 AND location_id = '$location_id'";
  $res = mysqli_query($con, $sql);
  if (!$res) return 0;
  $row = mysqli_fetch_assoc($res);
  return floatval($row['total']);
}

function formatAmt($amt) {
  return $amt >= 0 ? number_format($amt, 2) : '(' . number_format(abs($amt), 2) . ')';
}

function getGroupedExpenses($group) {
  global $con, $from_date, $to_date;
  $items = [];
  $qry = "SELECT ca_id, ca_name FROM acc_chart_of_accounts WHERE ca_type='Expenses' AND ca_group='$group' AND status=1 ORDER BY ca_name";
  $res = mysqli_query($con, $qry);
  $total = 0;
  while ($row = mysqli_fetch_assoc($res)) {
    $amt = getAmount($row['ca_id'], 'debit', $from_date, $to_date);
    if ($amt > 0) {
      $items[] = ['name' => $row['ca_name'], 'amount' => $amt];
      $total += $amt;
    }
  }
  return ['items' => $items, 'total' => $total];
}

$vat_query = "SELECT IFNULL(SUM(debit_Vat), 0) as total_debit_vat, IFNULL(SUM(credit_vat), 0) as total_credit_vat FROM acc_transaction WHERE t_date BETWEEN '$from_date' AND '$to_date' AND status = 1 AND location_id = '$location_id'";
$vat_res = mysqli_query($con, $vat_query);
$vat_data = mysqli_fetch_assoc($vat_res);
$vat_value = $vat_data['total_debit_vat'] - $vat_data['total_credit_vat'];

$opening_stock = getBalanceAsAt(22, $from_date);
$closing_stock = getBalanceAsAt(22, $to_date);
$cost_of_goods_sold = getAmount(21, 'debit', $from_date, $to_date) - getAmount(21, 'credit', $from_date, $to_date);

$price_increase = getAmount(17, 'debit', $from_date, $to_date);
$inventory_adjustment = getAmount(24, 'credit', $from_date, $to_date) - getAmount(24, 'debit', $from_date, $to_date);
$evaporation_loss = getAmount(23, 'credit', $from_date, $to_date) - getAmount(23, 'debit', $from_date, $to_date);
$tank_leakage_loss = getAmount(25, 'credit', $from_date, $to_date) - getAmount(25, 'debit', $from_date, $to_date);
$price_reduction = getAmount(18, 'credit', $from_date, $to_date) - getAmount(18, 'debit', $from_date, $to_date);
$Carrying_Cost = getAmount(43, 'credit', $from_date, $to_date) - getAmount(43, 'debit', $from_date, $to_date);

$less_adjustments = -$evaporation_loss - $tank_leakage_loss - $price_reduction;
$add_adjustments = $price_increase + $inventory_adjustment;

$purchase = $closing_stock + $cost_of_goods_sold + $less_adjustments - $add_adjustments - $opening_stock;

$sales_cash   = getAmount(10, 'credit', $from_date, $to_date) - getAmount(10, 'debit', $from_date, $to_date);
$sales_sort   = getAmount(45, 'credit', $from_date, $to_date) - getAmount(45, 'debit', $from_date, $to_date);

$sales_credit = getAmount(11, 'credit', $from_date, $to_date) - getAmount(11, 'debit', $from_date, $to_date);
$sales_card   = getAmount(12, 'credit', $from_date, $to_date) - getAmount(12, 'debit', $from_date, $to_date);
$sales_branch = getAmount(13, 'credit', $from_date, $to_date) - getAmount(13, 'debit', $from_date, $to_date);
$sales_vehicle = getAmount(14, 'credit', $from_date, $to_date) - getAmount(14, 'debit', $from_date, $to_date);
$sales_other = getAmount(15, 'credit', $from_date, $to_date) - getAmount(15, 'debit', $from_date, $to_date);

$sales = $sales_cash + $sales_credit + $sales_card + $sales_branch + $sales_other + $sales_sort + $sales_vehicle;
$gross_sales = $sales + $vat_value;
$gross_profit = $gross_sales - $cost_of_goods_sold;

$admin = getGroupedExpenses('Administrative Expenses');
$operational = getGroupedExpenses('Operational Expenses');
$finance = getGroupedExpenses('Finance Costs');
$total_expenses = $admin['total'] + $operational['total'] + $finance['total'];
$net_profit = $gross_profit - $total_expenses;
?>


<style>

    @media screen {
  .pl-card {
    width: 90% !important;
  }
}


    @media print {
  .card {
    margin-top: -60px; /* Adjust the value as needed */
  }
}


.pl-wrapper { display: flex; }
.pl-left, .pl-right {
  width: 50%;
  border-collapse: collapse;
}

  .pl-left th,   .pl-right th {
  border: 1px solid #333;
  height: 30px  ;
  padding: 6px;
  font-size: 14px;
}



.pl-left td,   .pl-right td {
  border-left: 1px solid #333;
  border-right: 1px solid #333;
 
 padding: 2px 6px 2px 8px;
/* top: 3px, right: 6px, bottom: 5px, left: 10px */
  font-size: 14px;
   line-height: 1.2;
}
.pl-left th, .pl-right th {
  background: #f4f4f4;
  text-align: center;
}
.text-right { text-align: right; }
.text-bold { font-weight: bold; }
</style>

<div class="content-wrapper">
  <div class="container-fluid  ">
    <div class="main-header no-print ">
      <h4>Profit and Loss Account</h4>
    
    
</div>
    <div class="card pl-card"  >    
      <div class="card-block">
<div class='no-print'>

        <form method="get" class="form-inline mb-3">
      <label>From:</label>
      <input type="date" name="from" class="form-control mx-2" value="<?= $from_date ?>">
      <label>To:</label>
      <input type="date" name="to" class="form-control mx-2" value="<?= $to_date ?>">
      <button type="submit" class="btn btn-primary">Generate</button>
      <button onclick="window.print()" class="btn btn-primary"> <i class="fa fa-print" aria-hidden="true"></i> Print</button>
    </form>
    <hr> </div>



        <div align='center'> <h4><?php echo $_SESSION['company']; ?></h4>
    <h5> Trading and Profit and Loss Account for the  Period <?php echo $from_date." - ".$to_date;?></h5>
    </div>
        <div class="pl-wrapper">
          <table class="pl-left">
            <tr><th>Description</th><th>Amount</th><th>Amount</th></tr>
            <tr><td>Opening Stock</td><td></td><td class="text-right"><?= formatAmt($opening_stock) ?></td></tr>
            <tr><td>Purchase</td><td class="text-right"><?= formatAmt($purchase) ?></td><td></td></tr>
            <tr><td>Add: Stock Carrying Cost</td><td class="text-right"><?= formatAmt($Carrying_Cost) ?></td><td></td></tr>
            
            <tr><td>Add: Price Increase *</td><td class="text-right"><?= formatAmt($price_increase) ?></td><td></td></tr>
            <tr><td>Less: Price Reduction *</td><td class="text-right"><?= formatAmt($price_reduction) ?></td><td></td></tr>
            <tr><td><?= $evaporation_loss >= 0 ? 'Add: Evaporation Loss' : 'Less: Evaporation Loss' ?></td><td class="text-right"><?= $evaporation_loss >= 0 ? formatAmt($evaporation_loss) : '(' . formatAmt(abs($evaporation_loss)) . ')' ?></td><td></td></tr>
            <tr><td><?= $inventory_adjustment >= 0 ? 'Add: Inventory Adjustment' : 'Less: Inventory Adjustment' ?></td><td class="text-right"><?= $inventory_adjustment >= 0 ? formatAmt($inventory_adjustment) : '(' . formatAmt(abs($inventory_adjustment)) . ')' ?></td><td></td></tr>
            <tr><td><?= $tank_leakage_loss >= 0 ? 'Add: Tank Leakage' : 'Less: Tank Leakage' ?></td><td class="text-right"><?= $tank_leakage_loss >= 0 ? formatAmt($tank_leakage_loss) : '(' . formatAmt(abs($tank_leakage_loss)) . ')' ?></td><td></td></tr>
            
            <tr><td>Stock is available for sale</td><td></td><td class="text-right"  style="border-top:1px solid #333;"><?= formatAmt($closing_stock+$cost_of_goods_sold) ?></td> </tr>
            <tr><td>Closing Stock ( - )</td><td></td><td class="text-right" >(<?= formatAmt($closing_stock) ?>)</td> </tr>
            <tr><td  >Cost of Goods Sold</td><td></td><td   class="text-right" style="border-top:1px solid #333;"><?= formatAmt($cost_of_goods_sold) ?></td> </tr>
               <!-- <tr><td><font color='white'>.</font></td><td></td><td></td></tr> -->
                            <?php if ($gross_profit >= 0): $g_profit = $gross_profit;  ?> <tr>
                            <td>Gross Profit C/F</td>  <td></td>  <td class="text-right"><?= formatAmt($gross_profit) ?></td>
                            </tr> <?php endif; ?>

                    <tr> <td><span style="color:white;">.</span></td>
                    <td></td> <td class="text-right" style="border-top:1px solid #333; border-bottom:2px solid #333 !important;""><b>
                            <?php 

                            $balance = $cost_of_goods_sold + $g_profit;  
                            echo formatAmt($balance); $balance = 0; ?> </b> </td> </tr>

          <?php if ($gross_profit < 0):    $g_loss = $gross_profit; ?> <tr>
                            <td>Gross Loss B/F</td>  <td></td>  <td class="text-right"><?= formatAmt($gross_profit) ?></td>
                            </tr> <?php endif; ?> 
                            <?php if ($gross_profit >= 0):    ?>  
                                 <tr><td><font color='white'>.</font></td><td></td><td></td></tr>
                                <?php endif; ?> 




                                 <?php foreach ([
                                    'Administrative Expenses' => $admin,
                                    'Operational Expenses' => $operational,
                                    'Finance Costs' => $finance
                                ] as $label => $group):
                                    if ($group['total'] > 0): ?>
                                    <tr><td   class="text-bold text-left bg-light"><?= $label ?></td> <td></td><td></td></tr>
                                    <?php foreach ($group['items'] as $item): ?>
                                        <tr><td><?= $item['name'] ?></td><td class="text-right"><?= formatAmt($item['amount']) ?></td> <td></td></tr>
                                    <?php endforeach; ?>
                                    <tr><td>Total <?= $label ?></td><td style="border-top:1px solid #333;"></td> <td class="text-bold text-right" style="border-top:1px solid #333;"><?= formatAmt($group['total']) ?></td> </tr>
                                <?php endif; endforeach; ?>



                                <?php if ($net_profit > 0): ?>
                                <tr>
                                <td class="text-bold">Net Profit</td>
                                 <td></td>
                                <td   class="text-bold text-right"><?= formatAmt($net_profit) ?></td>
                                </tr>
                                <?php else: ?>
                                <tr>
                                <td>&nbsp;</td>
                                <td></td>
                                <td></td>
                                </tr>
                                <?php endif; ?>


                                      <?php if( $net_profit < 0){
                                        $total =    ($gross_profit ?? 0) - ($net_profit ?? 0);
                                      }  else {
                                          $total =    $gross_profit ?? 0 ;
                                      }
                                        
                                        ?>
                                        <tr>
                                        <td>&nbsp;</td>
                                        <td></td>
                                        <td class="text-bold text-right" style="border-top:1px solid #333; border-bottom:2px solid #333 !important;"><?= formatAmt($total) ?></td>
                                        </tr>                  



        
        </table>

          <table class="pl-right">
            <tr><th>Description</th><th>Amount</th><th>Amount</th></tr>
            <tr><td>Cash Sales</td><td class="text-right"><?= formatAmt($sales_cash) ?></td><td></td></tr>
            <tr><td>Credit Sales</td><td class="text-right"><?= formatAmt($sales_credit) ?></td><td></td></tr>
            <tr><td>Card Sales</td><td class="text-right"><?= formatAmt($sales_card) ?></td><td></td></tr>
            <tr><td>Sales to MPCS Branches</td><td class="text-right"><?= formatAmt($sales_branch) ?></td><td></td></tr>
            <tr><td>Sales to MPCS Vehicle Section</td><td class="text-right"><?= formatAmt($sales_vehicle) ?></td><td></td></tr>
            <tr><td>Sales to MPCS Other Needs</td><td class="text-right"><?= formatAmt($sales_other) ?></td><td></td></tr>
           <tr><td>Sales of Shortage </td><td class="text-right"><?= formatAmt($sales_sort) ?></td><td></td></tr> 
            <tr><td>Total Sales</td><td class="text-right text-bold" style="border-top:1px solid #333;"><b><?= formatAmt($sales) ?></b></td><td></td></tr>
            <tr><td>Value Added Tax <?= $vat_value <= 0 ? '(Payable)' : '(Receivable)' ?></td><td class="text-right" style="border-bottom: 1px solid #333 !important;"><?= $vat_value >= 0 ? formatAmt($vat_value) : '(' . formatAmt(abs($vat_value)) . ')' ?></td><td></td></tr>
            <tr><td>Net Sales</td><td></td><td style="border-bottom:1px solid #333;" class="text-right"><?= formatAmt($gross_sales) ?></td></tr>
      
                        <tr><td><font color='white'>.</font></td><td></td><td></td></tr>
                        <!-- <tr><td><font color='white'>.</font></td><td></td><td></td></tr> -->
           
          
        
          <?php if ($gross_profit < 0):    $g_loss = $gross_profit; ?> <tr>
                            <td>Gross Loss C/F</td>  <td></td>  <td class="text-right"><?= formatAmt($gross_profit) ?></td>
                            </tr> <?php endif; ?> 
                            
                            
                            <tr><td><font color='white'>.</font></td><td></td><td></td></tr>
        
         <tr> <td><span style="color:white;">.</span></td>
                    <td></td> <td class="text-right" style="border-top:1px solid #333; border-bottom:2px solid #333 !important;"> <b>
                            <?php  $g_loss = $g_loss ?? 0;
                            $balance = $gross_sales + $g_loss;  
                            echo formatAmt($balance); ?> </b> </td> </tr>
        
                            <?php if ($gross_profit >= 0): $g_profit = $gross_profit;  ?>
                             <tr>
                            <td>Gross Profit B/F</td>  <td></td>  <td class="text-right"><?= formatAmt($gross_profit) ?></td>
                            </tr> <?php endif; ?>
                              <?php if ($gross_profit < 0):    ?>  
                                 <tr><td><font color='white'>.</font></td><td></td><td></td></tr>
                                <?php endif; ?> 


                                 <?php foreach ([
                                    'Administrative Expenses' => $admin,
                                    'Operational Expenses' => $operational,
                                    'Finance Costs' => $finance
                                ] as $label => $group):
                                    if ($group['total'] > 0): ?>
                                    <tr><td  > </td> <td><font color='white'>.</font></td><td></td></tr>
                                    <?php foreach ($group['items'] as $item): ?>
                                        <tr><td><font color='white'>.</font> </td><td class="text-right"> </td> <td></td></tr>
                                    <?php endforeach; ?>
                                    <tr><td><font color='white'>.</font> </td><td  ></td> <td  > </td> </tr>
                                <?php endif; endforeach; ?>   
                                


                                <?php if ($net_profit < 0): $net_loss = abs($net_profit); ?>
                                <tr>
                                <td class="text-bold">Net Loss</td>
                                 <td></td>
                                <td   class="text-bold text-right"><?= formatAmt($net_profit*-1) ?></td>
                                </tr>
                                <?php else: ?>
                                <tr>
                                <td>&nbsp;</td>
                                <td></td>
                                <td></td>
                                </tr>
                                <?php endif; ?>

                                        <?php
                                        $total = ($net_loss ?? 0) + ($gross_profit ?? 0);
                                        ?>
                                        <tr>
                                        <td>&nbsp;</td>
                                        <td></td>
                                        <td class="text-bold text-right" style="border-top:1px solid #333; border-bottom:2px solid #333 !important;"><?= formatAmt($total) ?></td>
                                        </tr> 



        </table>
        </div>

        <table class="pl-left" style="margin-top:20px; width:100%;">
         
          <!-- <td class="text-bold">Net Loss</td><td><?= $net_profit < 0 ? formatAmt(abs($net_profit)) : '' ?></td><td></td></tr> -->
        </table>
      </div>
    </div>
  </div>
</div>
<?php include 'footer.php'; ?>