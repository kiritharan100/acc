<?php
include("../../db.php");
session_start();

$user_id = $_SESSION['user_id'] ?? 0;
$c_id = intval($_POST['customer_id']);
$ca_id = intval($_POST['ca_id']);
$location_id = intval($_POST['location_id']);
$rec_date = mysqli_real_escape_string($con, $_POST['rec_date']);
$cheque_no = mysqli_real_escape_string($con, $_POST['cheque_no']);
$memo = mysqli_real_escape_string($con, $_POST['memo']);
$total_paid = floatval($_POST['total_paid']);

$inv_ids = $_POST['inv_id'];
$inv_types = $_POST['inv_type'];
$amounts = $_POST['amount'];
$loc_ids = $_POST['loc_id'];

// Generate receipt number
$get_serial = "SELECT MAX(receipt_no) AS max_rec FROM acc_customer_payment WHERE location_id = '$location_id'";
$res_serial = mysqli_query($con, $get_serial);
$row_serial = mysqli_fetch_assoc($res_serial);
$receipt_no = $row_serial['max_rec'] ? ($row_serial['max_rec'] + 1) : 1;

// Insert master record
$insert_master = "INSERT INTO acc_customer_payment
  (c_id, ca_id, location_id, receipt_no, rec_amount, rec_date, pay_type, cheque_no, Memo, rec_status, record_date, user_id)
  VALUES
  ('$c_id', '$ca_id', '$location_id', '$receipt_no', '$total_paid', '$rec_date', 'Cash', '$cheque_no', '$memo', 1, NOW(), '$user_id')";

if (mysqli_query($con, $insert_master)) {
  $cp_id = mysqli_insert_id($con);

  for ($i = 0; $i < count($inv_ids); $i++) {
    $inv_id = intval($inv_ids[$i]);
    $loc_id = intval($loc_ids[$i]);
    $inv_type = mysqli_real_escape_string($con, $inv_types[$i]);
    $amount = floatval($amounts[$i]);

    if ($amount > 0) {
      mysqli_query($con, "INSERT INTO acc_customer_payment_detail (rec_id, inv_id, inv_type, amount, rec_status)
                          VALUES ('$cp_id', '$inv_id', '$inv_type', '$amount', 1)");

      // Update paid amount in original invoice table
      if ($inv_type == 'Fuel') {
        mysqli_query($con, "UPDATE shed_credit_sales SET paid_amount = paid_amount + $amount WHERE cs_id = '$inv_id'");
      } elseif ($inv_type == 'Oil') {
        mysqli_query($con, "UPDATE oil_sales_master SET paid_amount = paid_amount + $amount WHERE iss_id = '$inv_id'");
      }
    }
  }

  echo json_encode(["status" => "success", "message" => "Payment recorded successfully."]);
} else {
  echo json_encode(["status" => "error", "message" => mysqli_error($con)]);
}