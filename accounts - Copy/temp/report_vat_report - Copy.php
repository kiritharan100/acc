<?php include 'header.php'; ?>

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




<div class="content-wrapper">
   <div class="container-fluid">

      <div class="row">
         <div class="col-sm-12">
            <div class="main-header">
               <h4>VAT Report / <?= $client_name ?></h4>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-12">
            <div class="card">
               <div class="card-header" align="right">
                  <form method="GET">
                     From:
                     <input type="date" name="from_date" value="<?= isset($_REQUEST['from_date']) ? $_REQUEST['from_date'] : date('Y-m-01') ?>" required>
                     To:
                     <input type="date" name="to_date" value="<?= isset($_REQUEST['to_date']) ? $_REQUEST['to_date'] : date('Y-m-t') ?>" required>
                     <button type="submit" class="btn btn-success">Search</button>
                     <button type="button" id="exportButton" filename="VAT_Report.xlsx" class="btn btn-primary">
                        <i class="ti-cloud-down"></i> Export
                     </button>

                  <button type="button" class="btn btn-primary" id="printButton">Print</button>

                     
                  </form>
               </div>

               <div class="card-block">
                  <div class="row">

                  






                  <div class="col-sm-12 table-responsive">

                        <div align='center'>
                           <h4>
                              <?php echo $_SESSION['company']; ?> <br>
                              <?php echo $client_name." - ".$reg_no; ?>
                           </h4>
                        </div>
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
                                 WHERE f.purchase_date BETWEEN '$from_date' AND '$to_date'
                                 ORDER BY f.purchase_date 
                              ";
                              $result = mysqli_query($con, $query);
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
                                 <td style="text-align:right;"><?= number_format($row['gross_vat'], 2); ?></td>
                                 <td style="text-align:right;"><?= number_format($row['vat_amount'], 2); ?></td>
                                 <td style="text-align:right;"><?= number_format($row['total_invoice'], 2); ?></td>
                              </tr>
                              <?php } ?>
                              <tr style="background-color:rgb(187, 190, 192);">
                                 <td align='center'> x</td>
                                 <td align='center'><b>Total</b></td>
                                 <td align='center'> </td>
                                 <td align='center'> </td>
                                 <td align='center'> </td>
                                 <td align='center'> </td>
                                 <td style="text-align:right;"><b><?= number_format($total_gross_sales_input, 2); ?></b></td>
                                 <td style="text-align:right;"><b><?= number_format($total_input_vat, 2); ?></b></td>
                                 <td style="text-align:right;"><b><?= number_format($total_net_input, 2); ?></b></td>
                              </tr>
                           </tbody>
                        </table>
                              <table width='100%'>
                                 <tr>
                                    <td width='50%' >
                                    </td>
                                    <td width='50%' >
                                       <table>
                                           <tr>
                                             <td width =200px;>Total Input VAT (Sales)</td>
                                             <td align='right'><?= number_format($total_output_vat, 2); ?> </td>
                                          </tr>
                                          <tr>
                                             <td width =200px;>Total Input VAT (Purchase)</td>
                                             <td  align='right' ><?= number_format($total_input_vat, 2); ?> </td>
                                          </tr>
                                            <tr>
                                             <td width =200px; >VAT Payable </td>
                                             <td  align='right'style='border-top: 2px solid black;' ><?= number_format(($total_output_vat-$total_input_vat), 2); ?> </td>
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


 <script>
document.getElementById('printButton').addEventListener('click', function () {
    // Clone only the table area
    var tableHTML = document.querySelector('.table-responsive').innerHTML;

    // Open custom print window
    var printWindow = window.open('', '', 'height=700,width=1000');
    printWindow.document.write('<html><head><title>VAT Report</title>');

    // Add custom styles
    printWindow.document.write(`
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                zoom: 0.9; /* Works in most modern browsers */
            }

            table {
                width: 100%;
                border-collapse: collapse;
                font-size: 11px;
            }

            th, td {
               
                padding: 2px 4px;
                height: 12px;
                text-align: center;
            }

            h4, h6 {
                
                margin: 5px 0;
            }

            @media print {
                @page {
                    margin: 10px;
                    size: A4 landscape;
                }
                body {
                    margin: 20px;
                }
            }
        </style>
    `);

    printWindow.document.write('</head><body>');

     
   //  printWindow.document.write(`
   //      <h4>${document.querySelector("h4").innerText}</h4>
   //      <h6>INPUT VAT SCHEDULE</h6>
   //  `);

    printWindow.document.write('<div class="table-responsive">' + tableHTML + '</div>');
    printWindow.document.write('</body></html>');
    printWindow.document.close();

    printWindow.focus();

    // Print after load
    printWindow.onload = function () {
        printWindow.print();
        printWindow.close();
    };
});
</script>
    


<?php include 'footer.php'; ?>

 <script>
   
  $('#example').dataTable( {
"pageLength": 50
} );
</script>