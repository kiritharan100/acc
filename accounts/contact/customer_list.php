<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$customers = [];
$sql = "SELECT c_id, customer_name, customer_address, customer_email, condact_number, max_limit, status
        FROM accounts_manage_customer
        WHERE location_id = '$location_id'
        ORDER BY c_id DESC";
$res = mysqli_query($con, $sql);
if ($res) {
    while ($row = mysqli_fetch_assoc($res)) {
        $customers[] = $row;
    }
}

echo json_encode(['success' => true, 'data' => $customers]);
