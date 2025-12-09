<?php  if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    } ?>

 
<?php
if (isset($_REQUEST['from_date'])) {
    $from_date = $_REQUEST['from_date'] . ' 00:00:00';
    $to_date   = $_REQUEST['to_date']   . ' 23:59:59';
} else {
    $from_date = date('Y-m-01') . ' 00:00:00';
    $to_date   = date('Y-m-t') . ' 23:59:59';
}
$total_output_vat='9876543.21';
?>



<style>

   
    @media print {
  .card {
    margin-top: -100px; /* Adjust the value as needed */
    margin-left: -220px; /* Adjust the value as needed */
  }
}

  @media print {
      
          @page {
    size: landscape;
    margin: 10mm; /* Optional: adjust as needed */
  }
  
       .card {
    margin-top: -100px; /* Adjust the value as needed */
    margin-left: -8px; /* Adjust the value as needed */
        }
        
           body {
    zoom: 86%;  /* Optional: works in most browsers like Chrome */
  }
  
  
    .no-print {
      display: none !important;
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

      <div class="row  no-print">
         <div class="col-sm-12">
            <div class="main-header">
               <h4>VAT Report / <?= $client_name ?></h4>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-12">
            <div class="card">
               <div class="card-header no-print" align="right">
                  <form method="GET">
                      <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
                                        echo "<input type='hidden' name='module' value='report'>";  }?>
                     From:
                     <input type="date" name="from_date" value="<?= isset($_REQUEST['from_date']) ? $_REQUEST['from_date'] : date('Y-m-01') ?>" required>
                     To:
                     <input type="date" name="to_date" value="<?= isset($_REQUEST['to_date']) ? $_REQUEST['to_date'] : date('Y-m-t') ?>" required>
                     <button type="submit" class="btn btn-success">Search</button>
                     <!-- <button type="button" id="exportButton" filename="VAT_Report.xlsx" class="btn btn-primary">
                        <i class="ti-cloud-down"></i> Export
                     </button> -->

                  <button type="button" class="btn btn-primary"  onclick="window.print()">Print</button>

                     
                  </form>
               </div>

               <div class="card-block">
                  <div class="row">

                  

                  <div class="col-sm-12 table-responsive no-scroll-on-print">

                        <div align='center'>
                           <h4>
                              <?php echo $_SESSION['company']; ?> <br>
                              <?php echo $client_name." - ".$reg_no; ?>
                           </h4>
                           
                        </div>
                        <div>
                           <h6 style='position: relative; left: 50px;'>INPUT VAT SCHEDULE</h6>
                        </div>


                        

                        <table  class="table table-bordered table-striped" width='100%' style="width:100%">
                           <thead>
                              <tr style="background-color:rgb(187, 190, 192);" >
                                 <th>SN</th>
                                 <th>Date</th>
                                 <th>Invoice Number</th>
                                 
                                 <th>Distribution</th>
                                 <th>Sales Value</th>
                                 <th>Sales VAT</th>

                                 <th>Purchase Value</th>
                                 <th>Purchase VAT</th>
                                  <th>Net VAT</th>
                              </tr>
                           </thead>
                         <tbody>
<?php
$count = 1;
$grand_sales_value = 0;
$grand_sales_vat = 0;
$grand_purchase_value = 0;
$grand_purchase_vat = 0;
$grand_net_vat = 0;

$data = [];

$query = "
   SELECT 
      f.rate,
      f.purchase_date,
      f.Invoice_no,
      s.tin_no,
      s.supplier_name,
      p.p_name,
      fpm.quantity,
      fpm.purchase_price,
      fpm.vat_amount,
      fpm.total_invoice,
      (fpm.total_invoice - fpm.vat_amount) AS gross_vat
   FROM fuel_purchase_master f
   INNER JOIN manage_supplier s ON s.sup_id = f.supplier_id
   INNER JOIN fuel_purchase_master fpm ON fpm.pur_id = f.pur_id
   INNER JOIN product_master p ON p.p_id = fpm.p_id
   WHERE f.purchase_date BETWEEN '$from_date' AND '$to_date' and f.location_id = '$location_id' AND fpm.vat_amount >0 AND f.status = 1
   ORDER BY p.p_id, f.purchase_date 
";
$result = mysqli_query($con, $query);

// Organize data by distribution (p_name)
while ($row = mysqli_fetch_assoc($result)) {
    $p_name = $row['p_name'];
    $line_sales_value = $row['rate'] * $row['quantity'];
    $vat_rate = 18;
    $sales_vat = $line_sales_value / (100 + $vat_rate) * $vat_rate;
    $net_vat = $sales_vat - $row['vat_amount'];

    $data[$p_name][] = [
        'purchase_date' => $row['purchase_date'],
        'Invoice_no' => $row['Invoice_no'],
        'sales_value' => $line_sales_value,
        'sales_vat' => $sales_vat,
        'purchase_value' => $row['total_invoice'],
        'purchase_vat' => $row['vat_amount'],
        'net_vat' => $net_vat
    ];
}

// Display grouped rows with subtotals
foreach ($data as $p_name => $rows) {
    $subtotal_sales_value = 0;
    $subtotal_sales_vat = 0;
    $subtotal_purchase_value = 0;
    $subtotal_purchase_vat = 0;
    $subtotal_net_vat = 0;

    echo "<tr style='background-color:#e8e8e8;'><td colspan='9'><b>Item: $p_name</b></td></tr>";

    foreach ($rows as $row) {
        echo "<tr>
            <td align='center'>" . $count++ . "</td>
            <td align='center'>" . date('Y-m-d', strtotime($row['purchase_date'])) . "</td>
            <td align='center'>" . $row['Invoice_no'] . "</td>
            <td align='center'>" . $p_name . "</td>
            <td style='text-align:right;'>" . number_format($row['sales_value'], 2) . "</td>
            <td style='text-align:right;'>" . number_format($row['sales_vat'], 2) . "</td>
            <td style='text-align:right;'>" . number_format($row['purchase_value'], 2) . "</td>
            <td style='text-align:right;'>" . number_format($row['purchase_vat'], 2) . "</td>
            <td style='text-align:right;'>" . number_format($row['net_vat'], 2) . "</td>
        </tr>";

        // Subtotals for current group
        $subtotal_sales_value += $row['sales_value'];
        $subtotal_sales_vat += $row['sales_vat'];
        $subtotal_purchase_value += $row['purchase_value'];
        $subtotal_purchase_vat += $row['purchase_vat'];
        $subtotal_net_vat += $row['net_vat'];

        // Grand totals
        $grand_sales_value += $row['sales_value'];
        $grand_sales_vat += $row['sales_vat'];
        $grand_purchase_value += $row['purchase_value'];
        $grand_purchase_vat += $row['purchase_vat'];
        $grand_net_vat += $row['net_vat'];
    }

    // Print subtotal row
    echo "<tr style='background-color:#d0d0d0; font-weight:bold;'>
        <td colspan='4' align='right'>Subtotal:</td>
        <td style='text-align:right;'>" . number_format($subtotal_sales_value, 2) . "</td>
        <td style='text-align:right;'>" . number_format($subtotal_sales_vat, 2) . "</td>
        <td style='text-align:right;'>" . number_format($subtotal_purchase_value, 2) . "</td>
        <td style='text-align:right;'>" . number_format($subtotal_purchase_vat, 2) . "</td>
        <td style='text-align:right;'>" . number_format($subtotal_net_vat, 2) . "</td>
    </tr>";
}

// Final grand total
echo "<tr style='background-color:rgb(187, 190, 192); font-weight:bold;'>
    <td colspan='4' align='right'>Grand Total:</td>
    <td style='text-align:right;'>" . number_format($grand_sales_value, 2) . "</td>
    <td style='text-align:right;'>" . number_format($grand_sales_vat, 2) . "</td>
    <td style='text-align:right;'>" . number_format($grand_purchase_value, 2) . "</td>
    <td style='text-align:right;'>" . number_format($grand_purchase_vat, 2) . "</td>
    <td style='text-align:right;'>" . number_format($grand_net_vat, 2) . "</td>
</tr>";
?>
</tbody>

                        </table>
                              

                                   
                                 



                                    </td>
                                 </td>
                              </table>




                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

   </div>
</div>

 
    


<?php include 'footer.php'; ?>

  