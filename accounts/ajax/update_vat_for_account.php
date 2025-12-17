<?php
include("../../db.php");
include("../../auth.php");
header('Content-Type: application/json');

$ca_id       = isset($_POST['ca_id']) ? (int)$_POST['ca_id'] : 0;
$new_vat_id  = isset($_POST['new_vat_id']) ? (int)$_POST['new_vat_id'] : 0;
$user_answer = isset($_POST['user_answer']) ? $_POST['user_answer'] : '';
$dont_ask    = isset($_POST['dont_ask']) ? (int)$_POST['dont_ask'] : 0;
$req_loc     = isset($_POST['location_id']) ? (int)$_POST['location_id'] : 0;
$loc_id      = $req_loc ?: (int)$location_id;

if (!$ca_id) {
    echo json_encode(['success' => false, 'message' => 'Missing account id']);
    exit;
}

$tableExists = false;
$check = mysqli_query($con, "SHOW TABLES LIKE 'accounts_vat_change_request'");
if ($check && mysqli_num_rows($check) > 0) {
    $tableExists = true;
}

// helper to upsert into accounts_coa_client following the edit logic
$updated = false;
$clientSql = "SELECT * FROM accounts_coa_client WHERE location_id = '$loc_id' AND (ca_id = '$ca_id' OR master_id = '$ca_id') LIMIT 1";
$clientRes = mysqli_query($con, $clientSql);
if ($clientRes && mysqli_num_rows($clientRes) > 0) {
    $updated = mysqli_query($con, "UPDATE accounts_coa_client SET vat_id = '$new_vat_id' WHERE location_id = '$loc_id' AND (ca_id = '$ca_id' OR master_id = '$ca_id')") ? true : false;
} else {
    // copy from master into client with new VAT
    $masterRes = mysqli_query($con, "SELECT * FROM accounts_coa_main WHERE ca_id = '$ca_id' LIMIT 1");
    if ($masterRes && mysqli_num_rows($masterRes) > 0) {
        $m = mysqli_fetch_assoc($masterRes);
        $cat_id = (int)$m['cat_id'];
        $ca_code = mysqli_real_escape_string($con, $m['ca_code']);
        $ca_name = mysqli_real_escape_string($con, $m['ca_name']);
        $status = (int)$m['status'];
        $insert = "INSERT INTO accounts_coa_client (ca_id, master_id, cat_id, location_id, ca_code, ca_name, vat_id, status) 
                   VALUES ('$ca_id', '$ca_id', '$cat_id', '$loc_id', '$ca_code', '$ca_name', '$new_vat_id', '$status')";
        $updated = mysqli_query($con, $insert) ? true : false;
    }
}

// Persist "Do Not Ask Again" when the user declines with checkbox OR when they accept
if ($tableExists && (($user_answer === 'no' && $dont_ask === 1) || $user_answer === 'yes')) {
    $locEsc = mysqli_real_escape_string($con, $loc_id);
    $caEsc  = mysqli_real_escape_string($con, $ca_id);
    mysqli_query($con, "INSERT IGNORE INTO accounts_vat_change_request (location_id, ca_id) VALUES ('$locEsc', '$caEsc')");
}

echo json_encode(['success' => true, 'updated' => $updated]);
