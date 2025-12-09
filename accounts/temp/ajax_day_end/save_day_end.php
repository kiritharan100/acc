<?php
include '../../db.php';
include '../../auth.php'; 

header('Content-Type: application/json');

// Get POST data
$date_ended = $_POST['end_date'] ?? null;
$fuel_sales = $_POST['fuel_sales'] ?? 0;

$oil_sales = $_POST['oil_sales'] ?? 0;
$card_sales = $_POST['card_sales'] ?? 0;
$credit_sales = $_POST['credit_sales'] ?? 0;
$short_excess = $_POST['short_excess'] ?? 0;
$total_cash_sales = $_POST['total_cash'] ?? 0;
$total_cash = $_POST['day_end_cash'] ?? 0;
$oil_short =  $total_cash - $total_cash_sales;
$location_id = $_REQUEST['location_id'] ?? 0;
$fuel_purchase = $_POST['fuel_purchase'] ?? 0;
$oil_purchase = $_POST['oil_purchase'] ?? 0;

if (!$date_ended) {
    echo json_encode(['success' => false, 'message' => 'End date is required']);
    exit;
}



// Find last serial_no for this location
$sql_last_serial = "SELECT serial_no FROM day_end_process WHERE location_id = '$location_id' ORDER BY serial_no DESC LIMIT 1";
$res = mysqli_query($con, $sql_last_serial);
if ($res && mysqli_num_rows($res) > 0) {
    $row = mysqli_fetch_assoc($res);
    $new_serial = intval($row['serial_no']) + 1;
} else {
    $new_serial = 1; // first serial_no
}

$sql = "
    SELECT s.shift_no, s.shift_id, s.total_sales, s.total_card_sales, s.total_credit_sales, s.cash_received, s.exces_short,
           o.op_name
    FROM shed_operator_shift s
    LEFT JOIN manage_pump_operator o ON s.operator_id = o.op_id
    WHERE s.open_status = 0 AND s.day_end = 0 AND s.status = 1 and s.location_id ='$location_id'
    ORDER BY s.shift_no ASC
";
$result = mysqli_query($con, $sql);
if (!$result) {
    echo json_encode(['success' => false, 'html' => '<p>Error: ' . htmlspecialchars(mysqli_error($con)) . '</p>']);
    exit;
}
$rows = [];
while ($row = mysqli_fetch_assoc($result)) {
    $shift_id = $row['shift_id'];

    $query_update_card_sales ="UPDATE `shed_card_sales` SET day_end = '$new_serial'  WHERE  ( shift_id = '$shift_id' OR shift_id = '0')  AND day_end = '0' AND status = '1'  ";
     mysqli_query($con, $query_update_card_sales);

     $query_update_credit_sales = "UPDATE shed_credit_sales SET day_end = '$new_serial'  WHERE shift_id = '$shift_id'  AND day_end = '0' AND status = '1'  ";
    mysqli_query($con, $query_update_credit_sales);



      $query_update_shift ="UPDATE shed_operator_shift set day_end = '$new_serial' where   shift_id = '$shift_id' ";
      mysqli_query($con, $query_update_shift);
  
}
    $query_update_oil_sales ="UPDATE oil_sales_master SET day_end = '$new_serial'  WHERE   day_end = '0' and issue_status = '1'";
     mysqli_query($con, $query_update_oil_sales);

      $query_update_oil_grn = "UPDATE  oil_grn_master set  day_end = '$new_serial' WHERE day_end = '0' AND grn_status = '1' AND location = '$location_id'   ";
      mysqli_query($con, $query_update_oil_grn);

      $query_update_fuel_purchase = "UPDATE  fuel_purchase_master set day_end = '$new_serial' WHERE day_end = '0' AND location_id ='$location_id' AND status = '1' ";
      mysqli_query($con, $query_update_fuel_purchase);

      


// Insert day end record
$sql_insert = "
    INSERT INTO day_end_process 
    (location_id, serial_no, date_ended, created_by, created_on, status, fuel_sales, oil_sales, total_card_settled, total_credit_settle, total_cash_settled, fuel_short_excess, oil_short_excess,fuel_purchase,oil_purchase) 
    VALUES 
    ('$location_id', '$new_serial', '$date_ended', '$user_id', NOW(), 1, '$fuel_sales', '$oil_sales', '$card_sales', '$credit_sales', '$total_cash', '$short_excess' , '$oil_short','$fuel_purchase','$oil_purchase')
";

if (mysqli_query($con, $sql_insert)) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => mysqli_error($con)]);
}
