<?php include 'header.php'; ?>
<?php
if(isset($_REQUEST['from_date'])){
   $from_date = $_REQUEST['from_date'];
   $to_Date = $_REQUEST['to_date'];
} else {
   $from_date = date('Y-01-01',strtotime('-0 MONTH'));
   $to_Date = date("Y-m-t");
}
if(isset($_REQUEST['record'])){
   echo "<script> notify('success', 'New material GRN recorded successfully.')</script>";
}
 ?>

 
<div class="content-wrapper">
   <!-- Container-fluid starts -->
   <div class="container-fluid">
      <!-- Header Starts -->
      <div class="row">
         <div class="col-sm-12 p-0">
            
            <div class="main-header">
               <h4>Medicine Stock</h4>
              
            </div>
         </div>
      </div>
      <!-- Header end -->

      <div class="row">
         <div class="col-sm-12">
 
            <div class="card">
               <div class="card-header" align='Right'>
                 
               <form>




                  <!-- <a href="material_grn.php" class="btn btn-primary waves-effect" data-type="info"   > <i class="fa fa-plus" aria-hidden="true"></i>Add New GRN</a> -->

                  <button type='button' id="exportButton" filename='<?php echo "OIL_STOCK_".$client_name; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
                  <button class="btn btn-primary class="print-button" onclick="printDivContent()"><i class="fa fa-print" aria-hidden="true"></i> Print </button> </form>
                  </form>
               </div>


               <div class="card-block">
                  <div class="row">
                     <div class="col-sm-12 table-responsive" id="printableDiv">


                <div align='center'> STOCK BALANCE 
                <?php echo $client_name." AS AT ".date('Y-m-d');?>
                </div>


                        <table id="example" class="table table-bordered  " style="width:100%">
                           <thead>
                             
                              <tr>
                              <th  width='50px'>#</th> 
                                 <th  >Name</th>
                                 
                               
                               
                                 <th>Stock</th>
                                 <th>Average Price</th>
                                 <th>Value</th>
                                  <th>View</th> 
                                  
                              </tr>
                           </thead>
                           <tbody>
                           <?php
$count=1;
 
$t1=0;

  $sel_query="SELECT mm.p_id,
  mm.p_name, mm.p_unit,
  SUM(CASE WHEN ms.store_id = $location_id THEN ms.purchase_qty - ms.return_qty - ms.transfered_qty - ms.issued_qty - ms.adjusted_qty ELSE 0 END) AS 'Stock Balance in Store 1',
 
  SUM(CASE WHEN ms.store_id = $location_id THEN (ms.purchase_qty - ms.return_qty - ms.transfered_qty - ms.issued_qty - ms.adjusted_qty) * ms.price ELSE 0 END) AS 'Stock Value in Store 1'
 
FROM 
  oil_stock ms
JOIN 
  product_master mm ON mm.p_id = ms.s_id

WHERE ms.open_status = 1 AND ms.batch_status = 1 


GROUP BY 
  mm.p_name";
$result = mysqli_query($con,$sel_query);
while($row = mysqli_fetch_assoc($result)) { 

if($row['Stock Balance in Store 1'] > 0) {
   
?>
                              <tr >
                                 <td align="center"><?php echo $count; $count++; ?></td> 
                                 <td  ><?php echo $row['p_name'] ?></td>
                             
                                 
                                 <td  align='center'><?php echo $row['Stock Balance in Store 1']; ?></td>
                                 <td  align='center'><?php echo  number_format(($row['Stock Value in Store 1']/$row['Stock Balance in Store 1']),2); ?></td>
                                 <td  align='right'><?php echo number_format($row['Stock Value in Store 1'],2); $t1 += $row['Stock Value in Store 1']; ?></td>
                         
                               <td  align='center'><a href='report_stock_ledger.php?m_id=<?php echo $row['p_id']; ?>' target='_blank'> <i class="fa fa-eye" aria-hidden="true"></i></a></td>
                                 

                              </tr>
                            

                              <?php }} ?>
                              <tr style='background-color:#D1D8DE;'>
                                 <td align="center"><?php echo $count;   ?></td> 
                               
                                 <td  > Total</td>
                                   <td  > </td>
                                 
                                 <td  align='center'> </td>
                                 <td  align='right'><?php echo number_format($t1,2); ?></td>
                                    <td  align='center'> <i class="fa fa-eye" aria-hidden="true"></i></td>
                               
                               
                                 

                              </tr>
                             
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
    DataTable.ext.errMode = 'none';
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



 
</script>



 <script>
 
 var table = $('#example').DataTable({
        paging: false,
        bFilter: false,
        ordering: false,
        searching: true,
        dom: 't'         // This shows just the table
    });  
        function printDivContent() {
            var printContents = document.getElementById('printableDiv').innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>

 
