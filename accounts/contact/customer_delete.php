<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$c_id = isset($_POST['c_id']) ? (int)$_POST['c_id'] : 0;
if ($c_id <= 0) {
    echo json_encode(['success' => false, 'message' => 'Invalid customer.']);
    exit;
}

$sql = "UPDATE accounts_manage_customer SET status = 0 WHERE c_id = ? AND location_id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("ii", $c_id, $location_id);
$ok = $stmt->execute();

if ($ok) {
    if (function_exists('UserLog')) {
        UserLog('1', 'Customer soft deleted', "Customer ID $c_id soft deleted");
    }
    echo json_encode(['success' => true, 'message' => 'Customer deleted (soft).']);
} else {
    echo json_encode(['success' => false, 'message' => 'Delete failed.']);
}
