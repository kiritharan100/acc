<?php
include("../../db.php");
include("../../auth.php");

$ch_id = isset($_POST['ch_id']) ? intval($_POST['ch_id']) : 0;

if (!$ch_id) {
    echo "Invalid cheque ID.";
    exit;
}

// Soft delete from acc_cheque
$update_cheque = "UPDATE acc_cheque SET status = 0 WHERE ch_id = '$ch_id'";
mysqli_query($con, $update_cheque);

// Soft delete from acc_cheque_detail
$update_details = "UPDATE acc_cheque_detail SET status = 0 WHERE ch_id = '$ch_id'";
mysqli_query($con, $update_details);

// Soft delete from acc_transaction
$update_transaction = "UPDATE acc_transaction SET status = 0 WHERE ref_no = '$ch_id' AND tra_type = 'CHEQUE'";
mysqli_query($con, $update_transaction);

// Log the action
$action = "Cheque deleted";
$detail = "Cheque #$ch_id marked as cancelled";
UserLog("3", $action, $detail);

echo "Cheque cancelled successfully.";
