<?php
include '../../db.php';

header('Content-Type: application/json');

if (!isset($_POST['p_id']) || !isset($_POST['date'])) {
    echo json_encode(['error' => 'Missing parameters']);
    exit;
}

$p_id = intval($_POST['p_id']);
$date = $_POST['date'];  // Expect format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'

// Sanitize and format date for query
$date_time = date('Y-m-d H:i:s', strtotime($date . ' 23:59:59'));

// Query for latest price <= given date and active (status=1, not cancelled)
$query = "SELECT new_price 
          FROM fuel_price_change 
          WHERE p_id = $p_id 
            AND status = 1 
            AND (cancellation IS NULL OR cancellation = '') 
            AND date_time <= '$date_time' 
          ORDER BY date_time DESC 
          LIMIT 1";

$result = mysqli_query($con, $query);

if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    echo json_encode(['new_price' => floatval($row['new_price'])]);
} else {
    echo json_encode(['new_price' => 0]);
}
