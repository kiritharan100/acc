<?php
include("../../db.php");
include("../../auth.php");

$re_id = isset($_POST['re_id']) ? intval($_POST['re_id']) : 0;

if (!$re_id) {
    echo "Invalid cheque ID.";
    exit;
}

// Soft delete from acc_receipt
$update_cheque = "UPDATE acc_receipt SET status = 0 WHERE re_id = '$re_id'";
mysqli_query($con, $update_cheque);

// Soft delete from acc_receipt_detail
$update_details = "UPDATE acc_receipt_detail SET status = 0 WHERE re_id = '$re_id'";
mysqli_query($con, $update_details);

// Soft delete from acc_transaction
$update_transaction = "UPDATE acc_transaction SET status = 0 WHERE ref_no = '$re_id' AND tra_type = 'CHEQUE'";
mysqli_query($con, $update_transaction);

// Log the action
$action = "Cheque deleted";
$detail = "Cheque #$re_id marked as cancelled";
UserLog("3", $action, $detail);

echo "Cheque cancelled successfully.";
