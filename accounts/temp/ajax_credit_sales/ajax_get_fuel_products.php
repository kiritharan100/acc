<?php
include '../../db.php';

header('Content-Type: application/json');

// Fetch active fuel products
$query = "SELECT p_id, p_code, p_name FROM product_master WHERE p_cat = 'Fuel' AND status = 1  ORDER BY p_name";
$result = mysqli_query($con, $query);

$products = [];
if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $products[] = [
            'p_id' => $row['p_id'],
            'p_code' => $row['p_code'],
            'p_name' => $row['p_name']
        ];
    }
}

echo json_encode($products);
