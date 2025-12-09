<?php
 if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }

$today = date('Y-m-d');
$from_date = isset($_GET['from']) ? $_GET['from'] : date('Y-m-01', strtotime('first day of last month'));
// $to_date   = isset($_GET['to']) ? $_GET['to'] : date('Y-m-t', strtotime('last day of last month'));
$to_date   = isset($_GET['to']) ? $_GET['to'] : date('Y-m-t');
?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Trial Balance</h4>
        </div>

        <div class="card">
            <div class="card-block">
                <form method="get" class="form-inline mb-3">
                    <label class="mr-2">From:</label>
                    <input type="date" name="from" class="form-control mr-3" value="<?= $from_date ?>" required>
                    <label class="mr-2">To:</label>
                     <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
                                        echo "<input type='hidden' name='module' value='report'>";  }?>
                    <input type="date" name="to" class="form-control mr-3" value="<?= $to_date ?>" required>
                    <button type="submit" class="btn btn-primary">Filter</button>
                                      <button type='button' id="exportButton" filename='TRIAL_BALANCE.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
                </form>

                <hr>

                <div class="table-responsive">
                    <table id='example' class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Account</th><th>Group</th>
                                <th class="text-right">Debit</th>
                                <th class="text-right">Credit</th>
                            </tr>
                        </thead>
                        <tbody>
<?php
$total_debit = 0;
$total_credit = 0;
$net_profit_bf = 0;
$vat_payable = 0;

// --- VAT Payable Calculation ---
$vat_result = mysqli_fetch_assoc(mysqli_query($con, "
    SELECT SUM(credit_vat) AS credit_vat, SUM(debit_vat) AS debit_vat
    FROM acc_transaction 
    WHERE t_date < '$to_date' AND location_id = '$location_id'
"));
$vat_txn = floatval($vat_result['credit_vat']) - floatval($vat_result['debit_vat']);

// Less: Amount already paid in VAT Payable ledger (ca_id = 47)
$vat_paid = mysqli_fetch_assoc(mysqli_query($con, "
    SELECT SUM(debit)  AS paid 
    FROM acc_transaction 
    WHERE ca_id = 47 AND t_date < '$to_date' AND location_id = '$location_id'
"));
$vat_paid_amt = floatval($vat_paid['paid']);

$vat_payable_tb = $vat_txn - $vat_paid_amt;
$vat_payable_tb = round($vat_payable_tb, 2);
$vat_payable = $vat_txn ;

$vat_payable = round($vat_payable, 2); // Round to 2 decimal places

// Start Loop
$accounts = mysqli_query($con, "
    SELECT ca_id, ca_name, ca_type ,ca_group
    FROM acc_chart_of_accounts 
    WHERE status = 1 
    ORDER BY ca_type, ca_name
");

while ($acc = mysqli_fetch_assoc($accounts)) {
    $ca_id = $acc['ca_id'];
    if ($ca_id == 47) continue; // Skip VAT Payable ledger from normal display

    $ca_name = $acc['ca_name'];
    $ca_type = $acc['ca_type'];
    $ca_group = $acc['ca_group'];

    if (in_array($ca_type, ['Assets', 'Liabilities', 'Equity'])) {
        $res = mysqli_fetch_assoc(mysqli_query($con, "
            SELECT SUM(debit) AS debit, SUM(credit) AS credit 
            FROM acc_transaction 
            WHERE ca_id = '$ca_id' AND t_date <= '$to_date' and location_id ='$location_id'
        "));
        $debit = floatval($res['debit']);
        $credit = floatval($res['credit']);
        $net = $debit - $credit;

        $has_txn = mysqli_fetch_assoc(mysqli_query($con, "
            SELECT COUNT(*) AS count 
            FROM acc_transaction 
            WHERE ca_id = '$ca_id' AND t_date <= '$to_date' and location_id ='$location_id'
        "))['count'];

        if ($has_txn == 0) continue;

        if ($net > 0) {
            $total_debit += $net;
            echo "<tr><td>$ca_name</td><td>$ca_group</td><td class='text-right'>" . number_format($net, 2) . "</td><td></td></tr>";
        } elseif ($net < 0) {
            $total_credit += abs($net);
            echo "<tr><td>$ca_name</td><td>$ca_group</td><td></td><td class='text-right'>" . number_format(abs($net), 2) . "</td></tr>";
        } else {
            echo "<tr><td>$ca_name</td><td>$ca_group</td><td></td><td></td></tr>";
        }

    } elseif (in_array($ca_type, ['Income', 'Expenses'])) {
        // Calculate B/F Profit
        $res_bf = mysqli_fetch_assoc(mysqli_query($con, "
            SELECT SUM(debit) AS debit, SUM(credit) AS credit 
            FROM acc_transaction 
            WHERE ca_id = '$ca_id' AND t_date < '$from_date' and location_id ='$location_id'
        "));
        $net_profit_bf += floatval($res_bf['credit']) - floatval($res_bf['debit']);

        // Show only this period’s activity for the P&L accounts
        $res_period = mysqli_fetch_assoc(mysqli_query($con, "
            SELECT SUM(debit) AS debit, SUM(credit) AS credit 
            FROM acc_transaction 
            WHERE ca_id = '$ca_id' AND t_date BETWEEN '$from_date' AND '$to_date' and location_id ='$location_id'
        "));
        $debit = floatval($res_period['debit']);
        $credit = floatval($res_period['credit']);

        if ($debit == 0 && $credit == 0) continue;

        if ($debit > $credit) {
            $total_debit += $debit - $credit;
            echo "<tr><td>$ca_name</td><td>$ca_group</td><td class='text-right'>" . number_format($debit - $credit, 2) . "</td><td></td></tr>";
        } else {
            $total_credit += $credit - $debit;
            echo "<tr><td>$ca_name</td><td>$ca_group</td><td></td><td class='text-right'>" . number_format($credit - $debit, 2) . "</td></tr>";
        }
    }
}

// Show VAT Payable if any
if ($vat_payable != 0.00) {
    $total_credit += $vat_payable_tb;
    echo "<tr class='table-warning'><td><strong>VAT Payable</strong></td><td>Current Liability</td><td></td><td class='text-right'>" . number_format($vat_payable_tb, 2) . "</td></tr>";
}

// Show Adjusted Net Profit B/F
$adjusted_profit_bf = $net_profit_bf - $vat_payable;
if (round($adjusted_profit_bf, 2) != 0.00) {
    if ($adjusted_profit_bf > 0) {
        $total_credit += $adjusted_profit_bf;
        echo "<tr class='table-info'><td><strong>Net Profit B/F</strong></td><td></td><td></td><td class='text-right'>" . number_format($adjusted_profit_bf, 2) . "</td></tr>";
    } else {
        $total_debit += abs($adjusted_profit_bf);
        echo "<tr class='table-info'><td><strong>Net Loss B/F</strong></td><td></td><td class='text-right'>" . number_format(abs($adjusted_profit_bf), 2) . "</td><td></td></tr>";
    }
}


?>
                    
                      
                            <tr style='background-color:#d3dace;'>
                                <td>x  Total</td><td></td>
                                <td align='right'><b><?= number_format($total_debit, 2) ?></b></td>
                                <td  align='right'><b><?= number_format($total_credit, 2) ?></b></td>
                            </tr>
                          </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
   $('#example').DataTable({
        "pageLength": 100
    });
});

    </script>
<?php include 'footer.php'; ?>
