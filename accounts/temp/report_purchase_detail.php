<?php include 'header.php'; ?>
<style>
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
 $from_date = date('Y-m-d', strtotime('-1 day')) . ' 00:00:00';
$to_date   = date('Y-m-d', strtotime('-1 day')) . ' 23:59:59';
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
                     From:
                     <input type="date" name="from_date" value="<?= isset($_REQUEST['from_date']) ? $_REQUEST['from_date'] : date('Y-m-d', strtotime('-1 day')) ?>" required>
                     To:
                     <input type="date" name="to_date" value="<?= isset($_REQUEST['to_date']) ? $_REQUEST['to_date'] : date('Y-m-d', strtotime('-1 day')) ?>" required>
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

                             <div align='right' style='position: relative; left: -50px;'> <h5>F 16 B</h5>
                           <h6 style='position: relative; left: -50px;'>
                               Date:
<?php 

$from_date_only = date('Y-m-d', strtotime($from_date));
$to_date_only = date('Y-m-d', strtotime($to_date));

if ($from_date_only === $to_date_only) {
    echo $date_show = date('d-m-Y', strtotime($from_date));
} else {
   echo $date_show = date('d-m-Y', strtotime($from_date)) . ' - ' . date('d-m-Y', strtotime($to_date));
}
?>
                           
                           </h6>
                          
                        </div>


                        </div>
  

                        <div>
                           <h6 style='position: relative; left: 50px;'>Details of Purchase</h6>
                        </div>


                        

 <table class="table table-bordered table-striped" style="width:100%">
    <thead>
        <tr  >
            <th class="text-center">SN</th>
            <th class="text-center">Invoice Number</th>
            <th class="text-center">Item Name</th>
            <th class="text-center">Quantity</th>
            <th class="text-center">Purchase Price</th>
            <th class="text-center">Purchase Value</th>
            <th class="text-center">Sales Price</th>
            <th class="text-center">Sales Value</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        $total_purchase_value = 0;
        $total_sales_value = 0;

        // 1. FUEL PURCHASES
        $query1 = "
            SELECT 
                f.Invoice_no AS invoice_no,
                p.p_name AS item_name,
                fpm.quantity,
                fpm.purchase_price,
                fpm.total_invoice AS purchase_value,
                fpm.rate AS sales_price,
                fpm.rate * fpm.quantity AS sales_value
            FROM fuel_purchase_master f
            INNER JOIN fuel_purchase_master fpm ON f.pur_id = fpm.pur_id AND fpm.location_id = '$location_id'
            INNER JOIN product_master p ON fpm.p_id = p.p_id
            WHERE f.status = 1  
            AND f.purchase_date BETWEEN '$from_date' AND '$to_date'
        ";
        $result1 = mysqli_query($con, $query1);
        while ($row = mysqli_fetch_assoc($result1)) {
            $total_purchase_value += $row['purchase_value'];
            $total_sales_value += $row['sales_value'];
            ?>
            <tr>
                <td align='center'><?= $count++; ?></td>
                <td align='center'><?= $row['invoice_no']; ?></td>
                <td  ><?= $row['item_name']; ?></td>
                <td align='center'><?=format_qty($row['quantity']); ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['purchase_price'], 2); ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['purchase_value'], 2); ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['sales_price'], 2); ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['sales_value'], 2); ?></td>
            </tr>
        <?php
        }

        // 2. OIL STOCK (from GRN)
        $query2 = "
            SELECT 
                og.invoice_no AS invoice_no,
                p.p_name AS item_name,
                os.purchase_qty AS quantity,
                os.price AS purchase_price,
               (os.price * os.purchase_qty) AS purchase_value,
                os.sales_price,
                (os.sales_price * os.purchase_qty) AS sales_value
            FROM oil_stock os
            INNER JOIN product_master p ON os.s_id = p.p_id
            INNER JOIN oil_grn_master og ON og.grn_id = os.grn_id AND og.location='$location_id'
            WHERE os.grn_status = 1 AND STR_TO_DATE(og.grn_date, '%Y-%m-%d') BETWEEN '$from_date' AND '$to_date' 
        ";
        $result2 = mysqli_query($con, $query2);
        while ($row = mysqli_fetch_assoc($result2)) {
            $total_purchase_value += $row['purchase_value'];
            $total_sales_value += $row['sales_value'];
            ?>
            <tr>
                <td align='center'><?= $count++; ?></td>
                <td align='center'><?= $row['invoice_no']; ?></td>
                <td  ><?= $row['item_name']; ?></td>
                <td align='center'><?= format_qty($row['quantity']); ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['purchase_price'], 2); ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['purchase_value'], 2); ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['sales_price'], 2); ?></td>
                <td style="text-align:right; padding-right:5px;"><?= number_format($row['sales_value'], 2); ?></td>
            </tr>
        <?php
        }
        ?>
        <tr style="background-color:rgb(187, 190, 192);">
            <td align='center'>#</td>
            <td align='center'><b>Total</b></td>
            <td colspan='3'></td>
            <td style="text-align:right;"><b><?= number_format($total_purchase_value, 2); ?></b></td>
            <td></td>
            <td style="text-align:right;"><b><?= number_format($total_sales_value, 2); ?></b></td>
        </tr>
    </tbody>
</table>





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
                                            <td width =200px; style='height:60px;'>Checked By :</td>
                                             <td align='right'>______________________________</td>
                                              
                                          
                                       </table>
                              </div>



                                    </td>
                                    <td width='30%' >
                                    
                                 



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