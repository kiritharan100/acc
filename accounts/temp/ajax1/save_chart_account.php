<?php
include("../../db.php");
include("../../auth.php");

$ca_id = $_POST['ca_id'];
$ca_type = mysqli_real_escape_string($con, $_POST['ca_type']);
$ca_name = mysqli_real_escape_string($con, $_POST['ca_name']);
$ca_group = mysqli_real_escape_string($con, $_POST['ca_group']);
$status = $_POST['status'];

if ($ca_id == '') {
    $sql = "INSERT INTO acc_chart_of_accounts (ca_type, ca_name, ca_group, status) VALUES ('$ca_type', '$ca_name', '$ca_group', '$status')";
    $action = "Created";
} else {
    $checkEditable = mysqli_fetch_assoc(mysqli_query($con, "SELECT editable FROM acc_chart_of_accounts WHERE ca_id = '$ca_id'"));
    if ($checkEditable['editable'] == 0) {
        echo "This account is not editable.";
        exit;
    }
    $sql = "UPDATE acc_chart_of_accounts SET ca_type='$ca_type', ca_name='$ca_name', ca_group='$ca_group', status='$status' WHERE ca_id='$ca_id'";
    $action = "New Chart of account created";
    $detail = "$ca_type - $ca_name";
}

if (mysqli_query($con, $sql)) {
     $action = "New Chart of account created";
    $detail = "$ca_type - $ca_name";
    UserLog("3", $action,$detail );
    echo "Account $action Successfully";
} else {
    echo "Error: " . mysqli_error($con);
}
