 
<?php include 'header.php'; ?>
 
<?php 
 
$user_license = $_SESSION['customer'];
  if(isset($_POST['create_new_client'])){
 
   
      $client_id1 = $_POST['client_id'];
      $client_name = $_POST['client_name'];
      // Convert business_start_date to YYYY-MM-DD
      $business_start_date = $_POST['business_start_date'];
      if (!empty($business_start_date)) {
         $business_start_date = str_replace('/', '-', $business_start_date);
         $parts = explode('-', $business_start_date);
         if (count($parts) === 3) {
            $business_start_date = $parts[2] . '-' . $parts[1] . '-' . $parts[0];
         }
      }
         // Convert book_start_from to YYYY-MM-DD
         $book_start_from = $_POST['book_start_from'];
         if (!empty($book_start_from)) {
            $book_start_from = str_replace('/', '-', $book_start_from);
            $parts = explode('-', $book_start_from);
            if (count($parts) === 3) {
               $book_start_from = $parts[2] . '-' . $parts[1] . '-' . $parts[0];
            }
         }
      $year_end = $_POST['year_end'];
      $primary_email = $_POST['primary_email'];
      $phone_number = $_POST['phone_number'];
      $company_type = $_POST['company_type'];
      $address_line1 = $_POST['address_line1'];
      $address_line2 = $_POST['address_line2'];
      $city_town = $_POST['city_town'];
      $district = $_POST['district'];
      $is_vat_registered = $_POST['is_vat_registered'] ?? 0;
      $vat_reg_no = $_POST['vat_reg_no'] ?? '';
      $vat_submit_type = $_POST['vat_submit_type'] ?? '';
      $md5_client = md5(time());
  
  $update="INSERT INTO `client_registration`(`md5_client`, `user_license`, `client_id`, `client_name`, `business_start_date`, `book_start_from`, `year_end`, `primary_email`, `phone_number`, `company_type`, `address_line1`, `address_line2`, `city_town`, `district`, `is_vat_registered`, `vat_reg_no`, `vat_submit_type`, `subscription`) 
   VALUES ('$md5_client','$user_license','$client_id1','$client_name','$business_start_date','$book_start_from','$year_end','$primary_email','$phone_number','$company_type','$address_line1','$address_line2','$city_town','$district','$is_vat_registered','$vat_reg_no','$vat_submit_type','$subscription')";
   mysqli_query($con, $update);
  
echo ' <script>  
notify("success","Great Job :","New Client '.$client_name.' Has been added");
</script> ';
}
  
if(isset($_POST['edit_client'])){
      $client_id1 = $_POST['client_id'];
      $client_name = $_POST['client_name'];
      // Convert business_start_date to YYYY-MM-DD
      $business_start_date = $_POST['business_start_date'];
      if (!empty($business_start_date)) {
         $business_start_date = str_replace('/', '-', $business_start_date);
         $parts = explode('-', $business_start_date);
         if (count($parts) === 3) {
            $business_start_date = $parts[2] . '-' . $parts[1] . '-' . $parts[0];
         }
      }
         // Convert book_start_from to YYYY-MM-DD
         $book_start_from = $_POST['book_start_from'];
         if (!empty($book_start_from)) {
            $book_start_from = str_replace('/', '-', $book_start_from);
            $parts = explode('-', $book_start_from);
            if (count($parts) === 3) {
               $book_start_from = $parts[2] . '-' . $parts[1] . '-' . $parts[0];
            }
         }
      $year_end = $_POST['year_end'];
      $primary_email = $_POST['primary_email'];
      $phone_number = $_POST['phone_number'];
      $company_type = $_POST['company_type'];
      $address_line1 = $_POST['address_line1'];
      $address_line2 = $_POST['address_line2'];
      $city_town = $_POST['city_town'];
      $district = $_POST['district'];
      $is_vat_registered = $_POST['is_vat_registered'] ?? 0;
      $vat_reg_no = $_POST['vat_reg_no'] ?? '';
      $vat_submit_type = $_POST['vat_submit_type'] ?? '';
      $md5_client = $_POST['md5_client'];
   
   $update="UPDATE client_registration SET client_id='$client_id1',client_name='$client_name',business_start_date='$business_start_date',book_start_from='$book_start_from',year_end='$year_end',primary_email='$primary_email',phone_number='$phone_number',company_type='$company_type',address_line1='$address_line1',address_line2='$address_line2',city_town='$city_town',district='$district',is_vat_registered='$is_vat_registered',vat_reg_no='$vat_reg_no',vat_submit_type='$vat_submit_type' WHERE md5_client ='$md5_client'";
   mysqli_query($con, $update);
  
echo ' <script>  
notify("success","Great Job :","Client '.$client_name.' Has been edited");
</script> ';

}











  ?>
<div class="content-wrapper">
   <!-- Container-fluid starts -->
   <div class="container-fluid">
      <!-- Header Starts -->
      <div class="row">
         <div class="col-sm-12 p-0">
            <div class="main-header">
               <h4>Client List</h4> 
            </div>
         </div>
      </div>
      <!-- Header end -->

      <div class="row">
         <div class="col-sm-12">

            <div class="card">
                
               <div class="card-header" align='right'>
                  <!-- <h5 class="mb-0"><i class="fa fa-building text-primary"></i> Client Management</h5> -->
                  
                     <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#AddTrailModal">
                        <i class="fa fa-plus"></i> Add New Client
                     </button>
                     <button type="button" id="exportButton" filename="Client_LIST.xlsx" class="btn btn-info btn-sm ml-2">
                        <i class="fa fa-download"></i> Export
                     </button>
                   
               </div>
               <div class="card-block">
                  <div class="row">
                     <div class="col-sm-12 table-responsive">


                        <table id="example" class="table table-bordered table-striped table-hover table-sm">
                           <thead class="thead-dark">
                              <tr>
                                 <th>#</th>
                                 <th>Client Name</th>
                                 <th>Client ID</th>
                                 <th>Company Type</th>
                                 <th>District</th>
                                 <th>VAT Registered</th>
                                 <th>Status</th>
                                 <th>Action</th> 
                              </tr>
                           </thead>
                           <tbody>

                           <?php
$count=1;
  $sel_query="SELECT * from client_registration Where subscription ='$subscription' ";
$result = mysqli_query($con,$sel_query);
while($row = mysqli_fetch_assoc($result)) { 
?>
                              <tr <?php  if($row['user_license']==0) {echo "class='table-danger'";} ?>>
                                 <td><?php echo $count;  $count ++ ; ?></td>
                                 <td><?php echo $row['client_name']; ?></td>
                                 <td><?php echo $row['client_id']; ?></td>
                                 <td><?php echo $row['company_type'] ?? 'N/A'; ?></td>
                                 <td><?php echo $row['district'] ?? 'N/A'; ?></td>
                                 <td align='center' >
                                   <?php if(($row['is_vat_registered'] ?? 0) == 1) { ?>
                                     <span class="badge badge-success"><i class="fa fa-check"></i> Yes</span>
                                   <?php } else { ?>
                                     <span class="badge badge-secondary"><i class="fa fa-times"></i> No</span>
                                   <?php } ?>
                                 </td>
                                 <td align='center'>
                                   <?php if($row['user_license']==1) { ?>
                                     <span class="badge badge-success"><i class="fa fa-check"></i> Active</span>
                                   <?php } else { ?>
                                     <span class="badge badge-danger"><i class="fa fa-times"></i> Inactive</span>
                                   <?php } ?>
                                 </td>
                                 <td>
                                   <div class="dropdown">
                                     <button class="btn btn-outline-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton<?= $row['c_id'] ?>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                       <i class="fa fa-cog"></i> Action
                                     </button>
                                     <div class="dropdown-menu" aria-labelledby="dropdownMenuButton<?= $row['c_id'] ?>">
                                       <a class="dropdown-item" href="#" onclick="editClient('<?= $row['md5_client'] ?>')">
                                         <i class="fa fa-edit text-primary"></i> Edit Client
                                       </a>
                                       <div class="dropdown-divider"></div>
                                       <?php if ($row['user_license'] == 1) { ?>
                                         <a class="dropdown-item text-warning" href="#" onclick="toggleClientStatus('<?= $row['md5_client'] ?>', 'Inactive')">
                                           <i class="fa fa-pause-circle"></i> Deactivate
                                         </a>
                                       <?php } else { ?>
                                         <a class="dropdown-item text-success" href="#" onclick="toggleClientStatus('<?= $row['md5_client'] ?>', 'Active')">
                                           <i class="fa fa-play-circle"></i> Activate
                                         </a>
                                       <?php } ?>
                                     </div>
                                   </div>
                                 </td>
                                 
                              </tr>
                              
                              <?php } ?>
                           </tbody>
                        </table>
                        
                        
                        <script>
function editClient(md5_client) {
    $('#EditClient').modal('show');
    
    $.ajax({
        type: "GET", 
        url: 'ajax/get_edit_client.php', 
        data: {md5_client: md5_client}, 
        success: function(response) {
            response = JSON.parse(response); 
            $("#edit-form [name='client_name']").val(response.client_name);
            $("#edit-form [name='client_id']").val(response.client_id);
            
            // Convert date format from YYYY-MM-DD to DD-MM-YYYY for datepicker
            if(response.business_start_date) {
                var businessDate = response.business_start_date.split('-');
                if(businessDate.length === 3) {
                    $("#edit-form [name='business_start_date']").val(businessDate[2] + '-' + businessDate[1] + '-' + businessDate[0]);
                }
            }
            
            if(response.book_start_from) {
                var bookDate = response.book_start_from.split('-');
                if(bookDate.length === 3) {
                    $("#edit-form [name='book_start_from']").val(bookDate[2] + '-' + bookDate[1] + '-' + bookDate[0]);
                }
            }
            
            // Re-initialize datepickers after loading data
            setTimeout(function() {
                initializeDatepickers();
            }, 100);
            
            $("#edit-form [name='year_end']").val(response.year_end);
            $("#edit-form [name='primary_email']").val(response.primary_email);
            $("#edit-form [name='phone_number']").val(response.phone_number);
            $("#edit-form [name='company_type']").val(response.company_type);
            $("#edit-form [name='address_line1']").val(response.address_line1);
            $("#edit-form [name='address_line2']").val(response.address_line2);
            $("#edit-form [name='city_town']").val(response.city_town);
            $("#edit-form [name='district']").val(response.district);
            $("#edit-form [name='md5_client']").val(response.md5_client);
            
            if(response.is_vat_registered == 1) {
                $("#edit-form [name='is_vat_registered']").val('1');
                $('#edit-vat-details').show();
                $("#edit-form [name='vat_reg_no']").val(response.vat_reg_no);
                $("#edit-form [name='vat_submit_type']").val(response.vat_submit_type);
            } else {
                $("#edit-form [name='is_vat_registered']").val('0');
                $('#edit-vat-details').hide();
            }
        }
    });
}

function toggleClientStatus(md5_client, status) {
    Swal.fire({
        title: 'Are you sure?',
        text: `You want to mark this Client as ${status}?`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, change status!',
        cancelButtonText: 'No, cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                type: "POST",
                url: "ajax/update_client_status.php",
                data: {md5_client: md5_client, status: status},
                success: function(response) {
                    if (response === 'success') {
                        Swal.fire({
                            title: 'Status Updated!',
                            text: `Client is now ${status}`,
                            icon: 'success'
                        });
                        
                        setTimeout(function() {
                            location.reload();
                        }, 2000);
                        
                    } else {
                        Swal.fire({
                            title: 'Error!',
                            text: 'Something went wrong while updating the status.',
                            icon: 'error'
                        });
                    }
                }
            });
        }
    });
}

// VAT Registration toggle for Add form
$(document).ready(function() {
   // Global Datepicker initialization for all date inputs
   initializeDatepickers();

   // Add form date validation
   $("#AddTrailModal form").on("submit", function(e) {
      var bsd = $("#business_start_date").val();
      var bsf = $("#book_start_from").val();
      if (!isValidDateDMY(bsd)) {
         notify('warning', 'Invalid Date', 'Business Start Date is not valid!');
         $("#business_start_date").focus();
         e.preventDefault();
         return false;
      }
      if (!isValidDateDMY(bsf)) {
         notify('Danger', 'Invalid Date', 'Book Start From is not valid!');
         $("#book_start_from").focus();
         e.preventDefault();
         return false;
      }
   });

   // Edit form date validation
   $("#edit-form").on("submit", function(e) {
      var bsd = $("#edit_business_start_date").val();
      var bsf = $("#edit_book_start_from").val();
      if (!isValidDateDMY(bsd)) {
         notify('warning', 'Invalid Date', 'Business Start Date is not valid!');
         $("#edit_business_start_date").focus();
         e.preventDefault();
         return false;
      }
      if (!isValidDateDMY(bsf)) {
         notify('warning', 'Invalid Date', 'Book Start From is not valid!');
         $("#edit_book_start_from").focus();
         e.preventDefault();
         return false;
      }
   });

   $('#add-is-vat-registered').change(function() {
      if($(this).val() == '1') {
         $('#add-vat-details').show();
      } else {
         $('#add-vat-details').hide();
         $('#add-vat-reg-no').val('');
         $('#add-vat-submit-type').val('');
      }
   });

   // VAT Registration toggle for Edit form
   $('#edit-is-vat-registered').change(function() {
      if($(this).val() == '1') {
         $('#edit-vat-details').show();
      } else {
         $('#edit-vat-details').hide();
         $('#edit-vat-reg-no').val('');
         $('#edit-vat-submit-type').val('');
      }
   });
});

// Helper: Validate DD-MM-YYYY or DD/MM/YYYY and check if real date
function isValidDateDMY(dateStr) {
   if (!dateStr) return false;
   var parts = dateStr.includes('-') ? dateStr.split('-') : dateStr.split('/');
   if (parts.length !== 3) return false;
   var day = parseInt(parts[0], 10);
   var month = parseInt(parts[1], 10);
   var year = parseInt(parts[2], 10);
   if (isNaN(day) || isNaN(month) || isNaN(year)) return false;
   if (year < 1900 || year > 2100) return false;
   var dt = new Date(year, month - 1, day);
   return dt.getFullYear() === year && (dt.getMonth() + 1) === month && dt.getDate() === day;
}
                        </script>
 

                     </div>
                  </div>
               </div>
            </div>



         </div>
      </div>
      <!-- Row end -->
      <!-- Tables end -->
   </div>

   <!-- Container-fluid ends -->
</div>


<?php include 'footer.php'; ?>


<script>
   $(document).ready(function() {
      if (!$.fn.DataTable.isDataTable('#example')) {
         $('#example').DataTable({
            "pageLength": 100
         });
      }
   });

   function lookin2(row_value){
 var c_id = row_value.getAttribute('c_id');
 
 var value = row_value.value;

 $.ajax({
type: "POST", 
url: 'ajax/estimate.php', 
data: {
	select_dmu:c_id
	,c_id:c_id
   ,value:value
  

 
}, 
beforeSend: function () { 
},
success: function (response) {
   notify('success', 'Updated successfully');
} 
}); 
}



</script>

<div class="modal fade" id="AddTrailModal" tabindex="-1" role="dialog" aria-labelledby="addClientModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-xl" role="document" style="max-width: 65%; width: 65%;">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="addClientModalLabel">Add New Client</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <form action="" method="POST">
         <div class="modal-body">
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="client_id" class="col-form-label">Client ID *</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="client_id" name="client_id" required placeholder="Enter Client ID">
               </div>
               <div class="col-md-2 text-right">
                  <label for="client_name" class="col-form-label">Client Name *</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="client_name" name="client_name" required placeholder="Enter Client name" style="text-transform: uppercase;">
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="business_start_date" class="col-form-label">Business Start Date *</label>
               </div>
               <div class="col-md-4">
                  <div class="input-group">
                     <input type="text" class="form-control datepicker" id="business_start_date" name="business_start_date" required placeholder="DD-MM-YYYY" maxlength="10">
                     <div class="input-group-append">
                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                     </div>
                  </div>
               </div>
               <div class="col-md-2 text-right">
                  <label for="book_start_from" class="col-form-label">Book Start From *</label>
               </div>
               <div class="col-md-4">
                  <div class="input-group">
                     <input type="text" class="form-control datepicker" id="book_start_from" name="book_start_from" required placeholder="DD-MM-YYYY" maxlength="10">
                     <div class="input-group-append">
                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                     </div>
                  </div>
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="year_end" class="col-form-label">Year End (DD/MM) *</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="year_end" name="year_end" required placeholder="DD/MM" pattern="[0-9]{2}/[0-9]{2}">
               </div>
               <div class="col-md-2 text-right">
                  <label for="primary_email" class="col-form-label">Primary Email</label>
               </div>
               <div class="col-md-4">
                  <input type="email" class="form-control" id="primary_email" name="primary_email" placeholder="Enter email address">
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="phone_number" class="col-form-label">Phone Number</label>
               </div>
               <div class="col-md-4">
                  <input type="tel" class="form-control" id="phone_number" name="phone_number" placeholder="Enter phone number" maxlength="13" minlength="10">
               </div>
               <div class="col-md-2 text-right">
                  <label for="company_type" class="col-form-label">Company Type *</label>
               </div>
               <div class="col-md-4">
                  <select class="form-control" id="company_type" name="company_type" required>
                     <option value="">Select Company Type</option>
                     <option value="Sole Proprietorship">Sole Proprietorship</option>
                     <option value="Partnership">Partnership</option>
                     <option value="Private Limited Company">Private Limited Company</option>
                     <option value="Cooperative Society">Cooperative Society</option>
                     <option value="Foundation">Foundation</option>
                  </select>
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="address_line1" class="col-form-label">Address Line 1</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="address_line1" name="address_line1" placeholder="Enter address line 1">
               </div>
               <div class="col-md-2 text-right">
                  <label for="address_line2" class="col-form-label">Address Line 2</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="address_line2" name="address_line2" placeholder="Enter address line 2">
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="city_town" class="col-form-label">City/Town</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="city_town" name="city_town" placeholder="Enter city or town">
               </div>
               <div class="col-md-2 text-right">
                  <label for="district" class="col-form-label">District</label>
               </div>
               <div class="col-md-4">
                  <select class="form-control" id="district" name="district">
                     <option value="">Select District</option>
                     <option value="Trincomalee">Trincomalee</option>
                     <option value="Batticaloa">Batticaloa</option>
                     <option value="Ampara">Ampara</option>
                  </select>
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="add-is-vat-registered" class="col-form-label">Is VAT Registered</label>
               </div>
               <div class="col-md-4">
                  <select class="form-control" id="add-is-vat-registered" name="is_vat_registered">
                     <option value="0" selected>No</option>
                     <option value="1">Yes</option>
                  </select>
               </div>
               <div class="col-md-6"></div>
            </div>
            
            <div id="add-vat-details" style="display: none;">
               <div class="row">
                  <div class="col-md-2 text-right">
                     <label for="add-vat-reg-no" class="col-form-label">VAT Registration No</label>
                  </div>
                  <div class="col-md-4">
                     <input type="text" class="form-control" id="add-vat-reg-no" name="vat_reg_no" placeholder="Enter VAT reg number">
                  </div>
                  <div class="col-md-2 text-right">
                     <label for="add-vat-submit-type" class="col-form-label">VAT Submit Type</label>
                  </div>
                  <div class="col-md-4">
                     <select class="form-control" id="add-vat-submit-type" name="vat_submit_type">
                        <option value="">Select VAT Submit Type</option>
                        <option value="Monthly">Monthly</option>
                        <option value="Quarterly">Quarterly</option>
                        <option value="Yearly">Yearly</option>
                     </select>
                  </div>
               </div>
            </div>
 
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" name="create_new_client" class="btn btn-success"><i class="fa fa-save"></i> Create Client</button>
         </div>
         </form>
      </div>
   </div>
</div>


<div class="modal fade" id="EditClient" tabindex="-1" role="dialog" aria-labelledby="editClientModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-xl" role="document" style="max-width: 65%; width: 65%;">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="editClientModalLabel">Edit Client</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <form action="" method="POST" id="edit-form">
         <div class="modal-body">
            <input type="hidden" name="md5_client" value="">
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="edit_client_id" class="col-form-label">Client ID *</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="edit_client_id" name="client_id" required placeholder="Enter Client ID">
               </div>
               <div class="col-md-2 text-right">
                  <label for="edit_client_name" class="col-form-label">Client Name *</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="edit_client_name" name="client_name" required placeholder="Enter Client name" style="text-transform: uppercase;">
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="edit_business_start_date" class="col-form-label">Business Start Date *</label>
               </div>
               <div class="col-md-4">
                  <div class="input-group">
                     <input type="text" class="form-control datepicker" id="edit_business_start_date" name="business_start_date" required placeholder="DD-MM-YYYY" maxlength="10">
                     <div class="input-group-append">
                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                     </div>
                  </div>
               </div>
               <div class="col-md-2 text-right">
                  <label for="edit_book_start_from" class="col-form-label">Book Start From *</label>
               </div>
               <div class="col-md-4">
                  <div class="input-group">
                     <input type="text" class="form-control datepicker" id="edit_book_start_from" name="book_start_from" required placeholder="DD-MM-YYYY" maxlength="10">
                     <div class="input-group-append">
                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                     </div>
                  </div>
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="edit_year_end" class="col-form-label">Year End (DD/MM) *</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="edit_year_end" name="year_end" required placeholder="DD/MM" pattern="[0-9]{2}/[0-9]{2}">
               </div>
               <div class="col-md-2 text-right">
                  <label for="edit_primary_email" class="col-form-label">Primary Email</label>
               </div>
               <div class="col-md-4">
                  <input type="email" class="form-control" id="edit_primary_email" name="primary_email" placeholder="Enter email address">
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="edit_phone_number" class="col-form-label">Phone Number</label>
               </div>
               <div class="col-md-4">
                  <input type="tel" class="form-control" id="edit_phone_number" name="phone_number" placeholder="Enter phone number" maxlength="13" minlength="10">
               </div>
               <div class="col-md-2 text-right">
                  <label for="edit_company_type" class="col-form-label">Company Type *</label>
               </div>
               <div class="col-md-4">
                  <select class="form-control" id="edit_company_type" name="company_type" required>
                     <option value="">Select Company Type</option>
                     <option value="Sole Proprietorship">Sole Proprietorship</option>
                     <option value="Partnership">Partnership</option>
                     <option value="Private Limited Company">Private Limited Company</option>
                     <option value="Cooperative Society">Cooperative Society</option>
                     <option value="Foundation">Foundation</option>
                  </select>
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="edit_address_line1" class="col-form-label">Address Line 1</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="edit_address_line1" name="address_line1" placeholder="Enter address line 1">
               </div>
               <div class="col-md-2 text-right">
                  <label for="edit_address_line2" class="col-form-label">Address Line 2</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="edit_address_line2" name="address_line2" placeholder="Enter address line 2">
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="edit_city_town" class="col-form-label">City/Town</label>
               </div>
               <div class="col-md-4">
                  <input type="text" class="form-control" id="edit_city_town" name="city_town" placeholder="Enter city or town">
               </div>
               <div class="col-md-2 text-right">
                  <label for="edit_district" class="col-form-label">District</label>
               </div>
               <div class="col-md-4">
                  <select class="form-control" id="edit_district" name="district">
                     <option value="">Select District</option>
                     <option value="Trincomalee">Trincomalee</option>
                     <option value="Batticaloa">Batticaloa</option>
                     <option value="Ampara">Ampara</option>
                  </select>
               </div>
            </div>
            
            <div class="row">
               <div class="col-md-2 text-right">
                  <label for="edit-is-vat-registered" class="col-form-label">Is VAT Registered</label>
               </div>
               <div class="col-md-4">
                  <select class="form-control" id="edit-is-vat-registered" name="is_vat_registered">
                     <option value="0">No</option>
                     <option value="1">Yes</option>
                  </select>
               </div>
               <div class="col-md-6"></div>
            </div>
            
            <div id="edit-vat-details" style="display: none;">
               <div class="row">
                  <div class="col-md-2 text-right">
                     <label for="edit-vat-reg-no" class="col-form-label">VAT Registration No</label>
                  </div>
                  <div class="col-md-4">
                     <input type="text" class="form-control" id="edit-vat-reg-no" name="vat_reg_no" placeholder="Enter VAT reg number">
                  </div>
                  <div class="col-md-2 text-right">
                     <label for="edit-vat-submit-type" class="col-form-label">VAT Submit Type</label>
                  </div>
                  <div class="col-md-4">
                     <select class="form-control" id="edit-vat-submit-type" name="vat_submit_type">
                        <option value="">Select VAT Submit Type</option>
                        <option value="Monthly">Monthly</option>
                        <option value="Quarterly">Quarterly</option>
                        <option value="Yearly">Yearly</option>
                     </select>
                  </div>
               </div>
            </div>
            
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" name="edit_client" class="btn btn-success"><i class="fa fa-save"></i> Save Changes</button>
         </div>
         </form>
      </div>
   </div>
</div>
