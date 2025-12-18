<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$items = [];

$sql = "
    SELECT p.p_id, p.location_id, p.category, p.income_account, p.vat_id,
           p.product_name, p.price, p.status,
           COALESCE(ca_client.ca_name, ca_main.ca_name) AS income_account_name,
           v.vat_name, v.percentage AS vat_percentage
    FROM accounts_product p
    LEFT JOIN accounts_coa_client ca_client
      ON ca_client.ca_id = p.income_account AND ca_client.location_id = '$location_id'
    LEFT JOIN accounts_coa_main ca_main
      ON ca_main.ca_id = p.income_account
    LEFT JOIN accounts_vat_cat v
      ON v.vat_id = p.vat_id
    WHERE p.location_id = '$location_id'
    ORDER BY p.p_id DESC
";
$res = mysqli_query($con, $sql);

if ($res) {
    while ($row = mysqli_fetch_assoc($res)) {
        $items[] = $row;
    }
}

echo json_encode(['success' => true, 'data' => $items]);
