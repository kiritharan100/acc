<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$suppliers = [];

$sql = "SELECT sup_id, supplier_name, address, contact_number, location_id, tin_no, status 
        FROM accounts_manage_supplier 
        WHERE location_id = '$location_id'
        ORDER BY sup_id DESC";
$res = mysqli_query($con, $sql);

if ($res) {
    while ($row = mysqli_fetch_assoc($res)) {
        $suppliers[] = $row;
    }
}

echo json_encode(['success' => true, 'data' => $suppliers]);
