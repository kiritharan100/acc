<?php
 
 
include("../../db.php");
include("../../auth.php");

$re_id         = isset($_POST['re_id']) ? intval($_POST['re_id']) : 0;
$payee         = isset($_POST['payee']) && !empty($_POST['payee']) ? mysqli_real_escape_string($con, $_POST['payee']) : '';
$bank_account  = intval($_POST['bank_account']);
$cheque_number = mysqli_real_escape_string($con, $_POST['cheque_number']);
$payment_date  = mysqli_real_escape_string($con, $_POST['payment_date']);
$memo          = mysqli_real_escape_string($con, $_POST['memo']);
$current_date_time = date('Y-m-d H:i:s');
$location_id = $_POST['location_id'];
$category    = $_POST['category'];
$description = $_POST['description'];
$amount      = $_POST['amount'];

$get_max = mysqli_query($con, "SELECT MAX(loc_no) as max_no FROM acc_receipt WHERE location_id = '$location_id'");
$row = mysqli_fetch_assoc($get_max);
$next_loc_no = ($row['max_no'] ?? 0) + 1;


$sub_total = 0;
foreach ($amount as $val) {
    $sub_total += floatval($val);
}

if ($re_id > 0) {
    // UPDATE MODE

    // Clear old lines and transactions
    mysqli_query($con, "DELETE FROM acc_receipt_detail WHERE re_id = '$re_id'");
    mysqli_query($con, "DELETE FROM acc_transaction WHERE ref_no = '$re_id' AND tra_type = 'CHEQUE'");

    $updateCheque = "UPDATE acc_receipt SET 
        dr_acc_id = '$bank_account',
        ch_date = '$payment_date',
        cheque_number = '$cheque_number',
        memo = '$memo',
        sub_total = '$sub_total',
        supplier_id = '$payee'
        WHERE re_id = '$re_id'";
    mysqli_query($con, $updateCheque);
} else {
    // INSERT MODE
    $insertCheque = "INSERT INTO acc_receipt 
  (dr_acc_id, ch_date, cheque_number, memo, status, sub_total, created_date, user_id, supplier_id, location_id, loc_no)
  VALUES 
  ('$bank_account', '$payment_date', '$cheque_number', '$memo', 1, '$sub_total', '$current_date_time', '$user_id', '$payee', '$location_id', '$next_loc_no')";


    // $insertCheque = "INSERT INTO acc_receipt (dr_acc_id, ch_date, cheque_number, memo, status, sub_total, created_date, user_id, supplier_id)
    //                  VALUES ('$bank_account', '$payment_date', '$cheque_number', '$memo', 1, '$sub_total', '$current_date_time', '$user_id', '$payee')";
    if (!mysqli_query($con, $insertCheque)) {
        echo "Error saving cheque: " . mysqli_error($con);
        exit;
    }
    $re_id = mysqli_insert_id($con);
}

// Insert detail lines and transactions
foreach ($category as $i => $cat_id) {
    $acc_id = intval($cat_id);
    $desc   = mysqli_real_escape_string($con, $description[$i]);
    $amt    = floatval($amount[$i]);

    if ($acc_id <= 0 || $amt <= 0) continue;

    // Line
    $insertLine = "INSERT INTO acc_receipt_detail (re_id, dr_acc_id, description, amount, status)
                   VALUES ('$re_id', '$acc_id', '$desc', '$amt', 1)";
    mysqli_query($con, $insertLine);

    // Debit entry
$insertDr = "INSERT INTO acc_transaction 
  (ca_id, t_date, tra_type, ref_no, debit, credit, vat_rate, debit_Vat, credit_vat, t_memo, credted_by, location_id, created_on,cus_id)
  VALUES 
  ('$acc_id', '$payment_date', 'Other Rec', '$re_id',  0,'$amt', 0, 0, 0, '$desc', '$user_id', '$location_id', NOW(),'$payee')";

    mysqli_query($con, $insertDr);
}

// Credit bank
$insertCr = "INSERT INTO acc_transaction 
  (ca_id, t_date, tra_type, ref_no, debit, credit, vat_rate, debit_Vat, credit_vat, t_memo, credted_by, location_id, created_on,cus_id)
  VALUES 
  ('$bank_account', '$payment_date', 'Other Rec', '$re_id', '$sub_total', 0, 0, 0, 0, '$memo', '$user_id', '$location_id', NOW(),'$payee')";

mysqli_query($con, $insertCr);

// Log
$action = $re_id > 0 && isset($_POST['re_id']) ? "receipt updated" : "New receipt written";
$detail = "$payee - Cheque #$cheque_number";
UserLog("3", $action, $detail);

echo "Cheque saved successfully.";
