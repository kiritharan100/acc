<?php
header('Content-Type: application/json');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("../../db.php");

$c_id = isset($_GET['c_id']) ? intval($_GET['c_id']) : 0;
$data = [];

if ($c_id > 0) {
  // Fuel Invoices
  $fuel_sql = "
    SELECT s.cs_id AS inv_id, s.invoice_no, DATE(s.date_time) AS date,
           (s.total_sales - s.paid_amount) AS amount_due,
           s.location_id, cr.client_id AS supply_by,
           s.total_sales AS org_amount, s.ref_no, s.vehicle_no
    FROM shed_credit_sales s
    LEFT JOIN client_registration cr ON s.location_id = cr.c_id
    WHERE s.c_id = '$c_id' AND s.status = 1 AND (s.total_sales - s.paid_amount) > 0
    ORDER BY s.date_time ASC
  ";
  $fuel_res = mysqli_query($con, $fuel_sql);
  if (!$fuel_res) {
    http_response_code(500);
    echo json_encode(["error" => "Fuel SQL Error: " . mysqli_error($con)]);
    exit;
  }

  while ($row = mysqli_fetch_assoc($fuel_res)) {
    $data[] = [
      'inv_id'      => $row['inv_id'],
      'invoice_no'  => $row['invoice_no'],
      'date'        => $row['date'],
      'amount_due'  => $row['amount_due'],
      'inv_type'    => 'Fuel',
      'supply_by'   => $row['supply_by'] ?? '',
      'loc_id'      => $row['location_id'] ?? '',
      'org_amount'  => $row['org_amount'] ?? '',
      'vehicle_no'  => $row['vehicle_no'] ?? '',
      'order_no'    => $row['ref_no'] ?? ''
    ];
  }

  // Oil Invoices
  $oil_sql = "
    SELECT o.iss_id AS inv_id, o.invoice_no, DATE(o.issue_date) AS date,
           (o.issue_total - o.paid_amount) AS amount_due,
           o.location AS loc_id, cr.client_id AS supply_by,
           o.issue_total AS org_amount
    FROM oil_sales_master o
    LEFT JOIN client_registration cr ON o.location = cr.c_id
    WHERE o.to_location = '$c_id' AND o.issue_status = 1 AND (o.issue_total - o.paid_amount) > 0
    ORDER BY o.issue_date ASC
  ";
  $oil_res = mysqli_query($con, $oil_sql);
  if (!$oil_res) {
    http_response_code(500);
    echo json_encode(["error" => "Oil SQL Error: " . mysqli_error($con)]);
    exit;
  }

  while ($row = mysqli_fetch_assoc($oil_res)) {
    $data[] = [
      'inv_id'      => $row['inv_id'],
      'invoice_no'  => $row['invoice_no'],
      'date'        => $row['date'],
      'amount_due'  => $row['amount_due'],
      'inv_type'    => 'Oil',
      'supply_by'   => $row['supply_by'] ?? '',
      'loc_id'      => $row['loc_id'] ?? '',
      'org_amount'  => $row['org_amount'] ?? '',
      'vehicle_no'  => '',
      'order_no'    => ''
    ];
  }
}

// Final response
echo json_encode($data);
