<?php
 if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }

$from_date = isset($_GET['from']) ? $_GET['from'] : date('Y-m-01');
$to_date   = isset($_GET['to']) ? $_GET['to'] : date('Y-m-t');
$ca_id     = 47;

$account = [];
$opening_balance = 0;
$is_balance_sheet = false;
 
?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Account Ledger</h4>
        </div>

        <div class="card">
            <div class="card-block">
                <form method="get" class="form-inline mb-3">
                    <label class="mr-2">Account:</label>
                   

                    <label class="mr-2">From:</label>
                     <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
                                        echo "<input type='hidden' name='module' value='report'>";  }?>
                    <input type="date" name="from" class="form-control mr-3" value="<?= $from_date ?>" required>

                    <label class="mr-2">To:</label>
                    <input type="date" name="to" class="form-control mr-3" value="<?= $to_date ?>" required>

                    <button type="submit" class="btn btn-primary">View</button>
                     <button type="button" id="exportButton" filename="ACCOUNT_Ledger.xlsx" class="btn btn-primary ml-2">
                        <i class="ti-cloud-down"></i> Export
                    </button>

                </form>

                <hr>

                <?php if ($ca_id > 0): ?>

                <?php
                $acc = mysqli_fetch_assoc(mysqli_query($con, "
                    SELECT ca_name, ca_type, ca_group FROM acc_chart_of_accounts WHERE ca_id = $ca_id
                "));
                $account = $acc;
                $is_balance_sheet = in_array($acc['ca_type'], ['Assets', 'Liabilities', 'Equity']);

          if ($is_balance_sheet) {
    $ob = mysqli_fetch_assoc(mysqli_query($con, "
        SELECT 
            SUM(CASE WHEN ca_id = 47 THEN debit ELSE debit_Vat END) AS debit,
            SUM(CASE WHEN ca_id = 47 THEN credit ELSE credit_vat END) AS credit
        FROM acc_transaction 
        WHERE (ca_id = 47 OR debit_Vat > 0 OR credit_vat > 0)
          AND t_date < '$from_date'
          AND location_id = '$location_id'
          AND status = 1
    "));
    $opening_balance = floatval($ob['debit']) - floatval($ob['credit']);
}
                ?>

                <h5>Account: <strong><?= $account['ca_name'] ?> (<?= $account['ca_type'] ?>)</strong></h5>
                <h6>Date Range: <?= $from_date ?> to <?= $to_date ?></h6>

                <div class="table-responsive mt-3">
                    <table id="example" class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Date</th>
                                <th>Transaction Type</th>
                                <th>Reference</th>
                                <th>Memo</th>
                                
                                <th class="text-right">Debit</th>
                                <th class="text-right">Credit</th>
                                <th class="text-right">Debit VAT </th>
                                <th class="text-right">Credit VAT</th>
                                <th class="text-right">Cumulative Balance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $balance = $opening_balance;

                            if ($is_balance_sheet && $opening_balance != 0) {
                                echo "<tr class='table-info'>
                                    <td colspan='7'><strong>Opening Balance</strong></td>
                                    <td class='text-right'><strong>" . number_format($opening_balance, 2) . "</strong></td>
                                </tr>";
                            }

                            $txns = mysqli_query($con, "
                                SELECT t.ca_id,t.t_date, t.tra_type, t.ref_no, t.t_memo, t.debit, t.credit,t.debit_Vat,t.credit_vat,
                                       s.supplier_name, c.customer_name
                                FROM acc_transaction t
                                LEFT JOIN manage_supplier s ON t.sup_id = s.sup_id
                                LEFT JOIN mange_customer c ON t.cus_id = c.c_id
                                WHERE   ( t.ca_id = 47  OR t.debit_Vat > 0 OR t.credit_vat > 0) AND t.status = 1 
                                  AND t.t_date BETWEEN '$from_date' AND '$to_date'
                                  AND t.location_id = '$location_id'
                                ORDER BY t.t_date, t.t_id
                            ");

                            while ($row = mysqli_fetch_assoc($txns)) {
                                  if ($row['ca_id'] == 47) {
                                        $debit = floatval($row['debit']);
                                        $credit = floatval($row['credit']);
                                    } else {
                                        $debit = floatval($row['debit_Vat']);
                                        $credit = floatval($row['credit_vat']);
                                    }
    
    
                                $balance += $debit - $credit;
                                $party = $row['supplier_name'] ?: $row['customer_name'];

                                echo "<tr>";
                                echo "<td>{$row['t_date']}</td>";
                                echo "<td>{$row['tra_type']}</td>";
                                echo "<td>{$row['ref_no']}</td>";
                                echo "<td>{$row['t_memo']}</td>";
                                
                                                                echo "<td class='text-right'>" . ($row['debit'] > 0 ? number_format($row['debit'], 2) : '') . "</td>";
                                echo "<td class='text-right'>" . ($row['credit'] > 0 ? number_format($row['credit'], 2) : '') . "</td>";
                                echo "<td class='text-right'>" . ($debit > 0 ? number_format($debit, 2) : '') . "</td>";
                                echo "<td class='text-right'>" . ($credit > 0 ? number_format($credit, 2) : '') . "</td>";
                                echo "<td class='text-right'>" . number_format($balance, 2) . "</td>";
                                echo "</tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function () {
    $('select[name="ca_id"]').select2();
    $('#example').DataTable({
        "pageLength": 100,
        "ordering": false
    });
});
</script>

<?php include 'footer.php'; ?>
