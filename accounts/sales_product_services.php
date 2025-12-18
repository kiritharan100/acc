<?php include 'header.php'; ?>

<?php
$isVat = ($is_vat_registered == 1);
?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Sales Products &amp; Services</h4>
        </div>

        <div class="card">
            <div class="card-header d-flex">
                <button class="btn btn-primary" data-toggle="modal" data-target="#add_product_modal">Add New</button>
                <!-- <button type='button' id="exportButton" filename='<?php echo "Products_Services_".date('Y-m-d'); ?>.xlsx' class="btn btn-primary ml-2"><i class="ti-cloud-down"></i> Export</button> -->
            </div>
            <div class="card-block">
                <div class="table-responsive">
                    <table id="productTable" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Category</th>
                                <th>Product/Service</th>
                                <th>Income Account</th>
                                <?php if ($isVat): ?>
                                <th>VAT</th>
                                <?php endif; ?>
                                <th>Price</th>
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

<!-- Add Product/Service Modal -->
<div class="modal" id="add_product_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add Product/Service</h4>
                <hr>
                <form id="addProductForm">
                    <table width="100%">
                        <tr>
                            <td align="right">Category:</td>
                            <td>
                                <select name="category" class="form-control" required>
                                    <option value="">-- Select --</option>
                                    <option value="Service">Service</option>
                                    <option value="Non-inventory">Non-inventory</option>
                                    <option value="Inventory">Inventory</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Product/Service:</td>
                            <td><input type="text" name="product_name" class="form-control" required></td>
                        </tr>
                        <tr>
                            <td align="right">Income Account:</td>
                            <td><select name="income_account" class="form-control" id="add_income_account"
                                    required></select></td>
                        </tr>
                        <?php if ($isVat): ?>
                        <tr>
                            <td align="right">VAT:</td>
                            <td><select name="vat_id" class="form-control" id="add_vat_id" required></select></td>
                        </tr>
                        <?php endif; ?>
                        <tr>
                            <td align="right">Price:</td>
                            <td><input type="text" name="price" class="form-control"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button type="submit" class="btn btn-success mt-2 processing">Submit</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit Product/Service Modal -->
<div class="modal" id="edit_product_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Edit Product/Service</h4>
                <hr>
                <form id="editProductForm">
                    <input type="hidden" name="p_id" id="edit_p_id">
                    <table width="100%">
                        <tr>
                            <td align="right">Category:</td>
                            <td>
                                <select name="category" id="edit_category" class="form-control" required>
                                    <option value="">-- Select --</option>
                                    <option value="Service">Service</option>
                                    <option value="Non-inventory">Non-inventory</option>
                                    <option value="Inventory">Inventory</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Product/Service:</td>
                            <td><input type="text" name="product_name" id="edit_product_name" class="form-control"
                                    required></td>
                        </tr>
                        <tr>
                            <td align="right">Income Account:</td>
                            <td><select name="income_account" id="edit_income_account" class="form-control"
                                    required></select></td>
                        </tr>
                        <?php if ($isVat): ?>
                        <tr>
                            <td align="right">VAT:</td>
                            <td><select name="vat_id" id="edit_vat_id" class="form-control" required></select></td>
                        </tr>
                        <?php endif; ?>
                        <tr>
                            <td align="right">Price:</td>
                            <td><input type="text" name="price" id="edit_price" class="form-control"></td>
                        </tr>
                        <tr>
                            <td align="right">Status:</td>
                            <td>
                                <select name="status" id="edit_status" class="form-control">
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><button type="submit" class="btn btn-success mt-2">Update</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
const isVatClient = <?= $isVat ? 'true' : 'false' ?>;
let productCache = {};
let productTable = null;
let incomeAccountOptions = '';
let vatOptions = '';

function initProductTable() {
    $.fn.dataTable.ext.errMode = 'none';
    productTable = $('#productTable').DataTable({
        pageLength: 25,
        lengthMenu: [
            [25, 50, 100, 500],
            [25, 50, 100, 500]
        ],
        order: [
            [2, 'asc']
        ],
        columnDefs: [{
            orderable: false,
            targets: [<?= $isVat ? '7' : '6' ?>]
        }]
    });
}

function renderProducts(data) {
    const $tbody = $('#productTable tbody');
    if ($.fn.DataTable.isDataTable('#productTable')) {
        $('#productTable').DataTable().destroy();
    }
    $tbody.empty();
    productCache = {};

    const esc = (v) => $('<div>').text(v == null ? '' : v).html();
    const fmt = (val) => {
        const num = parseFloat(val);
        if (!isFinite(num) || num === 0) return '';
        return num.toLocaleString('en-US', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    };

    if (!data || !data.length) {
        $tbody.append('<tr><td colspan="<?= $isVat ? '8' : '7' ?>" class="text-center">No items found.</td></tr>');
        initProductTable();
        return;
    }

    data.forEach((row, idx) => {
        productCache[row.p_id] = row;
        const statusLabel = row.status == 1 ? 'Active' : 'Inactive';
        const statusClass = row.status == 1 ? '' : 'table-danger cancelled-row';
        const toggleLabel = row.status == 1 ? 'Inactivate' : 'Activate';
        const toggleClass = row.status == 1 ? 'text-danger' : 'text-success';
        const vatLabel = row.vat_name ? (row.vat_name + (row.vat_percentage !== null ?
            ` (${row.vat_percentage}%)` : '')) : '';
        const actionMenu = `
        <div class="btn-group">
            <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Action
            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item action-edit" href="#" data-id="${row.p_id}">Edit</a>
                <a class="dropdown-item ${toggleClass} action-toggle" href="#" data-id="${row.p_id}" data-status="${row.status}">${toggleLabel}</a>
            </div>
        </div>`;

        $tbody.append(`
            <tr class="${statusClass}">
                <td>${idx + 1}</td>
                <td>${esc(row.category)}</td>
                <td>${esc(row.product_name)}</td>
                <td>${esc(row.income_account_name || '')}</td>
                ${isVatClient ? `<td>${esc(vatLabel)}</td>` : ''}
                <td class="text-right">${fmt(row.price)}</td>
                <td>${esc(statusLabel)}</td>
                <td>${actionMenu}</td>
            </tr>
        `);
    });

    initProductTable();
}

function loadProducts() {
    $.get('product/product_list.php', function(res) {
        if (res && res.success) {
            renderProducts(res.data);
        } else {
            notify('danger', 'Error', res && res.message ? res.message : 'Failed to load items.');
        }
    }).fail(function() {
        notify('danger', 'Error', 'Failed to load items.');
    });
}

function loadIncomeAccounts(cb) {
    $.get('product/fetch_income_accounts.php', function(resp) {
        incomeAccountOptions = resp;
        $('#add_income_account').html(resp);
        $('#edit_income_account').html(resp);
        if (typeof cb === 'function') cb();
    }).fail(function() {
        incomeAccountOptions = "<option value=''>-- No accounts --</option>";
        $('#add_income_account').html(incomeAccountOptions);
        $('#edit_income_account').html(incomeAccountOptions);
        if (typeof cb === 'function') cb();
    });
}

function loadVatOptions(cb) {
    if (!isVatClient) {
        if (typeof cb === 'function') cb();
        return;
    }
    $.get('ajax/fetch_vat_options.php', function(resp) {
        vatOptions = resp;
        $('#add_vat_id').html(resp);
        $('#edit_vat_id').html(resp);
        if (typeof cb === 'function') cb();
    }).fail(function() {
        vatOptions = "<option value=''>-- No VAT --</option>";
        $('#add_vat_id').html(vatOptions);
        $('#edit_vat_id').html(vatOptions);
        if (typeof cb === 'function') cb();
    });
}

function openEditModal(id) {
    const row = productCache[id];
    if (!row) {
        notify('danger', 'Not found', 'Unable to load item details.');
        return;
    }
    $('#edit_p_id').val(row.p_id);
    $('#edit_category').val(row.category);
    $('#edit_product_name').val(row.product_name);
    $('#edit_income_account').val(row.income_account);
    if (isVatClient) {
        $('#edit_vat_id').val(row.vat_id);
    }
    $('#edit_price').val(row.price);
    $('#edit_status').val(row.status);
    $('#edit_product_modal').modal('show');
}

$(document).ready(function() {
    loadIncomeAccounts(function() {
        loadVatOptions(loadProducts);
    });

    $('#addProductForm').on('submit', function(e) {
        e.preventDefault();
        const formData = $(this).serialize() + '&action=add';
        $.post('product/product_save.php', formData, function(res) {
            if (res && res.success) {
                notify('success', 'Success', res.message || 'Item added.');
                $('#add_product_modal').modal('hide');
                $('#addProductForm')[0].reset();
                $('#add_income_account').html(incomeAccountOptions);
                if (isVatClient) $('#add_vat_id').html(vatOptions);
                location.reload();
            } else {
                notify('danger', 'Error', res && res.message ? res.message :
                    'Failed to add item.');
            }
        }, 'json').fail(function() {
            notify('danger', 'Error', 'Failed to add item.');
        });
    });

    $('#editProductForm').on('submit', function(e) {
        e.preventDefault();
        const formData = $(this).serialize() + '&action=edit';
        $.post('product/product_save.php', formData, function(res) {
            if (res && res.success) {
                notify('success', 'Updated', res.message || 'Item updated.');
                $('#edit_product_modal').modal('hide');
                location.reload();
            } else {
                notify('danger', 'Error', res && res.message ? res.message :
                    'Failed to update item.');
            }
        }, 'json').fail(function() {
            notify('danger', 'Error', 'Failed to update item.');
        });
    });

    $(document).on('click', '.action-edit', function(e) {
        e.preventDefault();
        const id = $(this).data('id');
        openEditModal(id);
    });

    $(document).on('click', '.action-toggle', function(e) {
        e.preventDefault();
        const id = $(this).data('id');
        const row = productCache[id] || {};
        const name = row.product_name || '';
        const currentStatus = parseInt($(this).data('status'), 10);
        const newStatus = currentStatus === 1 ? 0 : 1;
        const actionTitle = newStatus === 1 ? 'Activate item?' : 'Inactivate item?';
        const actionHtml = newStatus === 1 ?
            `This will mark <b>${name || 'this item'}</b> as active.` :
            `This will mark <b>${name || 'this item'}</b> as inactive.`;
        Swal.fire({
            title: actionTitle,
            html: actionHtml,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: newStatus === 1 ? '#28a745' : '#d33',
            confirmButtonText: 'Yes',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (!result.isConfirmed) return;
            $.post('product/product_toggle.php', {
                p_id: id,
                status: newStatus
            }, function(res) {
                if (res && res.success) {
                    notify('success', 'Updated', res.message || 'Status updated.');
                    loadProducts();
                } else {
                    notify('danger', 'Error', res && res.message ? res.message :
                        'Status change failed.');
                }
            }, 'json').fail(function() {
                notify('danger', 'Error', 'Status change failed.');
            });
        });
    });
});
</script>

<?php include 'footer.php'; ?>
