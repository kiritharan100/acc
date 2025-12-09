<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
if ($id <= 0) {
  echo json_encode(['error' => 'Invalid id']);
  exit;
}

// Fetch journal header
$hdrSql = "SELECT id, journal_date, memo, total_debit, total_credit, status, loc_no, location_id FROM acc_journal WHERE id = $id";
$hdrRes = mysqli_query($con, $hdrSql);
$journal = mysqli_fetch_assoc($hdrRes);
if (!$journal) {
  echo json_encode(['error' => 'Not found']);
  exit;
}

// Format date as DD-MM-YYYY for UI
$journal['journal_date'] = $journal['journal_date'] ? date('d-m-Y', strtotime($journal['journal_date'])) : '';

$loc = intval($journal['location_id'] ?? 0);

// Fetch details with account name and VAT
$detSql = "
  SELECT d.id, d.journal_id, d.ca_id, d.description, d.debit, d.credit,
         d.vat_id, d.debit_vat, d.credit_vat,
         COALESCE(ca_client.ca_name, ca_main.ca_name) AS account_name,
         v.vat_name, v.percentage AS vat_percentage
  FROM acc_journal_detail d
  LEFT JOIN accounts_coa_client ca_client
    ON ca_client.ca_id = d.ca_id AND ca_client.location_id = '$loc'
  LEFT JOIN accounts_coa_main ca_main
    ON ca_main.ca_id = d.ca_id
  LEFT JOIN accounts_vat_cat v
    ON v.vat_id = d.vat_id
  WHERE d.journal_id = $id
  ORDER BY d.id ASC
";
$detRes = mysqli_query($con, $detSql);
$details = [];
while ($row = mysqli_fetch_assoc($detRes)) {
  // Normalize numeric fields
  $row['debit'] = (float)$row['debit'];
  $row['credit'] = (float)$row['credit'];
  $row['debit_vat'] = (float)$row['debit_vat'];
  $row['credit_vat'] = (float)$row['credit_vat'];
  $row['vat_percentage'] = $row['vat_percentage'] !== null ? (float)$row['vat_percentage'] : null;
  $details[] = $row;
}

echo json_encode(['journal' => $journal, 'details' => $details]);
