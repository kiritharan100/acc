<?php 
 
include 'header.php'; ?>

<?php
$clientDateRow = ['business_start_date' => null, 'book_start_from' => null];
$clientDateQ = mysqli_query($con, "SELECT business_start_date, book_start_from FROM client_registration WHERE c_id = '$location_id' LIMIT 1");
if ($clientDateQ && mysqli_num_rows($clientDateQ) > 0) {
    $clientDateRow = mysqli_fetch_assoc($clientDateQ);
}

$business_start_date = $clientDateRow['business_start_date'];
$book_start_from     = $clientDateRow['book_start_from'];

// Minimum allowed start date = later of business_start_date and book_start_from (when provided)
$min_start_date = '';
if (!empty($business_start_date) && !empty($book_start_from)) {
    $min_start_date = (strtotime($book_start_from) >= strtotime($business_start_date)) ? $book_start_from : $business_start_date;
} elseif (!empty($book_start_from)) {
    $min_start_date = $book_start_from;
} elseif (!empty($business_start_date)) {
    $min_start_date = $business_start_date;
}

// Fetch all periods for this location 
$count = 0;
$periods = [];
$q = mysqli_query($con, "
    SELECT id, perid_from, period_to, due_date, lock_period, status 
    FROM accounts_accounting_period 
    WHERE location_id = '$location_id' and status IN (1)
    ORDER BY perid_from DESC
");

while ($row = mysqli_fetch_assoc($q)) { $periods[] = $row;
$count = 1; }

 

if (isset($_REQUEST['setup_required']) && $_REQUEST['setup_required'] == 1) {
    echo "<script> notify('danger','Setup Required ','Please add accounting periods to proceed.'); </script>";
}

?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h5>ACCOUNTS | <?= $client_name ?> | ACCOUNTING PERIODS <?= $count ?></h5>
        </div>

        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-block">

                        <div align="right">
                            <button id="exportButton" filename="Accounting_periods.xlsx" class="btn btn-primary">
                                <i class="ti-cloud-down"></i> Export
                            </button>

                            <button class="btn btn-success" onclick="addNew();">
                                + Add Accounting Period
                            </button>
                        </div>

                        <hr>

                        <div class="table-responsive">
                            <table id="example" class="table table-bordered table-striped table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Period From</th>
                                        <th>Period To</th>
                                        <th>Due Date</th>
                                        <th>Log Period</th>
                                        <!-- <th>Status</th> -->
                                        <th width="140px">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($periods as $p): ?>
                                    <?php 
                  if($count == 1){
                    $next_day = date('Y-m-d', strtotime($p['period_to']. ' + 1 days'));
                    $next_year_end = date('Y-m-d', strtotime($p['period_to']. ' + 1 years'));
                    $next_year_end_due = date('Y-m-d', strtotime($next_year_end. ' + 6 months'));
                  }
                     
                  ?>
                                    <tr>
                                        <td><?= $count; ?></td>
                                        <td><?= date('d-m-Y', strtotime($p['perid_from'])) ?></td>
                                        <td><?= date('d-m-Y', strtotime($p['period_to'])) ?></td>
                                        <td><?= date('d-m-Y', strtotime($p['due_date'])) ?></td>
                                        <td align="center">
                                            <?php if($p['lock_period'] == 1): ?>
                                            <i class="fas fa-lock text-danger lock-icon"
                                                style="cursor:pointer;font-size:18px;" data-id="<?= $p['id']; ?>"
                                                data-state="1"></i>
                                            <?php else: ?>
                                            <i class="fas fa-unlock text-success lock-icon"
                                                style="cursor:pointer;font-size:18px;" data-id="<?= $p['id']; ?>"
                                                data-state="0"></i>
                                            <?php endif; ?>

                                        </td>
                                        <!-- <td><?= $p['status'] ? "Active" : "Inactive" ?></td> -->

                                        <td>
                                            <button type="button" class="btn btn-sm btn-primary"
                                                onclick="loadEdit(<?= $p['id'] ?>);">
                                                Edit
                                            </button>

                                            <button type="button" class="btn btn-sm btn-danger"
                                                onclick="deletePeriod(<?= $p['id'] ?>);">
                                                Delete
                                            </button>
                                        </td>
                                    </tr>
                                    <?php 
                $count++;
                endforeach; ?>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <?php 
        if ($count == 0) {
            // Default period based on bookkeeping start (preferred) or business start date, otherwise fall back
            if (!empty($book_start_from)) {
                $next_day = $book_start_from;
            } elseif (!empty($business_start_date)) {
                $next_day = $business_start_date;
            } else {
                $today = date('Y-m-d');
                $current_year = date('Y');
                $last_year = $current_year - 1;
                $april_first = $current_year . '-04-01';
                if ($today > $april_first) {
                    $next_day = date('Y-m-d', strtotime($current_year . '-04-01'));
                } else {
                    $next_day = date('Y-m-d', strtotime($last_year . '-01-01'));
                }
            }

            // End date: 31 March of same year if start on/before March, otherwise 31 March of next year
            $start_ts = strtotime($next_day);
            if ($start_ts) {
                $start_year = (int)date('Y', $start_ts);
                $start_month = (int)date('n', $start_ts);
                $period_end_year = ($start_month > 3) ? ($start_year + 1) : $start_year;
                $next_year_end = date('Y-m-d', strtotime($period_end_year . '-03-31'));
            } else {
                $next_year_end = date('Y-m-d', strtotime($next_day . ' +1 year'));
            }
            $next_year_end_due = date('Y-m-d', strtotime($next_year_end . ' +6 months'));
        }
        ?>

        <!-- =======================================
         ADD / EDIT MODAL
    ===========================================-->
        <div class="modal fade" id="periodModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <form id="period_form" onsubmit="return savePeriod();">

                        <div class="modal-header">
                            <h5 class="modal-title" id="periodModalLabel">Add Accounting Period</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">

                            <input type="hidden" name="id" id="id">
                            <input type="hidden" name="action" id="action" value="add">


                            <div class="form-group row align-items-center">

                                <label class="col-md-3 col-form-label text-right">Period From</label>
                                <div class="col-md-3">
                                    <input type="text" name="perid_from" class="form-control date_input"
                                        placeholder="dd/mm/yyyy" required
                                        value='<?= isset($next_day) ? date('d/m/Y', strtotime($next_day)) : '' ?>'>
                                </div>

                                <!-- Period To -->
                                <label class="col-md-2 col-form-label text-right">Period To</label>
                                <div class="col-md-3">
                                    <input type="text" name="period_to" class="form-control date_input"
                                        placeholder="dd/mm/yyyy" required
                                        value='<?= isset($next_year_end) ? date('d/m/Y', strtotime($next_year_end)) : '' ?>'>
                                </div>
                            </div>
                            <div class="form-group row align-items-center">
                                <!-- Due Date -->
                                <label class="col-md-3 col-form-label text-right">Due Date</label>
                                <div class="col-md-3">
                                    <input type="text" name="due_date" class="form-control date_input"
                                        placeholder="dd/mm/yyyy" required
                                        value='<?= isset($next_year_end_due) ? date('d/m/Y', strtotime($next_year_end_due)) : '' ?>'>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-success">Save</button>
                            </div>
                    </form>
                </div>
            </div>
        </div>

    </div>



</div>

<style>
/* .datepicker-group .form-control { min-width: 120px; }
.datepicker-group .input-group-append { vertical-align: middle; }
.datepicker-group.flex-nowrap { flex-wrap: nowrap; } */
</style>

<script>
// $(function() {
//   $('.datepicker').datepicker({
//       format: 'dd-mm-yyyy',
//       autoclose: true,
//       todayHighlight: true
//   });
// });

/*-----------------------------------------
  ADD NEW
------------------------------------------*/
function addNew() {
    $('#period_form')[0].reset();
    $('#action').val('add');
    $('#periodModalLabel').text("Add Accounting Period");
    $('#periodModal').modal('show');
}

/*-----------------------------------------
  LOAD EDIT DATA
------------------------------------------*/
function loadEdit(id) {
    $.post("ajax_accounting_period/load_single.php", {
        id: id
    }, function(res) {
        if (res.success) {

            $('#id').val(res.data.id);
            $('#action').val('edit');

            $('input[name=perid_from]').val(formatDMY(res.data.perid_from));
            $('input[name=period_to]').val(formatDMY(res.data.period_to));
            $('input[name=due_date]').val(formatDMY(res.data.due_date));

            $('input[name=lock_period]').prop('checked', res.data.lock_period == 1);
            $('select[name=status]').val(res.data.status);

            $('#periodModalLabel').text("Edit Accounting Period");
            $('#periodModal').modal('show');
        } else {
            notify("error", "Error", res.msg);
        }
    }, 'json');
}

/*-----------------------------------------
  SAVE ADD / EDIT
------------------------------------------*/
function savePeriod() {
    $.post("ajax_accounting_period/save_period.php",
        $('#period_form').serialize(),
        function(res) {
            if (res.success) {
                notify("success", "Great Job :", res.msg);
                setTimeout(() => location.reload(), 1000);
            } else {
                notify("error", "Error :", res.msg);
            }
        }, 'json'
    );
    return false;
}

/*-----------------------------------------
  DELETE
------------------------------------------*/
function deletePeriod(id) {
    Swal.fire({
        title: 'Are you sure?',
        html: `<div style='font-size:15px;'>Do you want to delete the period?<br><b>The action cannot be undone.</b><br><br><span style='color:#888;'>Note:Existing transactions recorded within this period will remain unchanged.</span></div>`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            $.post("ajax_accounting_period/delete_period.php", {
                id: id
            }, function(res) {
                if (res.success) {
                    notify("success", "Deleted :", res.msg);
                    setTimeout(() => location.reload(), 800);
                }
            }, 'json');
        }
    });
}



/*-------------------------------------------------------
   LOCK / UNLOCK PERIOD
-------------------------------------------------------*/
$(document).on("click", ".lock-icon", function() {

    let id = $(this).data("id");
    let state = $(this).data("state"); // 1 = locked, 0 = unlocked

    if (state == 1) {
        // Currently locked → ask to unlock
        Swal.fire({
            title: 'Unlock Period?',
            html: "<b>Do you want to unlock this accounting period?</b>",
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes, Unlock',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                toggleLock(id, 0, $(this));
            }
        });

    } else {
        // Currently unlocked → ask to lock
        Swal.fire({
            title: 'Lock Period?',
            html: "<b>Do you want to lock this accounting period?</b>",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, Lock',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                toggleLock(id, 1, $(this));
            }
        });
    }

});


function toggleLock(id, newState, iconObj) {

    $.post("ajax_accounting_period/update_lock.php", {
            id: id,
            state: newState
        },
        function(res) {

            if (res.success) {

                // Update icon on screen instantly
                if (newState == 1) {
                    iconObj.removeClass("fa-unlock text-success")
                        .addClass("fa-lock text-danger")
                        .data("state", 1);
                } else {
                    iconObj.removeClass("fa-lock text-danger")
                        .addClass("fa-unlock text-success")
                        .data("state", 0);
                }

                notify("success", "Updated", res.msg);

            } else {
                notify("error", "Error", res.msg);
            }
        }, 'json');
}
</script>

<?php include 'footer.php'; ?>
