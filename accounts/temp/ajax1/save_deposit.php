<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$location_id = $_POST['location_id'] ?? 0;
$t_date      = $_POST['deposit_date'] ?? date('Y-m-d');
$to_account  = $_POST['to_account'] ?? 0;
$amount      = floatval($_POST['amount'] ?? 0);
$memo        = mysqli_real_escape_string($con, $_POST['memo'] ?? '');
$user_id     = $_SESSION['user_id'];
$now         = date('Y-m-d H:i:s');

// Basic validation
if ($to_account <= 0 || $amount <= 0) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid input.']);
    exit;
}

// 🔢 Generate next unique source_id (Deposit ID) for location
$get_max = mysqli_query($con, "SELECT IFNULL(MAX(source_id), 0) AS last_id 
                               FROM acc_transaction 
                               WHERE source = 'Deposit' AND location_id = '$location_id'");
$row = mysqli_fetch_assoc($get_max);
$next_id = intval($row['last_id']) + 1;
$ref_no = $next_id;

// 📝 Create two transaction entries

$entries = [
    // Debit to selected account (Cash in Hand category, not ca_id 7)
    "INSERT INTO acc_transaction 
        (location_id, ca_id, t_date, tra_type, source, source_id, ref_no, debit, credit, t_memo, credted_by, created_on, status)
     VALUES 
        ('$location_id', '$to_account', '$t_date', 'Deposit', 'Deposit', '$next_id', '$ref_no', '$amount', 0, '$memo', '$user_id', '$now', 1)",

    // Credit from Cash in Hand (ca_id = 7)
    "INSERT INTO acc_transaction 
        (location_id, ca_id, t_date, tra_type, source, source_id, ref_no, debit, credit, t_memo, credted_by, created_on, status)
     VALUES 
        ('$location_id', 7, '$t_date', 'Deposit', 'Deposit', '$next_id', '$ref_no', 0, '$amount', '$memo', '$user_id', '$now', 1)"
];

// Execute both entries
foreach ($entries as $query) {
    if (!mysqli_query($con, $query)) {
        echo json_encode(['status' => 'error', 'message' => 'Error saving transaction.']);
        exit;
    }
}

echo json_encode(['status' => 'success', 'message' => 'Deposit recorded successfully.']);
?>
