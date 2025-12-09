<?php
require_once '../../db.php';
require_once '../../auth.php';

header('Content-Type: application/json');

if (!isset($_POST['id'])) {
    echo json_encode(['success'=>false, 'msg'=>'Invalid ID']);
    exit;
}

$id = intval($_POST['id']);
 

$q = mysqli_query($con, "
    SELECT * FROM accounts_accounting_period 
    WHERE id = $id AND location_id = '$location_id' LIMIT 1
");

if ($q && mysqli_num_rows($q) == 1) {
    echo json_encode(['success'=>true, 'data'=>mysqli_fetch_assoc($q)]);
} else {
    echo json_encode(['success'=>false, 'msg'=>'Record not found']);
}
