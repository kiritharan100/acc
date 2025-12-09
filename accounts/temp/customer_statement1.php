<?php
include 'header.php';

// Fetch customers
$customers = mysqli_query($con, "SELECT c_id, customer_name FROM mange_customer WHERE status = 1 ORDER BY customer_name");
$c_id = isset($_GET['c_id']) ? intval($_GET['c_id']) : 0;

$customer = $c_id ? mysqli_fetch_assoc(mysqli_query($con, "SELECT customer_name, customer_address FROM mange_customer WHERE c_id = $c_id")) : ['customer_name' => '', 'customer_address' => ''];
$letter_head =   mysqli_fetch_assoc(mysqli_query($con, "SELECT * FROM letter_head"));

?>
<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Account Transactions</h4>
        </div>

        <div class="card">
            <div class="card-block">
<div class="container mt-4">
    <div class="card p-4 shadow">
        <form method="get" class="form-inline mb-4">
            <label class="mr-2">Select Customer:</label>
            <select name="c_id" class="form-control select2 mr-3" required style="min-width: 300px">
                <option value="">-- Choose --</option>
                <?php while ($row = mysqli_fetch_assoc($customers)) { ?>
                    <option value="<?= $row['c_id'] ?>" <?= $c_id == $row['c_id'] ? 'selected' : '' ?>>
                        <?= htmlspecialchars($row['customer_name']) ?>
                    </option>
                <?php } ?>
            </select>
            <button type="submit" class="btn btn-primary">Generate Statement</button>
        </form>

        <?php if ($c_id): ?>
        <div id="print_area">
          <div class="text-center mb-3">
    <h4 class="mb-1"><?= $letter_head['entity']; ?></h4>
    <h4 class="mb-1">(<?= $letter_head['reg_no']; ?>)</h4>
    <h4 class="mb-1">Outstanding Customer Statement</h4>
</div>
             

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="thead-light">
                         <tr>
            <th colspan='3' style="width: 25%;">Statement Date:</th>
            <td colspan='2'><?= date('Y-m-d') ?></td>
        </tr>
        <tr>
            <th colspan='3'>Name of the Account Holder:</th>
            <td colspan='2'><?= htmlspecialchars($customer['customer_name']) ?></td>
        </tr>
        <tr>
            <th colspan='3'>Address:</th>
            <td colspan='2'><?= nl2br(htmlspecialchars($customer['customer_address'])) ?></td>
        </tr>

                        <tr>
                        <th style="width: 15%;">Date</th>
            <th style="width: 20%;">Invoice No</th>
            <th style="width: 20%;">Reference</th>
            <th style="width: 25%;">Vehicle</th>
            <th style="width: 20%;" class="text-right">Amount (Rs.)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $total = 0;

                        // Shed credit sales
                        $fuel_sql = "SELECT date_time AS date, invoice_no, ref_no, vehicle_no, total_sales, paid_amount 
                                     FROM shed_credit_sales 
                                     WHERE c_id = $c_id AND status = 1 AND (total_sales - paid_amount) > 0";
                        $fuel_res = mysqli_query($con, $fuel_sql);
                        while ($f = mysqli_fetch_assoc($fuel_res)) {
                            $amount = $f['total_sales'] - $f['paid_amount'];
                            $total += $amount;
                            echo "<tr>
                                <td>" . date('Y-m-d', strtotime($f['date'])) . "</td>
                                <td>{$f['invoice_no']}</td>
                                <td>{$f['ref_no']}</td>
                                <td>{$f['vehicle_no']}</td>
                                <td class='text-right'>" . number_format($amount, 2) . "</td>
                            </tr>";
                        }

                        // Oil sales
                        $oil_sql = "SELECT issue_date AS date, invoice_no, '' AS ref_no, 'Oil' AS vehicle_no, issue_total, paid_amount 
                                    FROM oil_sales_master 
                                    WHERE to_location = $c_id AND issue_status = 1 AND (issue_total - paid_amount) > 0";
                        $oil_res = mysqli_query($con, $oil_sql);
                        while ($o = mysqli_fetch_assoc($oil_res)) {
                            $amount = $o['issue_total'] - $o['paid_amount'];
                            $total += $amount;
                            echo "<tr>
                                <td>" . date('Y-m-d', strtotime($o['date'])) . "</td>
                                <td>{$o['invoice_no']}</td>
                                <td>-</td>
                                <td>{$o['vehicle_no']}</td>
                                <td class='text-right'>" . number_format($amount, 2) . "</td>
                            </tr>";
                        }
                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="4" class="text-right">Total Outstanding</th>
                            <th class="text-right"><?= number_format($total, 2) ?></th>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <p class="text-danger mt-3 font-weight-bold">
                Payment is to be made within a week from the date of receipt of this statement please.
            </p>

            <div class="row mt-5">
                <div class="col-md-6">
                    <p><strong>Checked By:</strong> ____________________</p>
                    <p><strong>Date:</strong> <?= date('Y-m-d') ?></p>
                </div>
                <div class="col-md-6 text-right">
                    <p>____________________</p>
                    <p><strong>General Manager</strong></p>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <button onclick="printDiv('print_area')" class="btn btn-secondary">
                <i class="fa fa-print"></i> Print Statement
            </button>
        </div>
        <?php endif; ?>
    </div>
</div>

 
 
<script>
function printDiv(id) {
    const divContents = document.getElementById(id).innerHTML;
    const win = window.open('', '', 'height=900,width=1200');

    win.document.write('<html><head><title>Print Statement</title>');
    win.document.write(`
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 40px;
                font-size: 14px;
                color: #000;
            }
            h4 {
                margin-bottom: 2px;
                text-align: center;
                text-transform: uppercase;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 30px;
            }
            table, th, td {
                border: 1px solid #000;
            }
            th, td {
                padding: 5px 8px;
                text-align: left;
            }
            th {
                background: #f0f0f0;
            }
            .text-right {
                text-align: right;
            }
            .signature-section {
                margin-top: 60px;
            }
            .signature-section .left,
            .signature-section .right {
                width: 45%;
                display: inline-block;
                vertical-align: top;
            }
            .signature-section .right {
                text-align: right;
            }
        </style>
    `);
    win.document.write('</head><body>');
    win.document.write(divContents);
    win.document.write('</body></html>');
    win.document.close();
    win.focus();
    win.print();
    win.close();
}
</script>

<?php include 'footer.php'; ?>
