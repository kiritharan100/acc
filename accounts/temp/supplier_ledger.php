 <?php
include 'header.php';
 
 

$from_date = $_GET['from'] ?? date('Y-m-01');
$to_date   = $_GET['to'] ?? date('Y-m-d');
$sup_id    = isset($_GET['sup_id']) ? intval($_GET['sup_id']) : 0;

$supplier = $sup_id > 0 ? mysqli_fetch_assoc(mysqli_query($con, "SELECT supplier_name, tin_no FROM manage_supplier WHERE sup_id = $sup_id")) : ['supplier_name' => '', 'tin_no' => ''];
$opening_balance = 0;
?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Supplier Ledger</h4>





            
        </div>

        <div class="card">
            <div class="card-block">
                <form method="get" class="form-inline mb-3">
                    <label class="mr-2">Supplier:</label>
                    <select name="sup_id" class="form-control select2 mr-3" required style="min-width: 300px;">
                        <option value="">-- Select Supplier --</option>
                        <?php
                        $suppliers = mysqli_query($con, "SELECT sup_id, supplier_name FROM manage_supplier WHERE status = 1 ORDER BY supplier_name");
                        while ($row = mysqli_fetch_assoc($suppliers)) {
                            $selected = ($sup_id == $row['sup_id']) ? 'selected' : '';
                            echo "<option value='{$row['sup_id']}' $selected>" . htmlspecialchars($row['supplier_name']) . "</option>";
                        }
                        ?>
                    </select>

                    <label class="mr-2">From:</label>
                    <input type="date" name="from" class="form-control mr-3" value="<?= $from_date ?>" required>

                    <label class="mr-2">To:</label>
                    <input type="date" name="to" class="form-control mr-3" value="<?= $to_date ?>" required>

                    <button type="submit" class="btn btn-primary">View</button>
                    <button type="button" id="exportButton" filename="SUPPLIER_STATEMENT_<?php echo $supplier['supplier_name']; ?>.xlsx" class="btn btn-primary ml-2">
                        <i class="ti-cloud-down"></i> Export
                    </button>
                </form>
                <hr>

                <?php if ($sup_id > 0): ?>

                <?php
                // Opening balance
                $ob = mysqli_fetch_assoc(mysqli_query($con, "
                    SELECT SUM(debit) AS debit, SUM(credit) AS credit 
                    FROM acc_transaction 
                    WHERE sup_id = $sup_id AND t_date < '$from_date' AND location_id = '$location_id' AND status = 1 AND ca_id = 9
                "));
                $opening_balance = floatval($ob['debit']) - floatval($ob['credit']);
                ?>

                <h5>Supplier: <strong><?= htmlspecialchars($supplier['supplier_name']) ?></strong></h5>
                 
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
                                WHERE sup_id = $sup_id AND t_date BETWEEN '$from_date' AND '$to_date'
                                  AND location_id = '$location_id' AND status = 1 AND ca_id = 9
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
