<?php
include '../../db.php';
include '../../auth.php';
header('Content-Type: application/json');

$location = $_REQUEST['location_id'];
$months = [];
$sales = [];
$purchases = [];

for ($i = 5; $i >= 0; $i--) {
    $month_start = date('Y-m-01', strtotime("-{$i} months"));
    $month_end = date('Y-m-t', strtotime($month_start));
    $label = date('M Y', strtotime($month_start));
    $months[] = $label;

    $query = "SELECT
                IFNULL(SUM(fuel_sales + oil_sales), 0) AS total_sales,
                IFNULL(SUM(fuel_purchase + oil_purchase), 0) AS total_purchase
              FROM day_end_process
              WHERE location_id = '$location'
              AND date_ended BETWEEN '$month_start' AND '$month_end'
              AND posted = 1";

    $res = mysqli_query($con, $query);
    $row = mysqli_fetch_assoc($res);

    $sales[] = round(floatval($row['total_sales']), 2);
    $purchases[] = round(floatval($row['total_purchase']), 2);
}

$response = [
    'months' => $months,
    'sales' => $sales,
    'purchases' => $purchases
];

echo json_encode($response);
exit;