<?php
include("../../db.php");
include("../../auth.php");

// $payee         = mysqli_real_escape_string($con, $_POST['payee']);
$payee = isset($_POST['payee']) && !empty($_POST['payee']) 
    ? mysqli_real_escape_string($con, $_POST['payee']) 
    : '';
$bank_account  = intval($_POST['bank_account']);
$cheque_number = mysqli_real_escape_string($con, $_POST['cheque_number']);
$payment_date  = mysqli_real_escape_string($con, $_POST['payment_date']);
$memo          = mysqli_real_escape_string($con, $_POST['memo']);

$category      = $_POST['category'];
$description   = $_POST['description'];
$amount        = $_POST['amount'];
$current_date_time = date('Y-m-d H:i:s');
$sub_total = 0;
foreach ($amount as $val) {
    $sub_total += floatval($val);
}

// Insert into acc_cheque
$insertCheque = "INSERT INTO acc_cheque (cr_acc_id,ch_date, cheque_number, memo, status, sub_total, created_date, user_id,supplier_id)
                 VALUES ('$bank_account','$payment_date', '$cheque_number', '$memo', 1, '$sub_total', '$current_date_time', '$user_id','$payee')";
if (!mysqli_query($con, $insertCheque)) {
    echo "Error saving cheque: " . mysqli_error($con);
    exit;
}
$ch_id = mysqli_insert_id($con);

// Insert cheque details and transactions
foreach ($category as $i => $cat_id) {
    $desc   = mysqli_real_escape_string($con, $description[$i]);
    $amt    = floatval($amount[$i]);
    $acc_id = intval($cat_id);

    if ($acc_id <= 0 || $amt <= 0) continue;

    // Save line
    $insertLine = "INSERT INTO acc_cheque_detail (ch_id, dr_acc_id, description, amount, status)
                   VALUES ('$ch_id', '$acc_id', '$desc', '$amt', 1)";
    mysqli_query($con, $insertLine);

    // Save debit transaction
    $insertDr = "INSERT INTO acc_transaction (ca_id,t_date, tra_type, ref_no, debit, credit, vat_rate, debit_Vat, credit_vat, t_memo, credted_by, created_on)
                 VALUES ('$acc_id','$payment_date', 'CHEQUE', '$ch_id', '$amt', 0, 0, 0, 0, '$desc', '$user_id', NOW())";
    mysqli_query($con, $insertDr);
}

// Save credit transaction (bank payment)
$insertCr = "INSERT INTO acc_transaction (ca_id,t_date, tra_type, ref_no, debit, credit, vat_rate, debit_Vat, credit_vat, t_memo, credted_by, created_on)
             VALUES ('$bank_account','$payment_date', 'CHEQUE', '$ch_id', 0, '$sub_total', 0, 0, 0, '$memo', '$user_id', NOW())";
mysqli_query($con, $insertCr);

// Log user action
$action = "New cheque written";
$detail = "$payee - Cheque #$cheque_number";
UserLog("4", $action, $detail);

echo "Cheque saved successfully.";
