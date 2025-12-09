<?php
include("../../db.php");

$re_id = isset($_GET['re_id']) ? intval($_GET['re_id']) : 0;

if (!$re_id) {
    echo json_encode(['error' => 'Invalid cheque ID']);
    exit;
}

// Fetch cheque header
$query = "SELECT c.*, s.supplier_name 
          FROM acc_receipt c 
          LEFT JOIN manage_supplier s ON c.supplier_id = s.sup_id 
          WHERE c.re_id = '$re_id' 
          LIMIT 1";
$result = mysqli_query($con, $query);

if (!$result || mysqli_num_rows($result) === 0) {
    echo json_encode(['error' => 'receipt not found']);
    exit;
}

$cheque = mysqli_fetch_assoc($result);

// Fetch receipt line details
$detailQuery = "SELECT d.*, coa.ca_name 
                FROM acc_receipt_detail d 
                LEFT JOIN acc_chart_of_accounts coa ON d.dr_acc_id = coa.ca_id 
                WHERE d.re_id = '$re_id'";
$detailsResult = mysqli_query($con, $detailQuery);

$details = [];
while ($row = mysqli_fetch_assoc($detailsResult)) {
    $details[] = [
        'dr_acc_id'   => $row['dr_acc_id'],
        'description' => $row['description'],
        'amount'      => $row['amount'],
        'ca_name'     => $row['ca_name']
    ];
}

// Return JSON response
echo json_encode([
    'cheque' => $cheque,
    'details' => $details
]);
