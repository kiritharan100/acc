<?php
require_once '../../db.php';
require_once '../../auth.php';

header('Content-Type: application/json');


 
$action = $_POST['action'] ?? '';

$perid_from = save_date($_POST['perid_from'] ?? '');
$period_to  = save_date($_POST['period_to'] ?? '');
$due_date   = save_date($_POST['due_date'] ?? '');
$lock_period = isset($_POST['lock_period']) ? 1 : 0;
$status = intval($_POST['status'] ?? 1);

// Enforce minimum start date based on client registration
$min_start_date = '';
$datesQ = mysqli_query($con, "SELECT business_start_date, book_start_from FROM client_registration WHERE c_id = '$location_id' LIMIT 1");
if ($datesQ && mysqli_num_rows($datesQ) > 0) {
    $datesRow = mysqli_fetch_assoc($datesQ);
    $bsd = $datesRow['business_start_date'];
    $book = $datesRow['book_start_from'];
    if (!empty($bsd) && !empty($book)) {
        $min_start_date = (strtotime($book) >= strtotime($bsd)) ? $book : $bsd;
    } elseif (!empty($book)) {
        $min_start_date = $book;
    } elseif (!empty($bsd)) {
        $min_start_date = $bsd;
    }
}

if (!empty($min_start_date) && !empty($perid_from) && (strtotime($perid_from) < strtotime($min_start_date))) {
    echo json_encode(['success' => false, 'msg' => 'Period From cannot be before the bookkeeping/business start date (' . $min_start_date . ').']);
    exit;
}

if ($action == 'add') {

    $sql = "UPDATE accounts_accounting_period SET lock_period=1
      WHERE location_id='$location_id'  AND status=1"; 
       mysqli_query($con, $sql);
  

    $sql = "INSERT INTO accounts_accounting_period 
      (location_id, perid_from, period_to, due_date, lock_period, status)
      VALUES ('$location_id','$perid_from','$period_to','$due_date',$lock_period,$status)";

    mysqli_query($con, $sql);
    echo json_encode(['success'=>true,'msg'=>'Added']);
    exit;
}

if ($action == 'edit') {
    $id = intval($_POST['id']);

    $sql = "UPDATE accounts_accounting_period
      SET perid_from='$perid_from', period_to='$period_to', due_date='$due_date',
      lock_period=$lock_period, status=$status
      WHERE id=$id AND location_id='$location_id'";

    mysqli_query($con, $sql);
    echo json_encode(['success'=>true,'msg'=>'Updated']);
    exit;
}

echo json_encode(['success'=>false,'msg'=>'Invalid request']);
