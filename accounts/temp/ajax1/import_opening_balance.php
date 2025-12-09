 <?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
header('Content-Type: application/json');

include '../../db.php';
include '../../auth.php'; // $user_id available

if (!isset($_FILES['csv_file']) || $_FILES['csv_file']['error'] !== UPLOAD_ERR_OK) {
    echo json_encode(['error' => 'CSV file not uploaded properly']);
    exit;
}

$location_id = isset($_COOKIE['client_cook']) ? getLocationId($con, $_COOKIE['client_cook']) : 0;

function getLocationId($con, $md5) {
    $sql = "SELECT c_id FROM client_registration WHERE md5_client = '$md5'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($res);
    return $row ? intval($row['c_id']) : 0;
}

function clean($val) {
    return htmlspecialchars(trim($val));
}

// Read CSV
$csv = array_map('str_getcsv', file($_FILES['csv_file']['tmp_name']));
$csv[0][0] = preg_replace('/^\xEF\xBB\xBF/', '', $csv[0][0]); // Remove BOM
$headers = array_map('strtolower', array_map('trim', $csv[0]));
unset($csv[0]);

$expected_headers = ['invoice_no', 'customer_id', 'invoice_date', 'vehicle_no', 'order_no', 'total_sales'];
if (array_diff($expected_headers, $headers)) {
    echo json_encode(['error' => 'Invalid CSV headers']);
    exit;
}

// Get next inv_id
$inv_id = 1;
$res = mysqli_query($con, "SELECT MAX(inv_id) as max_id FROM shed_credit_sales WHERE location_id = $location_id");
if ($row = mysqli_fetch_assoc($res)) {
    $inv_id = intval($row['max_id']) + 1;
}

$errors = [];
$success_count = 0;
$skipped = 0;
$day_end = 999999999;

mysqli_begin_transaction($con);

try {
    foreach ($csv as $i => $row) {
        $data = array_combine($headers, array_map('clean', $row));
        $invoice_no = $data['invoice_no'];
        $c_id = intval($data['customer_id']);
        $invoice_date = $data['invoice_date'];
        $vehicle_no = $data['vehicle_no'];
        $order_no = $data['order_no'];
        $total_sales = floatval($data['total_sales']);

        if (!$invoice_no || !$c_id || !$invoice_date || $total_sales <= 0) {
            $errors[] = "Line ".($i+2).": Missing or invalid fields.";
            continue;
        }

        
// Clean invoice date string
$invoice_date = trim(preg_replace('/[^\x20-\x7E]/', '', $data['invoice_date']));
$invoice_date = str_replace('/', '-', $invoice_date); // convert slash to dash

// Validate format
$date = DateTime::createFromFormat('Y-m-d', $invoice_date);
if (!$date || $date->format('Y-m-d') !== $invoice_date) {
    $errors[] = "Line ".($i+2).": Invalid date format. Use yyyy-mm-dd";
    continue;
}

// Get and cache the first allowed transaction date
if (!isset($first_day_end)) {
    $first_day_end = null;
    $first_day_end_result = mysqli_query($con, "SELECT MIN(date_ended) AS first_day_end_date FROM day_end_process WHERE status = 1");
    if ($first_day_end_result && $row = mysqli_fetch_assoc($first_day_end_result)) {
        $first_day_end = $row['first_day_end_date'];
    }
}

// Compare only if $first_day_end is found
if ($first_day_end) {
    $firstDate = DateTime::createFromFormat('Y-m-d', $first_day_end);
    if (!$firstDate || $firstDate->format('Y-m-d') !== $first_day_end) {
        $errors[] = "Line ".($i+2).": System error: invalid first transaction date ($first_day_end)";
        continue;
    }

    if ($date >= $firstDate) {
        $errors[] = "Line ".($i+2).": Invoice date ($invoice_date) must be earlier than first transaction date ($first_day_end)";
        continue;
    }
}



                    // $date = DateTime::createFromFormat('Y-m-d', $invoice_date);
                    // $errors_dt = DateTime::getLastErrors();

                    // if (!$date || $errors_dt['warning_count'] || $errors_dt['error_count']) {
                    //     $errors[] = "Line ".($i+2).": Invalid date format. Use yyyy-mm-dd";
                    //     continue;
                    // }

            // Get the first day-end date once (outside the loop ideally for performance)
            // if (!isset($first_day_end)) {
            //     $first_day_end_result = mysqli_query($con, "SELECT MIN(date_ended) AS first_day_end_date FROM day_end_process WHERE status = 1");
            //     $first_day_end_row = mysqli_fetch_assoc($first_day_end_result);
            //     $first_day_end = $first_day_end_row['first_day_end_date'];
            // }

            // // Validate the invoice date is earlier than the first day-end date
            // if (strtotime($invoice_date) >= strtotime($first_day_end)) {
            //     $errors[] = "Line ".($i+2).": Invoice date ($invoice_date) must be before first transaction date ($first_day_end)";
            //     continue;
            // }


        // if (!DateTime::createFromFormat('Y-m-d', $invoice_date)) {
        //     $errors[] = "Line ".($i+2).": Invalid date format. use yyyy-mm-dd";
        //     continue;
        // }

        // Skip duplicates (same invoice_no, date, and customer)
        $dup_check = mysqli_query($con, "
            SELECT cs_id FROM shed_credit_sales 
            WHERE c_id = $c_id 
              AND invoice_no = '$invoice_no' 
              AND DATE(date_time) = '$invoice_date'
              AND location_id = $location_id
            LIMIT 1
        ");
        if (mysqli_num_rows($dup_check) > 0) {
            $skipped++;
            continue;
        }

        // Validate customer
        $cust_q = mysqli_query($con, "SELECT ca_id FROM mange_customer WHERE c_id = $c_id");
        if (!$cust_q || mysqli_num_rows($cust_q) == 0) {
            $errors[] = "Line ".($i+2).": Customer not found.";
            continue;
        }

        $memo = "OB: Veh:$vehicle_no, Inv#: $invoice_no";

        // Insert into shed_credit_sales
        $insert_sql = "INSERT INTO shed_credit_sales (
            inv_id, invoice_no, c_id, shift_id, ref_no, date_time, vehicle_no,
            total_sales, status, record_by, location_id, day_end
        ) VALUES (
            $inv_id, '$invoice_no', $c_id, 0, '$order_no', '$invoice_date', '$vehicle_no',
            $total_sales, 1, $user_id, $location_id, $day_end
        )";
        if (!mysqli_query($con, $insert_sql)) {
            $errors[] = "Line ".($i+2).": DB insert failed - ".mysqli_error($con);
            continue;
        }

        $cs_id = mysqli_insert_id($con);

        // Debit entry (Customer - ca_id 8)
        $debit_sql = "INSERT INTO acc_transaction (
            location_id, ca_id, t_date, tra_type, ref_no,
            debit, credit, vat_rate, debit_Vat, credit_vat,
            t_memo, credted_by, created_on, cus_id, source, source_id
        ) VALUES (
            $location_id, 8, '$invoice_date', 'Opening Balance', 'OB-$inv_id',
            $total_sales, 0, 0, 0, 0,
            '$memo', $user_id, NOW(), $c_id, 'Fuel Sales', $cs_id
        )";
        if (!mysqli_query($con, $debit_sql)) {
            throw new Exception("Line ".($i+2).": Debit insert failed: " . mysqli_error($con));
        }

        // Credit entry (Opening Balance Equity - ca_id 26)
        $credit_sql = "INSERT INTO acc_transaction (
            location_id, ca_id, t_date, tra_type, ref_no,
            debit, credit, vat_rate, debit_Vat, credit_vat,
            t_memo, credted_by, created_on, cus_id, source, source_id
        ) VALUES (
            $location_id, 26, '$invoice_date', 'Opening Balance', 'OB-$inv_id',
            0, $total_sales, 0, 0, 0,
            '$memo', $user_id, NOW(), $c_id, 'Fuel Sales', $cs_id
        )";
        if (!mysqli_query($con, $credit_sql)) {
            throw new Exception("Line ".($i+2).": Credit insert failed: " . mysqli_error($con));
        }

        $inv_id++;
        $success_count++;
    }

    mysqli_commit($con);

    echo json_encode([
        'success' => true,
        'imported' => $success_count,
        'skipped' => $skipped,
        'errors' => $errors
    ]);
} catch (Exception $ex) {
    mysqli_rollback($con);
    echo json_encode([
        'error' => 'Transaction failed: ' . $ex->getMessage(),
        'line' => $i+2
    ]);
}
