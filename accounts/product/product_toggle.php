<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$p_id = isset($_POST['p_id']) ? (int)$_POST['p_id'] : 0;
$new_status = isset($_POST['status']) ? (int)$_POST['status'] : 0;
if ($new_status !== 0 && $new_status !== 1) {
    $new_status = 0;
}
if ($p_id <= 0) {
    echo json_encode(['success' => false, 'message' => 'Invalid product/service.']);
    exit;
}

$sql = "UPDATE accounts_product SET status = ? WHERE p_id = ? AND location_id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("iii", $new_status, $p_id, $location_id);
$ok = $stmt->execute();

if ($ok) {
    if (function_exists('UserLog')) {
        $actionText = ($new_status === 1) ? 'activated' : 'inactivated';
        UserLog('1', 'Product/service status changed', "Product ID $p_id $actionText");
    }
    $msg = ($new_status === 1) ? 'Product/Service activated.' : 'Product/Service inactivated.';
    echo json_encode(['success' => true, 'message' => $msg]);
} else {
    echo json_encode(['success' => false, 'message' => 'Status change failed.']);
}
