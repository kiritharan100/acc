<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$action = $_POST['action'] ?? '';
$product_name = trim($_POST['product_name'] ?? '');
$category = trim($_POST['category'] ?? '');
$income_account = isset($_POST['income_account']) ? (int)$_POST['income_account'] : 0;
$vat_id = isset($_POST['vat_id']) ? (int)$_POST['vat_id'] : 0;
$price = isset($_POST['price']) ? trim($_POST['price']) : '';
$status = isset($_POST['status']) ? (int)$_POST['status'] : 1;

if ($product_name === '') {
    echo json_encode(['success' => false, 'message' => 'Product/Service name is required.']);
    exit;
}
if ($category === '') {
    echo json_encode(['success' => false, 'message' => 'Category is required.']);
    exit;
}
if ($income_account <= 0) {
    echo json_encode(['success' => false, 'message' => 'Income account is required.']);
    exit;
}

// Normalize price (remove commas)
$price = str_replace(',', '', $price);
if ($price === '') {
    $price = '0';
}
$price = (float)$price;

if ($action === 'add') {
    $dup = mysqli_query($con, "SELECT 1 FROM accounts_product WHERE product_name = '" . mysqli_real_escape_string($con, $product_name) . "' AND location_id = '$location_id' LIMIT 1");
    if ($dup && mysqli_num_rows($dup) > 0) {
        echo json_encode(['success' => false, 'message' => 'Product/Service name already exists.']);
        exit;
    }

    $sql = "INSERT INTO accounts_product (location_id, category, income_account, vat_id, product_name, price, status)
            VALUES (?, ?, ?, ?, ?, ?, 1)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("isiisd", $location_id, $category, $income_account, $vat_id, $product_name, $price);
    $ok = $stmt->execute();
    if ($ok) {
        if (function_exists('UserLog')) {
            UserLog('1', 'New product/service added', "Added $product_name");
        }
        echo json_encode(['success' => true, 'message' => 'Product/Service added successfully.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to add product/service.']);
    }
    exit;
}

if ($action === 'edit') {
    $p_id = isset($_POST['p_id']) ? (int)$_POST['p_id'] : 0;
    if ($p_id <= 0) {
        echo json_encode(['success' => false, 'message' => 'Invalid product/service.']);
        exit;
    }

    $sql = "UPDATE accounts_product
            SET category = ?, income_account = ?, vat_id = ?, product_name = ?, price = ?, status = ?
            WHERE p_id = ? AND location_id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("siisdiii", $category, $income_account, $vat_id, $product_name, $price, $status, $p_id, $location_id);
    $ok = $stmt->execute();
    if ($ok) {
        if (function_exists('UserLog')) {
            UserLog('1', 'Product/service updated', "Updated $product_name");
        }
        echo json_encode(['success' => true, 'message' => 'Product/Service updated successfully.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to update product/service.']);
    }
    exit;
}

echo json_encode(['success' => false, 'message' => 'Invalid action.']);
