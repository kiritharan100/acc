<?php
include("../../db.php");

$bank_id = intval($_GET['bank_id']);

$query = "SELECT cheque_number FROM acc_cheque 
          WHERE cr_acc_id = '$bank_id' 
          ORDER BY ch_id DESC LIMIT 1";
$result = mysqli_query($con, $query);

$next_number = '';

if ($row = mysqli_fetch_assoc($result)) {
    $last = preg_replace('/[^0-9]/', '', $row['cheque_number']);
    $next_number = $last ? str_pad($last + 1, strlen($last), '0', STR_PAD_LEFT) : '';
}

echo $next_number;
