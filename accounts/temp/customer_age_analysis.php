<?php
 if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }

$today = date('Y-m-d');
$customers = mysqli_query($con, "SELECT c_id, customer_name FROM mange_customer WHERE status = 1 AND c_id > 3 ORDER BY customer_name");

function get_due($con, $c_id, $days_start, $days_end = null) {
    $condition = $days_end 
        ? "DATEDIFF(CURDATE(), date_time) BETWEEN $days_start AND $days_end"
        : "DATEDIFF(CURDATE(), date_time) > $days_start";

    $fuel = mysqli_query($con, "SELECT SUM(total_sales - paid_amount) AS due FROM shed_credit_sales WHERE c_id = $c_id AND status = 1 AND (total_sales - paid_amount) > 0 AND $condition");
    $f_due = mysqli_fetch_assoc($fuel)['due'] ?? 0;

    $oil = mysqli_query($con, "SELECT SUM(issue_total - paid_amount) AS due FROM oil_sales_master WHERE to_location = $c_id AND issue_status = 1 AND (issue_total - paid_amount) > 0 AND DATEDIFF(CURDATE(), issue_date) " . ($days_end ? "BETWEEN $days_start AND $days_end" : "> $days_start"));
    $o_due = mysqli_fetch_assoc($oil)['due'] ?? 0;

    return floatval($f_due) + floatval($o_due);
}
?>

<style>
  @media print {
 
     

    .no-print {
      display: none !important;
    }
     .card {
    margin-top: -130px; /* Adjust the value as needed */
    margin-left: -8px; /* Adjust the value as needed */
        }
         body {
    zoom: 76%;  /* Optional: works in most browsers like Chrome */
  }
  
  }
  .no-scroll-on-print {
      overflow: hidden !important;
    }

     @media print {
    .print-only {
      display: block !important;
    }
  }

  @media screen {
    .print-only {
      display: none !important;
    }
  }
</style>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Customer Age Analysis Report</h4>
        </div>

        <div class="card ">
            <div class="card-block table-responsive">
                <div class='no-print'>
                          
                    <button type="button" class="btn btn-primary"  onclick="window.print()">Print</button>
                      <hr>
                    </div>
                    <div align='center'>
                        <h4><?=   $_SESSION['company']    ?></h4>
                        <h5>Customer Age Analysis</h5>
                    </div>
            
                <table id='example1' class="table table-bordered table-striped table-hover" id="age_analysis_table">
                    <thead  >
                        <tr>
                             <th>SN</th>
                            <th>Customer Name</th>
                            <th class="text-right" style="padding-right:5px;">0–30 Days</th>
                            <th class="text-right" style="padding-right:5px;">1–3 Months</th>
                            <th class="text-right" style="padding-right:5px;">3–6 Months</th>
                            <th class="text-right" style="padding-right:5px;">6–12 Months</th>
                            <th class="text-right" style="padding-right:5px;">Over 12 Months</th>
                            <th class="text-right" style="padding-right:5px;">Total Due</th>
                        </tr>
                    </thead>
                   <tbody>
    <?php
    $sn = 1;
    $grand_0_30 = $grand_1_3 = $grand_3_6 = $grand_6_12 = $grand_12 = $grand_total = 0;

    while ($row = mysqli_fetch_assoc($customers)) {
        $c_id = $row['c_id'];
        $b0_30 = get_due($con, $c_id, 0, 30);
        $b1_3  = get_due($con, $c_id, 31, 90);
        $b3_6  = get_due($con, $c_id, 91, 180);
        $b6_12 = get_due($con, $c_id, 181, 365);
        $b12   = get_due($con, $c_id, 365);

        $total = $b0_30 + $b1_3 + $b3_6 + $b6_12 + $b12;
        if ($total == 0) continue;

        // Accumulate totals
        $grand_0_30 += $b0_30;
        $grand_1_3  += $b1_3;
        $grand_3_6  += $b3_6;
        $grand_6_12 += $b6_12;
        $grand_12   += $b12;
        $grand_total += $total;
    ?>
    <tr>  <td><?= $sn++ ?></td>
        <td><?= htmlspecialchars($row['customer_name']) ?></td>
        <td class="text-right" style="padding-right:5px;"><?= number_format($b0_30, 2) ?></td>
        <td class="text-right" style="padding-right:5px;"><?= number_format($b1_3, 2) ?></td>
        <td class="text-right" style="padding-right:5px;"><?= number_format($b3_6, 2) ?></td>
        <td class="text-right" style="padding-right:5px;"><?= number_format($b6_12, 2) ?></td>
        <td class="text-right" style="padding-right:5px;"><?= number_format($b12, 2) ?></td>
        <td class="text-right font-weight-bold"><?= number_format($total, 2) ?></td>
    </tr>
    <?php } ?>
        <tr>
            <td></td>
        <td class="text-center">Total</td>
        <td class="text-right font-weight-bold " style="padding-right:5px;"><?= number_format($grand_0_30, 2) ?></td>
        <td class="text-right font-weight-bold" style="padding-right:5px;"><?= number_format($grand_1_3, 2) ?></td>
        <td class="text-right font-weight-bold" style="padding-right:5px;"><?= number_format($grand_3_6, 2) ?></td>
        <td class="text-right font-weight-bold" style="padding-right:5px;"><?= number_format($grand_6_12, 2) ?></td>
        <td class="text-right font-weight-bold" style="padding-right:5px;"><?= number_format($grand_12, 2) ?></td>
        <td class="text-right font-weight-bold" style="padding-right:5px;"><?= number_format($grand_total, 2) ?></td>
    </tr>
</tbody>

 

                </table>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('#example').DataTable({
        "pageLength": 500
    });
});
</script>
<?php include 'footer.php'; ?>
