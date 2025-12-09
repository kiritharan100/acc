<?php
include '../../db.php';

$serial_no = $_GET['serial_no'] ?? '';
$location_id = $_REQUEST['location_id'] ?? 0;

$sql = "
  SELECT 
    at.t_id,
    at.ca_id,
    at.t_date,
    at.tra_type,
    at.source,
    at.ref_no,
    at.debit,
    at.credit,
    at.t_memo,
    at.cus_id,
    at.sup_id,
    coa.ca_name,
    c.customer_name,
    s.supplier_name
  FROM acc_transaction at
  LEFT JOIN acc_chart_of_accounts coa ON coa.ca_id = at.ca_id
  LEFT JOIN mange_customer c ON c.c_id = at.cus_id AND at.cus_id > 0
  LEFT JOIN manage_supplier s ON s.sup_id = at.sup_id AND at.sup_id > 0
  WHERE at.tra_type = 'Day End' AND at.ref_no = '$serial_no' and at.location_id ='$location_id'
  ORDER BY at.t_id ASC
";

$result = mysqli_query($con, $sql);

if (!$result || mysqli_num_rows($result) === 0) {
    echo "<p class='text-danger'>No journal entries found for Serial No: $serial_no</p>";
    exit;
}
?>

<table class="table table-bordered table-hover table-striped">
  <thead class="thead-dark">
    <tr>
      <th>#</th>
      <th>Date</th>
      <th>Type</th>
      <th>Ref No</th>
      <th>Source</th>
      <th>Account</th>
      <th class="text-right">Debit</th>
      <th class="text-right">Credit</th>
      <th>Memo</th>
    </tr>
  </thead>
  <tbody>
    <?php
    $i = 1;
    $total_debit = 0;
    $total_credit = 0;
    while ($row = mysqli_fetch_assoc($result)):
        $total_debit += floatval($row['debit']);
        $total_credit += floatval($row['credit']);

        // Combine account name with customer/supplier name if applicable
        $account_label = $row['ca_name'];
        if (!empty($row['customer_name'])) {
            $account_label .= ' : ' . $row['customer_name'];
        } elseif (!empty($row['supplier_name'])) {
            $account_label .= ' : ' . $row['supplier_name'];
        }
    ?>
      <tr>
        <td><?= $i++ ?></td>
        <td><?= $row['t_date'] ?></td>
        <td><?= $row['tra_type'] ?></td>
        <td><?= $row['ref_no'] ?></td>
        <td><?= $row['source'] ?></td>
        <td><?= htmlspecialchars($account_label) ?></td>
        <td class="text-right"><?= number_format($row['debit'], 2) ?></td>
        <td class="text-right"><?= number_format($row['credit'], 2) ?></td>
        <td><?= htmlspecialchars($row['t_memo']) ?></td>
      </tr>
    <?php endwhile; ?>
  </tbody>
  <tfoot class="table-secondary fw-bold">
    <tr>
      <td colspan="6" class="text-end">Total</td>
      <td class="text-right"><?= number_format($total_debit, 2) ?></td>
      <td class="text-right"><?= number_format($total_credit, 2) ?></td>
      <td></td>
    </tr>
  </tfoot>
</table>
