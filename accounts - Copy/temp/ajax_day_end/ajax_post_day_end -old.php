 <?php
include '../../db.php';
include '../../auth.php';

header('Content-Type: application/json');

$serial_no = $_POST['serial_no'] ?? null;

if (!$serial_no) {
    echo json_encode(['success' => false, 'message' => ' Already posted']);
    exit;
}

// 1. Fetch the day end record
$query = "SELECT * FROM day_end_process WHERE serial_no = '$serial_no'";
$res = mysqli_query($con, $query);

if (!$res || mysqli_num_rows($res) === 0) {
    echo json_encode(['success' => false, 'message' => 'Day End record not found.']);
    exit;
}

$data = mysqli_fetch_assoc($res);

if ($data['posted'] == 1) {
    echo json_encode(['success' => false, 'message' => 'This transaction is already posted.']);
    exit;
}

$location_id = $data['location_id'];
$date_ended = $data['date_ended'];
$t_memo = "Day End Serial #$serial_no";

// 2. Prepare data
$fuel_sales         = floatval($data['fuel_sales']);
$oil_sales          = floatval($data['oil_sales']);
$card_sales         = floatval($data['total_card_settled']);
$credit_sales       = floatval($data['total_credit_settle']);
$fuel_short_excess  = floatval($data['fuel_short_excess']);
$oil_short_excess   = floatval($data['oil_short_excess']);

$total_sales = $fuel_sales + $oil_sales;

$sales_ledger = $total_sales - $card_sales - $credit_sales ;

$short_excess = $fuel_short_excess + $oil_short_excess;
$cash_sales = $total_sales - $card_sales - $credit_sales + $short_excess;
// 3. Build entries
$entries = [
    // Credit entries
    ['ca_id' => 10, 'type' => 'credit', 'amount' => $sales_ledger],    // Cash Sales
    ['ca_id' => 11, 'type' => 'credit', 'amount' => $credit_sales],  // Credit Sales
    ['ca_id' => 12, 'type' => 'credit', 'amount' => $card_sales],    // Card Sales

    // Debit entries
    ['ca_id' => 7,  'type' => 'debit', 'amount' => $cash_sales],     // Cash in Hand
    ['ca_id' => 8,  'type' => 'debit', 'amount' => $credit_sales],   // Trade Receivable
    ['ca_id' => 1,  'type' => 'debit', 'amount' => $card_sales],     // Current Account
];

// Correct logic: short = negative → debit, excess = positive → credit
if ($short_excess != 0) {
    $entries[] = [
        'ca_id' => 19,
        'type'  => $short_excess < 0 ? 'debit' : 'credit',  // ✅ short = debit, excess = credit
        'amount'=> abs($short_excess)
    ];
}

// 4. Insert into acc_transaction
$success = true;

foreach ($entries as $entry) {
    $ca_id   = $entry['ca_id'];
    $debit   = $entry['type'] === 'debit' ? $entry['amount'] : 0;
    $credit  = $entry['type'] === 'credit' ? $entry['amount'] : 0;

    $sql = "INSERT INTO acc_transaction (
                location_id, ca_id, t_date, tra_type, ref_no, 
                debit, credit, vat_rate, debit_Vat, credit_vat, 
                t_memo, credted_by, created_on
            ) VALUES (
                '$location_id', '$ca_id', '$date_ended', 'Day End', '$serial_no',
                '$debit', '$credit', 0, 0, 0,
                '$t_memo', '$user_id', NOW()
            )";

    if (!mysqli_query($con, $sql)) {
        $success = false;
        $error = mysqli_error($con);
        break;
    }
}

// 5. Final update
if ($success) {
    $update = "UPDATE day_end_process SET posted = 1, posted_by = '$user_id' WHERE serial_no = '$serial_no'";
    mysqli_query($con, $update);
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Insert failed: ' . $error]);
}
