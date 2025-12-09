<?php
include("header.php");

// Add Select2 CSS and JS if not already included
echo '<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />';
echo '<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>';

// Add custom CSS for account status styling
echo '<style>
.table-danger {
    background-color: rgba(220, 53, 69, 0.1) !important;
}
.table-danger td {
    border-color: rgba(220, 53, 69, 0.2) !important;
}
.dropdown-item:hover {
    background-color: #f8f9fa;
}
.dropdown-item i {
    width: 16px;
    margin-right: 8px;
}
.badge {
    font-size: 0.8em;
    padding: 0.4em 0.6em;
}
.btn-outline-primary:hover {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}
.dropdown {
    position: relative !important;
}
.dropdown-menu {

    position: absolute !important;
    top: 100% !important;
    left: 0 !important;
    z-index: 999999 !important;
    min-width: 160px;
    padding: 0.5rem 0;
    margin: 0.125rem 0 0;
    font-size: 0.875rem;
    color: #495057;
    text-align: left;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0, 0, 0, 0.15);
    border-radius: 0.375rem;
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.175) !important;
}
.dropdown-menu.show {
    display: block !important;
    z-index: 999999 !important;
}
table .dropdown-menu {
    z-index: 999999 !important;
}
.dataTables_wrapper .dropdown-menu {
    z-index: 999999 !important;
}
#example .dropdown-menu {
    z-index: 999999 !important;
}
.table-responsive .dropdown-menu {
    z-index: 999999 !important;
}

    .table-responsive {
    overflow: visible !important;
    position: relative !important;
    z-index: auto !important;
}

/* Prevent card from clipping dropdown */
.card {
    overflow: visible !important;
}

/* Optional safety for DataTables */
.dataTables_wrapper {
    overflow: visible !important;
}
</style>';
?>
 

<div class="content-wrapper">
  <div class="container-fluid">
    <div class="main-header">
      <h5>ACCOUNTS | <?php echo $client_name; ?> | NEW CHART OF ACCOUNTS</h5>
    </div>

    <div class="row" style='z-index:-50;'>
      <div class="col-md-12"  >
        <div class="card" >
          <div class="card-block"  >
            <div class="table-responsive" style='z-index:99;' >

              <div align='right' >
                <button type='button' id="exportButton" filename='Chart_of_accounts.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
                <button class="btn btn-success" onclick="openCreateModal()">+ Add Account</button>
              </div>
            <hr>
              <table id='example' class="table table-bordered table-striped table-hover table-sm">
                <thead class="thead-dark">
                  <tr>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Group</th>
                     <th>VAT</th>
                    <th>Status</th>
                    <th>Editable</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <?php 
                  // Union query to get both master and client accounts
                  // Priority: if same ca_id exists in both tables, only show client version
                  // Show all accounts regardless of status (active and inactive)
                   $query = "
                    SELECT 
                        cm.ca_id,
                        cm.ca_code as ca_code,
                        cm.ca_name,
                        cat.coa_nature as ca_type,
                        cat.main_category as ca_group,
                        cm.status,
                        cm.vat_id,
                        vat.vat_name as vat_name,
                        cat.id as cat_id,
                        1 as editable,
                        'master' as account_type,
                        CASE WHEN cc_check.master_id IS NOT NULL THEN 1 ELSE 0 END as is_customized
                    FROM accounts_coa_main cm
                    LEFT JOIN accounts_coa_category cat ON cm.cat_id = cat.id
                    LEFT JOIN accounts_vat_cat vat ON cm.vat_id = vat.vat_id
                    LEFT JOIN accounts_coa_client cc_check ON cc_check.master_id = cm.ca_id AND cc_check.location_id = '$location_id'
                    WHERE NOT EXISTS (
                        SELECT 1 FROM accounts_coa_client cc_exists 
                        WHERE cc_exists.ca_id = cm.ca_id AND cc_exists.location_id = '$location_id'
                    )
                    
                    UNION ALL
                    
                    SELECT 
                        cc.ca_id,
                        cc.ca_code as ca_code,
                        cc.ca_name,
                        cat.coa_nature as ca_type,
                        cat.main_category as ca_group,
                        cc.status,
                        cc.vat_id,
                        vat.vat_name as vat_name,
                        cat.id as cat_id,
                        1 as editable,
                        CASE WHEN cc.master_id > 0 THEN 'master' ELSE 'client' END as account_type,
                        CASE WHEN cc.master_id > 0 THEN 1 ELSE 0 END as is_customized
                    FROM accounts_coa_client cc
                    LEFT JOIN accounts_coa_category cat ON cc.cat_id = cat.id
                    LEFT JOIN accounts_vat_cat vat ON cc.vat_id = vat.vat_id
                    WHERE cc.location_id = '$location_id'
                    
                    ORDER BY ca_type, ca_group, ca_name
                  ";
                  
                  $result = mysqli_query($con, $query);
                  
                  if ($result) {
                      while ($row = mysqli_fetch_assoc($result)) { 
                        // Add row class based on status
                        $row_class = $row['status'] == 0 ? 'table-danger' : '';
                  ?>
                    <tr class="<?= $row_class ?>">
                      <td><?= htmlspecialchars($row['ca_code']) ?></td>
                      <td><?= htmlspecialchars($row['ca_name']) ?></td>
                      <td><?= htmlspecialchars($row['ca_type']) ?></td>
                      <td><?= htmlspecialchars($row['ca_group']) ?></td>
                      <td>
                        <?php 
                        if ($row['vat_id'] && $row['vat_id'] > 0) {
                            echo htmlspecialchars($row['vat_name']);
                        } else {
                            echo 'No VAT';
                        }
                        ?>
                      </td>
                      <td align='center'>
                        <?php if ($row['status'] == 1) { ?>
                          <span class="badge badge-success"><i class="fa fa-check"></i> Active</span>
                        <?php } else { ?>
                          <span class="badge badge-danger"><i class="fa fa-times"></i> Inactive</span>
                        <?php } ?>
                      </td>
                      <td align='center'>
                        <?php 
                        if ($row['account_type'] == 'master') {
                            echo $row['is_customized'] == 1 ? 'Customized' : 'Yes';
                        } else {
                            echo 'Yes';
                        }
                        ?>
                      </td>
                      <td align='center'>
                        <div class="dropdown">
                          <button class="btn btn-outline-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton<?= $row['ca_id'] ?>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-cog"></i> Action
                          </button>
                          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton<?= $row['ca_id'] ?>">
                            <a class="dropdown-item" href="#" onclick="openEditModal(<?= htmlspecialchars(json_encode($row)) ?>)">
                              <i class="fa fa-edit text-primary"></i> Edit Account
                            </a>
                            <div class="dropdown-divider"></div>
                            <?php if ($row['status'] == 1) { ?>
                              <a class="dropdown-item text-warning" href="#" onclick="toggleStatus(<?= $row['ca_id'] ?>, 0, '<?= $row['account_type'] ?>')">
                                <i class="fa fa-pause-circle"></i> Deactivate
                              </a>
                            <?php } else { ?>
                              <a class="dropdown-item text-success" href="#" onclick="toggleStatus(<?= $row['ca_id'] ?>, 1, '<?= $row['account_type'] ?>')">
                                <i class="fa fa-play-circle"></i> Activate
                              </a>
                            <?php } ?>
                          </div>
                        </div>
                      </td>
                    </tr>
                  <?php 
                      }
                  } else {
                      echo "<tr><td colspan='7'>Error: Tables not found. Please run the SQL script first.</td></tr>";
                  }
                  ?>
                </tbody>
              </table>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Add Account Modal -->
<div class="modal fade" id="accountModal" tabindex="-1" role="dialog" aria-labelledby="accountModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <form method="post" id="accountForm">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="accountModalLabel">Add/Edit Account</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="ca_id" id="ca_id">
          <input type="hidden" name="account_type" id="account_type">

          <div class="form-group">
            <label for="cat_id">Account Type (Category)</label>
            <select class="form-control select2" id="cat_id" name="cat_id" required>
              <option value="">-- Select Category --</option>
              <?php
              $cat_query = "SELECT id, coa_nature, main_category, sub_category FROM accounts_coa_category WHERE status = 1 ORDER BY coa_nature, main_category, sub_category";
              $cat_result = mysqli_query($con, $cat_query);
              while ($cat_row = mysqli_fetch_assoc($cat_result)) {
                  echo "<option value='" . $cat_row['id'] . "'>" . 
                       $cat_row['coa_nature'] . " > " . 
                       $cat_row['main_category'] . " > " . 
                       $cat_row['sub_category'] . "</option>";
              }
              ?>
            </select>
          </div>

          <div class="form-group">
            <label for="ca_code">Account Code (Numbers Only)</label>
            <input type="number" class="form-control" id="ca_code" name="ca_code" required min="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            <div id="code-feedback" class="mt-1"></div>
          </div>

          <div class="form-group">
            <label for="ca_name">Account Name</label>
            <input type="text" class="form-control" id="ca_name" name="ca_name" required>
          </div>

          <div class="form-group">
            <label for="vat_id">VAT Code</label>
            <select class="form-control" id="vat_id" name="vat_id">
              <option value="0">No VAT</option>
              <?php
              $vat_query = "SELECT vat_id, vat_name FROM accounts_vat_cat WHERE 1";
              $vat_result = mysqli_query($con, $vat_query);
              if ($vat_result) {
                  while ($vat_row = mysqli_fetch_assoc($vat_result)) {
                      echo "<option value='" . $vat_row['vat_id'] . "'>" . htmlspecialchars($vat_row['vat_name']) . "</option>";
                  }
              }
              ?>
            </select>
          </div>

          <div class="form-group">
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="status" name="status" value="1" checked>
              <label class="form-check-label" for="status">
                Active
              </label>
            </div>
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="submit" id="submitBtn" class="btn btn-success">Save</button>
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
    
    // Initialize Select2 when modal is shown
    $('#accountModal').on('shown.bs.modal', function () {
        $('#cat_id.select2').select2({
            dropdownParent: $('#accountModal'),
            width: '100%'
        });
    });
    
    // Destroy Select2 when modal is hidden to prevent conflicts
    $('#accountModal').on('hidden.bs.modal', function () {
        $('#cat_id.select2').select2('destroy');
    });
    
    // Real-time account code validation
    let codeCheckTimeout;
    $('#ca_code').on('input', function() {
        const code = $(this).val().trim();
        const caId = $('#ca_id').val();
        const accountType = $('#account_type').val();
        
        // Clear previous timeout
        clearTimeout(codeCheckTimeout);
        
        // Clear feedback
        $('#code-feedback').html('');
        
        if (code.length >= 1) {
            // Set timeout to avoid too many requests
            codeCheckTimeout = setTimeout(function() {
                checkAccountCode(code, caId, accountType);
            }, 500);
        }
    });
});

function checkAccountCode(code, caId, accountType) {
    $.ajax({
        url: 'ajax/chart_of_accounts_handler.php',
        type: 'POST',
        data: {
            action: 'check_code',
            ca_code: code,
            ca_id: caId,
            account_type: accountType
        },
        dataType: 'json',
        beforeSend: function() {
            console.log('Checking code:', code, 'for location:', '<?php echo $location_id; ?>');
        },
        success: function(response) {
            if (response.exists) {
                $('#code-feedback').html('<small class="text-danger"><i class="fa fa-times"></i> ' + response.message + '</small>');
                $('#ca_code').addClass('is-invalid');
            } else {
                $('#code-feedback').html('<small class="text-success"><i class="fa fa-check"></i> Account code is available</small>');
                $('#ca_code').removeClass('is-invalid').addClass('is-valid');
            }
        },
        error: function(xhr, status, error) {
            console.error('Code check error:', xhr.responseText);
            $('#code-feedback').html('<small class="text-warning"><i class="fa fa-warning"></i> Unable to check code availability</small>');
        }
    });
}

function openCreateModal() {
  $('#accountForm')[0].reset();
  $('#accountModalLabel').text('Add New Account');
  $('#ca_id').val('');
  $('#account_type').val('client');
  $('#status').prop('checked', true);
  $('#code-feedback').html('');
  $('#ca_code').removeClass('is-invalid is-valid');
  $('#accountModal').modal('show');
}

function openEditModal(data) {
  console.log('Edit data:', data); // Debug log
  $('#accountForm')[0].reset();
  $('#accountModalLabel').text('Edit Account');
  $('#ca_id').val(data.ca_id);
  $('#account_type').val(data.account_type);
  $('#code-feedback').html('');
  $('#ca_code').removeClass('is-invalid is-valid');
  
  // Get account details via AJAX
  $.ajax({
    url: 'ajax/chart_of_accounts_handler.php',
    type: 'POST',
    data: {
      action: 'get_account',
      ca_id: data.ca_id,
      account_type: data.account_type
    },
    dataType: 'json',
    beforeSend: function() {
        console.log('Fetching account data...'); // Debug log
    },
    success: function(response) {
      console.log('AJAX Response:', response); // Debug log
      if (response.success) {
        const accountData = response.data;
        $('#cat_id').val(accountData.cat_id || accountData.category_id);
        $('#ca_code').val(accountData.ca_code);
        $('#ca_name').val(accountData.ca_name);
        $('#vat_id').val(accountData.vat_id || 0);
        $('#status').prop('checked', accountData.status == 1);
        $('#accountModal').modal('show');
      } else {
        Swal.fire('Error!', response.message || 'Failed to load account data', 'error');
      }
    },
    error: function(xhr, status, error) {
      console.error('AJAX Error:', xhr.responseText); // Debug log
      Swal.fire('Error!', 'Failed to load account data: ' + error, 'error');
    }
  });
}

// Handle form submission
$('#accountForm').on('submit', function(e) {
  e.preventDefault();
  
  // Validate form
  const caCode = $('#ca_code').val().trim();
  const caName = $('#ca_name').val().trim();
  const catId = $('#cat_id').val();
  
  if (!caCode || !caName || !catId) {
    Swal.fire('Error!', 'Please fill in all required fields.', 'error');
    return;
  }
  
  if (!/^[0-9]+$/.test(caCode)) {
    Swal.fire('Error!', 'Account code must contain only numbers.', 'error');
    return;
  }
  
  // Check if code has validation errors
  if ($('#ca_code').hasClass('is-invalid')) {
    Swal.fire('Error!', 'Please fix the account code error before saving.', 'error');
    return;
  }
  
  const formData = $(this).serialize();
  const isEdit = $('#ca_id').val() !== '';
  const action = isEdit ? 'edit' : 'add';
  
  console.log('Form submission:', formData + '&action=' + action); // Debug log
  console.log('Current location_id:', '<?php echo $location_id; ?>'); // Debug location
  
  $.ajax({
    url: 'ajax/chart_of_accounts_handler.php',
    type: 'POST',
    data: formData + '&action=' + action,
    dataType: 'json',
    beforeSend: function() {
        $('#submitBtn').prop('disabled', true).text('Saving...');
    },
    success: function(response) {
      console.log('Save response:', response); // Debug log
      $('#submitBtn').prop('disabled', false).text('Save');
      
      if (response.success) {
        Swal.fire('Success!', response.message, 'success').then(() => {
          $('#accountModal').modal('hide');
          location.reload();
        });
      } else {
        Swal.fire('Error!', response.message || 'Unknown error occurred', 'error');
      }
    },
    error: function(xhr, status, error) {
      console.error('Save error:', xhr.responseText); // Debug log
      $('#submitBtn').prop('disabled', false).text('Save');
      Swal.fire('Error!', 'Server error: ' + error + '. Please check console for details.', 'error');
    }
  });
});

function toggleStatus(accountId, newStatus, accountType) {
  const statusText = newStatus == 1 ? 'activate' : 'deactivate';
  
  Swal.fire({
    title: 'Are you sure?',
    text: `Do you want to ${statusText} this account?`,
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: `Yes, ${statusText} it!`
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url: 'ajax/chart_of_accounts_handler.php',
        type: 'POST',
        data: {
          action: 'toggle_status', 
          ca_id: accountId, 
          status: newStatus,
          account_type: accountType
        },
        dataType: 'json',
        success: function(response) {
          if (response.success) {
            Swal.fire('Success!', response.message, 'success').then(() => {
              location.reload();
            });
          } else {
            Swal.fire('Error!', response.message, 'error');
          }
        },
        error: function() {
          Swal.fire('Error!', 'An error occurred while processing your request.', 'error');
        }
      });
    }
  });
}
</script>

<?php include('footer.php'); ?>