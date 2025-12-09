<?php
include("../../db.php");

$location_id = $_GET['location_id'] ?? 0;
$ca_id = 7; // Always fixed for Cash in Hand

$sql = "SELECT 
          IFNULL(SUM(debit), 0) AS total_debit, 
          IFNULL(SUM(credit), 0) AS total_credit 
        FROM acc_transaction 
        WHERE ca_id = '$ca_id' AND location_id = '$location_id' AND status = 1";

$res = mysqli_query($con, $sql);

if ($res && mysqli_num_rows($res) > 0) {
    $row = mysqli_fetch_assoc($res);
    $balance = floatval($row['total_debit']) - floatval($row['total_credit']);
    echo number_format($balance, 2, '.', '');
} else {
    echo "0.00";
}
?>
