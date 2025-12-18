<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$sup_id = isset($_POST['sup_id']) ? (int)$_POST['sup_id'] : 0;
$new_status = isset($_POST['status']) ? (int)$_POST['status'] : 0;
if ($new_status !== 0 && $new_status !== 1) {
    $new_status = 0;
}
if ($sup_id <= 0) {
    echo json_encode(['success' => false, 'message' => 'Invalid supplier.']);
    exit;
}

$sql = "UPDATE accounts_manage_supplier SET status = ? WHERE sup_id = ? AND location_id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("iii", $new_status, $sup_id, $location_id);
$ok = $stmt->execute();

if ($ok) {
    if (function_exists('UserLog')) {
        $actionText = ($new_status === 1) ? 'activated' : 'inactivated';
        UserLog('1', 'Supplier status changed', "Supplier ID $sup_id $actionText");
    }
    $msg = ($new_status === 1) ? 'Supplier activated.' : 'Supplier inactivated.';
    echo json_encode(['success' => true, 'message' => $msg]);
} else {
    echo json_encode(['success' => false, 'message' => 'Status change failed.']);
}
