<?php
include("../../db.php");
include("../../auth.php");

$source_id    = $_POST['source_id'] ?? 0;
$location_id  = $_POST['location_id'] ?? 0;

if (!$source_id || !$location_id) {
    echo "Invalid request.";
    exit;
}

$update = "UPDATE acc_transaction 
           SET status = 0 
           WHERE source = 'Deposit' 
             AND source_id = '$source_id' 
             AND location_id = '$location_id' 
             AND status = 1";

if (mysqli_query($con, $update)) {
    echo "Deposit cancelled successfully.";
} else {
    echo "Failed to cancel deposit.";
}
?>
