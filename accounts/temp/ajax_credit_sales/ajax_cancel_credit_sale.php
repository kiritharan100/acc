 <?php

include '../../db.php';
include '../../auth.php'; // $user_id available

// Validate sale_id
if (!isset($_POST['sale_id']) || empty($_POST['sale_id'])) {
    echo json_encode(['error' => 'Invalid sale ID']);
    exit;
}

$sale_id = intval($_POST['sale_id']);

// Fetch sale details with day_end
$sale_query = "SELECT vehicle_no, total_sales, day_end 
               FROM shed_credit_sales 
               WHERE cs_id = $sale_id AND status = 1";
$sale_result = mysqli_query($con, $sale_query);

if (!$sale_result || mysqli_num_rows($sale_result) == 0) {
    echo json_encode(['error' => 'Credit sale not found']);
    exit;
}

$sale_row = mysqli_fetch_assoc($sale_result);
$vehicle_no  = $sale_row['vehicle_no'];
$total_sales = $sale_row['total_sales'];
$day_end     = $sale_row['day_end'];

// Only allow cancellation if day_end is 999999999
if ($day_end != 999999999) {
    echo json_encode(['error' => 'This credit sale is already processed in day-end and cannot be cancelled.']);
    exit;
}

// Begin transaction
mysqli_begin_transaction($con);

try {
    // Cancel credit sale and detail
    $cancel_main = mysqli_query($con, "UPDATE shed_credit_sales SET status = 0 WHERE cs_id = $sale_id");
    $cancel_detail = mysqli_query($con, "UPDATE shed_credit_sales_detail SET status = 0 WHERE cs_id = $sale_id");

    // Cancel related acc_transaction entries
    $cancel_acc = mysqli_query($con, "UPDATE acc_transaction SET status = 0 WHERE source = 'Fuel Sales' AND source_id = $sale_id");

    if ($cancel_main && $cancel_detail && $cancel_acc) {
        $log_message = "Credit sale cancelled. Vehicle No: $vehicle_no, Total Sales: " . number_format($total_sales, 2);
        UserLog(2, 'Cancelled Credit Sale', $log_message);
        mysqli_commit($con);
        echo json_encode(['success' => true]);
    } else {
        throw new Exception('Failed to update all related records.');
    }
} catch (Exception $e) {
    mysqli_rollback($con);
    echo json_encode(['error' => $e->getMessage()]);
}
?>
