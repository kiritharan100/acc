<?php
require_once '../../db.php';
require_once '../../auth.php';

header('Content-Type: application/json');


 
$action = $_POST['action'] ?? '';

$perid_from = save_date($_POST['perid_from'] ?? '');
$period_to  = save_date($_POST['period_to'] ?? '');
$due_date   = save_date($_POST['due_date'] ?? '');
$log_old_period = isset($_POST['log_old_period']) ? 1 : 0;
$status = intval($_POST['status'] ?? 1);

if ($action == 'add') {

    $sql = "UPDATE accounts_accounting_period SET log_old_period=1
      WHERE location_id='$location_id'  AND status=1"; 
       mysqli_query($con, $sql);
  

    $sql = "INSERT INTO accounts_accounting_period 
      (location_id, perid_from, period_to, due_date, log_old_period, status)
      VALUES ('$location_id','$perid_from','$period_to','$due_date',$log_old_period,$status)";

    mysqli_query($con, $sql);
    echo json_encode(['success'=>true,'msg'=>'Added']);
    exit;
}

if ($action == 'edit') {
    $id = intval($_POST['id']);

    $sql = "UPDATE accounts_accounting_period
      SET perid_from='$perid_from', period_to='$period_to', due_date='$due_date',
      log_old_period=$log_old_period, status=$status
      WHERE id=$id AND location_id='$location_id'";

    mysqli_query($con, $sql);
    echo json_encode(['success'=>true,'msg'=>'Updated']);
    exit;
}

echo json_encode(['success'=>false,'msg'=>'Invalid request']);
