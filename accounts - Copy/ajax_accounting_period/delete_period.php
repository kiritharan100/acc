<?php
require_once '../../db.php';
require_once '../../auth.php';

header('Content-Type: application/json');

$id = intval($_POST['id'] ?? 0);

if ($id <= 0) {
    echo json_encode(['success'=>false]);
    exit;
}


mysqli_query($con, "
    UPDATE accounts_accounting_period
    SET status = 0
    WHERE id = $id AND location_id = '$location_id'
");

echo json_encode(['success'=>true,'msg'=>'Deleted']);
