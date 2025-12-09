<?php
include 'header.php';

// Ensure $location_id is set in the header/session
$location_id = $location_id ?? 0;

// Default date range values
$end_date = isset($_GET['end_date']) ? $_GET['end_date'] : date('Y-m-d'); // today
$start_date = isset($_GET['start_date']) ? $_GET['start_date'] : date('Y-m-d', strtotime('-31 days')); // 29 days ago (so total 30 days including today)


?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
            <h4>Day End Process</h4>
        </div>

  
  
      <div class="card">
            <div class="card-block">
                
            <!-- Date Range Filter -->
        <form method="get" class="form-inline mb-3">
            <label for="start_date">Start Date:&nbsp;</label>
            <input type="date" name="start_date" id="start_date" class="form-control mr-3" value="<?= htmlspecialchars($start_date) ?>" required>

            <label for="end_date">End Date:&nbsp;</label>
            <input type="date" name="end_date" id="end_date" class="form-control mr-3" value="<?= htmlspecialchars($end_date) ?>" required>

            <button type="submit" class="btn btn-primary mr-3">Filter</button>
             <button type='button' id="exportButton" filename='<?php echo "DAY_END_".$start_date."_".$end_date; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>

            <button type="button" disabled class="btn btn-primary"  id="todayShiftsBtn" >Day End Process</button>
        </form>
        <hr>

        <!-- Bootstrap Table -->
   <?php
 
$count = 1;
// Fetch all day end records (you may want to filter by location or date)
$sql = "    SELECT id, location_id, serial_no, date_ended, created_by, created_on, status, posted,
           total_cash_settled, total_card_settled, total_credit_settle, 
           fuel_purchase, oil_purchase, fuel_sales, oil_sales, 
           fuel_short_excess, oil_short_excess 
    FROM day_end_process
    WHERE date_ended BETWEEN '$start_date' AND '$end_date' and location_id='$location_id'
    ORDER BY  serial_no DESC";

$result = mysqli_query($con, $sql);
?>

<div class="table-responsive">
    <table id='example' class="table table-bordered table-hover" style="font-size:13px;">
        <thead class="thead-light">
            <tr>
                <th>#</th>
                <th>No</th>
                <th>Date Ended</th>
                <th>Fuel Sales</th>
                <th>Oil Sales</th>
                <th>Cash Settled</th>
                <th>Card Settled</th>
                <th>Credit Settled</th>
                <th>Fuel Sh/Ex</th>
                <th>Oil Sh/Ex</th>
                <th>Fuel Purchase</th>
                <th>Oil Purchase</th>
                <th>Created On</th>
                 <th>Reports</th>
                <th>Action</th>
                
            </tr>
        </thead>
        <tbody>
        <?php if ($result && mysqli_num_rows($result) > 0): ?>
            <?php while ($row = mysqli_fetch_assoc($result)): ?>
                <tr <?php if($row['posted'] == 1) { echo "style='background-color:#bdf69f;'"; }?>>
                    <td class="text-center"><?= htmlspecialchars($count) ?></td>
                    <td class="text-center"><?= htmlspecialchars($row['serial_no']) ?></td>
                    <td class="text-center"><?= htmlspecialchars($row['date_ended']); if($count ==1){ $pick_last_date = $row['date_ended']; } ?></td>
                    <td class="text-right"><?= number_format($row['fuel_sales'], 2) ?></td>
                    <td class="text-right"><?= number_format($row['oil_sales'], 2) ?></td>
                    <td class="text-right"><?= number_format($row['total_cash_settled'], 2) ?></td>
                    <td class="text-right"><?= number_format($row['total_card_settled'], 2) ?></td>
                    <td class="text-right"><?= number_format($row['total_credit_settle'], 2) ?></td>
                    <td class="text-right"><?= number_format($row['fuel_short_excess'], 2) ?></td>
                    <td class="text-right"><?= number_format($row['oil_short_excess'], 2) ?></td>
                    <td class="text-right"><?= number_format($row['fuel_purchase'], 2) ?></td>
                    <td class="text-right"><?= number_format($row['oil_purchase'], 2) ?></td>
                    <td class="text-center"><?= date('n-j g:ia', strtotime($row['created_on'])) ?></td>
                    <td>
                        <select class="form-control report-select" style='height:15px; width:100px;' data-day_no='<?= htmlspecialchars($row['serial_no']) ?>' data-date="<?= htmlspecialchars($row['date_ended']); ?>">
                        <option value="">Select</option>
                        <option value="sr">Sales Reconciliation</option>
                        <option value="sales_f15">Sales F15</option>
                        <option value="f21c">Sales F21C</option>
                        <option value="<?php if($row['posted'] == 1){ echo "9c";}else{ echo "9c-editable";} ?>">Card Sales - 9C</option>
                        <option value="<?php if($row['posted'] == 1){ echo "f9c";}else{ echo "f9c-editable"; }?>">Credit Sales F9c</option>
                        <option value="f16b">Purchase F16B</option>
                        </select>
                        
                        
                    </td>
                    

              <td class="text-center">
  <?php if ($row['posted'] == 0): ?>
    <button class="btn btn-primary btn-sm view-dayend-btn" data-id="<?= $row['serial_no'] ?>">
      <i class="fa fa-upload"></i> Post
    </button>
  <?php else: ?>
    <select class="form-control form-control-sm journal-action-dropdown" data-serial="<?= $row['serial_no'] ?>">
      <option selected disabled>Choose</option>
      <option value="view">View</option>
      <option value="entry">View Entry</option>
      <option value="report">View Report</option>
    </select>
  <?php endif; ?>
</td>

                   
                </tr>
            <?php $count++; endwhile; ?>
        <?php else: ?>
            <tr><td colspan="14" class="text-center">No records found.</td></tr>
        <?php endif; ?>
        </tbody>
    </table>
    
    
<script>
document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.report-select').forEach(function(select) {
    select.addEventListener('change', function() {
      var option = this.value;
      var date = this.dataset.date;
      var day_no = this.dataset.day_no;

      if (option === 'sales_f15') {
        var url = 'report_sales_monthly_total.php?date=' + encodeURIComponent(date);
        window.open(url, '_blank');
      }
      if (option === 'f21c') {
        var url = 'report_sales_monthly.php?date=' + encodeURIComponent(date);
        window.open(url, '_blank');
      }
            if (option === '9c-editable') {
        var url = 'report_credit_card.php?from_date=' + encodeURIComponent(date) + '&to_date=' + encodeURIComponent(date) + '&cash=257b707bec895aee405e60cb19a6a608f8348bdc' ;
        window.open(url, '_blank');
      }
           if (option === '9c') {
        var url = 'report_credit_card.php?from_date=' + encodeURIComponent(date) + '&to_date=' + encodeURIComponent(date)   ;
        window.open(url, '_blank');
      }

       if (option === 'f9c-editable') {
        var url = 'report_credit_sales.php?from_date=' + encodeURIComponent(date) + '&to_date=' + encodeURIComponent(date) + '&cash=257b707bec895aee405e60cb19a6a608f8348bdc'   ;
        window.open(url, '_blank');
      }
      
       if (option === 'f9c') {
        var url = 'report_credit_sales.php?from_date=' + encodeURIComponent(date) + '&to_date=' + encodeURIComponent(date) ;
        window.open(url, '_blank');
      }
             if (option === 'f16b') {
        var url = 'report_purchase_detail.php?from_date=' + encodeURIComponent(date) + '&to_date=' + encodeURIComponent(date) ;
        window.open(url, '_blank');
      }
      
             if (option === 'sr') {
        var url = 'report_pump.php?day_end=' + encodeURIComponent(day_no) ;
        window.open(url, '_blank');
      }
    
    

      // Reset back to default
      this.value = '';
    });
  });
});
</script>


</div>






    </div>
</div>
 

</div>
</div>
<div class="modal fade" id="viewJournalModal" tabindex="-1" role="dialog" aria-labelledby="viewJournalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Journal Entry</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span>&times;</span>
        </button>
      </div>
      <div class="modal-body" id="journalEntryContent">
        <p>Loading...</p>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="viewDayEndModal" tabindex="-1" role="dialog" aria-labelledby="viewDayEndLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
         <form id="AccSubmitForm" method="POST" autocomplete="off">
      <div class="modal-header">
        <h5 class="modal-title">Day End Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">

          <span>&times;</span>
        </button>
      </div>
      <div class="modal-body" id="viewDayEndContent">
        <p>Loading...</p>
      </div>
  
        <div class="modal-footer">
           <label style="display: flex; align-items: center; font-size: 1.3rem; font-weight: bold; color: green; cursor: pointer; ">
  <input type="checkbox" id='accounts_checkbox' style="width: 20px; height: 20px; margin-right: 10px;"  >
  I have verified all the transaction and ready to post to accouts
</label>

<input type='hidden' name='location_id' value='<?php echo $location_id; ?>'>
          <button type="submit" class="btn btn-primary processingxyz" id='record_accounts' disabled >Post To account</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        </form>
    </div>
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const checkbox = document.getElementById('accounts_checkbox');
    const submitBtn = document.getElementById('record_accounts');

    checkbox.addEventListener('change', function () {
      submitBtn.disabled = !this.checked;
    });
  });
</script>

 <script>
  document.getElementById('AccSubmitForm').addEventListener('submit', function(event) {
    const form = this;

    // Validate form
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
      form.classList.add('was-validated');
      return;
    }

    // Get the submit button by class
    const button = form.querySelector('button.processingxyz');
    if (button) {
      button.disabled = true;
      button.innerHTML = 'Please wait <i class="fa fa-gear fa-spin" style="font-size:24px"></i>';
    }
  });


  
</script>


<script>
document.getElementById('AccSubmitForm').addEventListener('submit', function (event) {
  event.preventDefault();
  const form = this;

  const submitBtn = document.getElementById('record_accounts');
  submitBtn.disabled = true;
  submitBtn.innerHTML = 'Posting... <i class="fa fa-gear fa-spin"></i>';

  const serialNo = document.getElementById('serial_no').value;

  $.ajax({
    url: 'ajax_day_end/ajax_post_day_end.php?',
    type: 'POST',
    data: { serial_no: serialNo,location_id: <?php echo $location_id; ?> },
    dataType: 'json',
    success: function (response) {
      if (response.success) {
        notify('success', 'Posted to accounts!');
        $('#viewDayEndModal').modal('hide');
        setTimeout(() => location.reload(), 1500);
      } else {
        notify('danger', 'Error', response.message || 'Failed to update.');
      }
    },
    error: function (xhr, status, error) {
      notify('danger', 'Error', 'AJAX failed: ' + error);
    },
    complete: function () {
      submitBtn.disabled = false;
      submitBtn.innerHTML = 'Post To account';
    }
  });
});
</script>





<div class="modal fade" id="todayShiftsModal" ...>
  <div class="modal-dialog modal-lg" ...>
    <div class="modal-content">
      <form id="addDayEndForm" method="POST" autocomplete="off">
        <div class="modal-header">
          <h5 class="modal-title" id="todayShiftsLabel">Day End Process</h5>
          <!-- form tag starts here -->
        </div>
        <div class="modal-body">
          <div class="col-md-4">
            <label for="end_date" class="form-label">Process Day End For</label>

            <?php
            $next_date = isset($pick_last_date) && !empty($pick_last_date)
    ? date('Y-m-d', strtotime($pick_last_date . ' +1 day'))
    : date('Y-m-d');
    
    
 
            $today = date('Y-m-d');
            $minDate = date('Y-m-d', strtotime('-3 days'));
            ?>
            <input type="date" name="end_date" class="form-control"
       value="<?= htmlspecialchars($next_date) ?>"
       min="<?= $minDate ?>"
       max="<?= $today ?>"
       style="width:150px;" required> <br>
          </div>

          <div id="todayShiftsContent">Loading...</div>
          <!-- Make sure the hidden inputs get injected inside the form, for example in #todayShiftsContent -->


          <label style="display: flex; align-items: center; font-size: 1.3rem; font-weight: bold; color: green; cursor: pointer; ">
  <input type="checkbox" id='day_end_checkbox' style="width: 20px; height: 20px; margin-right: 10px;"  >
  I confirm that all transactions are verified and  ready for day end
</label>
        </div>
       
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary processingx"  id="record_day_end_btn" disabled >Record Day End</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const checkbox = document.getElementById('day_end_checkbox');
    const submitBtn = document.getElementById('record_day_end_btn');

    checkbox.addEventListener('change', function () {
      submitBtn.disabled = !this.checked;
    });
  });
</script>

 


 <script>
 
document.getElementById('todayShiftsBtn').addEventListener('click', function() {
    $('#todayShiftsModal').modal('show');
    $('#todayShiftsContent').html('Loading...');

   $.ajax({
    url: 'ajax_day_end/ajax_get_today_shifts.php?location_id=<?php echo $location_id; ?>',
    type: 'POST',
    dataType: 'json',
    success: function(response) {
        if (response.success) {
           
       


            $('#todayShiftsContent').html(response.html);
             bindDayEndCashListener(); 
        } else {
            $('#todayShiftsContent').html('<p>Error loading data.</p>');
        }
    },
    error: function() {
        $('#todayShiftsContent').html('<p>Error connecting to server.</p>');
    }
});

});

function bindDayEndCashListener() {
    const totalCashInput = document.getElementById('total_cash');
    const dayEndCashInput = document.getElementById('day_end_cash');
    const dayEndShortInput = document.getElementById('day_end_short');

    if (!totalCashInput || !dayEndCashInput || !dayEndShortInput) return;

    function calculateShortExcess() {
        const systemCash = parseFloat(totalCashInput.value) || 0;
        const userCash = parseFloat(dayEndCashInput.value) || 0;
        const difference = (userCash - systemCash).toFixed(2);
        dayEndShortInput.value = difference;
    }

    // Remove any existing listener before adding (to prevent duplicates)
    dayEndCashInput.removeEventListener('input', calculateShortExcess);
    dayEndCashInput.addEventListener('input', calculateShortExcess);

    calculateShortExcess();  // initialize
}
    
$(document).ready(function() {
    $('#addDayEndForm').on('submit', function(e) {
        e.preventDefault();

        // Optional: disable submit button to prevent double submits
        $('.processing').prop('disabled', true).text('Processing...');

        // Collect form data, including hidden inputs
        var formData = $(this).serialize();

        $.ajax({
            url: 'ajax_day_end/save_day_end.php?location_id=<?php echo $location_id; ?>', // Your PHP endpoint to handle save
            type: 'POST',
             data: { location_id: <?php echo $location_id; ?> }, 
            data: formData,
            dataType: 'json',
           success: function(response) {
    $('.processing').prop('disabled', false).text('Record Day End');
    if (response.success) {
        notify('success', 'Day end processed successfully!');
        setTimeout(function() {
            $('#todayShiftsModal').modal('hide');
            location.reload(); // refresh page after 2 seconds
        }, 2000);
    } else {
        alert('Error: ' + response.message);
    }
},
            error: function(xhr, status, error) {
                $('.processing').prop('disabled', false).text('Record Day End');
                alert('AJAX Error: ' + error);
            }
        });
    });

    $('#example').DataTable({
        "pageLength": 50
    });


});

 

$(document).on('click', '.view-dayend-btn', function () {
    var serialNo = $(this).data('id');
    $('#viewDayEndModal').modal('show');
    $('#viewDayEndContent').html('<p>Loading...</p>');

    $.ajax({
        url: 'ajax_day_end/ajax_view_day_end.php',
        type: 'GET',
        data: { serial_no: serialNo ,location_id: <?php echo $location_id; ?>},
        success: function (res) {
            $('#viewDayEndContent').html(res);
        },
        error: function () {
            $('#viewDayEndContent').html('<p class="text-danger">Error loading details.</p>');
        }
    });
});

</script>

<?php include 'footer.php'; ?>


<script>
  document.getElementById('addDayEndForm').addEventListener('submit', function(event) {
    const form = this;

    // Validate form
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
      form.classList.add('was-validated');
      return;
    }

    // Get the submit button by class
    const button = form.querySelector('button.processingx');
    if (button) {
      button.disabled = true;
      button.innerHTML = 'Please wait <i class="fa fa-gear fa-spin" style="font-size:24px"></i>';
    }
 
  });



  $(document).on('change', '.journal-action-dropdown', function () {
  const action = $(this).val();
  const serialNo = $(this).data('serial');

  if (action === 'view') {
    $('#viewDayEndModal').modal('show');
    $('#viewDayEndContent').html('<p>Loading...</p>');
    $.get('ajax_day_end/ajax_view_day_end.php', { serial_no: serialNo,location_id: <?php echo $location_id; ?> }, function (res) {
      $('#viewDayEndContent').html(res);
    });
  }

  if (action === 'entry') {
    $('#viewJournalModal').modal('show');
    $('#journalEntryContent').html('<p>Loading...</p>');
    $.get('ajax_day_end/ajax_view_journal_entry.php', { serial_no: serialNo,location_id: <?php echo $location_id; ?> }, function (res) {
      $('#journalEntryContent').html(res);
    });
  }

  if (action === 'report') {
  const url = `report_pump.php?day_end=${serialNo}`;
  window.open(url, '_blank');
}

 

  $(this).val(''); // reset dropdown
});


</script>


 