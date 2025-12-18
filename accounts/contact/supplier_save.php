<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$action = $_POST['action'] ?? '';
$supplier_name = trim($_POST['supplier_name'] ?? '');
$tin_no = trim($_POST['tin_no'] ?? '');
$address = trim($_POST['address'] ?? '');
$contact_number = trim($_POST['contact_number'] ?? '');
$status = isset($_POST['status']) ? (int)$_POST['status'] : 1;

if ($supplier_name === '') {
    echo json_encode(['success' => false, 'message' => 'Supplier name is required.']);
    exit;
}

if ($action === 'add') {
    $dup = mysqli_query($con, "SELECT 1 FROM accounts_manage_supplier WHERE supplier_name = '" . mysqli_real_escape_string($con, $supplier_name) . "' AND location_id = '$location_id' LIMIT 1");
    if ($dup && mysqli_num_rows($dup) > 0) {
        echo json_encode(['success' => false, 'message' => 'Supplier name already exists.']);
        exit;
    }

    $sql = "INSERT INTO accounts_manage_supplier (supplier_name, address, contact_number, location_id, tin_no, status)
            VALUES (?, ?, ?, ?, ?, 1)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("sssis", $supplier_name, $address, $contact_number, $location_id, $tin_no);
    $ok = $stmt->execute();
    if ($ok) {
        $detail = "New supplier $supplier_name added";
        if (function_exists('UserLog')) {
            UserLog('1', 'New Supplier added', $detail);
        }
        echo json_encode(['success' => true, 'message' => 'Supplier added successfully.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to add supplier.']);
    }
    exit;
}

if ($action === 'edit') {
    $sup_id = isset($_POST['sup_id']) ? (int)$_POST['sup_id'] : 0;
    if ($sup_id <= 0) {
        echo json_encode(['success' => false, 'message' => 'Invalid supplier.']);
        exit;
    }

    $sql = "UPDATE accounts_manage_supplier 
            SET supplier_name = ?, tin_no = ?, address = ?, contact_number = ?, status = ?
            WHERE sup_id = ? AND location_id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("ssssiii", $supplier_name, $tin_no, $address, $contact_number, $status, $sup_id, $location_id);
    $ok = $stmt->execute();
    if ($ok) {
        $detail = "$supplier_name : Detail edited";
        if (function_exists('UserLog')) {
            UserLog('1', 'Supplier detail edited', $detail);
        }
        echo json_encode(['success' => true, 'message' => 'Supplier updated successfully.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to update supplier.']);
    }
    exit;
}

echo json_encode(['success' => false, 'message' => 'Invalid action.']);
