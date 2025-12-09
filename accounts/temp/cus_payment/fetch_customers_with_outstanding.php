<?php
include("../../db.php");

$search = isset($_GET['term']) ? mysqli_real_escape_string($con, $_GET['term']) : '';

$query = "
  SELECT c.c_id, c.customer_name
  FROM mange_customer c
  WHERE c.status = 1 AND (c.customer_name LIKE '%$search%' OR c.customer_email LIKE '%$search%') AND c.c_id > 0
";

$result = mysqli_query($con, $query);
$data = [];

while ($row = mysqli_fetch_assoc($result)) {
  $c_id = $row['c_id'];
  $total_due = 0;

  // Shed Credit Sales (fuel)
  $shed_sql = "SELECT SUM(total_sales - paid_amount) AS due 
               FROM shed_credit_sales 
               WHERE c_id = '$c_id' AND status = 1 AND (total_sales - paid_amount) > 0";
  $shed_result = mysqli_query($con, $shed_sql);
  $shed_row = mysqli_fetch_assoc($shed_result);
  $shed_due = $shed_row['due'] ?? 0;

  // Oil Sales
  $oil_sql = "SELECT SUM(issue_total - paid_amount) AS due 
              FROM oil_sales_master 
              WHERE to_location = '$c_id' AND issue_status = 1 AND (issue_total - paid_amount) > 0";
  $oil_result = mysqli_query($con, $oil_sql);
  $oil_row = mysqli_fetch_assoc($oil_result);
  $oil_due = $oil_row['due'] ?? 0;

  $total_due = floatval($shed_due) + floatval($oil_due);

  if ($total_due > 0) {
    $data[] = [
      'id' => $c_id,
      'text' => $row['customer_name'] . ' - ' . number_format($total_due, 2)
    ];
  }
}

echo json_encode($data);
