<?php
include("header.php");

$query = "SELECT `ca_id`, `ca_type`, `ca_name`, `status`, `ca_group`, `editable` FROM `acc_chart_of_accounts` LIMIT 50";
$result = mysqli_query($con, $query);

$account_types = [
  'Assets' => [
    'Current Assets', 'Fixed Assets', 'Inventory', 'Cash in Hand', 'Other Assets'
  ],
  'Liabilities' => [
    'Current Liabilities', 'Non-Current Liabilities', 'Tax Liabilities'
  ],
  'Equity' => [
    "Shareholders’ Equity", 'Retained Earnings', 'Drawings/Dividends'
  ],
  // 'Income' => [
  //   'Operating Revenue', 'Non-Operating Income', 'Other Income'
  // ],
  // 'Expenses' => [
  //   'Cost of Goods Sold', 'Administrative Expenses', 'Operational Expenses', 'Finance Costs'
     
  // ]
   'Expenses' => [
     'Administrative Expenses', 'Operational Expenses', 'Finance Costs'
     
  ]
];
?>

<div class="content-wrapper">
  <div class="container-fluid">
    <div class="main-header">
      <h5>ACCOUNTS | <?php echo  $client_name; ?> | CHART OF ACCOUNTS</h5>
    </div>

    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-block">
            <div class="table-responsive">

              <div align='right' >
                         <button type='button' id="exportButton" filename='Chart_of_accounts.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>

                <button class="btn btn-success" data-toggle="modal" data-target="#accountModal" onclick="openCreateModal()">+ Add Account</button>
              </div>
            <hr>
              <table id='example' class="table table-bordered table-striped table-hover table-sm">
                <thead class="thead-dark">
                  <tr>
                    <th>Type</th>
                    <th>Name</th>
                    <th>Group</th>
                    <th>Status</th>
                    <th>Editable</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <?php while ($row = mysqli_fetch_assoc($result)) { ?>
                    <tr>
                      <td><?= htmlspecialchars($row['ca_type']) ?></td>
                      <td><?= htmlspecialchars($row['ca_name']) ?></td>
                      <td><?= htmlspecialchars($row['ca_group']) ?></td>
                      <td align='center'><?= $row['status'] == 1 ? 'Active' : 'Inactive' ?></td>
                      <td align='center'><?= $row['editable'] == 1 ? 'Yes' : 'No' ?></td>
                      <td align='center'>
                        <button class="btn btn-primary btn-sm" onclick='openEditModal(<?= json_encode($row) ?>)'>Edit</button>
                      </td>
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

<!-- Modal -->
<div class="modal fade" id="accountModal" tabindex="-1" role="dialog" aria-labelledby="accountModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <form method="post" id="accountForm" class='processing_form'>
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="accountModalLabel">Add/Edit Account</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="ca_id" id="ca_id">

          <div class="form-group">
            <label for="ca_type">Account Type (Main Category)</label>
            <select class="form-control" id="ca_type" name="ca_type" required onchange="updateGroupOptions()">
              <option value="">-- Select Type --</option>
              <?php foreach ($account_types as $type => $groups) { ?>
                <option value="<?= $type ?>"><?= $type ?></option>
              <?php } ?>
            </select>
          </div>

         

          <div class="form-group">
            <label for="ca_group">Account Group (Sub-Category)</label>
            <select class="form-control" id="ca_group" name="ca_group" required>
              <option value="">-- Select Group --</option>
            </select>
          </div>

           <div class="form-group">
            <label for="ca_name">Account Name</label>
            <input type="text" class="form-control" id="ca_name" name="ca_name" required>
          </div>
          
                   <div class="form-group">
            
            <label class="form-check-label" for="flexCheckDefault">
            Check if Applicable for current Location Only
            </label> 
            <input type="checkbox" name='location'  value='<?php echo $location_id; ?>' style="width:20px; height:20px; accent-color: red;">
          </div>


          <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status">
              <option value="1">Active</option>
              <option value="0">Inactive</option>
            </select>
          </div>

        </div>
        <div class="modal-footer">
          <button type="submit" id="submitBtn" class="btn btn-success processing_button">Save</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script>
$(document).ready(function() {
    $('#example').DataTable({
        "pageLength": 50
    });
});
</script>
<?php include("footer.php"); ?>

<script>
const accountMap = <?php echo json_encode($account_types); ?>;

function openCreateModal() {
  $('#accountForm')[0].reset();
  $('#ca_group').html('<option value="">-- Select Group --</option>');
  $('#accountModalLabel').text("Add Account");
  $('#submitBtn').prop('disabled', false);
  setReadOnlyFields(false);
  $('#ca_id').val('');
}

function openEditModal(data) {
  $('#ca_id').val(data.ca_id);
  $('#ca_type').val(data.ca_type);
  $('#ca_name').val(data.ca_name);
  $('#status').val(data.status);
  updateGroupOptions();
  $('#ca_group').val(data.ca_group);
  $('#accountModalLabel').text("Edit Account");

  const isEditable = parseInt(data.editable) === 1;
  setReadOnlyFields(!isEditable);
  $('#submitBtn').prop('disabled', !isEditable);

  $('#accountModal').modal('show');
}

function setReadOnlyFields(readOnly) {
  $('#ca_type').prop('disabled', readOnly);
  $('#ca_name').prop('readonly', readOnly);
  $('#ca_group').prop('disabled', readOnly);
  $('#status').prop('disabled', readOnly);
}

function updateGroupOptions() {
  const selectedType = $('#ca_type').val();
  const groupSelect = $('#ca_group');
  groupSelect.html('<option value="">-- Select Group --</option>');
  if (accountMap[selectedType]) {
    accountMap[selectedType].forEach(function(group) {
      groupSelect.append(`<option value="${group}">${group}</option>`);
    });
  }
}

$('#accountForm').on('submit', function(e) {
  e.preventDefault();
  const formData = new FormData(this);

  fetch('ajax/save_chart_account.php', {
    method: 'POST',
    body: formData
  })
  .then(res => res.text())
  .then(data => {
    notify('success', 'Saved', data);
    setTimeout(() => location.reload(), 1000);
  })
  .catch(err => {
    notify('danger', 'Error', err);
  });
});
</script>
