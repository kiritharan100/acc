<?php include 'header.php'; ?>
 <?php
 if (isset($_POST['add_customer'])) {
  //check duplicate customer name in the database 
  $customer_name = mysqli_real_escape_string($con, $_POST['customer_name']);
  $check_duplicate = mysqli_query($con, "SELECT * FROM accounts_manage_customer WHERE customer_name = '$customer_name' AND location_id = '$location_id'");
  if (mysqli_num_rows($check_duplicate) > 0) {
      echo "<script> notify('danger', 'Customer name already exists'); </script>";
  } else {  


  
    $customer_name = mysqli_real_escape_string($con, $_POST['customer_name']);
    $customer_address = mysqli_real_escape_string($con, $_POST['customer_address']);
    $customer_email = mysqli_real_escape_string($con, $_POST['customer_email']);
    $condact_number = mysqli_real_escape_string($con, $_POST['condact_number']);
    $max_limit = mysqli_real_escape_string($con, $_POST['max_limit']);
    $status = 1;

    $insert = "INSERT INTO accounts_manage_customer (location_id, customer_name, customer_address, customer_email, condact_number, max_limit, status) 
               VALUES ('$location_id', '$customer_name', '$customer_address', '$customer_email', '$condact_number', '$max_limit', '$status')";
    mysqli_query($con, $insert);

    $detail = "New customer $customer_name added with Max Limit $max_limit";
    UserLog('1', 'New customer added', $detail);

    echo "<script> notify('success', 'New customer added successfully'); </script>";
  }
}
if (isset($_POST['edit_customer'])) {
    $c_id = $_POST['c_id'];
    $customer_name = mysqli_real_escape_string($con, $_POST['customer_name']);
    $customer_address = mysqli_real_escape_string($con, $_POST['customer_address']);
    $customer_email = mysqli_real_escape_string($con, $_POST['customer_email']);
    $condact_number = mysqli_real_escape_string($con, $_POST['condact_number']);
    $max_limit = mysqli_real_escape_string($con, $_POST['max_limit']);
    $status = mysqli_real_escape_string($con, $_POST['status']);

    $update = "UPDATE accounts_manage_customer SET 
                customer_name = '$customer_name', 
                customer_address = '$customer_address', 
                customer_email = '$customer_email', 
                condact_number = '$condact_number', 
                max_limit = '$max_limit', 
                status = '$status' 
              WHERE c_id = '$c_id' AND location_id = '$location_id'";
    mysqli_query($con, $update);

    $detail = "Customer Detail of $customer_name Edited";
    UserLog('1', 'Customer Detail edited', $detail);

    echo "<script> notify('success', 'Customer details updated'); </script>";
}

?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Manage Customers</h4>
        </div>

        <div class="card">
            <div class="card-header">
                <button class="btn btn-primary" data-toggle="modal" data-target="#add_customer_modal">Add New Customer</button>
                  <button type='button' id="exportButton" filename='<?php echo "Customer_List".date('Y-m-d'); ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
            </div>
            <div class="card-block">
                <div class="table-responsive">
                    <table id='example' class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Email</th>
                                <th>Contact Number</th>
                                <th>Max Limit</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        $query = "SELECT * FROM accounts_manage_customer WHERE location_id = '$location_id' ORDER BY c_id ASC";
                        $result = mysqli_query($con, $query);
                        $count = 1;
                      
                        while ($row = mysqli_fetch_assoc($result)) {
                            $disabled = ($row['c_id'] < 4) ? 'disabled' : '';
                             if($row['status'] == 1){ echo "<tr>";} else {  echo "<tr class='table-danger cancelled-row'>";}
                            echo "<td>" . $count++ . "</td>";
                            echo "<td>" . $row['customer_name'] . "</td>";
                            echo "<td>" . $row['customer_address'] . "</td>";
                            echo "<td>" . $row['customer_email'] . "</td>";
                            echo "<td>" . $row['condact_number'] . "</td>";
                            echo "<td align='right' style='padding-right:15px;'>" . number_format($row['max_limit'], 2) . "</td>";
                            echo "<td>" . ($row['status'] == 1 ? 'Active' : 'Inactive') . "</td>";
                          echo "<td>
    <button class='btn btn-sm btn-info edit-customer' style='height:10px;'
        data-id='" . htmlspecialchars($row['c_id'], ENT_QUOTES) . "' 
        data-name='" . htmlspecialchars($row['customer_name'], ENT_QUOTES) . "'
        data-address='" . htmlspecialchars($row['customer_address'], ENT_QUOTES) . "'
        data-email='" . htmlspecialchars($row['customer_email'], ENT_QUOTES) . "'
        data-number='" . htmlspecialchars($row['condact_number'], ENT_QUOTES) . "'
        data-limit='" . htmlspecialchars($row['max_limit'], ENT_QUOTES) . "'
        data-status='" . htmlspecialchars($row['status'], ENT_QUOTES) . "'
        data-toggle='modal' $disabled
        data-target='#edit_customer_modal'>Edit</button>
</td>";
                            echo "</tr>";
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Customer Modal -->
<div class="modal" id="add_customer_modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Customer</h4><hr>
        <form method="POST">
          <table width="100%">
            <tr><td align="right">Name:</td><td><input type="text" name="customer_name" class="form-control" required></td></tr>
            <tr><td align="right">Address:</td><td><input type="text" name="customer_address" class="form-control" ></td></tr>
            <tr><td align="right">Email:</td><td><input type="email" name="customer_email" class="form-control"></td></tr>
            <tr><td align="right">Contact Number:</td><td><input type="text" name="condact_number" class="form-control"  ></td></tr>
            <tr><td align="right">Max Limit:</td><td><input type="number" step="0.01" name="max_limit" class="form-control"  ></td></tr>
            <tr><td></td><td><button type="submit" name="add_customer" class="btn btn-success mt-2 ">Submit</button></td></tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Edit Customer Modal -->
<div class="modal" id="edit_customer_modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Customer</h4><hr>
        <form method="POST">
          <input type="hidden" name="c_id" id="edit_c_id">
          <table width="100%">
            <tr><td align="right">Name:</td><td><input type="text" name="customer_name" id="edit_customer_name" class="form-control" required ></td></tr>
            <tr><td align="right">Address:</td><td><input type="text" name="customer_address" id="edit_customer_address" class="form-control" ></td></tr>
            <tr><td align="right">Email:</td><td><input type="email" name="customer_email" id="edit_customer_email" class="form-control"></td></tr>
            <tr><td align="right">Contact Number:</td><td><input type="text" name="condact_number" id="edit_condact_number" class="form-control"  ></td></tr>
            <tr><td align="right">Max Limit:</td><td><input type="number" step="0.01" name="max_limit" id="edit_max_limit" class="form-control"  ></td></tr>
            <tr><td align="right">Status:</td><td>
              <select name="status" id="edit_status" class="form-control">
                <option value="1">Active</option>
                <option value="0">Inactive</option>
              </select>
            </td></tr>
            <tr><td></td><td><button type="submit" name="edit_customer" class="btn btn-success mt-2">Update</button></td></tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
    $('.edit-customer').click(function() {
        $('#edit_c_id').val($(this).data('id'));
        $('#edit_customer_name').val($(this).data('name'));
        $('#edit_customer_address').val($(this).data('address'));
        $('#edit_customer_email').val($(this).data('email'));
        $('#edit_condact_number').val($(this).data('number'));
        $('#edit_max_limit').val($(this).data('limit'));
        $('#edit_status').val($(this).data('status'));
    });
});
</script>

<script>
$(document).ready(function() {
    $('#example').DataTable({
        "pageLength": 50, // Default entries per page
        "lengthMenu": [ [50, 100, 200, 500], [50, 100, 200, 500] ]
    });
});
</script>

<?php include 'footer.php'; ?>
