 <!--

 manage_pump_operator   need 0 id op_name = Oil Sales
 shed_operator_shift   need 0 id  location 0 operator 0 open status 1
-->
 
 <?php
include 'header.php';
$day_end_id = $_REQUEST['serial'];
// Ensure $location_id and $user_id are set in the header
$location_id = $location_id; // Location ID from session or header
$user_id = $user_id; // User ID from session or header

// Default values for start_date and end_date
$start_date = isset($_GET['start_date']) ? $_GET['start_date'] : date('Y-m-d');
$end_date = isset($_GET['end_date']) ? $_GET['end_date'] : date('Y-m-d');

// Ensure that the dates are correctly formatted for a DATETIME field
$start_datetime = $start_date . " 00:00:00"; // Start date at midnight
$end_datetime = $end_date . " 23:59:59"; // End date at the end of the day

// Handle card sale addition
 // Handle card sale addition
if (isset($_POST['add_card_sale'])) {
    $card_type = $_POST['card_type'];
    $serial_number = $_POST['serial_number'];
    $shift_id = $_POST['shift_id'];
    $amount = $_POST['amount'];
    $created_on = date('Y-m-d H:i:s');
    
    // Check if the shift is open
    $shift_check_query = "SELECT open_status FROM shed_operator_shift WHERE shift_id = '$shift_id' AND location_id = '$location_id' AND open_status = 1";
    $shift_check_result = mysqli_query($con, $shift_check_query);

    if (mysqli_num_rows($shift_check_result) == 0 && $shift_id > 0) {
        // If no open shift found, display error message and stop sale insertion
        echo "<script> notify('danger', 'The selected shift is not open. Please select an open shift.'); </script>";
    } else {
        // Check if the serial number already exists for today
        $serial_check_query = "SELECT id FROM shed_card_sales WHERE card_type = '$card_type' AND serial_number = '$serial_number' AND created_on >= CURDATE() AND location_id = '$location_id'";
        $serial_check_result = mysqli_query($con, $serial_check_query);

        if (mysqli_num_rows($serial_check_result) > 0) {
            // If serial number exists today, display error and prevent insertion
            echo "<script> notify('danger', 'The serial number has already been used today. Please use a different serial number.'); </script>";
        } else {
            // Proceed with inserting card sale data if serial number is unique for the day
            $insert_sale = "INSERT INTO shed_card_sales (location_id, card_type, serial_number, shift_id, amount, created_on, created_by) 
                            VALUES ('$location_id', '$card_type', '$serial_number', '$shift_id', '$amount', '$created_on', '$user_id')";
            mysqli_query($con, $insert_sale);
            echo "<script> notify('success', 'Card Sale added successfully'); </script>";
        }
    }
}

// Fetch card types for dropdown
$card_types_q = mysqli_query($con, "SELECT card_id, card_name, status FROM shed_card_type WHERE 1");

// Fetch open shifts for the current location
$shifts_q = mysqli_query($con, "SELECT shift_id, op_name FROM shed_operator_shift s
                                LEFT JOIN manage_pump_operator o ON s.operator_id = o.op_id 
                                WHERE s.location_id = $location_id AND s.open_status = 1");

// Fetch last serial number for the selected card type
function get_last_serial($card_type, $location_id) {
    global $con;
    $query = "SELECT MAX(serial_number) AS last_serial FROM shed_card_sales WHERE card_type = '$card_type' AND location_id = '$location_id'";
    $result = mysqli_query($con, $query);
    if ($result) {
        $row = mysqli_fetch_assoc($result);
        return $row['last_serial'] ? $row['last_serial'] + 1 : 1; // Suggest next serial number
    }
    return 1;
}

?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header"><h4>Card Sales Management   <?php if(isset($_REQUEST['serial'])){ echo $_REQUEST['date'];} ?></h4>
    

       


    </div>

        <!-- Date Range Filter -->

  
                   

                  


        

        <!-- Sales List -->

        <div class="card">
            <div class="card-block">
                        <form method="get" class="form-inline mb-3">
                                                     <?php if(isset($_REQUEST['serial'])){ echo " <a href='oil_grn_master.php'> <button class='btn btn-success'>Show All  </button></a>";} else { ?>

            <label for="start_date">Start Date:&nbsp;</label>
            <input type="date" name="start_date" id="start_date" class="form-control mr-3" value="<?= htmlspecialchars($start_date) ?>" required>
            <label for="end_date">End Date:&nbsp;</label>
            <input type="date" name="end_date" id="end_date" class="form-control mr-3" value="<?= htmlspecialchars($end_date) ?>" required>
            <button type="submit" class="btn btn-primary">Filter</button>

            <?php } ?> 
             <button type='button' id="exportButton" filename='<?php echo "CARD_SALES_".$start_date."_".$end_date; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
         
             <!-- <button type="button" class="btn btn-primary mb-3" id="operatorSummaryBtn">
    Operator Wise Summary
</button> -->
             <a id="total-card-sales" style='font-size:22px;' > Total Card Sales:  Calculating...</a>
            </form>


        <div class="table-responsive">
            <table id="example" class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Card Type</th>
                        <th>Serial Number</th>
                        <th>Shift</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Day End</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php

                    if(isset($_REQUEST['serial'])){

                               $sales_q = mysqli_query($con, "
    SELECT s.id, s.card_type, c.card_name, s.serial_number, o.op_name, s.amount, s.created_on,s.status,s.day_end
    FROM shed_card_sales s
    JOIN shed_card_type c ON s.card_type = c.card_id
    JOIN shed_operator_shift os ON s.shift_id = os.shift_id
    LEFT JOIN manage_pump_operator o ON os.operator_id = o.op_id
    WHERE s.location_id = $location_id
      AND s.day_end = $day_end_id
    ORDER BY s.created_on DESC
    LIMIT 50
");

                    } else {

       $sales_q = mysqli_query($con, "
    SELECT s.id, s.card_type, c.card_name, s.serial_number, o.op_name, s.amount, s.created_on,s.status,s.day_end
    FROM shed_card_sales s
    JOIN shed_card_type c ON s.card_type = c.card_id
    JOIN shed_operator_shift os ON s.shift_id = os.shift_id
    LEFT JOIN manage_pump_operator o ON os.operator_id = o.op_id
    WHERE s.location_id = $location_id
      AND s.created_on BETWEEN '$start_datetime' AND '$end_datetime'
    ORDER BY s.created_on DESC
    LIMIT 50
");
                    }
           

 

                    if (!$sales_q) {
    echo "<tr><td colspan='6'>No records found or error: " . mysqli_error($con) . "</td></tr>";
} else {
 $count = 1;  
while ($sale = mysqli_fetch_assoc($sales_q)) {
    // Check if the sale is cancelled (status = 0)
    $is_cancelled = $sale['status'] == 0;
    $row_style = $is_cancelled ? 'class="table-danger cancelled-row"' : '';
    $cancel_button = $is_cancelled
        ? '<span  >Cancelled</span>'
        : "<button class='btn btn-danger btn-sm py-0 cancel-sale-btn' style='padding: 2px 8px; font-size: 12px;' data-sale-id='{$sale['id']}'>Cancel</button>";
  $amount_display = $is_cancelled
    ? '<span style="text-decoration: line-through; color: #a94442;">' . number_format($sale['amount'], 2) . '</span>'
    : '<span class="sale-amount" data-value="' . $sale['amount'] . '">' . number_format($sale['amount'], 2) . '</span>';


    // Output the table row
    echo "<tr $row_style>";
    echo "<td align='center'>{$count}</td>";
    echo "<td align='center'>" . htmlspecialchars($sale['card_name']) . "</td>";
    echo "<td align='center'>" . htmlspecialchars($sale['serial_number']) . "</td>";
    echo "<td>" . htmlspecialchars($sale['op_name']) . "</td>";
    echo "<td align='right'>{$amount_display}</td>";
    echo "<td align='center'>" . date('Y-m-d H:i', strtotime($sale['created_on'])) . "</td>";
    echo "<td align='center'>".$sale['day_end']."</td>";
    echo "<td align='center'>$cancel_button</td>";
    echo "</tr>";
    $count++;
}


}
                    ?>
                </tbody>
            </table>
        </div>
        </div>
        </div>

    </div>
</div>



<div class="modal fade" id="operatorSummaryModal" tabindex="-1" role="dialog" aria-labelledby="operatorSummaryLabel" aria-hidden="true">
    <div class="modal-dialog modal-m" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="operatorSummaryLabel">Operator Wise Card Sale Summary <br>( <?php echo $start_date."<->".$end_date; ?> ) </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="operatorSummaryContent">Loading...</div>
            </div>
            <div class="modal-footer">
                <!-- Close button for Bootstrap 4 -->
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<script>
$(document).ready(function () {
    // Autogenerate serial number based on card type and location
    $('#card_type').change(function () {
        var card_type = $(this).val();
        var location_id = <?= json_encode($location_id) ?>;
        
        if (card_type) {
            $.ajax({
                url: 'ajax/ajax_get_next_serial.php',
                type: 'POST',
                data: { card_type: card_type, location_id: location_id },
                success: function (response) {
                    try {
                        // Parse the response (if not automatically parsed)
                        var data = JSON.parse(response);
                        
                        // Check if 'next_serial' exists in the response
                        if (data.next_serial) {
                            // alert("Next Serial: " + data.next_serial);
                            $('#serial_number').val(data.next_serial); // Uncomment to set serial number field
                        } else {
                            alert("No next serial number found.");
                        }
                    } catch (e) {
                        alert("Error: Unable to parse response.");
                    }
                },
                error: function () {
                    alert('Error fetching next serial number.');
                }
            });
        }
    });
});


 $(document).ready(function () {
    $('.cancel-sale-btn').click(function () {
        var saleId = $(this).data('sale-id');

        Swal.fire({
            title: 'Are you sure?',
            text: "You are about to cancel this sale!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, cancel it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'ajax/ajax_cancel_card_sale.php',
                    type: 'POST',
                    data: { sale_id: saleId },
                    success: function(response) {
                        try {
                            var data = JSON.parse(response);
                            if (data.success) {
                                Swal.fire('Cancelled!', 'The sale has been cancelled.', 'success');
                                setTimeout(function () {
                                    window.location.href = window.location.href;
                                }, 2000);
                            } else if (data.error) {
                                Swal.fire('Error!', data.error, 'error');
                            }
                        } catch (e) {
                            Swal.fire('Error!', 'There was an issue processing the request. Please try again.', 'error');
                        }
                    },
                    error: function() {
                        Swal.fire('Error!', 'Unable to cancel the sale. Please try again.', 'error');
                    }
                });
            }
        });
    });
});

      
$(document).ready(function () {
    $('#operatorSummaryBtn').click(function () {
        $('#operatorSummaryContent').html('Loading...');
        $('#operatorSummaryModal').modal('show');

        $.ajax({
            url: 'ajax/ajax_operator_summary.php',
            type: 'POST',
            data: {
                location_id: <?= $location_id ?>,
                start: '<?= $start_datetime ?>',
                end: '<?= $end_datetime ?>'
            },
            success: function (data) {
                $('#operatorSummaryContent').html(data);
            },
            error: function () {
                $('#operatorSummaryContent').html('<div class="alert alert-danger">Failed to load summary.</div>');
            }
        });
    });
});



   $(document).ready(function() {
    $('#example').DataTable({
        "pageLength": 50
    });
});


 

</script>

<script>
document.addEventListener("DOMContentLoaded", function () {
    let total = 0;
    document.querySelectorAll('.sale-amount').forEach(function (el) {
        const amount = parseFloat(el.getAttribute('data-value')) || 0;
        total += amount;
    });

    document.getElementById('total-card-sales').innerHTML =
        'Total Card Sales:<strong> ' + total.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2})+ '</strong>';
});
</script>


<?php include 'footer.php'; ?>
