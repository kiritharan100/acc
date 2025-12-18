<?php include 'header.php'; ?>
<?php
// Note: All CRUD handled via AJAX in accounts/contact/ (customer_list/save/delete)
?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Manage Customers</h4>
        </div>

        <div class="card">
            <div class="card-header d-flex">
                <button class="btn btn-primary" data-toggle="modal" data-target="#add_customer_modal">Add New Customer</button>
                <button type='button' id="exportButton" filename='<?php echo "Customer_List".date('Y-m-d'); ?>.xlsx' class="btn btn-primary ml-2"><i class="ti-cloud-down"></i> Export</button>
            </div>
            <div class="card-block">
                <div class="table-responsive">
                    <table id='customerTable' class="table table-bordered">
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
                        <tbody></tbody>
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
        <form id="addCustomerForm">
          <table width="100%">
            <tr>
              <td align="right">Name:</td>
              <td><input type="text" name="customer_name" class="form-control" required></td>
            </tr>
            <tr>
              <td align="right">Address:</td>
              <td><input type="text" name="customer_address" class="form-control"></td>
            </tr>
            <tr>
              <td align="right">Email:</td>
              <td><input type="email" name="customer_email" class="form-control"></td>
            </tr>
            <tr>
              <td align="right">Contact Number:</td>
              <td><input type="text" name="condact_number" class="form-control"></td>
            </tr>
            <tr>
              <td align="right">Max Limit:</td>
              <td><input type="text" name="max_limit" class="form-control"></td>
            </tr>
            <tr><td></td><td>
              <button type="submit" class="btn btn-success mt-2 processing">Submit</button></td></tr>
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
        <form id="editCustomerForm">
          <input type="hidden" name="c_id" id="edit_c_id">
          <table width="100%">
            <tr><td align="right">Name:</td><td><input type="text" name="customer_name" id="edit_customer_name" class="form-control" readonly></td></tr>
            <tr><td align="right">Address:</td><td><input type="text" name="customer_address" id="edit_customer_address" class="form-control"></td></tr>
            <tr><td align="right">Email:</td><td><input type="email" name="customer_email" id="edit_customer_email" class="form-control"></td></tr>
            <tr><td align="right">Contact Number:</td><td><input type="text" name="condact_number" id="edit_condact_number" class="form-control"></td></tr>
            <tr><td align="right">Max Limit:</td><td><input type="text" name="max_limit" id="edit_max_limit" class="form-control"></td></tr>
            <tr><td align="right">Status:</td>
              <td>
                <select name="status" id="edit_status" class="form-control">
                  <option value="1">Active</option>
                  <option value="0">Inactive</option>
                </select>
              </td>
            </tr>
            <tr><td></td><td><button type="submit" class="btn btn-success mt-2">Update</button></td></tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
let customerCache = {};

function renderCustomers(data) {
    const $tbody = $('#customerTable tbody');
    $tbody.empty();
    customerCache = {};

    const esc = (v) => $('<div>').text(v == null ? '' : v).html();
    const fmt = (val) => {
        const num = parseFloat(val);
        if (!isFinite(num) || num === 0) return '';
        return num.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
    };

    if (!data || !data.length) {
        $tbody.append('<tr><td colspan="8" class="text-center">No customers found.</td></tr>');
        return;
    }

    data.forEach((row, idx) => {
        customerCache[row.c_id] = row;
        const statusLabel = row.status == 1 ? 'Active' : 'Inactive';
        const statusClass = row.status == 1 ? '' : 'table-danger cancelled-row';
        const actionMenu = `
        <div class="btn-group">
            <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Action
            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item action-edit" href="#" data-id="${row.c_id}">Edit</a>
                <a class="dropdown-item text-danger action-delete" href="#" data-id="${row.c_id}">Delete</a>
            </div>
        </div>`;

        $tbody.append(`
            <tr class="${statusClass}">
                <td>${idx + 1}</td>
                <td>${esc(row.customer_name)}</td>
                <td>${esc(row.customer_address)}</td>
                <td>${esc(row.customer_email)}</td>
                <td>${esc(row.condact_number)}</td>
                <td class="text-right">${fmt(row.max_limit)}</td>
                <td>${esc(statusLabel)}</td>
                <td>${actionMenu}</td>
            </tr>
        `);
    });
}

function loadCustomers() {
    $.get('contact/customer_list.php', function(res) {
        if (res && res.success) {
            renderCustomers(res.data);
        } else {
            notify('danger', 'Error', res && res.message ? res.message : 'Failed to load customers.');
        }
    }).fail(function() {
        notify('danger', 'Error', 'Failed to load customers.');
    });
}

function openEditModal(id) {
    const row = customerCache[id];
    if (!row) {
        notify('danger', 'Not found', 'Unable to load customer details.');
        return;
    }
    $('#edit_c_id').val(row.c_id);
    $('#edit_customer_name').val(row.customer_name);
    $('#edit_customer_address').val(row.customer_address);
    $('#edit_customer_email').val(row.customer_email);
    $('#edit_condact_number').val(row.condact_number);
    $('#edit_max_limit').val(row.max_limit);
    $('#edit_status').val(row.status);
    $('#edit_customer_modal').modal('show');
}

$(document).ready(function() {
    loadCustomers();

    // Add customer
    $('#addCustomerForm').on('submit', function(e) {
        e.preventDefault();
        const formData = $(this).serialize() + '&action=add';
        $.post('contact/customer_save.php', formData, function(res) {
            if (res && res.success) {
                notify('success', 'Success', res.message || 'Customer added.');
                $('#add_customer_modal').modal('hide');
                $('#addCustomerForm')[0].reset();
                loadCustomers();
            } else {
                notify('danger', 'Error', res && res.message ? res.message : 'Failed to add customer.');
            }
        }, 'json').fail(function() {
            notify('danger', 'Error', 'Failed to add customer.');
        });
    });

    // Edit customer
    $('#editCustomerForm').on('submit', function(e) {
        e.preventDefault();
        const formData = $(this).serialize() + '&action=edit';
        $.post('contact/customer_save.php', formData, function(res) {
            if (res && res.success) {
                notify('success', 'Updated', res.message || 'Customer updated.');
                $('#edit_customer_modal').modal('hide');
                loadCustomers();
            } else {
                notify('danger', 'Error', res && res.message ? res.message : 'Failed to update customer.');
            }
        }, 'json').fail(function() {
            notify('danger', 'Error', 'Failed to update customer.');
        });
    });

    // Action handlers
    $(document).on('click', '.action-edit', function(e) {
        e.preventDefault();
        const id = $(this).data('id');
        openEditModal(id);
    });

    $(document).on('click', '.action-delete', function(e) {
        e.preventDefault();
        const id = $(this).data('id');
        const name = customerCache[id] ? customerCache[id].customer_name : '';
        Swal.fire({
            title: 'Delete customer?',
            html: `This will mark <b>${name || 'this customer'}</b> as inactive.`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            confirmButtonText: 'Yes, delete',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (!result.isConfirmed) return;
            $.post('contact/customer_delete.php', { c_id: id }, function(res) {
                if (res && res.success) {
                    notify('success', 'Deleted', res.message || 'Customer deleted.');
                    loadCustomers();
                } else {
                    notify('danger', 'Error', res && res.message ? res.message : 'Failed to delete customer.');
                }
            }, 'json').fail(function() {
                notify('danger', 'Error', 'Failed to delete customer.');
            });
        });
    });
});
</script>

<?php include 'footer.php'; ?>
