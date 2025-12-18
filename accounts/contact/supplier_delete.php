<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$sup_id = isset($_POST['sup_id']) ? (int)$_POST['sup_id'] : 0;
if ($sup_id <= 0) {
    echo json_encode(['success' => false, 'message' => 'Invalid supplier.']);
    exit;
}

$sql = "UPDATE accounts_manage_supplier SET status = 0 WHERE sup_id = ? AND location_id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("ii", $sup_id, $location_id);
$ok = $stmt->execute();

if ($ok) {
    if (function_exists('UserLog')) {
        UserLog('1', 'Supplier soft deleted', "Supplier ID $sup_id soft deleted");
    }
    echo json_encode(['success' => true, 'message' => 'Supplier deleted (soft).']);
} else {
    echo json_encode(['success' => false, 'message' => 'Delete failed.']);
}
