<?php
 if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }

$from_date = $_GET['from'] ?? date('Y-m-01');
$to_date   = $_GET['to'] ?? date('Y-m-d');
$c_id      = isset($_GET['c_id']) ? intval($_GET['c_id']) : 0;

$customer = $c_id > 0 ? mysqli_fetch_assoc(mysqli_query($con, "SELECT customer_name, customer_address FROM mange_customer WHERE c_id = $c_id ")) : ['customer_name' => '', 'customer_address' => ''];
$opening_balance = 0;
?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Customer Ledger</h4>
        </div>

        <div class="card">
            <div class="card-block">
                <form method="get" class="form-inline mb-3">
                    <label class="mr-2">Customer:</label>
                    <select name="c_id" class="form-control select2 mr-3" required style="min-width: 300px;">
                        <option value="">-- Select Customer --</option>
                        <?php
                        $customers = mysqli_query($con, "SELECT c_id, customer_name FROM mange_customer WHERE status = 1 and c_id > 0 ORDER BY customer_name");
                        while ($row = mysqli_fetch_assoc($customers)) {
                            $selected = ($c_id == $row['c_id']) ? 'selected' : '';
                            echo "<option value='{$row['c_id']}' $selected>" . htmlspecialchars($row['customer_name']) . "</option>";
                        }
                        ?>
                    </select>
                        
    

                    <label class="mr-2">From:</label>
                                    <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
                                        echo "<input type='hidden' name='module' value='report'>";  }?>
                    
                    <input type="date" name="from" class="form-control mr-3" value="<?= $from_date ?>" required>

                    <label class="mr-2">To:</label>
                    <input type="date" name="to" class="form-control mr-3" value="<?= $to_date ?>" required>

                    <button type="submit" class="btn btn-primary">View</button>
                             <button type="button" id="exportButton" filename="CUSTOMER_STATEMENT_<?php echo $customer['customer_name']; ?>.xlsx" class="btn btn-primary ml-2">
                        <i class="ti-cloud-down"></i> Export
                    </button>
                </form>
                <hr>

                <?php if ($c_id > 0): ?>

                <?php
                // Opening balance
                $ob = mysqli_fetch_assoc(mysqli_query($con, "
                    SELECT SUM(debit) AS debit, SUM(credit) AS credit 
                    FROM acc_transaction 
                    WHERE cus_id = $c_id AND t_date < '$from_date' AND location_id = '$location_id' AND status = 1 and ca_id = 8
                "));
                $opening_balance = floatval($ob['debit']) - floatval($ob['credit']);
                ?>

                <h5>Customer: <strong><?= htmlspecialchars($customer['customer_name']) ?></strong></h5>
                <h6>Address: <?= nl2br(htmlspecialchars($customer['customer_address'])) ?></h6>
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
                                <th class="text-right">Cumulative Balance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $balance = $opening_balance;

                            if ($opening_balance != 0) {
                                echo "<tr class='table-info'>
                                    <td colspan='6'><strong>Opening Balance</strong></td>
                                    <td class='text-right'><strong>" . number_format($opening_balance, 2) . "</strong></td>
                                </tr>";
                            }

                            $txns = mysqli_query($con, "
                                SELECT t_date, tra_type, ref_no, t_memo, debit, credit
                                FROM acc_transaction 
                                WHERE cus_id = $c_id AND t_date BETWEEN '$from_date' AND '$to_date'
                                  AND location_id = '$location_id' AND status = 1 and ca_id = 8
                                ORDER BY t_date, t_id
                            ");

                            while ($row = mysqli_fetch_assoc($txns)) {
                                $balance += floatval($row['debit']) - floatval($row['credit']);
                                echo "<tr>";
                                echo "<td>{$row['t_date']}</td>";
                                echo "<td>{$row['tra_type']}</td>";
                                echo "<td>{$row['ref_no']}</td>";
                                echo "<td>{$row['t_memo']}</td>";
                                echo "<td class='text-right'>" . ($row['debit'] > 0 ? number_format($row['debit'], 2) : '') . "</td>";
                                echo "<td class='text-right'>" . ($row['credit'] > 0 ? number_format($row['credit'], 2) : '') . "</td>";
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
    $('.select2').select2();
    $('#example').DataTable({
        pageLength: 100,
        ordering: false
    });
});
</script>

<?php include 'footer.php'; ?>
