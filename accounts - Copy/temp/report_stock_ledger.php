<?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    } ?>
<?php
if(isset($_REQUEST['from_date'])){
   $from_date = $start_date = $_REQUEST['from_date'];
   $to_Date = $end_date = $_REQUEST['to_date'];
} else {
   $from_date = $start_date = date('Y-01-01',strtotime('-0 MONTH'));
   $to_Date= $end_date = date("Y-m-t");

}

$m_id = $_REQUEST['m_id'];
?>
 

 
<div class="content-wrapper" style='margin-top:0px;'>
   <!-- Container-fluid starts -->
   <div class="container-fluid">
      <!-- Header Starts -->
      <div class="row">
         <div class="col-sm-12 p-0">
            
            <div class="main-header">
               <h4> Stock Ledger</h4>
              
            </div>
         </div>
      </div>
      <!-- Header end -->

      <div class="row">
         <div class="col-sm-12">
 
            <div class="card">
               <div class="card-header"  >
                 
               <form>

               Medicine <select id="mySelect_search" name='m_id'   required  class="form-control input-sm" style="width: 300px;" >
                 <option value=''>Select</option>
              
                  <?php
                  $balance = 0;
				  if($client_language == 'Tamil'){ $order_by = "ORDER BY  m_tamil " ;} 
				  elseif($client_language == 'Sinhala'){ $order_by = "ORDER BY  m_sinhala " ;} else { $order_by = "ORDER BY  p_name " ;}
                     $sel_query="SELECT * from product_master where status = 1 and p_cat = 'Oil' ".$order_by;
                     $result = mysqli_query($con,$sel_query);
                     while($row = mysqli_fetch_assoc($result)) { 
                           echo "<option value='".$row['p_id']."'>  ";
		 
						   echo $row['p_name'];
						   echo "</option>"; 
                     }?>
                  </select> 

                From  <input type='date'  name='from_date' value='<?php echo $from_date; ?>' > to Date <input type='date' name='to_date' value='<?php echo $to_Date; ?>' > 
                 <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
                                        echo "<input type='hidden' name='module' value='report'>";  }?>
                  <button type='submit' class="btn btn-success"><i class="fa fa-search" style="font-size:15px;color:red"></i></button>


                  <!-- <a href="material_grn.php" class="btn btn-primary waves-effect" data-type="info"   > <i class="fa fa-plus" aria-hidden="true"></i>Add New GRN</a> -->

                  <button type='button' id="exportButton" filename='<?php echo "MEDICINE_STOCK_".$customer_name; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
                  </form>
               </div>


               <div class="card-block">
                  <div class="row">
                     <div class="col-sm-12 table-responsive">
                     <script>   $('#mySelect_search').val(<?php echo $m_id; ?>); </script> 
<?php 
  $to_Date =  $to_Date." 23:59:59";
  $end_date = $end_date." 23:59:59";
   $sql_movements = "
SELECT batch_date, CONCAT(source ,' : ' ,supplier_name) as type, purchase_qty as debit_qty,  NULL as credit_qty, price , (purchase_qty * price) as value,oil_stock.batch_id,oil_stock.exp_date
FROM oil_stock
LEFT JOIN manage_supplier ON manage_supplier.sup_id = oil_stock.supplier
WHERE s_id = '$m_id' AND batch_date BETWEEN '$start_date' AND '$end_date' AND grn_status = 1  AND oil_stock.store_id='$location_id' AND oil_stock.source <> 'PRN'



UNION ALL 

SELECT issue_date as batch_date, CONCAT('SALES : ',mange_customer.customer_name ) as type, NULL as debit_qty, issue_qty as credit_qty ,oil_stock.price, issue_qty * price as value,oil_stock.batch_id,oil_stock.exp_date
FROM oil_sales_detail 
INNER JOIN oil_sales_master ON oil_sales_detail .iss_id = oil_sales_master.iss_id  AND   oil_sales_master.location = '$location_id'
INNER JOIn mange_customer on mange_customer.c_id = oil_sales_master.to_location
INNER JOIN oil_stock on oil_stock.batch_id = oil_sales_detail .batch_id
WHERE oil_stock.s_id = '$m_id' AND issue_date BETWEEN '$start_date' AND '$end_date' AND issue_status = 1


UNION ALL
SELECT  oil_stock_adjustment.adj_on as batch_date ,CONCAT('ADJUSTED :' ,method) as type, 
    CASE  WHEN adj_qty < 0 THEN (adj_qty*-1)  ELSE NULL  END AS debit_qty,
    CASE  WHEN adj_qty > 0 THEN adj_qty  ELSE NULL END AS credit_qty,oil_stock.price,(oil_stock.price*adj_qty) as value,oil_stock.batch_id,oil_stock.exp_date
FROM oil_stock_adjustment
INNER JOIN oil_stock ON oil_stock.batch_id = oil_stock_adjustment.batch_id
WHERE oil_stock.store_id = '$location_id' AND oil_stock.s_id='$m_id' AND oil_stock_adjustment.adj_on BETWEEN '$start_date' AND '$end_date'


 





ORDER BY batch_date

";
 
?>


 
                     


                        <table id="example" class="table table-bordered  " style="width:100%">
                           <thead>
                             
                              <tr>
                              <th  width='50px'>#</th> 
                                 <th  >Date</th>
                                 <th  >Detail</th>
                                         <th  >Batch ID</th>
                                          <th  >Exp Date</th>
                                 <th  >Debit</th>
                                 <th  >Credit</th>
                                 <th  >Stock Balance</th>
                                 <th  >Batch Price</th>
                          
                                  
                              </tr>
                           </thead>
                           <tbody>

            
                        
                        <?php 
 $count = 1;
 $opening_balance_query = "
    SELECT 
        COALESCE(SUM(debit_qty), 0) - COALESCE(SUM(credit_qty), 0) AS opening_qty,
        COALESCE(SUM(debit_value), 0) - COALESCE(SUM(credit_value), 0) AS opening_value
    FROM (
        SELECT 
            purchase_qty AS debit_qty, 
            NULL AS credit_qty, 
            (purchase_qty * price) AS debit_value, 
            NULL AS credit_value
        FROM oil_stock
        WHERE s_id = '$m_id' 
          AND batch_date < '$start_date' 
          AND grn_status = 1 
          AND oil_stock.store_id = '$location_id'
    
        UNION ALL
    
        SELECT 
            NULL AS debit_qty, 
            issue_qty AS credit_qty, 
            NULL AS debit_value, 
            (issue_qty * price) AS credit_value
        FROM oil_sales_detail 
        INNER JOIN oil_sales_master ON oil_sales_detail .iss_id = oil_sales_master.iss_id
            AND oil_sales_master.location = '$location_id'
        INNER JOIN mange_customer ON mange_customer.c_id = oil_sales_master.to_location
        INNER JOIN oil_stock ON oil_stock.batch_id = oil_sales_detail .batch_id
        WHERE oil_stock.s_id = '$m_id' 
          AND issue_date < '$start_date' 
          AND issue_status = 1
    
        UNION ALL
    
        SELECT 
            CASE WHEN adj_qty < 0 THEN (adj_qty * -1) ELSE NULL END AS debit_qty, 
            CASE WHEN adj_qty > 0 THEN (adj_qty * 1) ELSE NULL END AS credit_qty, 
            CASE WHEN adj_qty > 0 THEN (adj_qty * price) ELSE NULL END AS debit_value, 
            CASE WHEN adj_qty < 0 THEN (adj_qty * price * -1) ELSE NULL END AS credit_value
        FROM oil_stock_adjustment
        INNER JOIN oil_stock ON oil_stock.batch_id = oil_stock_adjustment.batch_id
        WHERE oil_stock.store_id = '$location_id' 
          AND oil_stock.s_id = '$m_id' 
          AND oil_stock_adjustment.adj_on < '$start_date'
          
     
    ) AS stock_movements;
";

$result_opening_balance = mysqli_query($con, $opening_balance_query);
$opening_balance = mysqli_fetch_assoc($result_opening_balance);
$opening_quantity = $opening_balance['opening_qty'];
$opening_value = $opening_balance['opening_value'];
 


     if($opening_quantity > 0){
     
     ?>

<tr >
                                 <td align="center"><?php echo $count; $count++; ?></td> 
                                 <td align='center' ><?php    echo $start_date; ?></td>
                                 <td></td><td></td>
                                 <td   >Opening Balance as at <?php    echo $start_date; ?></td>
                                 <td align='center'  ><?php  if($opening_quantity >0 ) {echo $opening_quantity;} ?></td>
                                 <td  align='center'  ><?php  if($opening_quantity < 0 ) {echo $opening_quantity*-1;} ?></td>
                                 <td  align='center'  ><?php   echo $balance += $opening_quantity ?></td>
                                 <td  align='right'  ><?php echo number_format(($opening_value/$opening_quantity),2); ?></td>
                                 <!-- <td  align='right'  ><?php echo number_format($opening_value,2); ?></td> -->
                              </tr>

                               
    <?php } ?>


    
    <?php

$result = mysqli_query($con,$sql_movements);

if (!$result) {
    die("Query Failed: " . mysqli_error($conn)); // Show the error and stop execution
}

while($row = mysqli_fetch_assoc($result)) { 

 
   
?>

                          
                              <tr >
                                 <td align="center"><?php echo $count; $count++; ?></td> 
                                 <td align='center' ><?php   $date=date_create($row['batch_date']);
                                     echo date_format($date,"Y-m-d"); ?></td>
                                 <td   ><?php if($row['type']==''){ echo "GTN:From Non DMU"; } else{ echo $row['type'];} ?></td>
                                      <td align='center'  ><?php echo $row['batch_id'] ?></td>
                                      <td align='center'  ><?php echo $row['exp_date'] ?></td>
                                 <td align='center'  ><?php echo $row['debit_qty'] ?></td>
                                 <td  align='center'  ><?php echo $row['credit_qty'] ?></td>
                                 <td  align='center'  ><?php echo  $balance += ($row['debit_qty'] - $row['credit_qty']);?></td>
                                 <td  align='right'  ><?php echo number_format($row['price'],2); ?></td>
                                 <!-- <td  align='right'  ><?php echo number_format($row['value'],2); ?></td> -->
                              </tr>
                            

                               <?php } ?>
                           
                             
                           </tbody>
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
   $(document).ready(function() {
      $('#example').DataTable();
   });

   $(document).ready(function() {
    $('#mySelect1').select2({
              dropdownParent: $("#add_coa")
      });
  });
    $(document).ready(function() {
    $('#mySelect_search').select2();
  });



  $('#example').dataTable( {
"pageLength":  1111
} );
</script>




 
