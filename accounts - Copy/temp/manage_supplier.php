<?php include 'header.php'; ?>
<?php
if (isset($_POST['add_supplier'])) {
    $supplier_name = $_POST['supplier_name'];

    $status = 1;

    $insert = "INSERT INTO manage_supplier (supplier_name, status) 
               VALUES ('$supplier_name', '$status')";
    mysqli_query($con, $insert);
     $detail = " New supplier  $supplier_name added   ";
        UserLog('1','New Supplier added',$detail);
        
    echo "<script> notify('success', 'New supplier added successfully'); </script>";
}

if (isset($_POST['edit_supplier'])) {
    $sup_id = $_POST['sup_id'];
    $supplier_name = $_POST['supplier_name'];
       $tin_no = $_POST['tin_no'];
    $status = $_POST['status'];

    $update = "UPDATE manage_supplier SET supplier_name = '$supplier_name', tin_no ='$tin_no' ,status = '$status' 
               WHERE sup_id = '$sup_id'";
    mysqli_query($con, $update);

    $detail = "   $supplier_name : Detial edited   ";
        UserLog('1',' Supplier detail edited',$detail);
    
    echo "<script> notify('success', 'Supplier updated successfully'); </script>";
}
?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Manage Suppliers</h4>
        </div>

        <div class="card">
            <div class="card-header">
                <button class="btn btn-primary" data-toggle="modal" data-target="#add_supplier_modal">Add New Supplier</button>
            </div>
            <div class="card-block">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Supplier Name</th>
                                 <th>TIN No</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        $query = "SELECT * FROM manage_supplier ORDER BY sup_id";
                        $result = mysqli_query($con, $query);
                        $count = 1;
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo ($row['status'] == 1) ? "<tr>" : "<tr style='background-color:#f9c9ba;'>";
                            echo "<td>" . $count++ . "</td>";
                            echo "<td>" . $row['supplier_name'] . "</td>";
                            echo "<td>" . $row['tin_no'] . "</td>";
                            echo "<td>" . ($row['status'] == 1 ? 'Active' : 'Inactive') . "</td>";
                            echo "<td><button class='btn btn-sm btn-info edit-supplier' 
                                        data-id='" . $row['sup_id'] . "' 
                                        data-name='" . $row['supplier_name'] . "' 
                                        data-status='" . $row['status'] . "' 
                                        data-toggle='modal' 
                                        data-target='#edit_supplier_modal'>Edit</button></td>";
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

<!-- Add Supplier Modal -->
<div class="modal" id="add_supplier_modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Supplier</h4><hr>
        <form method="POST" id='my-form'>
          <table width="100%">
            <tr>
              <td align="right">Supplier Name:</td>
              <td><input type="text" name="supplier_name" class="form-control" required></td>
            </tr>
         
            <tr><td></td><td>
              <input type='hidden'   name="add_supplier"     value='11'>
              <button type="submit" class="btn btn-success mt-2 processing"   >Submit</button></td></tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Edit Supplier Modal -->
<div class="modal" id="edit_supplier_modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Supplier</h4><hr>
        <form method="POST">
          <input type="hidden" name="sup_id" id="edit_sup_id">
          <table width="100%">

            <tr><td align="right">Supplier Name:</td><td><input type="text" name="supplier_name" id="edit_supplier_name" class="form-control" readonly></td></tr>
            <tr><td align="right">TIN No:</td><td><input type="text" name="tin_no" id="edit_tin_no" class="form-control"></td></tr>
            
            <tr><td align="right">Status:</td>
              <td>
                <select name="status" id="edit_status" class="form-control">
                  <option value="1">Active</option>
                  <option value="0">Inactive</option>
                </select>
              </td>
            </tr>
            <tr><td></td><td><button type="submit" name="edit_supplier" class="btn btn-success mt-2">Update</button></td></tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
    $('.edit-supplier').click(function() {
        $('#edit_sup_id').val($(this).data('id'));
        $('#edit_supplier_name').val($(this).data('name'));
        $('#edit_tin_no').val($(this).data('tin_no'));
        $('#edit_status').val($(this).data('status'));
    });
});
</script>

<?php include 'footer.php'; ?>
