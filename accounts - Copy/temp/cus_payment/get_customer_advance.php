<?php
include '../../db.php'; // or your path
$customer_id = intval($_POST['customer_id']);
$as_at = date('Y-m-d');

function get_advance_balance($con, $c_id, $as_at) {
    $q = mysqli_query($con, "
        SELECT SUM(credit - debit) AS advance 
        FROM acc_transaction 
        WHERE ca_id = 44 
          AND cus_id = $c_id 
          AND status = 1 
          AND DATE(t_date) <= '$as_at'
    ");
    return floatval(mysqli_fetch_assoc($q)['advance'] ?? 0);
}

echo get_advance_balance($con, $customer_id, $as_at);
