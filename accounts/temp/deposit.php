<?php include("header.php");

$start_date = $_GET['start_date'] ?? date('Y-m-d', strtotime('-31 days'));
$end_date   = $_GET['end_date'] ?? date('Y-m-t');
$start_datetime = $start_date . ' 00:00:00';
$end_datetime   = $end_date . ' 23:59:59';

// Fetch deposit accounts (Cash in Hand group, excluding ca_id = 7)
$accounts = mysqli_query($con, "SELECT ca_id, ca_name FROM acc_chart_of_accounts 
                                  WHERE ca_group = 'Cash in Hand' AND ca_id != 7 AND ca_id != 44 AND status = 1 
                                ORDER BY ca_name");
?>

<div class="content-wrapper">
  <div class="container-fluid">
    <div class="main-header">
      <h5>ACCOUNTS | <?= $client_name ?> | DEPOSITS</h5>
    </div>

    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-block">

            <div class="d-flex justify-content-between align-items-center mb-3">
              <form method="get" class="form-inline">
                <label for="start_date">Start:</label>
                <input type="date" name="start_date" value="<?= $start_date ?>" class="form-control mx-2" required>
                <label for="end_date">End:</label>
                <input type="date" name="end_date" value="<?= $end_date ?>" class="form-control mx-2" required>
                <button type="submit" class="btn btn-primary">Filter</button>
              </form>
              <button class="btn btn-success" onclick="openDepositModal()">+ Record Deposit</button>
            </div>

            <table id="example" class="table table-bordered table-striped table-sm">
              <thead class="thead-dark">
                <tr>
                  <th>#</th>
                  <th>Date</th>
                  <th>From (Cash)</th>
                  <th>To Account</th>
                  <th>Amount</th>
                  <th>Memo</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
              <?php
                $sql = "SELECT t1.source_id, t1.t_date, t1.t_memo, t1.debit, t1.status, acc.ca_name
                        FROM acc_transaction t1
                        LEFT JOIN acc_chart_of_accounts acc ON t1.ca_id = acc.ca_id
                        WHERE t1.source = 'Deposit' 
                          AND t1.credit = 0 
                          AND t1.location_id = '$location_id' 
                          AND t1.t_date BETWEEN '$start_datetime' AND '$end_datetime'
                        GROUP BY t1.source_id
                        ORDER BY t1.t_date DESC";

                $res = mysqli_query($con, $sql);
                $count = 1;
                while ($row = mysqli_fetch_assoc($res)) {
                  $cancelled = $row['status'] == 0;
                  $row_class = $cancelled ? 'class="table-danger"' : '';
                  echo "<tr $row_class>
                          <td>{$count}</td>
                          <td>{$row['t_date']}</td>
                          <td>Cash in Hand</td>
                          <td>{$row['ca_name']}</td>
                          <td class='text-right'>" . number_format($row['debit'], 2) . "</td>
                          <td>{$row['t_memo']}</td>
                          <td>" . ($cancelled ? 'Cancelled' : 'Posted') . "</td>
                          <td>";
                  if (!$cancelled) {
                    echo "<button class='btn btn-danger btn-sm' onclick='cancelDeposit({$row['source_id']})'>Cancel</button>";
                  }
                  echo "</td></tr>";
                  $count++;
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

<!-- Modal -->
<div class="modal fade" id="depositModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <form method="post" id="depositForm" class="processing_form">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Record Deposit</h5>
        </div>
        <div class="modal-body">
          <div class="alert alert-info" id="cashBalance">Loading balance...</div>
          <div class="form-group">
            <label>Date</label>
            <input type="date" name="deposit_date" class="form-control" value="<?= date('Y-m-d') ?>" required>
          </div>
          <div class="form-group">
            <label>To Account</label>
            <select name="to_account" class="form-control select2_single" required>
              <option value="">-- Select Account --</option>
              <?php while ($a = mysqli_fetch_assoc($accounts)) {
                echo "<option value='{$a['ca_id']}'>{$a['ca_name']}</option>";
              } ?>
            </select>
          </div>
          <div class="form-group">
            <label>Amount</label>
            <input type="number" name="amount" class="form-control  " step="0.01" required>
          </div>
          <div class="form-group">
            <label>Memo</label>
            <textarea name="memo" class="form-control"></textarea>
          </div>
          <input type="hidden" name="location_id" value="<?= $location_id ?>">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-success processing_button">Save Deposit</button>
        </div>
      </div>
    </form>
  </div>
</div>

<script>
function openDepositModal() {
  $('#depositForm')[0].reset();
  $('select[name="to_account"]').val('').trigger('change');
  $('#depositModal').modal('show');

  $.get('ajax/get_cash_balance.php', { location_id: <?= $location_id ?> }, function(balance) {
    // $('#cashBalance').html('Cash in Hand Balance: <strong>' + parseFloat(balance).toFixed(2) + '</strong>');
    $('#cashBalance').html('Cash in Hand Balance: <strong>' + parseFloat(balance).toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) + '</strong>');
  });
}

$('#depositForm').on('submit', function(e) {
  e.preventDefault();
  const formData = new FormData(this);
  fetch('ajax/save_deposit.php', {
    method: 'POST',
    body: formData
  }).then(res => res.json()).then(data => {
    if (data.status === 'success') {
      notify('success', 'Saved', data.message);
      setTimeout(() => location.reload(), 1000);
    } else {
      notify('danger', 'Error', data.message);
    }
  }).catch(() => {
    notify('danger', 'Error', 'Failed to save deposit.');
  });
});

 function cancelDeposit(source_id) {
    
  Swal.fire({
    title: 'Cancel Deposit?',
    text: "This will mark the deposit as cancelled.",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#d33',
    cancelButtonColor: '#aaa',
    confirmButtonText: 'Yes, cancel it'
  }).then((result) => {
    if (result.isConfirmed) {
      $.post('ajax/delete_deposit.php', {
        source_id: source_id,
        location_id: <?= $location_id ?>
      }, function(res) {
        notify('success', 'Cancelled', res);
        setTimeout(() => location.reload(), 1000);
      });
    }
  });
}


$(document).ready(function() {
  $('#example').DataTable({ pageLength: 50 });
  $('.select2_single').select2({ width: '100%' });
});
</script>

<?php include("footer.php"); ?>
