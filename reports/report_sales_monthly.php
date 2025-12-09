<?php  ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }
    ?>
 

<style>
 

   
    @media print {
  .card {
    margin-top: -100px; /* Adjust the value as needed */
    margin-left: -12px; /* Adjust the value as needed */
        }
      }
  @media print {
    .no-print { display: none !important; }
    .print-only { display: block !important; }
  }
  @media screen {
    .print-only { display: none !important; }
  }
  /* .table td, .table th {
    border: 1px solid #999;
    padding: 0px 8px;
    font-size: 13px;
  } */

  .table td, .table th {
    border: 1px solid #999;
    padding: 2px 6px;       /* Less padding for compact rows */
    font-size: 14px;        /* Smaller but still readable */
    line-height: 1.3;       /* Reduced vertical spacing */
    font-family: 'Arial Narrow', Arial, sans-serif;  /* Space-efficient font */
}


  .table th {
    border: 1px solid #999;
    text-align: center;
    background: #f4f4f4;
  }
  .text-right { text-align: right; }
  .text-center { text-align: center; }
  .font-weight-bold { font-weight: bold; }
</style>

<?php
 

$selected_date = isset($_GET['date']) ? $_GET['date'] : date('Y-m-d');
$from_month_start = date('Y-m-01', strtotime($selected_date));
$yesterday = date('Y-m-d', strtotime($selected_date . ' -1 day'));
$opening_end = date('Y-m-d', strtotime($from_month_start . ' -1 day'));

$products = [];
$product_q = mysqli_query($con, "SELECT product_master.p_id, p_name FROM product_master INNER JOIN fuel_capacity ON fuel_capacity.p_id = product_master.p_id WHERE p_cat = 'Fuel' AND fuel_capacity.capacity > 0 AND fuel_capacity.location_id = '$location_id'");
while ($row = mysqli_fetch_assoc($product_q)) {
    $products[$row['p_id']] = $row['p_name'];
}

$addition_today = [];
$addition_yesterday = [];
$addition_total = [];

$opening_stock = [];
 

$adjustment_today = [];
$adjustment_yesterday = [];
$adjustment_total = [];

$q_adjust = mysqli_query($con, "
  SELECT p_id, DATE(date_time) AS dt, SUM(debit - credit) AS net_qty, MAX(sales_price) AS rate
  FROM fuel_stock_ledger
  WHERE shift_id = -2
    AND location_id = '$location_id'
    AND status = 1
    AND DATE(date_time) BETWEEN '$from_month_start' AND '$selected_date'
  GROUP BY p_id, DATE(date_time)
");

$adjustment_count = [];

while ($row = mysqli_fetch_assoc($q_adjust)) {
    $p_id = $row['p_id'];
    $qty = floatval($row['net_qty']);
    $rate = floatval($row['rate']);
    $date = $row['dt'];

    if (!isset($adjustment_count[$p_id])) $adjustment_count[$p_id] = 0;
    $adjustment_count[$p_id]++;

    if ($date === $selected_date) {
        $adjustment_today[$p_id]['qty'] = ($adjustment_today[$p_id]['qty'] ?? 0) + $qty;
        $adjustment_today[$p_id]['rate'] = $rate;
    } else {
        $adjustment_yesterday[$p_id]['qty'] = ($adjustment_yesterday[$p_id]['qty'] ?? 0) + $qty;
        $adjustment_yesterday[$p_id]['rate'] = $rate;
    }

    // always sum for total
    $adjustment_total[$p_id]['qty'] = ($adjustment_total[$p_id]['qty'] ?? 0) + $qty;
    $adjustment_total[$p_id]['rate'] = $rate;
}


// Step 1: Get total opening qty per product
$qty_sql = mysqli_query($con, "
    SELECT p_id, SUM(debit - credit) AS qty
    FROM fuel_stock_ledger
    WHERE status = 1
      AND location_id = '$location_id'
      AND DATE(date_time) < '$from_month_start'
    GROUP BY p_id
");

while ($row = mysqli_fetch_assoc($qty_sql)) {
    $opening_stock[$row['p_id']] = [
        'qty' => floatval($row['qty']),
        'rate' => 0 // will fill later
    ];
}

// Step 2: Get latest sales_price per product (latest shift_id and id)

foreach ($opening_stock as $p_id => &$stock) {
    $rate_sql = mysqli_query($con, "
        SELECT new_price 
        FROM fuel_price_change
        WHERE  
           status = 1
          AND p_id = '$p_id'
          AND DATE(date_time) < '$from_month_start'
        ORDER BY date_time DESC 
        LIMIT 1
    ");
    
    if ($rate_row = mysqli_fetch_assoc($rate_sql)) {
        $stock['rate'] = floatval($rate_row['new_price']);
    }
}


// foreach ($opening_stock as $p_id => &$stock) {
//     $rate_sql = mysqli_query($con, "
//         SELECT sales_price 
//         FROM fuel_stock_ledger
//         WHERE location_id = '$location_id'
//           AND status = 1 
//           AND  shift_id > 0
//           AND p_id = '$p_id'
//           AND DATE(date_time) < '$from_month_start'
//         ORDER BY shift_id DESC 
//         LIMIT 1
//     ");
//     if ($rate_row = mysqli_fetch_assoc($rate_sql)) {
//         $stock['rate'] = floatval($rate_row['sales_price']);
//     }
// }



// Query for additions - today
$q_today = mysqli_query($con, "
    SELECT p_id, SUM(quantity) AS qty, MAX(rate) AS rate
    FROM fuel_purchase_master
    WHERE location_id = '$location_id'
      AND status = 1
      AND DATE(purchase_date) = '$selected_date'
    GROUP BY p_id
");
while ($row = mysqli_fetch_assoc($q_today)) {
    $addition_today[$row['p_id']] = [
        'qty' => floatval($row['qty']),
        'rate' => floatval($row['rate']),
    ];
}

// Query for additions - up to yesterday
$q_prev = mysqli_query($con, "
    SELECT p_id, SUM(quantity) AS qty, MAX(rate) AS rate
    FROM fuel_purchase_master
    WHERE location_id = '$location_id'
      AND status = 1
      AND DATE(purchase_date) BETWEEN '$from_month_start' AND '$yesterday'
    GROUP BY p_id
");
while ($row = mysqli_fetch_assoc($q_prev)) {
    $addition_yesterday[$row['p_id']] = [
        'qty' => floatval($row['qty']),
        'rate' => floatval($row['rate']),
    ];
}

foreach ($products as $pid => $pname) {
    $qty_today = $addition_today[$pid]['qty'] ?? 0;
    $rate_today = $addition_today[$pid]['rate'] ?? 0;

    $qty_yest = $addition_yesterday[$pid]['qty'] ?? 0;
    $rate_yest = $addition_yesterday[$pid]['rate'] ?? 0;

    $total_qty = $qty_today + $qty_yest;

    // Pick the latest available rate (prefer today's if available)
    $rate = $rate_today ?: $rate_yest;

    $addition_total[$pid] = [
        'qty' => $total_qty,
        'rate' => $rate,
    ];
}


$stock_ready = [];

foreach ($products as $p_id => $pname) {
    $q1 = $opening_stock[$p_id]['qty'] ?? 0;
    $r1 = $opening_stock[$p_id]['rate'] ?? 0;

    $q2 = $addition_yesterday[$p_id]['qty'] ?? 0;
    $r2 = $addition_yesterday[$p_id]['rate'] ?? 0;

    $q3 = $addition_today[$p_id]['qty'] ?? 0;
    $r3 = $addition_today[$p_id]['rate'] ?? 0;

    $q4 = $other_addition[$p_id]['qty'] ?? 0;
    $r4 = $other_addition[$p_id]['rate'] ?? 0;

    $total_qty = $q1 + $q2 + $q3 + $q4;

    // pick the most recent available rate (priority: today > yesterday > other > opening)
    $rate = $r3 ?: ($r2 ?: ($r4 ?: $r1));

    $stock_ready[$p_id] = [
        'qty' => $total_qty,
        'rate' => $rate
    ];
}


$supply_today = $supply_yesterday = $supply_month = [];
foreach ($products as $pid => $pname) {
    $supply_today[$pid] = ['cash' => 0, 'credit' => 0, 'internal' => 0, 'rate' => 0];
    $supply_yesterday[$pid] = ['cash' => 0, 'credit' => 0, 'internal' => 0, 'rate' => 0];
    $supply_month[$pid] = ['cash' => 0, 'credit' => 0, 'internal' => 0, 'rate' => 0];
}
$q_credit_today = mysqli_query($con, "
  SELECT d.p_id, d.qty, d.rate, s.c_id
  FROM shed_credit_sales_detail d
  JOIN shed_credit_sales s ON d.cs_id = s.cs_id
  WHERE DATE(s.date_time) = '$selected_date' AND s.status = 1
");
while ($row = mysqli_fetch_assoc($q_credit_today)) {
    $pid = $row['p_id'];
    $qty = floatval($row['qty']);
    $rate = floatval($row['rate']);
    $type = $row['c_id'] < 4 ? 'internal' : 'credit';
    $supply_today[$pid][$type] += $qty;
    $supply_today[$pid]['rate'] = $rate;
}

// Fetch credit and internal sales for up to yesterday
$q_credit_yesterday = mysqli_query($con, "
  SELECT d.p_id, d.qty, d.rate, s.c_id
  FROM shed_credit_sales_detail d
  JOIN shed_credit_sales s ON d.cs_id = s.cs_id
  WHERE DATE(s.date_time) BETWEEN '$from_month_start' AND '$yesterday' AND s.status = 1
");
while ($row = mysqli_fetch_assoc($q_credit_yesterday)) {
    $pid = $row['p_id'];
    $qty = floatval($row['qty']);
    $rate = floatval($row['rate']);
    $type = $row['c_id'] < 4 ? 'internal' : 'credit';
    $supply_yesterday[$pid][$type] += $qty;
    $supply_yesterday[$pid]['rate'] = $rate;
}

// Fetch total sales from pump_assign for today
$q_pump_today = mysqli_query($con, "
  SELECT a.product_id AS p_id, SUM(a.fuel_sales) AS total_qty, MAX(a.sales_price) AS rate
  FROM shed_pump_assign a
  JOIN shed_operator_shift s ON a.shift_id = s.shift_id
  WHERE DATE(s.start_time) = '$selected_date'
    AND s.status = 1 AND s.location_id = '$location_id'
  GROUP BY a.product_id
");
while ($row = mysqli_fetch_assoc($q_pump_today)) {
    $pid = $row['p_id'];
    $qty = floatval($row['total_qty']);
    $rate = floatval($row['rate']);
    $credit = $supply_today[$pid]['credit'] ?? 0;
    $internal = $supply_today[$pid]['internal'] ?? 0;
    $cash = $qty - $credit - $internal;
    $supply_today[$pid]['cash'] = $cash > 0 ? $cash : 0;
    $supply_today[$pid]['rate'] = $rate;
}

// Fetch total sales from pump_assign for up to yesterday
$q_pump_yesterday = mysqli_query($con, "
  SELECT a.product_id AS p_id, SUM(a.fuel_sales) AS total_qty, MAX(a.sales_price) AS rate
  FROM shed_pump_assign a
  JOIN shed_operator_shift s ON a.shift_id = s.shift_id
  WHERE DATE(s.start_time) BETWEEN '$from_month_start' AND '$yesterday'
    AND s.status = 1 AND s.location_id = '$location_id'
  GROUP BY a.product_id
");
while ($row = mysqli_fetch_assoc($q_pump_yesterday)) {
    $pid = $row['p_id'];
    $qty = floatval($row['total_qty']);
    $rate = floatval($row['rate']);
    $credit = $supply_yesterday[$pid]['credit'] ?? 0;
    $internal = $supply_yesterday[$pid]['internal'] ?? 0;
    $cash = $qty - $credit - $internal;
    $supply_yesterday[$pid]['cash'] = $cash > 0 ? $cash : 0;
    $supply_yesterday[$pid]['rate'] = $rate;
}

// Combine into month totals
foreach ($products as $pid => $pname) {
    $supply_month[$pid]['cash'] = ($supply_today[$pid]['cash'] ?? 0) + ($supply_yesterday[$pid]['cash'] ?? 0);
    $supply_month[$pid]['credit'] = ($supply_today[$pid]['credit'] ?? 0) + ($supply_yesterday[$pid]['credit'] ?? 0);
    $supply_month[$pid]['internal'] = ($supply_today[$pid]['internal'] ?? 0) + ($supply_yesterday[$pid]['internal'] ?? 0);
    $supply_month[$pid]['rate'] = $supply_today[$pid]['rate'] ?: $supply_yesterday[$pid]['rate'];
}




 $total_adjustment_qty = 0;
$total_adjustment_value = 0;

foreach ($adjustment_total as $pid => $row) {
    $qty = floatval($row['qty']);
    $rate = floatval($row['rate']);
    $total_adjustment_qty += $qty;
    $total_adjustment_value += $qty * $rate;
}
$has_adjustment = $total_adjustment_qty != 0;



$end_stock = [];
$total_supply = [];
$remaining_stock = [];

 $price_change_adjustment = [];
 

 foreach ($products as $pid => $pname) {
    $price_change_result = mysqli_query($con, "
        SELECT new_price, date_time 
        FROM fuel_price_change 
        WHERE p_id = '$pid' 
          AND DATE(date_time) BETWEEN '$from_month_start' AND '$selected_date' 
          AND status = 1 
        ORDER BY date_time ASC 
        LIMIT 1
    ");

    if (!$price_change_result || mysqli_num_rows($price_change_result) == 0) continue;

    $price_change = mysqli_fetch_assoc($price_change_result);
    $new_price = floatval($price_change['new_price']);
    $change_date = $price_change['date_time'];

    $old_price_result = mysqli_query($con, "
        SELECT new_price 
        FROM fuel_price_change 
        WHERE p_id = '$pid'
          AND DATE(date_time) < '$change_date'
          AND status = 1 
        ORDER BY date_time DESC 
        LIMIT 1
    ");

    if (!$old_price_result || mysqli_num_rows($old_price_result) == 0) continue;

    $old_price = floatval(mysqli_fetch_assoc($old_price_result)['new_price']);

    // 🔍 Get stock before price change
    $stock_qty_result = mysqli_query($con, "
        SELECT SUM(debit - credit) AS qty 
        FROM fuel_stock_ledger 
        WHERE p_id = '$pid' 
          AND location_id = '$location_id'
          AND status = 1 
          AND DATE(date_time) < '$change_date'
    ");

    $qty = 0;
    if ($stock_qty_result && mysqli_num_rows($stock_qty_result) > 0) {
        $stock_row = mysqli_fetch_assoc($stock_qty_result);
        $qty = floatval($stock_row['qty']);
    }

    if ($qty == 0 || $new_price == $old_price) continue;

    $price_diff = $new_price - $old_price;
    $adjustment = $qty * $price_diff;

    $price_change_adjustment[$pid] = $adjustment;

 // Ensure base structure
if (!isset($adjustment_total[$pid])) {
    $adjustment_total[$pid] = ['qty' => 0, 'rate' => 0];
}

// Ledger-based value
$ledger_qty  = $adjustment_total[$pid]['qty'];
$ledger_rate = $adjustment_total[$pid]['rate'];
$ledger_value = $ledger_qty * $ledger_rate;

// Store combined value
$adjustment_total[$pid]['value'] = $ledger_value + $adjustment;


    // ✅ Reflect updated price in End Stock
    $end_stock[$pid]['rate'] = $new_price;
}


 

foreach ($products as $pid => $pname) {
    // qty & rate already worked out earlier
    $ready_qty  = $stock_ready[$pid]['qty']  ?? 0;
    $ready_rate = $stock_ready[$pid]['rate'] ?? 0;

    $sup_qty  = ($supply_month[$pid]['cash']     ?? 0)
              + ($supply_month[$pid]['credit']   ?? 0)
              + ($supply_month[$pid]['internal'] ?? 0);
    $sup_rate = $supply_month[$pid]['rate'] ?? 0;

    /* 👉 NEW – month’s net stock-adjustment (debit-credit) */
    $adj_qty  = $adjustment_total[$pid]['qty']  ?? 0;
    $adj_rate = $adjustment_total[$pid]['rate'] ?? 0;   // keeps a value handy

    /* End stock **after** applying the adjustment */
    $end_qty = $ready_qty - $sup_qty + $adj_qty;
    $end_qty = $end_qty < 0 ? 0 : $end_qty;             // safety guard

    // $end_stock[$pid]      = ['qty' => $end_qty, 'rate' => $ready_rate];
    $final_rate = isset($price_change_adjustment[$pid]) ? $new_price : $ready_rate;
    $end_stock[$pid] = ['qty' => $end_qty, 'rate' => $final_rate];
    $total_supply[$pid]   = ['qty' => $sup_qty, 'rate' => $sup_rate];
    $remaining_stock[$pid]= ['qty' => $end_qty, 'rate' => $ready_rate];
}



?>

<div class="content-wrapper">
   <div class="container-fluid">

      <div class="row  no-print">
         <div class="col-sm-12">
            <div class="main-header">
               <h4>  Stock Movement Report as at <?= date('d-m-Y', strtotime($selected_date)) ?></h4>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-12">
            <div class="card">
          <div class="row no-print">
            <div class="col-sm-12">
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

 
<div align='right'>
 
        <h6> F21C</h6>
         
      </div>
      <div align='center'>
         <h4 class="mt-4"><?= $_SESSION['company'] ?> | <?= $client_name; ?> - <?= $reg_no; ?>  </h4>
           Stock Movement Report as at <?= date('d-m-Y', strtotime($selected_date)) ?> 
      </div>
      
        <table class="table table-bordered">
          <thead>
            <tr>
              <th rowspan="2">Description</th>
              <?php foreach ($products as $pid => $pname): ?>
                <th colspan="2" class="text-center"><?= $pname ?> </th>
              <?php endforeach; ?>
            </tr>
            <tr>
              <?php foreach ($products as $pid => $pname): ?>
                <th class="text-center">Qty</th>
                <th class="text-center">Value</th>
              <?php endforeach; ?>
            </tr>
          </thead>
          <tbody>
            <?php
                $rows = [
                'Receipt' => [
                    // 'Other Addition',
                    'Addition - today',
                    'Addition - up to yesterday',
                    'Total',
                    'Opening Stock',
                    'Total Stock ready to supply'
                ],
                'Supply - Today' => ['Cash sales', 'Credit', 'Credit - Internal', 'Supply Total 1'],
                'Supply - Up to Yesterday' => ['Cash sales', 'Credit', 'Credit - Internal', 'Supply Total 2'],
                'This Month Supply' => ['Cash sales', 'Credit', 'Credit - Internal', 'Total Supply'],
                'Stock Adjustment' => ['Adjustment - Up to Yesterday', 'Adjustment - Today', 'Price Change Adjustment','Total Adjustment'],
                'End Stock' => ['End Stock','Stock Adjustment',  'Total Supply', 'Stock ready to sales']
                ];

            foreach ($rows as $section => $items):
              echo "<tr><td colspan=" . (1 + count($products) * 2) . "><strong>$section</strong></td></tr>";
              foreach ($items as $item):
                echo "<tr><td>$item</td>";
                foreach ($products as $pid => $pname):
                //   echo "<td class='text-center'>0.0</td><td class='text-right'>0.00</td>"; // Placeholder values


                if ($item == 'Addition - today') {
                    $qty = $addition_today[$pid]['qty'] ?? 0;
                    $rate = $addition_today[$pid]['rate'] ?? 0;
                } elseif ($item == 'Addition - up to yesterday') {
                    $qty = $addition_yesterday[$pid]['qty'] ?? 0;
                    $rate = $addition_yesterday[$pid]['rate'] ?? 0;
                } elseif ($item == 'Total') {
                    $qty = $addition_total[$pid]['qty'] ?? 0;
                    $rate = $addition_total[$pid]['rate'] ?? 0;
                }
                elseif ($item == 'Opening Stock') {
                    $qty = $opening_stock[$pid]['qty'] ?? 0;
                    $rate = $opening_stock[$pid]['rate'] ?? 0;
                }
                elseif ($item == 'Total Stock ready to supply') {
                      $qty = $stock_ready[$pid]['qty'] ?? 0;
                      $rate = $stock_ready[$pid]['rate'] ?? 0;
                      $value = $qty * $rate;

                      echo "<td class='text-center font-weight-bold'>" . format_qty($qty) . "</td>";
                      echo "<td class='text-right font-weight-bold'>" . number_format($value, 2) . "</td>";
                      continue;
                  }

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                // else {
                //     $qty = 0;
                //     $rate = 0;
                // }
                    // echo "<td class='text-center'>" . format_qty($qty) . "</td>";
                    // echo "<td class='text-right'>" . number_format($qty * $rate, 1) . "</td>";

 


                    elseif (in_array($item, ['Cash sales', 'Credit', 'Credit - Internal'])) {
    if ($section == 'Supply - Today') {
        $type = strtolower(str_replace(' ', '', $item)); // 'cashsales' → 'cashsales'
        $type = str_contains($type, 'cash') ? 'cash' : (str_contains($type, 'internal') ? 'internal' : 'credit');
        $qty = $supply_today[$pid][$type] ?? 0;
        $rate = $supply_today[$pid]['rate'] ?? 0;
    } elseif ($section == 'Supply - Up to Yesterday') {
        $type = str_contains($item, 'Cash') ? 'cash' : (str_contains($item, 'Internal') ? 'internal' : 'credit');
        $qty = $supply_yesterday[$pid][$type] ?? 0;
        $rate = $supply_yesterday[$pid]['rate'] ?? 0;
    } elseif ($section == 'This Month Supply') {
        $type = str_contains($item, 'Cash') ? 'cash' : (str_contains($item, 'Internal') ? 'internal' : 'credit');
        $qty = $supply_month[$pid][$type] ?? 0;
        $rate = $supply_month[$pid]['rate'] ?? 0;
    } else {
        $qty = 0;
        $rate = 0;
    }
} elseif (str_starts_with($item, 'Supply Total')) {
    if ($section == 'Supply - Today') {
        $qty = ($supply_today[$pid]['cash'] ?? 0) + ($supply_today[$pid]['credit'] ?? 0) + ($supply_today[$pid]['internal'] ?? 0);
        $rate = $supply_today[$pid]['rate'] ?? 0;
    } elseif ($section == 'Supply - Up to Yesterday') {
        $qty = ($supply_yesterday[$pid]['cash'] ?? 0) + ($supply_yesterday[$pid]['credit'] ?? 0) + ($supply_yesterday[$pid]['internal'] ?? 0);
        $rate = $supply_yesterday[$pid]['rate'] ?? 0;
    } elseif ($section == 'This Month Supply') {
        $qty = ($supply_month[$pid]['cash'] ?? 0) + ($supply_month[$pid]['credit'] ?? 0) + ($supply_month[$pid]['internal'] ?? 0);
        $rate = $supply_month[$pid]['rate'] ?? 0;
    } else {
        $qty = 0;
        $rate = 0;
    }
} elseif ($item == 'End Stock') {
    $qty = $end_stock[$pid]['qty'] ?? 0;
    $rate = $end_stock[$pid]['rate'] ?? 0;
} elseif ($item == 'Total Supply') {
    $qty = $total_supply[$pid]['qty'] ?? 0;
    $rate = $total_supply[$pid]['rate'] ?? 0;
} 

            elseif ($item == 'Stock ready to sales') {
    $qty = $stock_ready[$pid]['qty'] ?? 0;
    $rate = $stock_ready[$pid]['rate'] ?? 0;
    $value = $qty * $rate;

    echo "<td class='text-center font-weight-bold'>" . format_qty($qty) . "</td>";
    echo "<td class='text-right font-weight-bold'>" . number_format($value, 2) . "</td>";
    continue;
}

elseif ($item == 'Adjustment - Up to Yesterday') {
    $qty = $adjustment_yesterday[$pid]['qty'] ?? 0;
    $rate = $adjustment_yesterday[$pid]['rate'] ?? 0;
} elseif ($item == 'Adjustment - Today') {
    $qty = $adjustment_today[$pid]['qty'] ?? 0;
    $rate = $adjustment_today[$pid]['rate'] ?? 0;
}  
elseif ($item == 'Stock Adjustment') {
   $qty   = $adjustment_total[$pid]['qty'] ?? 0;
    $value = $adjustment_total[$pid]['value'] ?? 0;
    echo "<td class='text-center'>" . format_qty($qty) . "</td>";
    echo "<td class='text-right  '>" . number_format($value, 2) . "</td>";
    continue;
}

elseif ($item == 'Price Change Adjustment') {
    $qty = '-';
    $rate = 0;
    $value = $price_change_adjustment[$pid] ?? 0;
    echo "<td class='text-center'>-</td>";
    echo "<td class='text-right text-primary font-weight-bold'>" . number_format($value, 2) . "</td>";
    continue;
} elseif ($item == 'Total Adjustment') {
    $qty   = $adjustment_total[$pid]['qty'] ?? 0;
    $value = $adjustment_total[$pid]['value'] ?? 0;
    echo "<td class='text-center'>" . format_qty($qty) . "</td>";
    echo "<td class='text-right '>" . number_format($value, 2) . "</td>";
    continue;
}


else {
    $qty = 0;
    $rate = 0;
}
 
      echo "<td class='text-center'>" . format_qty($qty) . "</td>";
                    echo "<td class='text-right'>" . number_format($qty * $rate, 2) . "</td>";

                endforeach;
                echo "</tr>";
              endforeach;
            endforeach;





            
            ?>
          </tbody>
        </table>
<?php 
        $products = [];
$product_q = mysqli_query($con, "
    SELECT product_master.p_id, p_name 
    FROM product_master 
    INNER JOIN fuel_capacity ON fuel_capacity.p_id = product_master.p_id 
    WHERE p_cat = 'Fuel' AND fuel_capacity.capacity > 0 AND fuel_capacity.location_id = '$location_id'
");
while ($row = mysqli_fetch_assoc($product_q)) {
    $products[$row['p_id']] = $row['p_name'];
}

// Get pump details
$pumps = [];
$pump_q = mysqli_query($con, "SELECT id, pump_name, product_assigned FROM manage_pump WHERE location_id = '$location_id' AND status = 1");
while ($row = mysqli_fetch_assoc($pump_q)) {
    $pumps[$row['id']] = [
        'name' => $row['pump_name'],
        'product_id' => $row['product_assigned']
    ];
}

// Get all shifts for the day
$shift_ids = [];
$shift_q = mysqli_query($con, "SELECT shift_id FROM shed_operator_shift WHERE location_id = '$location_id' AND DATE(start_time) = '$selected_date'");
while ($r = mysqli_fetch_assoc($shift_q)) {
    $shift_ids[] = $r['shift_id'];
}

// Get all assignments for those shifts
$assignments = [];
if (!empty($shift_ids)) {
    $ids_str = implode(',', $shift_ids);
    $res = mysqli_query($con, "SELECT * FROM shed_pump_assign WHERE shift_id IN ($ids_str) AND status = 1");

    while ($r = mysqli_fetch_assoc($res)) {
        $pump_id = $r['pump_id'];
        $product_id = $r['product_id'];

        $assignments[] = [
            'product_id' => $product_id,
            'product_name' => $products[$product_id] ?? 'Unknown',
            'pump_name' => $pumps[$pump_id]['name'] ?? 'Unknown',
            'opening' => $r['opening_reading'],
            'closing' => $r['closing_reading'],
            'test' => $r['total_test_reading'],
            'sales' => $r['fuel_sales']
        ];
    }
}

// Sort assignments by product name, then pump name, then opening
usort($assignments, function ($a, $b) {
    return [$a['product_name'], $a['pump_name'], $a['opening']] <=> [$b['product_name'], $b['pump_name'], $b['opening']];
});
?>

<style>
.custom-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 14px;
}
.custom-table th, .custom-table td {
    /* border: 1px solid #999;
    padding: 0px 6px;
     */

         border: 1px solid #999;
    padding: 2px 6px;       /* Less padding for compact rows */
    font-size: 14px;        /* Smaller but still readable */
    line-height: 1.3;       /* Reduced vertical spacing */
    font-family: 'Arial Narrow', Arial, sans-serif;  /* Space-efficient font */
    
}
.custom-table th {
    background: #f2f2f2;
}
.subtotal-row {
    font-weight: bold;
    background: #eee;
}
.text-right {
    text-align: right;
}
</style>

<b>Pump Summary - <?= date('d-m-Y', strtotime($selected_date)) ?></b>

<table class="custom-table">
    <thead>
        <tr>
            <th>Product</th>
            <th>Pump</th>
            <th>Opening</th>
            <th>Closing</th>
            <th>Test Reading</th>
            <th>Fuel Sales</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $current_product = null;
        $product_total = 0;

        foreach ($assignments as $entry) {
            if ($entry['product_name'] !== $current_product) {
                // Show subtotal for previous product
                if ($current_product !== null) {
                    echo "<tr class='subtotal-row'>
                            <td colspan='5'>Total for {$current_product}</td>
                            <td class='text-right'>" . number_format($product_total, 3) . "</td>
                          </tr>";
                }
                $current_product = $entry['product_name'];
                $product_total = 0;
            }
            
     // 🔁 Skip row if opening and closing are the same
        if ($entry['opening'] == $entry['closing']) {
            continue;
        }

            
            echo "<tr>
                    <td>{$entry['product_name']}</td>
                    <td>{$entry['pump_name']}</td>
                    <td>{$entry['opening']}</td>
                    <td>{$entry['closing']}</td>
                    <td class='text-center'>{$entry['test']}</td>
                    <td class='text-right'>" . number_format($entry['sales'], 3) . "</td>
                  </tr>";

            $product_total += $entry['sales'];
        }

        // Final subtotal
        if ($current_product !== null) {
            echo "<tr class='subtotal-row'>
                    <td colspan='5'>Total for {$current_product}</td>
                    <td class='text-right'>" . number_format($product_total, 3) . "</td>
                  </tr>";
        }
        ?>
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
  </div>
</div>

<?php include 'footer.php'; ?>
