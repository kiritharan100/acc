<?php include 'header.php'; ?>
<?php
if (isset($_REQUEST['from_date'])) {
    $from_date = $_REQUEST['from_date'] . ' 00:00:00';
    $to_date   = $_REQUEST['to_date']   . ' 23:59:59';
} else {
    $from_date = date('Y-m-01') . ' 00:00:00';
    $to_date   = date('Y-m-t') . ' 23:59:59';
}
?>

 
<div class="content-wrapper">
   <!-- Container-fluid starts -->
   <div class="container-fluid">
      <!-- Header Starts -->
      <div class="row">
         <div class="col-sm-12 p-0">
            
            <div class="main-header">
               <h4>User Log / <?php  echo $client_name?></h4>
              
            </div>
         </div>
      </div>
      <!-- Header end -->

      <div class="row">
         <div class="col-sm-12">
 
            <div class="card">
               <div class="card-header" align='Right'>
                 
              
 <form method="GET">
  From:
  <input type="datetime-local" name="from_date" value="<?= isset($_REQUEST['from_date']) ? date('Y-m-d\TH:i', strtotime($_REQUEST['from_date'])) : date('Y-m-01\T00:00') ?>" />

  To:
  <input type="datetime-local" name="to_date" value="<?= isset($_REQUEST['to_date']) ? date('Y-m-d\TH:i', strtotime($_REQUEST['to_date'])) : date('Y-m-t\T23:59') ?>" />

  <button type="submit" class="btn btn-success">
    <i class="fa fa-search" style="font-size:15px;color:red"></i>
  </button>

  <button type="button" id="exportButton" filename="USER_LOG_<?= $client_name ?>.xlsx" class="btn btn-primary">
    <i class="ti-cloud-down"></i> Export
  </button>
</form>

               </div>


               <div class="card-block">
                  <div class="row">
                     <div class="col-sm-12 table-responsive">
                     
                


<table id="example" class="table table-bordered " style="width:100%">
                           <thead>
                              <tr>
                                 <th width='50px'>#</th> 
                                 <th>User</th>
                                 <th>Activity</th>
                                 <th>Detail </th>
                                    <th>Date</th>
                              </tr>
                           </thead>
                           <tbody>
                           <?php
                                $count=1;
                               
                            
                                  $sel_query="SELECT user_log.*,user_license.i_name FROM `user_log` 
                                 INNER JOIN user_license ON user_license.usr_id = user_log.usr_id 
                                 
                                 -- WHERE location = '$location_id' AND module='3' AND log_date BETWEEN '$from_date' AND '$to_date'
                                 WHERE   log_date BETWEEN '$from_date' AND '$to_date'   and location = '$location_id'
                                 ORDER BY id DESC;
                                 
                                 ";
                                $result = mysqli_query($con,$sel_query);
                                while($row = mysqli_fetch_assoc($result)) { 
                                ?>
                              <tr>
                                 <td align="center"><?php echo $count; $count++; ?></td> 
                                 <td  ><?php echo $row['i_name'] ?></td>
                                 
                                 <td  ><?php echo $row['action'] ?></td>
                                 <td  ><?php echo $row['detail'] ?></td>
                                  <td  ><?php echo $row['log_date'] ?></td>
                                  

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
"pageLength": 50
} );
</script>




 
