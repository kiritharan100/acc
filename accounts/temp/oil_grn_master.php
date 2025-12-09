<?php include 'header.php';
$day_end_id = $_REQUEST['serial'];

?>
<?php
if(isset($_REQUEST['from_date'])){
   $from_date = $_REQUEST['from_date'];
   $to_Date = $_REQUEST['to_date'];
} else {
   $from_date = date('Y-01-01',strtotime('-0 MONTH'));
   $to_Date = date("Y-m-t");
}
if(isset($_REQUEST['record'])){
   echo "<script> notify('success', 'New  GRN recorded successfully.')</script>";
}
 ?>

 
<div class="content-wrapper">
   <!-- Container-fluid starts -->
   <div class="container-fluid">
      <!-- Header Starts -->
      <div class="row">
         <div class="col-sm-12 p-0">
            
            <div class="main-header">
               <h4>OIL GRN Master / <?php echo $client_name ?> <?php if(isset($_REQUEST['serial'])){ echo $_REQUEST['date'];} ?> </h4>
              
            </div>
         </div>
      </div>
      <!-- Header end -->

      <div class="row">
         <div class="col-sm-12">
 
            <div class="card">
               <div class="card-header" align='Right'>
                         <?php if(isset($_REQUEST['serial'])){ echo " <a href='oil_grn_master.php'> <button class='btn btn-success'>Show All  </button></a>";} else { ?>

                <form> 
                  
                From  <input type='date'  name='from_date' value='<?php echo $from_date; ?>' > to Date <input type='date' name='to_date' value='<?php echo $to_Date; ?>' > 
                 
                  <button type='submit' class="btn btn-success"><i class="fa fa-search" style="font-size:15px;color:red"></i></button>




                  <!-- <a href="oil_new_grn.php" class="btn btn-primary waves-effect" data-type="info"   > <i class="fa fa-plus" aria-hidden="true"></i>Add New GRN</a> -->
                  <?php } ?>
                  <button type='button' id="exportButton" filename='<?php echo "GRN_".$client_name; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
                  </form>
                 
               </div>


               <div class="card-block">
                  <div class="row">
                     <div class="col-sm-12 table-responsive">





                        <table id="example" class="table table-bordered " style="width:100%">
                           <thead>
                              <tr>
                                 <th width='50px'>#</th> 
                                 <th>Invoice Numner</th>
                                 <th>Date</th>
                                 <th>Supplier name</th>
                                 <th>Total Value </th>
                                 <th>Day end</th>
                                 
                                 <th>Action</th>
                              </tr>
                           </thead>
                           <tbody>
                           <?php
$count=1;
 
$today = date('Y-m-d');
$total= 0;


if(isset($_REQUEST['serial'])){
     $sel_query="SELECT oil_grn_master.* ,manage_supplier.supplier_name	 FROM oil_grn_master
  INNER JOIN manage_supplier on manage_supplier.sup_id = oil_grn_master.sup_id
  
   where    location='$location_id' and day_end = '$day_end_id' AND grn_type = 'Other'  Order by grn_id desc ";
   
 } else {
  $sel_query="SELECT oil_grn_master.* ,manage_supplier.supplier_name	 FROM oil_grn_master
  INNER JOIN manage_supplier on manage_supplier.sup_id = oil_grn_master.sup_id
  
   where    location='$location_id' and grn_date >= '$from_date' AND grn_date <= '$to_Date' AND grn_type = 'Other'  Order by grn_id desc ";
}




$result = mysqli_query($con,$sel_query);
while($row = mysqli_fetch_assoc($result)) { 
?>
                              <tr <?php if($row['grn_status'] == 0 ){ echo 'class="table-danger cancelled-row"';} ?> >
                                 <td align="center"><?php echo $count; $count++; ?></td> 
                                 <td style='padding-left:5px;  width:85px ;' ><?php echo $row['invoice_no'] ?></td>
                                 
                                 <td  align='center'><?php echo $row['grn_date'] ?></td>
                                 <td  style='padding-left:5px;' ><?php echo $row['supplier_name'] ?></td>
                                 <td align='right' style='padding-right:10px;' > <?php if($row['grn_status'] == 0 ){ echo 'C <s>';} ?><?php echo number_format($row['grn_total'],2)  ?><?php if($row['grn_status'] == 0 ){ echo '</s>';} else { $total += $row['grn_total'];} ?></td> 
                                 <td align='center'  style='padding-left:5px;' ><?php echo $row['day_end'] ?></td>
                                 <!-- <td align="center" style="width:15px ;"><i class="fa fa-check" aria-hidden="true" title="Balanced"></i></td> -->
                                 <td align="center" style="width:85px ; ">  <select class="dropdown_change" style="height: 18px;" class="form-select"   row_id="<?php echo $row['grn_id']; ?>"  > 
                                            <option>Select</option> 
                                            <option>View</option> 
                                           <?php if($row['grn_date'] == $today): ?>
        <option>Delete</option>  
      <?php endif; ?>
                                           </select></td>

                              </tr>

                              <?php } ?>
                             
                           </tbody>
                        </table>
<div align='right'>
                       <?php 
  if (!isset($total)) {
    $total = 0;  
  }
?>
<h4>Total GRN <?php echo number_format($total, 2); ?></h4>
                                                  <script>
                                                
                                                $(".dropdown_change").change(function() {
                                                     var row_id = $(this).attr("row_id"); 
                                                     var value = $(this).find(":selected").val();  
                                                     var user_language = '<?php echo $client_language;?>';    
                                                    if(value == 'View' ){
                                                       window.open('oil_grn_print.php?grn_id='+row_id+'&language=' + user_language,'_blank');
                                                       

                                                    }
                                                    if(value == 'Delete' ){
                                                                        $.ajax({
                                                                            type: "GET", 
                                                                            url: 'oil_ajax/delete_grn.php', 
                                                                            data: {grn_id:row_id}, 
                                                                            beforeSend: function () { 
                                                                            },
                                                                            success: function (response) {
                                                                                  response = JSON.parse(response);   
                                                   
                                                                               var spent_qty = response.stock_adjusted; 

                                                                               if(spent_qty > 0){  notify('danger', 'Error :This GRN already affected by other transaction');  }
                                                                               else {
                                                                                 Swal.fire({
                                                                                       title: "Are you sure?",
                                                                                       text: "You won't be able to revert this!",
                                                                                       icon: "warning",
                                                                                       showCancelButton: true,
                                                                                       confirmButtonColor: "#3085d6",
                                                                                       cancelButtonColor: "#d33",
                                                                                       confirmButtonText: "Yes, delete it!"
                                                                                       }).then((result) => {
                                                                                       if (result.isConfirmed) {
                                                                                          Swal.fire({
                                                                                             title: "Deleted!",
                                                                                             text: "Your file has been deleted.",
                                                                                             icon: "success"
                                                                                          });
                                                                                                      $.ajax({
                                                                                                            type: "GET", 
                                                                                                            url: 'oil_ajax/delete_grn.php', 
                                                                                                            data: {delete_grn_id:row_id}, 
                                                                                                            beforeSend: function () { 
                                                                                                            },
                                                                                                            success: function (response) {
                                                                                                                  response = JSON.parse(response);   } 
                                                                                                         });  
                                                                                                 setTimeout(() => {
                                                                                                document.location.reload();
                                                                                                }, 3000); 
                                                                                       }
                                                                                       });
                                                                               }
                                                                            } 
                                                                         });        
                                                               } 
                                                   });
                              
                                                </script> 
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
"pageLength": 25
} );
</script>




 
