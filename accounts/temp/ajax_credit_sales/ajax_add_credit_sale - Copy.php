 <?php
 
 
ini_set('display_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');
include '../../db.php';
include '../../auth.php'; // To get $user_id

// Sanitize input helper
function clean_input($data) {
    return htmlspecialchars(strip_tags(trim($data)));
}

// Check required POST fields
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

$get_last_shift_no_query = "
    SELECT MAX(inv_id) AS last_inv_id
    FROM shed_credit_sales
    WHERE location_id = $location_id
";
$result = mysqli_query($con, $get_last_shift_no_query);
$row = mysqli_fetch_assoc($result);

// Step 2: Determine next shift number
$inv_id = ($row['last_inv_id'] ?? 0) + 1;

if (!DateTime::createFromFormat('Y-m-d', $invoice_date)) {
    echo json_encode(['error' => 'Invalid invoice date format.']);
    exit;
}



$p_ids = $_POST['products']['p_id'];
$qtys = $_POST['products']['qty'];
$rates = $_POST['products']['rate'];
$line_totals = $_POST['products']['line_total'];

if (!is_array($p_ids) || count($p_ids) === 0) {
    echo json_encode(['error' => 'At least one product is required']);
    exit;
}

// Calculate total sales
$total_sales = 0;
foreach ($line_totals as $lt) {
    $total_sales += floatval($lt);
}

if ($total_sales <= 0) {
    echo json_encode(['error' => 'Total sales must be greater than zero']);
    exit;
}

// Begin transaction
mysqli_begin_transaction($con);

try {
    // Check if the shift is open
    $shift_check_query = "SELECT open_status FROM shed_operator_shift WHERE shift_id = ? ";
    $shift_stmt = $con->prepare($shift_check_query);
    $shift_stmt->bind_param("i", $shift_id);
    $shift_stmt->execute();
    $shift_result = $shift_stmt->get_result();
    $shift_stmt->close();

     
    $shift_row = $shift_result->fetch_assoc();
    

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

    // Insert into shed_credit_sales_detail
    $stmt_detail = $con->prepare("INSERT INTO shed_credit_sales_detail (cs_id, p_id, qty, rate, line_total, status) VALUES (?, ?, ?, ?, ?, 1)");
    if (!$stmt_detail) {
        throw new Exception("Prepare detail failed: " . $con->error);
    }

    // Insert each product line
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


    // Commit transaction
    if (!mysqli_commit($con)) {
        throw new Exception("Commit failed: " . mysqli_error($con));
    }

    echo json_encode(['success' => true]);

} catch (Exception $e) {
    mysqli_rollback($con);
    echo json_encode(['error' => $e->getMessage()]);
}

?>
