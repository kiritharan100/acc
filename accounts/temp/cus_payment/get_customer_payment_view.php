 <?php
include("../../db.php");

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

$query = "
  SELECT cp.*, c.customer_name, coa.ca_name 
  FROM acc_customer_payment cp
  LEFT JOIN mange_customer c ON cp.c_id = c.c_id
  LEFT JOIN acc_chart_of_accounts coa ON cp.ca_id = coa.ca_id
  WHERE cp.cp_id = '$id'
";

$res = mysqli_query($con, $query);
if (!$res || mysqli_num_rows($res) === 0) {
  echo "<div class='alert alert-danger'>Payment not found.</div>";
  exit;
}

$payment = mysqli_fetch_assoc($res);

$details_sql = "
  SELECT d.*, 
    CASE d.inv_type 
      WHEN 'Fuel' THEN (
        SELECT CONCAT_WS('~', invoice_no, DATE(date_time), (total_sales - paid_amount), location_id, total_sales, vehicle_no, ref_no,
                        (SELECT client_id FROM client_registration WHERE c_id = s.location_id))
        FROM shed_credit_sales s WHERE s.cs_id = d.inv_id
      )
      WHEN 'Oil' THEN (
        SELECT CONCAT_WS('~', invoice_no, DATE(issue_date), (issue_total - paid_amount), loc_id, issue_total, '', '',
                        (SELECT client_id FROM client_registration WHERE c_id = o.location))
        FROM oil_sales_master o WHERE o.iss_id = d.inv_id
      )
    END AS detail_data
  FROM acc_customer_payment_detail d
  WHERE d.rec_id = '$id'
";

$details_res = mysqli_query($con, $details_sql);
?>

<div class="table-responsive">
  <table class="table table-sm table-bordered">
    <tr><th>Receipt No</th><td><?= $payment['receipt_no'] ?></td></tr>
    <tr><th>Receipt Date</th><td><?= $payment['rec_date'] ?></td></tr>
    <tr><th>Customer</th><td><?= $payment['customer_name'] ?></td></tr>
    <tr><th>Deposit Account</th><td><?= $payment['ca_name'] ?></td></tr>
    <tr><th>Cheque No</th><td><?= $payment['cheque_no'] ?></td></tr>
    <tr><th>Memo</th><td><?= $payment['Memo'] ?></td></tr>
    <tr><th>Amount</th><td><?= number_format($payment['rec_amount'], 2) ?></td></tr>
  </table>

  <h6>Applied Invoices</h6>
  <table class="table table-bordered table-sm">
    <thead>
      <tr>
        <th>#</th>
        <th>Invoice No</th>
        <th>Type</th>
        <th>Date</th>
    
        <th>Vehicle</th>
        <th>Order No</th>
        <th>Supply By</th>
            <th>Original Amt</th>
        <th>Amt Due</th>
        <th>Paid</th>
      </tr>
    </thead>
    <tbody>
      <?php
      $i = 1;
      while ($row = mysqli_fetch_assoc($details_res)) {
        $fields = explode('~', $row['detail_data']);
        echo "<tr>
                <td>{$i}</td>
                <td>{$fields[0]}</td>
                <td>{$row['inv_type']}</td>
                <td>{$fields[1]}</td>

                <td>{$fields[5]}</td>
                <td>{$fields[6]}</td>
                <td>{$fields[7]}</td>
                                <td class='text-right'>" . number_format((float)($fields[4] ?? 0), 2) . "</td>
                <td class='text-right'>" . number_format((float)($fields[2] ?? 0), 2) . "</td>
                <td class='text-right'>" . number_format((float)$row['amount'], 2) . "</td>
              </tr>";
        $i++;
      }
      ?>
    </tbody>
  </table>
</div>