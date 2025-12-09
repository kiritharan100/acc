<?php
 if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }

$from_date = isset($_GET['from']) ? $_GET['from'] : date('Y-m-01');
$to_date   = isset($_GET['to']) ? $_GET['to'] : date('Y-m-t');
?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Account Transactions</h4>
        </div>

        <div class="card">
            <div class="card-block">
                <form method="get" class="form-inline mb-3">
                    <label class="mr-2">From:</label>
                     <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
                                        echo "<input type='hidden' name='module' value='report'>";  }?>
                    <input type="date" name="from" class="form-control mr-3" value="<?= $from_date ?>" required>
                    <label class="mr-2">To:</label>
                    <input type="date" name="to" class="form-control mr-3" value="<?= $to_date ?>" required>
                    <button type="submit" class="btn btn-primary">Filter</button>
                    <button type="button" id="exportButton" filename="ACCOUNT_TRANSACTIONS.xlsx" class="btn btn-primary ml-2">
                        <i class="ti-cloud-down"></i> Export
                    </button>
                </form>
                <hr>

                <div class="table-responsive">
                    <table id="example" class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th style='width:60px;'>Date</th>
                                <th style='width:180px;'>Account</th>
                                <!-- <th>Group</th> -->
                                <th>Transaction Type</th>
                                <th>Reference</th>
                                <th>Memo</th>
                                <th>Party</th>
                                <th class="text-right">Debit</th>
                                <th class="text-right">Credit</th>
                                <th class="text-right">Input VAT</th>
                                <th class="text-right">Output VAT</th>
                            </tr>
                        </thead>
                        <tbody>
<?php
$total_debit = 0;
$total_credit = 0;

$qry = "
    SELECT t.t_date, t.tra_type, t.ref_no, t.t_memo, t.debit, t.credit, t.cus_id, t.sup_id,t.debit_Vat,t.credit_vat,
           a.ca_name, a.ca_group,
           s.supplier_name, c.customer_name
    FROM acc_transaction t
    LEFT JOIN acc_chart_of_accounts a ON t.ca_id = a.ca_id
    LEFT JOIN manage_supplier s ON t.sup_id = s.sup_id AND t.sup_id > 0
    LEFT JOIN mange_customer c ON t.cus_id = c.c_id  AND t.cus_id > 0
    WHERE t.status = 1
      AND t.t_date BETWEEN '$from_date' AND '$to_date'
      AND t.location_id = '$location_id'
    ORDER BY t.t_date ASC, t.t_id ASC
";

$res = mysqli_query($con, $qry);
while ($row = mysqli_fetch_assoc($res)) {
    $total_debit += floatval($row['debit']);
    $total_credit += floatval($row['credit']);

    $party = '';
    if (!empty($row['supplier_name'])) {
        $party = $row['supplier_name'];
    } elseif (!empty($row['customer_name'])) {
        $party = $row['customer_name'];
    }

    echo "<tr>";
    echo "<td>{$row['t_date']}</td>";
    echo "<td>{$row['ca_name']}</td>";
    // echo "<td>{$row['ca_group']}</td>";
    echo "<td>{$row['tra_type']}</td>";
    echo "<td>{$row['ref_no']}</td>";
    echo "<td>{$row['t_memo']}</td>";
    echo "<td>{$party}</td>";
    echo "<td class='text-right'>" . ($row['debit'] > 0 ? number_format($row['debit'], 2) : '') . "</td>";
    echo "<td class='text-right'>" . ($row['credit'] > 0 ? number_format($row['credit'], 2) : '') . "</td>";
    echo "<td class='text-right'>" . ($row['debit_Vat'] > 0 ? number_format($row['debit_Vat'], 2) : '') . "</td>";
    echo "<td class='text-right'>" . ($row['credit_vat'] > 0 ? number_format($row['credit_vat'], 2) : '') . "</td>";
    echo "</tr>";
}
?>
                          
                        </tbody>
                    </table>
<div align ='right'>
                    <table > 
                        <tr>  <tr style="background-color:#d3dace;">
                                <td colspan="7" class="text-right"><strong>Total</strong></td>
                                <td class="text-right"><strong>Dr: <?= number_format($total_debit, 2) ?> ---- </strong></td>
                                <td class="text-right"><strong>Cr: <?= number_format($total_credit, 2) ?></strong></td>
                            </tr>
                        </tr>
                    </table> </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function () {
    $('#example').DataTable({
        "pageLength": 100
    });
});
</script>

<?php include 'footer.php'; ?>
