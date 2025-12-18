<?php
include("../../db.php");
include("../../auth.php");
include("../../main_functions.php");

$isSigned = verify_signed_request($_GET);
if (!$isSigned) {
    http_response_code(400);
    exit("Invalid or missing signature.");
}

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
if ($id <= 0) {
    die("Invalid journal id");
}

$hdrSql = "SELECT id, journal_date, memo, total_debit, total_credit, status, loc_no, location_id FROM accounts_journal WHERE id = $id";
$hdrRes = mysqli_query($con, $hdrSql);
$journal = mysqli_fetch_assoc($hdrRes);
if (!$journal) {
    die("Journal not found");
}
$loc = intval($journal['location_id'] ?? 0);
$journal_date = $journal['journal_date'] ? date('Y-m-d', strtotime($journal['journal_date'])) : '';
$journal_no = $journal['loc_no'] ? 'J' . $journal['loc_no'] : '';

$cliRes = mysqli_query($con, "SELECT client_name, address_line1, address_line2, city_town, district FROM client_registration WHERE c_id = '$loc' LIMIT 1");
$client = mysqli_fetch_assoc($cliRes);

$detSql = "
    SELECT d.*, 
      COALESCE(ca_client.ca_name, ca_main.ca_name) AS account_name,
      v.vat_name, v.percentage AS vat_percentage,
      c.customer_name, s.supplier_name
  FROM accounts_journal_detail d
  LEFT JOIN accounts_coa_client ca_client
    ON ca_client.ca_id = d.ca_id AND ca_client.location_id = '$loc'
  LEFT JOIN accounts_coa_main ca_main
    ON ca_main.ca_id = d.ca_id
  LEFT JOIN accounts_vat_cat v
    ON v.vat_id = d.vat_id
  LEFT JOIN accounts_manage_customer c
    ON c.c_id = d.contact_id AND c.location_id = '$loc'
  LEFT JOIN accounts_manage_supplier s
    ON s.sup_id = d.contact_id AND s.location_id = '$loc'
  WHERE d.journal_id = $id
  ORDER BY d.id ASC
";
$detRes = mysqli_query($con, $detSql);
$details = [];
while ($row = mysqli_fetch_assoc($detRes)) {
    $details[] = $row;
}

$fmt = function($val) {
    $num = floatval($val);
    if ($num == 0) return '';
    return number_format($num, 2);
};

ob_start();
?>
<style>
body {
    font-family: DejaVu Sans, sans-serif;
    font-size: 12px;
}

.header {
    margin-bottom: 10px;
}

.title {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 6px;
}

.client {
    font-size: 12px;
    margin-bottom: 10px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th,
td {
    border: 1px solid #ccc;
    padding: 6px;
}

th {
    background: #f0f0f0;
}

.right {
    text-align: right;
}

.total-row {
    background: #B3C6F2;
    font-weight: bold;
}
</style>
<div class="header">
    <div class="title">Journal Entry</div>
    <div class="client">
        <div><strong>Client:</strong> <?= htmlspecialchars($client['client_name'] ?? '') ?></div>
        <div><strong>Address:</strong>
            <?= htmlspecialchars(trim(($client['address_line1'] ?? '') . ' ' . ($client['address_line2'] ?? '') . ' ' . ($client['city_town'] ?? '') . ' ' . ($client['district'] ?? ''))) ?>
        </div>
        <div><strong>Journal No:</strong> <?= htmlspecialchars($journal_no) ?></div>
        <div><strong>Date:</strong> <?= htmlspecialchars($journal_date) ?></div>
        <div><strong>Memo:</strong> <?= htmlspecialchars($journal['memo'] ?? '') ?></div>
    </div>
</div>

<table>
    <thead>
        <tr>
            <th style="width:40px;">#</th>
            <th>Account</th>
            <th>Description</th>
            <?php if ($is_vat_registered == 1): ?>
            <th style="width:90px;">VAT</th>
            <th style="width:90px;" class="right">VAT Value</th>
            <?php endif; ?>
            <th style="width:90px;" class="right">Debit</th>
            <th style="width:90px;" class="right">Credit</th>
            <th style="width:140px;">Contact</th>
        </tr>
    </thead>
    <tbody>
        <?php
    $tDr = 0; $tCr = 0;
    foreach ($details as $idx => $line):
        $dr = floatval($line['debit'] ?? 0);
        $cr = floatval($line['credit'] ?? 0);
        $tDr += $dr; $tCr += $cr;
        $vatVal = (floatval($line['debit_vat'] ?? 0) + floatval($line['credit_vat'] ?? 0));
        $vatName = $line['vat_name'] ? $line['vat_name'] . (($line['vat_percentage'] ?? '') !== '' ? ' (' . $line['vat_percentage'] . '%)' : '') : '';
        $contactName = '';
        if (!empty($line['customer_name'])) { $contactName = $line['customer_name']; }
        elseif (!empty($line['supplier_name'])) { $contactName = $line['supplier_name']; }
    ?>
        <tr>
            <td><?= $idx + 1 ?></td>
            <td><?= htmlspecialchars($line['account_name'] ?? '') ?></td>
            <td><?= htmlspecialchars($line['description'] ?? '') ?></td>
            <?php if ($is_vat_registered == 1): ?>
            <td><?= htmlspecialchars($vatName) ?></td>
            <td class="right"><?= $fmt($vatVal) ?></td>
            <?php endif; ?>
            <td class="right"><?= $fmt($dr) ?></td>
            <td class="right"><?= $fmt($cr) ?></td>
            <td><?= htmlspecialchars($contactName) ?></td>
        </tr>
        <?php endforeach; ?>
    </tbody>
    <tfoot>
        <tr class="total-row">
            <td colspan="<?= ($is_vat_registered == 1) ? 5 : 3; ?>" class="right">Total</td>
            <?php if ($is_vat_registered == 1): ?>
            <td class="right"><?= $fmt($tDr) ?></td>
            <td class="right"><?= $fmt($tCr) ?></td>
            <?php else: ?>
            <td class="right"><?= $fmt($tDr) ?></td>
            <td class="right"><?= $fmt($tCr) ?></td>
            <?php endif; ?>
            <td></td>
        </tr>
    </tfoot>
</table>
<?php
$html = ob_get_clean();
render_pdf($html, "Journal_{$journal_no}.pdf");