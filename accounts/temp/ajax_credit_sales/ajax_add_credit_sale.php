<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
header('Content-Type: application/json');

include '../../db.php';
include '../../auth.php'; // $user_id is available

function clean_input($data) {
    return htmlspecialchars(strip_tags(trim($data)));
}

if (
    !isset($_POST['customer_id'], $_POST['shift_id'], $_POST['vehicle_no'], 
    $_POST['products']['p_id'], $_POST['products']['qty'], $_POST['products']['rate'], $_POST['products']['line_total'])
) {
    echo json_encode(['error' => 'Missing required fields']);
    exit;
}

$c_id = intval($_POST['customer_id']);
$shift_id = intval($_POST['shift_id']);
$vehicle_no = clean_input($_POST['vehicle_no']);
$order_no = clean_input($_POST['order_no']);
$invoice_no = clean_input($_POST['invoice_no']);
$location_id = intval($_POST['location_id']);
$invoice_date = $_POST['invoice_date'];
$created_by = $user_id;

if (!DateTime::createFromFormat('Y-m-d', $invoice_date)) {
    echo json_encode(['error' => 'Invalid invoice date format.']);
    exit;
}

// Get next inv_id
$inv_id = 1;
$get_last_shift_no_query = "
    SELECT MAX(inv_id) AS last_inv_id
    FROM shed_credit_sales
    WHERE location_id = $location_id
";
$result = mysqli_query($con, $get_last_shift_no_query);
if ($row = mysqli_fetch_assoc($result)) {
    $inv_id = ($row['last_inv_id'] ?? 0) + 1;
}

// Get product arrays
$p_ids = $_POST['products']['p_id'];
$qtys = $_POST['products']['qty'];
$rates = $_POST['products']['rate'];
$line_totals = $_POST['products']['line_total'];

if (!is_array($p_ids) || count($p_ids) === 0) {
    echo json_encode(['error' => 'At least one product is required']);
    exit;
}

// Calculate total
$total_sales = 0;
foreach ($line_totals as $lt) {
    $total_sales += floatval($lt);
}

if ($total_sales <= 0) {
    echo json_encode(['error' => 'Total sales must be greater than zero']);
    exit;
}

// Fetch customer ca_id for debit entry
$ca_id_customer = 0;
$cust_q = mysqli_query($con, "SELECT ca_id FROM mange_customer WHERE c_id = $c_id");
if ($cust_row = mysqli_fetch_assoc($cust_q)) {
    $ca_id_customer = intval($cust_row['ca_id']);
    if ($ca_id_customer <= 0) {
        echo json_encode(['error' => 'Invalid customer account code']);
        exit;
    }
} else {
    echo json_encode(['error' => 'Customer not found']);
    exit;
}

mysqli_begin_transaction($con);
try {
    // Insert into shed_credit_sales
    $day_end = 999999999;
    $stmt = $con->prepare("INSERT INTO shed_credit_sales (
        inv_id, invoice_no, c_id, shift_id, ref_no, date_time, vehicle_no, total_sales, status, record_by, location_id, day_end
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1, ?, ?, ?)");
    if (!$stmt->bind_param("isiisssdiii", $inv_id, $invoice_no, $c_id, $shift_id, $order_no, $invoice_date, $vehicle_no, $total_sales, $created_by, $location_id, $day_end)) {
        throw new Exception("Bind failed: " . $stmt->error);
    }
    if (!$stmt->execute()) {
        throw new Exception("Execute failed: " . $stmt->error);
    }
    $cs_id = $stmt->insert_id;
    $stmt->close();

    // Insert shed_credit_sales_detail
    $stmt_detail = $con->prepare("INSERT INTO shed_credit_sales_detail (cs_id, p_id, qty, rate, line_total, status) VALUES (?, ?, ?, ?, ?, 1)");
    if (!$stmt_detail) {
        throw new Exception("Prepare detail failed: " . $con->error);
    }

    for ($i = 0; $i < count($p_ids); $i++) {
        $p_id = intval($p_ids[$i]);
        $qty = floatval($qtys[$i]);
        $rate = floatval($rates[$i]);
        $line_total = floatval($line_totals[$i]);

        if ($qty <= 0 || $rate <= 0 || $line_total <= 0) {
            throw new Exception("Invalid product details at line " . ($i + 1));
        }

        if (!$stmt_detail->bind_param("iiddd", $cs_id, $p_id, $qty, $rate, $line_total)) {
            throw new Exception("Bind detail failed at line " . ($i + 1) . ": " . $stmt_detail->error);
        }

        if (!$stmt_detail->execute()) {
            throw new Exception("Execute detail failed at line " . ($i + 1) . ": " . $stmt_detail->error);
        }
    }
    $stmt_detail->close();

    // Memo
    $memo = "FU: OR# $order_no,Inv#$invoice_no, Veh:$vehicle_no";

    // Debit entry (Customer)
    $insert_debit = "
        INSERT INTO acc_transaction (
            location_id, ca_id, t_date, tra_type, ref_no,
            debit, credit, vat_rate, debit_Vat, credit_vat,
            t_memo, credted_by, created_on, cus_id, source, source_id
        ) VALUES (
            '$location_id', '8', '$invoice_date', 'Fuel Invoice', '$shift_id',
            '$total_sales', 0, 0, 0, 0,
            '$memo', '$user_id', NOW(), '$c_id', 'Fuel Sales', '$cs_id'
        )
    ";
    if (!mysqli_query($con, $insert_debit)) {
        throw new Exception("Debit insert failed: " . mysqli_error($con));
    }

    // Credit entry (Opening Balance Equity)
    $insert_credit = "
        INSERT INTO acc_transaction (
            location_id, ca_id, t_date, tra_type, ref_no,
            debit, credit, vat_rate, debit_Vat, credit_vat,
            t_memo, credted_by, created_on, cus_id, source, source_id
        ) VALUES (
            '$location_id', '26', '$invoice_date', 'Fuel Invoice', '$shift_id',
            0, '$total_sales', 0, 0, 0,
            '$memo', '$user_id', NOW(), '$c_id', 'Fuel Sales', '$cs_id'
        )
    ";
    if (!mysqli_query($con, $insert_credit)) {
        throw new Exception("Credit insert failed: " . mysqli_error($con));
    }

    mysqli_commit($con);
    echo json_encode(['success' => true, 'inv_id' => $inv_id]);

} catch (Exception $e) {
    mysqli_rollback($con);
    echo json_encode(['error' => $e->getMessage()]);
}
?>
