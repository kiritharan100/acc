<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$action = $_POST['action'] ?? '';
$customer_name     = trim($_POST['customer_name'] ?? '');
$customer_address  = trim($_POST['customer_address'] ?? '');
$customer_email    = trim($_POST['customer_email'] ?? '');
$condact_number    = trim($_POST['condact_number'] ?? '');
$max_limit         = isset($_POST['max_limit']) ? trim($_POST['max_limit']) : '';
$status            = isset($_POST['status']) ? (int)$_POST['status'] : 1;

if ($customer_name === '') {
    echo json_encode(['success' => false, 'message' => 'Customer name is required.']);
    exit;
}

if ($action === 'add') {
    $dup = mysqli_query($con, "SELECT 1 FROM accounts_manage_customer WHERE customer_name = '" . mysqli_real_escape_string($con, $customer_name) . "' AND location_id = '$location_id' LIMIT 1");
    if ($dup && mysqli_num_rows($dup) > 0) {
        echo json_encode(['success' => false, 'message' => 'Customer name already exists.']);
        exit;
    }

    $sql = "INSERT INTO accounts_manage_customer (location_id, customer_name, customer_address, customer_email, condact_number, max_limit, status)
            VALUES (?, ?, ?, ?, ?, ?, 1)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("isssss", $location_id, $customer_name, $customer_address, $customer_email, $condact_number, $max_limit);
    $ok = $stmt->execute();
    if ($ok) {
        if (function_exists('UserLog')) {
            UserLog('1', 'New customer added', "New customer $customer_name added with Max Limit $max_limit");
        }
        echo json_encode(['success' => true, 'message' => 'Customer added successfully.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to add customer.']);
    }
    exit;
}

if ($action === 'edit') {
    $c_id = isset($_POST['c_id']) ? (int)$_POST['c_id'] : 0;
    if ($c_id <= 0) {
        echo json_encode(['success' => false, 'message' => 'Invalid customer.']);
        exit;
    }

    $sql = "UPDATE accounts_manage_customer 
            SET customer_name = ?, customer_address = ?, customer_email = ?, condact_number = ?, max_limit = ?, status = ?
            WHERE c_id = ? AND location_id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("ssssiiii", $customer_name, $customer_address, $customer_email, $condact_number, $max_limit, $status, $c_id, $location_id);
    $ok = $stmt->execute();
    if ($ok) {
        if (function_exists('UserLog')) {
            UserLog('1', 'Customer detail edited', "Customer detail of $customer_name edited");
        }
        echo json_encode(['success' => true, 'message' => 'Customer updated successfully.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to update customer.']);
    }
    exit;
}

echo json_encode(['success' => false, 'message' => 'Invalid action.']);
