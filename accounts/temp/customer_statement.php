<?php
 if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }

// Fetch customer list
$customers = mysqli_query($con, "SELECT c_id, customer_name FROM mange_customer WHERE status = 1 AND c_id > 0 ORDER BY customer_name");

$c_id = isset($_GET['c_id']) ? intval($_GET['c_id']) : 0;
$from_date = $_GET['from'] ?? date('Y-m-01');
$to_date = $_GET['to'] ?? date('Y-m-d');

$customer = $c_id ? mysqli_fetch_assoc(mysqli_query($con, "SELECT customer_name, customer_address FROM mange_customer WHERE c_id = $c_id")) : ['customer_name' => '', 'customer_address' => ''];
$letter_head = mysqli_fetch_assoc(mysqli_query($con, "SELECT * FROM letter_head"));
?>

<style>
  @media print {
 
     

    .no-print {
      display: none !important;
    }
     .card {
    margin-top: -100px; /* Adjust the value as needed */
    margin-left: -8px; /* Adjust the value as needed */
        }
         body {
    zoom: 96%;  /* Optional: works in most browsers like Chrome */
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
        <div class="main-header"><h4>Outstanding Customer Statement</h4></div>

        <div class="card">
            <div class="card-block">
                <form method="get" class="form-inline mb-3">
                    <label class="mr-2">Customer:</label>
                    <select   name="c_id" class="form-control select2 mr-3" required style="max-width: 450px; importrnt;">
                        <option value="">-- Select Customer --</option>
                        <?php while ($row = mysqli_fetch_assoc($customers)) { ?>
                            <option value="<?= $row['c_id'] ?>" <?= $c_id == $row['c_id'] ? 'selected' : '' ?>>
                                <?= htmlspecialchars($row['customer_name']) ?>
                            </option>
                        <?php } ?>
                    </select>
                    <label class="mr-2">Show OpeningBalance:</label>
                    <input type="checkbox" name="op" 
                    <?php 
                    if($_REQUEST['op'] == 1) { echo "checked"; }
                    ?> class="form-control mr-2" value="1"  > ---
                    
                    
                    <label class="mr-2">From:</label>
                    <input type="date" name="from" class="form-control mr-2" value="<?= $from_date ?>" required>
                    <label class="mr-2">To:</label>
                      <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
                                        echo "<input type='hidden' name='module' value='report'>";  }?>
                    <input type="date" name="to" class="form-control mr-2" value="<?= $to_date ?>" required>
                    <button type="submit" class="btn btn-primary">Generate</button>
                      <button onclick="printDiv('print_area')" class="btn btn-primary">
        <i class="fa fa-print"></i> Print Statement
    </button><hr>
                </form>

<?php if ($c_id): ?>
<div id="print_area">
    <div class="text-center mb-3">
        <h4 class="mb-1"><?= $letter_head['entity'] ?></h4>
        <!--<h4 class="mb-1">(<?= $letter_head['reg_no'] ?>)</h4>-->
        <h4 class="mb-1"><?php if($_REQUEST['op'] == 1) { echo "Outstanding "; } ?>Customer Statement <?php echo $_REQUEST['from']."~".$_REQUEST['to'];  ?> </h4>
    </div>

 

    <div class="table-responsive">
        <table class="table table-bordered data-table">
            <thead class="thead-light">       <tr>
            <th colspan='3' style="width: 25%;">Statement Date Range:</th>
            <td colspan='2'><?php echo $_REQUEST['from']."~".$_REQUEST['to'];  ?>  </td>
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
                    <th style="width: 20%;">Date</th>
                    <th style="width: 20%;">Invoice No</th>
                    <th style="width: 20%;">Order No</th>
                    <th style="width: 20%;">Vehicle</th>
                    <th style="width: 20%;" class="text-right">Amount (Rs.)</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $total = 0;
                $bf = 0;

                // B/F from Fuel
                $fuel_bf = mysqli_query($con, "SELECT (total_sales - paid_amount) AS due FROM shed_credit_sales WHERE c_id = $c_id AND status = 1 AND DATE(date_time) < '$from_date' AND (total_sales - paid_amount) > 0");
                while ($r = mysqli_fetch_assoc($fuel_bf)) {
                    $bf += $r['due'];
                }

                // B/F from Oil
                $oil_bf = mysqli_query($con, "SELECT (issue_total - paid_amount) AS due FROM oil_sales_master WHERE to_location = $c_id AND issue_status = 1 AND DATE(issue_date) < '$from_date' AND (issue_total - paid_amount) > 0");
                while ($r = mysqli_fetch_assoc($oil_bf)) {
                    $bf += $r['due'];
                }
                
                
             

                if ($bf > 0 && $_REQUEST['op'] == 1) {
                    echo "<tr>
                        <td colspan='4'><strong>Brought Forward Balance</strong></td>
                        <td class='text-right'><strong>" . number_format($bf, 2) . "</strong></td>
                    </tr>";
                    $total += $bf;
                }

                // Invoices within date range
                $fuel_sql = "SELECT date_time AS date, invoice_no, ref_no, vehicle_no, (total_sales - paid_amount) AS due
                             FROM shed_credit_sales 
                             WHERE c_id = $c_id AND status = 1 AND DATE(date_time) BETWEEN '$from_date' AND '$to_date' AND (total_sales - paid_amount) > 0 ORDER BY date_time"  ;
                $fuel_res = mysqli_query($con, $fuel_sql);
                while ($f = mysqli_fetch_assoc($fuel_res)) {
                    $total += $f['due'];
                    echo "<tr>
                        <td>" . date('Y-m-d', strtotime($f['date'])) . "</td>
                        <td>{$f['invoice_no']}</td>
                        <td>{$f['ref_no']}</td>
                        <td>{$f['vehicle_no']}</td>
                        <td class='text-right'>" . number_format($f['due'], 2) . "</td>
                    </tr>";
                }

                $oil_sql = "SELECT issue_date AS date, invoice_no, (issue_total - paid_amount) AS due
                            FROM oil_sales_master 
                            WHERE to_location = $c_id AND issue_status = 1 AND DATE(issue_date) BETWEEN '$from_date' AND '$to_date' AND (issue_total - paid_amount) > 0";
                $oil_res = mysqli_query($con, $oil_sql);
                while ($o = mysqli_fetch_assoc($oil_res)) {
                    $total += $o['due'];
                    echo "<tr>
                        <td>" . date('Y-m-d', strtotime($o['date'])) . "</td>
                        <td>{$o['invoice_no']}</td>
                        <td>-</td>
                        <td>Oil</td>
                        <td class='text-right'>" . number_format($o['due'], 2) . "</td>
                    </tr>";
                }
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="4" class="text-right">Total </th>
                    <th class="text-right"><?= number_format($total, 2) ?></th>
                </tr>
            </tfoot>
        </table>
    </div>

    <p class="text-danger font-weight-bold mt-3">
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

<!-- <div class="text-center mt-4">
    <button onclick="printDiv('print_area')" class="btn btn-secondary">
        <i class="fa fa-print"></i> Print Statement
    </button>
</div> -->
<?php endif; ?>
</div>
</div>

<script>
  $(document).ready(function() {
    $('.select2').select2({
      placeholder: "-- Select Customer --",
      allowClear: true,
      width: 'resolve'
    });
  });
</script>
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
