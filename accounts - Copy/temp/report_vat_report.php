<?php if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    } ?>
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
<?php
if (isset($_REQUEST['from_date'])) {
    $from_date = $_REQUEST['from_date'] . ' 00:00:00';
    $to_date   = $_REQUEST['to_date']   . ' 23:59:59';
} else {
    $from_date = date('Y-m-01') . ' 00:00:00';
    $to_date   = date('Y-m-t') . ' 23:59:59';
}
$total_output_vat= 0;
?>




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
                           <h6 style='position: relative; left: 50px;'>OUT VAT SCHEDULE</h6>
                        </div>


                        <?php
$count = 2;
$total_gross_total = 0;
$total_vat = 0;
$total_invoice = 0;

// Get sales_vat total from shed_operator_shift
$vat_q = mysqli_query($con, "SELECT SUM(sales_vat) as total_sales_vat FROM shed_operator_shift 
                             WHERE end_time BETWEEN '$from_date' AND '$to_date' AND location_id = '$location_id' AND status = 1");
$vat_data = mysqli_fetch_assoc($vat_q);
$total_sales_vat = floatval($vat_data['total_sales_vat']);

// Prepare original invoice list
$invoice_rows = [];
$query = "SELECT * FROM `vat_sales_master` 
          WHERE issue_date BETWEEN '$from_date' AND '$to_date' AND Location ='$location_id' and issue_status = 1  
          ORDER BY issue_date";
$result = mysqli_query($con, $query);

while ($row = mysqli_fetch_assoc($result)) {
    $vat_rate = $row['vat_rate'];
    $gross_sales = $row['issue_total'] / (100 + $vat_rate) * 100;
    $vat_sales = $row['issue_total'] / (100 + $vat_rate) * $vat_rate;

    $total_gross_total += $gross_sales;
    $total_vat += $vat_sales;
    $total_invoice += $row['issue_total'];

    $invoice_rows[] = [
        'date' => date('Y-m-d', strtotime($row['issue_date'])),
        'invoice_no' => $row['invoice_no'],
        'tin' => '100902885-7000',
        'name' => $row['to_location'],
        'distribution' => 'Fuel',
        'gross' => $gross_sales,
        'vat' => $vat_sales,
        'total' => $row['issue_total']
    ];
}

// Calculate Bulk VAT
$bulk_vat = $total_sales_vat - $total_vat;
$bulk_gross = $bulk_vat / 18 * 100;
$bulk_total = $bulk_vat / 18 * 118;
$month_number = date('m', strtotime($to_date));
$month_end = date('Y-m-t', strtotime($to_date));
?>

<table class="table table-bordered table-striped" style="width:100%">
    <thead>
        <tr>
            <th>SN</th>
            <th>Date</th>
            <th>Invoice Number</th>
            <th>TIN Number</th>
            <th>Name of the Purchaser</th>
            <th>Distribution</th>
            <th>Amount</th>
            <th>VAT</th>
            <th>With VAT</th>
        </tr>
    </thead>
    <tbody>
        <!-- First row: Bulk VAT -->
        <tr>
            <td align='center'>1</td>
            <td align='center'><?= $month_end ?></td>
            <td align='center'><?= $month_number ?></td>
            <td align='center'>100902885</td>
            <td align='center'>Others</td>
            <td align='center'>Fuel</td>
            <td style="text-align:right; padding-right:5px;"><?= number_format($bulk_gross, 2) ?></td>
            <td style="text-align:right; padding-right:5px;"><?= number_format($bulk_vat, 2) ?></td>
            <td style="text-align:right; padding-right:5px;"><?= number_format($bulk_total, 2) ?></td>
        </tr>

        <!-- Original invoice rows -->
        <?php foreach ($invoice_rows as $row): ?>
            <tr>
                <td align='center'><?= $count++ ?></td>
                <td align='center'><?= $row['date'] ?></td>
                <td align='center'><?= $row['invoice_no'] ?></td>
                <td align='center'><?= str_replace('-7000', '', $row['tin']) ?></td>
                <td align='center'><?= $row['name'] ?></td>
                <td align='center'><?= $row['distribution'] ?></td>
                <td style="text-align:right;"><?= number_format($row['gross'], 2) ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['vat'], 2) ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['total'], 2) ?></td>
            </tr>
        <?php endforeach; ?>

        <!-- Total Row -->
        <tr style="background-color:rgb(187, 190, 192);">
            <td align='center'> x</td>
            <td align='center'><b>Total</b></td>
            <td align='center'></td>
            <td align='center'></td>
            <td align='center'></td>
            <td align='center'></td>
            <td style="text-align:right;"><b><?= number_format($bulk_gross + $total_gross_total, 2) ?></b></td>
            <td style="text-align:right; padding-right:5px;"><b><?= number_format($bulk_vat + $total_vat, 2) ?></b></td>
            <td style="text-align:right; padding-right:5px;"><b><?= number_format($bulk_total + $total_invoice, 2) ?></b></td>
        </tr>
    </tbody>
</table>



                        <!-- <table  class="table table-bordered table-striped" style="width:100%">
                           <thead>
                              <tr>
                                 <th>SN</th>
                                 <th>Date</th>
                                 <th>Invoice Number</th>
                                 <th>TIN Number</th>
                                 <th>Name of the Purchaser</th>
                                 <th>Distribution</th>
                                 <th>Amount</th>
                                 <th>VAT</th>
                                 <th>With VAT</th>
                              </tr>
                           </thead>
                           <tbody>
                              <?php
                              $count = 1;
                               $total_gross_total = 0;
                               $total_vat = 0;
                               $total_invoice = 0;
                              $query = "SELECT * FROM `vat_sales_master` 
                                 WHERE issue_date BETWEEN '$from_date' AND '$to_date' AND Location ='$location_id' and issue_status = 1  
                                 ORDER BY issue_date
                              ";
                              $result = mysqli_query($con, $query);
                              while ($row = mysqli_fetch_assoc($result)) {
                                 $vat_rate = $row['vat_rate'];
                                $total_gross_total += $gross_sales = $row['issue_total']/(100+$vat_rate)*100;
                               $total_vat +=  $vat_sales = $row['issue_total']/(100+$vat_rate)*$vat_rate;
                               $total_invoice += $row['issue_total'];

                                 // $total_gross_sales_input  += $row['gross_vat'];
                                 // $total_input_vat  += $row['vat_amount'];
                                 // $total_net_input  += $row['total_invoice'];
                                 
                              ?>
                              <tr>
                                 <td align='center'><?= $count++; ?></td>
                                 <td align='center'><?= date('Y-m-d', strtotime($row['issue_date'])); ?></td>
                                 <td align='center'><?= $row['invoice_no']; ?></td>
                                 <td align='center'> 100902885-7000</td>
                                 <td align='center'><?= $row['to_location']; ?></td>
                                 <td align='center'> Fuel</td>
                           
                                 <td style="text-align:right;"><?= number_format($gross_sales, 2); ?></td>
                                 <td style="text-align:right;"><?= number_format($vat_sales, 2); ?></td>
                                 <td style="text-align:right;"><?= number_format($row['issue_total'], 2); ?></td>
                              </tr>
                              <?php } ?>
                              <tr style="background-color:rgb(187, 190, 192);">
                                 <td align='center'> x</td>
                                 <td align='center'><b>Total</b></td>
                                 <td align='center'> </td>
                                 <td align='center'> </td>
                                 <td align='center'> </td>
                                 <td align='center'> </td>
                                 <td style="text-align:right;"><b><?= number_format($total_gross_total, 2); ?></b></td>
                                 <td style="text-align:right;"><b><?= number_format($total_vat, 2); $total_output_vat = $total_vat; ?></b></td>
                                 <td style="text-align:right;"><b><?= number_format($total_invoice, 2); ?></b></td>
                              </tr>
                           </tbody>
                        </table> -->













                        <div>
                           <h6 style='position: relative; left: 50px;'>INPUT VAT SCHEDULE</h6>
                        </div>


                        

                        <table  class="table table-bordered table-striped" style="width:100%">
                           <thead>
                              <tr>
                                 <th>SN</th>
                                 <th>Date</th>
                                 <th>Invoice Number</th>
                                 <th>TIN Number</th>
                                 <th>Name of the Supplier</th>
                                 <th>Distribution</th>
                                 <th>Amount</th>
                                 <th>VAT</th>
                                 <th>With VAT</th>
                              </tr>
                           </thead>
                           <tbody>
                              <?php
                              $count = 1;
                              $total_input_vat=0;
                              $total_gross_sales_input=0;
                              $total_net_input=0;
                              $query = "
                                 SELECT 
                                    f.purchase_date,
                                    f.Invoice_no,
                                    s.tin_no,
                                    s.supplier_name,
                                    p.p_name,
                                    fpm.quantity,
                                    fpm.purchase_price,
                                    fpm.vat_amount,fpm.total_invoice,
                                    (fpm.total_invoice - fpm.vat_amount) AS gross_vat
                                 FROM fuel_purchase_master f
                                 INNER JOIN manage_supplier s ON s.sup_id = f.supplier_id
                                 INNER JOIN fuel_purchase_master fpm ON fpm.pur_id = f.pur_id
                                 INNER JOIN product_master p ON p.p_id = fpm.p_id
                                 WHERE f.purchase_date BETWEEN '$from_date' AND '$to_date' AND f.location_id ='$location_id' and f.status = 1 and f.day_end <> 0 AND fpm.vat_amount >0
                                 ORDER BY f.purchase_date 
                              ";
                              $result = mysqli_query($con, $query);
                              if (!$result) {
    die("Query Failed: " . mysqli_error($conn)); // Show the error and stop execution
}
                              while ($row = mysqli_fetch_assoc($result)) {

                                 $total_gross_sales_input  += $row['gross_vat'];
                                 $total_input_vat  += $row['vat_amount'];
                                 $total_net_input  += $row['total_invoice'];
                                 
                              ?>
                              <tr>
                                 <td align='center'><?= $count++; ?></td>
                                 <td align='center'><?= date('Y-m-d', strtotime($row['purchase_date'])); ?></td>
                                 <td align='center'><?= $row['Invoice_no']; ?></td>
                                 <td align='center'><?= $row['tin_no']; ?></td>
                                 <td align='center'><?= $row['supplier_name']; ?></td>
                                 <td align='center'><?= $row['p_name']; ?></td>
                                 <td style="text-align:right; padding-right:5px;"><?= number_format($row['gross_vat'], 2); ?></td>
                                 <td style="text-align:right; padding-right:5px;"><?= number_format($row['vat_amount'], 2); ?></td>
                                 <td style="text-align:right; padding-right:5px;"><?= number_format($row['total_invoice'], 2); ?></td>
                              </tr>
                              <?php } ?>
                              <tr style="background-color:rgb(187, 190, 192);">
                                 <td align='center'> x</td>
                                 <td align='center'><b>Total</b></td>
                                 <td align='center'> </td>
                                 <td align='center'> </td>
                                 <td align='center'> </td>
                                 <td align='center'> </td>
                                 <td style="text-align:right; padding-right:5px;"><b><?= number_format($total_gross_sales_input, 2); ?></b></td>
                                 <td style="text-align:right; padding-right:5px;"><b><?= number_format($total_input_vat, 2); ?></b></td>
                                 <td style="text-align:right; padding-right:5px;"><b><?= number_format($total_net_input, 2); ?></b></td>
                              </tr>
                           </tbody>
                        </table>
                              <table width='100%'>
                                 <tr>
                                    <td width='70%' >


                                     <div class="print-only">
                                          <table>
                                          
                                           <tr>
                                             <td width =200px;>Prepared By :</td>
                                             <td align='right'>______________________________</td>
                                          </tr>
                                          <tr>
                                            <td width =200px;>Checked By :</td>
                                             <td align='right'>______________________________</td>
                                              
                                          </tr>
                                            <tr>
                                               <td width =200px;>Internal Auditor :</td>
                                             <td align='right'>______________________________</td>
                                          </tr>

                                          <tr>
                                               <td width =200px;>Accountant :</td>
                                             <td align='right'>______________________________</td>
                                          </tr>
                                       </table>
                              </div>



                                    </td>
                                    <td width='30%' >
                                       <table>
                                           <tr>
                                             <td width =200px;>Total Input VAT (Sales)</td>
                                             <td align='right'><?= number_format($total_output_vat+$bulk_vat, 2); ?> </td>
                                          </tr>
                                          <tr>
                                             <td width =200px;>Total Input VAT (Purchase)</td>
                                             <td  align='right' ><?= number_format($total_input_vat, 2); ?> </td>
                                          </tr>
                                            <tr>
 <?php
$vat_balance = ($total_output_vat + $bulk_vat) - $total_input_vat;
?>
<td width="200px;">
    <?= $vat_balance < 0 ? 'VAT Receivable' : 'VAT Payable' ?>
</td>
<td align="right" style="border-top: 2px solid black;">
    <?= number_format(abs($vat_balance), 2); ?>
</td>
                                          </tr>
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

 <script>
   
  $('#example').dataTable( {
"pageLength": 50
} );
</script>