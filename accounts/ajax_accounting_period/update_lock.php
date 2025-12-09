<?php
require_once '../../db.php';
require_once '../../auth.php';
header('Content-Type: application/json');

$id = intval($_POST['id'] ?? 0);
$state = intval($_POST['state'] ?? 0); // 1 = locked, 0 = unlocked

if ($id <= 0) {
    echo json_encode(['success' => false, 'msg' => 'Invalid ID']);
    exit;
}

$sql = "UPDATE accounts_accounting_period 
        SET log_old_period = '$state' 
        WHERE id = '$id' AND location_id = '$location_id'";

if (mysqli_query($con, $sql)) {

    if ($state == 1) {
        $msg = "Period locked successfully.";
    } else {
        $msg = "Period unlocked successfully.";
    }

    echo json_encode(['success' => true, 'msg' => $msg]);
} 
else {
    echo json_encode(['success' => false, 'msg' => 'DB update failed']);
}
?>
