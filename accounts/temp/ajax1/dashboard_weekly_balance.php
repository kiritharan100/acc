<?php
include '../../db.php';
include '../../auth.php';
header('Content-Type: application/json');

$today = date('Y-m-d');
$location =  $_REQUEST['location_id'];

function getWeeklyDates($weeks = 6) {
    $dates = [];
    for ($i = $weeks - 1; $i >= 0; $i--) {
        $start = date('Y-m-d', strtotime("last sunday -$i week"));
        $end = date('Y-m-d', strtotime("saturday -$i week"));
        $label = date('M d', strtotime($start)) . ' - ' . date('d', strtotime($end));
        $dates[] = [
            'label' => $label,
            'start' => $start,
            'end' => $end
        ];
    }
    return $dates;
}

$weeks = getWeeklyDates();

$accounts = [
    ['ca_id' => 1, 'name' => 'Current Account'],
    ['ca_id' => 7, 'name' => 'Cash in Hand']
];

$series = [];
foreach ($accounts as $acc) {
    $points = [];
    foreach ($weeks as $week) {
        $sql = "SELECT 
                    IFNULL(SUM(debit),0) AS debit,
                    IFNULL(SUM(credit),0) AS credit 
                FROM acc_transaction 
                WHERE location_id = '$location' 
                    AND ca_id = '{$acc['ca_id']}' 
                    AND t_date <= '{$week['end']}' 
                    AND status = 1";
        $res = mysqli_query($con, $sql);
        $row = mysqli_fetch_assoc($res);
        $balance = floatval($row['debit']) - floatval($row['credit']);
        $points[] = round($balance, 2);
    }
    $series[] = [
        'name' => $acc['name'],
        'data' => $points
    ];
}

$response = [
    'weeks' => array_column($weeks, 'label'),
    'series' => $series
];

echo json_encode($response);
exit;
