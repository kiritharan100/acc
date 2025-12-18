<?php include 'header.php'; ?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Manage Suppliers</h4>
        </div>

        <div class="card">
            <div class="card-header d-flex">
                <button class="btn btn-primary" data-toggle="modal" data-target="#add_supplier_modal">Add New Supplier</button>
                <button type='button' id="exportButton" filename='<?php echo "Supplier_List".date('Y-m-d'); ?>.xlsx' class="btn btn-primary ml-2"><i class="ti-cloud-down"></i> Export</button>
            </div>
            <div class="card-block">
                <div class="table-responsive">
                    <table class="table table-bordered" id="supplierTable">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Supplier Name</th>
                                <th>TIN No</th>
                                <th>Address</th>
                                <th>Contact Number</th>
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

<!-- Add Supplier Modal -->
<div class="modal" id="add_supplier_modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Supplier</h4><hr>
        <form id="addSupplierForm">
          <table width="100%">
            <tr>
              <td align="right">Supplier Name:</td>
              <td><input type="text" name="supplier_name" class="form-control" required></td>
            </tr>
            <tr>
              <td align="right">TIN No:</td>
              <td><input type="text" name="tin_no" class="form-control"></td>
            </tr>
            <tr>
              <td align="right">Address:</td>
              <td><input type="text" name="address" class="form-control"></td>
            </tr>
            <tr>
              <td align="right">Phone No:</td>
              <td><input type="text" name="contact_number" class="form-control"></td>
            </tr>
            <tr><td></td><td>
              <button type="submit" class="btn btn-success mt-2 processing">Submit</button></td></tr>
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
        <form id="editSupplierForm">
          <input type="hidden" name="sup_id" id="edit_sup_id">
          <table width="100%">
            <tr><td align="right">Supplier Name:</td><td><input type="text" name="supplier_name" id="edit_supplier_name" class="form-control" readonly></td></tr>
            <tr><td align="right">TIN No:</td><td><input type="text" name="tin_no" id="edit_tin_no" class="form-control"></td></tr>
            <tr><td align="right">Address:</td><td><input type="text" name="address" id="edit_address" class="form-control"></td></tr>
            <tr><td align="right">Phone No:</td><td><input type="text" name="contact_number" id="edit_contact_number" class="form-control"></td></tr>
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
let supplierCache = {};

function renderSuppliers(data) {
    const $tbody = $('#supplierTable tbody');
    $tbody.empty();
    supplierCache = {};

    const esc = (v) => {
        return $('<div>').text(v == null ? '' : v).html();
    };

    if (!data || !data.length) {
        $tbody.append('<tr><td colspan="7" class="text-center">No suppliers found.</td></tr>');
        return;
    }

    data.forEach((row, idx) => {
        supplierCache[row.sup_id] = row;
        const statusLabel = row.status == 1 ? 'Active' : 'Inactive';
        const statusClass = row.status == 1 ? '' : 'table-danger cancelled-row';
        const actionMenu = `
        <div class="btn-group">
            <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Action
            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item action-edit" href="#" data-id="${row.sup_id}">Edit</a>
                <a class="dropdown-item text-danger action-delete" href="#" data-id="${row.sup_id}">Delete</a>
            </div>
        </div>`;

        $tbody.append(`
            <tr class="${statusClass}">
                <td>${idx + 1}</td>
                <td>${esc(row.supplier_name)}</td>
                <td>${esc(row.tin_no)}</td>
                <td>${esc(row.address)}</td>
                <td>${esc(row.contact_number)}</td>
                <td>${esc(statusLabel)}</td>
                <td>${actionMenu}</td>
            </tr>
        `);
    });
}

function loadSuppliers() {
    $.get('contact/supplier_list.php', function(res) {
        if (res && res.success) {
            renderSuppliers(res.data);
        } else {
            notify('danger', 'Error', res && res.message ? res.message : 'Failed to load suppliers.');
        }
    }).fail(function() {
        notify('danger', 'Error', 'Failed to load suppliers.');
    });
}

function openEditModal(id) {
    const row = supplierCache[id];
    if (!row) {
        notify('danger', 'Not found', 'Unable to load supplier details.');
        return;
    }
    $('#edit_sup_id').val(row.sup_id);
    $('#edit_supplier_name').val(row.supplier_name);
    $('#edit_tin_no').val(row.tin_no);
    $('#edit_address').val(row.address);
    $('#edit_contact_number').val(row.contact_number);
    $('#edit_status').val(row.status);
    $('#edit_supplier_modal').modal('show');
}

$(document).ready(function() {
    loadSuppliers();

    // Add supplier
    $('#addSupplierForm').on('submit', function(e) {
        e.preventDefault();
        const formData = $(this).serialize() + '&action=add';
        $.post('contact/supplier_save.php', formData, function(res) {
            if (res && res.success) {
                notify('success', 'Success', res.message || 'Supplier added.');
                $('#add_supplier_modal').modal('hide');
                $('#addSupplierForm')[0].reset();
                loadSuppliers();
            } else {
                notify('danger', 'Error', res && res.message ? res.message : 'Failed to add supplier.');
            }
        }, 'json').fail(function() {
            notify('danger', 'Error', 'Failed to add supplier.');
        });
    });

    // Edit supplier
    $('#editSupplierForm').on('submit', function(e) {
        e.preventDefault();
        const formData = $(this).serialize() + '&action=edit';
        $.post('contact/supplier_save.php', formData, function(res) {
            if (res && res.success) {
                notify('success', 'Updated', res.message || 'Supplier updated.');
                $('#edit_supplier_modal').modal('hide');
                loadSuppliers();
            } else {
                notify('danger', 'Error', res && res.message ? res.message : 'Failed to update supplier.');
            }
        }, 'json').fail(function() {
            notify('danger', 'Error', 'Failed to update supplier.');
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
        const name = supplierCache[id] ? supplierCache[id].supplier_name : '';
        Swal.fire({
            title: 'Delete supplier?',
            html: `This will mark <b>${name || 'this supplier'}</b> as inactive.`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            confirmButtonText: 'Yes, delete',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (!result.isConfirmed) return;
            $.post('contact/supplier_delete.php', { sup_id: id }, function(res) {
                if (res && res.success) {
                    notify('success', 'Deleted', res.message || 'Supplier deleted.');
                    loadSuppliers();
                } else {
                    notify('danger', 'Error', res && res.message ? res.message : 'Failed to delete supplier.');
                }
            }, 'json').fail(function() {
                notify('danger', 'Error', 'Failed to delete supplier.');
            });
        });
    });
});
</script>

<?php include 'footer.php'; ?>
