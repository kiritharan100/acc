<?php include 'header.php'; $day_end_id = $_REQUEST['serial']; ?>
<?php
if(isset($_REQUEST['from_date'])){
   $from_date = $_REQUEST['from_date'];
   $to_Date = $_REQUEST['to_date'];
} else {
   $from_date = date("Y-m-d");
   $to_Date = date("Y-m-d");
}
if(isset($_REQUEST['record'])){
   echo "<script> notify('success', 'New  Transfer recorded successfully.')</script>";
}
 ?>

 
<div class="content-wrapper">
   <!-- Container-fluid starts -->
   <div class="container-fluid">
      <!-- Header Starts -->
      <div class="row">
         <div class="col-sm-12 p-0">
            
            <div class="main-header">
               <h4> <i class="icon-arrow-up-circle"></i> Oil Sales Invoice List / <?php echo $client_name ?>  <?php if(isset($_REQUEST['serial'])){ echo $_REQUEST['date'];} ?></h4>
              
            </div>
         </div>
      </div>
      <!-- Header end -->

      <div class="row">
         <div class="col-sm-12">
 
            <div class="card">
               <div class="card-header" align='Right'>
                                          <?php if(isset($_REQUEST['serial'])){ echo " <a href='oil_sales_master.php'> <button class='btn btn-success'>Show All </button></a>";} else { ?>

                <form> 
                  
                From  <input type='date'  name='from_date' value='<?php echo $from_date; ?>' > to Date <input type='date' name='to_date' value='<?php echo $to_Date; ?>' > 
                 
                  <button type='submit' class="btn btn-success"><i class="fa fa-search" style="font-size:15px;color:red"></i></button>




                  <!-- <a href="oil_sales.php" class="btn btn-primary waves-effect" data-type="info"   > <i class="fa fa-plus" aria-hidden="true"></i>Add New oil sales</a> -->
                  <?php } ?><button type='button' id="exportButton" filename='<?php echo "OIL_SALES_"; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
                </form>
               </div>


               <div class="card-block">
                  <div class="row">
                     <div class="col-sm-12 table-responsive">





                        <table id="example" class="table table-bordered " style="width:100%">
                           <thead>
                              <tr>
                                 <th width='50px'>#</th> 
                                 <th>Invoice</th>
                                 <th>Date</th>
                                 <th>Transfered To</th>
                                 <th>Total Value </th>
                                 <th>Day End</th>
                                 
                                 <th>Action</th>
                              </tr>
                           </thead>
                           <tbody>
                           <?php
$count=1;
 
$total =0;

if(isset($_REQUEST['serial'])){
   $sel_query="SELECT oil_sales_master.*,mange_customer.customer_name,mange_customer.c_id FROM  oil_sales_master 
  left JOIN mange_customer ON mange_customer.c_id = oil_sales_master.to_location 
  
   where    location='$location_id' and day_end = '$day_end_id' Order by iss_id desc "; 

}else{
     
  $sel_query="SELECT oil_sales_master.*,mange_customer.customer_name,mange_customer.c_id FROM  oil_sales_master 
  left JOIN mange_customer ON mange_customer.c_id = oil_sales_master.to_location 
  
   where    location='$location_id' and issue_date >= '$from_date' AND issue_date <= '$to_Date' Order by iss_id desc";
}

$result = mysqli_query($con,$sel_query);
while($row = mysqli_fetch_assoc($result)) { 
?>
                              <tr <?php if($row['issue_status'] == 0 ){ echo 'class="table-danger cancelled-row"';} ?> >
                                 <td align="center"><?php echo $count; $count++; ?></td> 
                                 <td style='padding-left:5px;  width:85px ;' ><?php echo $row['loc_id'] ?></td>
                                 
                                 <td  align='center'><?php echo $row['issue_date'] ?></td>
                                 <td  style='padding-left:5px;' ><?php if($row['c_id'] > 0){ echo $row['customer_name']; } else { echo "Cash sales"; } ?></td>
                                 <td align='right' style='padding-right:10px;' > <?php if($row['issue_status'] == 0 ){ echo 'C <s>';} ?><?php   echo number_format($row['issue_total'],2)  ?><?php if($row['issue_status'] == 0 ){ echo '</s>';} else {$total += $row['issue_total'];} ?></td> 
                                <td  align='center'><?php echo $row['day_end'] ?></td>
                                 <!-- <td align="center" style="width:15px ;"><i class="fa fa-check" aria-hidden="true" title="Balanced"></i></td> -->
                                 <td align="center" style="width:85px ; ">  <select class="dropdown_change" style="height: 18px;" class="form-select"   row_id="<?php echo $row['iss_id']; ?>"  > 
                                            <option>Select</option> 
                                            <option>View</option> 
                                             <?php if($row['received_status'] == 0  && $row['issue_status'] == 1){ echo "<option>Cancel</option>"; }?>
                                           </select></td>

                              </tr>

                              <?php } ?>
                             
                           </tbody>
                        </table>
                                                  <script>
                                                
                                                $(".dropdown_change").change(function() {
                                                     var row_id = $(this).attr("row_id"); 
                                                     var value = $(this).find(":selected").val();  
                                                     var user_language = '<?php echo $client_language;?>';    
                                                    if(value == 'View' ){
                                                       window.open('oil_sales_print.php?iss_id='+row_id+'&language=' + user_language,'_blank');
                                                       

                                                    }
                                                  
        if(value == 'Cancel') {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, cancel it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'oil_ajax/delete_sales.php',
                    type: 'POST',
                    data: {iss_id: row_id},
                    success: function(response) {
                        if(response.success) {
                            Swal.fire(
                                'Cancelled!',
                                'Sales has been cancelled.',
                                'success'
                            ).then(() => {
                                setTimeout(function() {
                                    location.reload(); // Reload the page to reflect changes
                                }, 2000); // Delay of 2 seconds
                            });
                        } else {
                            Swal.fire(
                                'Error!',
                                'There was an error cancelling the stock transfer.',
                                'error'
                            );
                        }
                    },
                    error: function() {
                        Swal.fire(
                            'Error!',
                            'There was an error processing your request.',
                            'error'
                        );
                    }
                });
            }
        });
    }
    
    
    
    
                                                   });
                              
                                                </script> 

                                                <div align='right'>
                                                 <h3> Total Sales : <?php echo number_format($total,2); ?> </h3>
                                                </div>
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




 
