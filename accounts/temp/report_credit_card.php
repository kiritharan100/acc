<?php 
 if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }
    ?>
<style>
  @media print {
.card {
    margin-top: -100px; /* Adjust the value as needed */
    margin-left: -8px; /* Adjust the value as needed */
        }
         body {
    zoom: 80%;  /* Optional: works in most browsers like Chrome */
  }
    .row {
    display: flex;
    flex-direction: row;
  }
  .col-md-6 {
    width: 50% !important;
    float: left;
  }
     

    .no-print {
      display: none !important;
    }
  }
  .no-scroll-on-print {
      overflow: hidden !important;
    }

     @media print {
    .print-only {
      display: block !important;
    }
  }

  @media screen {
    .print-only {
      display: none !important;
    }
  }

  .editable-buttons .editable-submit:after {
    font-family: 'Font Awesome 6 Free';
    font-weight: 900;
    content: "\f00c"; /* fa-check */
}

.editable-buttons .editable-cancel:after {
    font-family: 'Font Awesome 6 Free';
    font-weight: 900;
    content: "\f00d"; /* fa-times */
}

.editable-width-sm {
    width: 50px !important;
}

/* Or make it responsive */
.editable-width-sm {
    min-width: 40px;
    max-width: 50px;
}

</style>
 


<?php
if (isset($_REQUEST['from_date'])) {
    $from_date = $_REQUEST['from_date'] . ' 00:00:00';
    $to_date   = $_REQUEST['to_date']   . ' 23:59:59';
} else {
    $from_date = date('Y-m-d') . ' 00:00:00';
    $to_date   = date('Y-m-d') . ' 23:59:59';
}
 
?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.1/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
<!-- X-editable JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.1/bootstrap3-editable/js/bootstrap-editable.min.js"></script>


<div class="content-wrapper">
   <div class="container-fluid">

      <div class="row  no-print">
         <div class="col-sm-12">
            <div class="main-header" >
               <h4>Credit Card Sales - 9C / <?= $client_name ?></h4>
            </div>
         </div>
      </div>

      <div class="row">
         <div class="col-sm-12">
            <div class="card">
               <div class="card-header no-print" align="right">
                  <form method="GET">
                     From:
                     <?php   if (isset($_GET['module']) && $_GET['module'] === 'report') {
                                        echo "<input type='hidden' name='module' value='report'>";  }?>
                     <input type="date" name="from_date" value="<?= isset($_REQUEST['from_date']) ? $_REQUEST['from_date'] : date('Y-m-d') ?>" required>
                     To:
                     <input type="date" name="to_date" value="<?= isset($_REQUEST['to_date']) ? $_REQUEST['to_date'] : date('Y-m-d') ?>" required>
                     <button type="submit" class="btn btn-success">Search</button>
                     <!-- <button type="button" id="exportButton" filename="VAT_Report.xlsx" class="btn btn-primary">
                        <i class="ti-cloud-down"></i> Export
                     </button> -->

                  <button type="button" class="btn btn-primary"  onclick="window.print()">Print</button>

                     
                  </form>
               </div>

               <div class="card-block">
                  <div class="row">

                  

                  <div class="col-sm-12 table-responsive no-scroll-on-print">

                        <div align='center'>
                           <h4>
                              <?php echo $_SESSION['company']; ?> <br>
                              <?php echo $client_name." - ".$reg_no; ?>
                           </h4>
                        </div>
                        <div align='right' style='position: relative; left: -50px;'> <h5>Card - 9C</h5>
                           <h6 style='position: relative; left: -50px;'>
                               Date:
<?php 

$from_date_only = date('Y-m-d', strtotime($from_date));
$to_date_only = date('Y-m-d', strtotime($to_date));

if ($from_date_only === $to_date_only) {
    echo $date_show = date('d-m-Y', strtotime($from_date));
} else {
   echo $date_show = date('d-m-Y', strtotime($from_date)) . ' - ' . date('d-m-Y', strtotime($to_date));
}
?>
                           
                           </h6>
                        </div>


                        

                      <?php
// Fetch all rows into an array
$data = [];
$sales_q = mysqli_query($con, "
    SELECT s.id, s.card_type, c.card_name, s.serial_number, o.op_name, s.amount, s.created_on, s.status, s.day_end
    FROM shed_card_sales s
    JOIN shed_card_type c ON s.card_type = c.card_id
    JOIN shed_operator_shift os ON s.shift_id = os.shift_id
    LEFT JOIN manage_pump_operator o ON os.operator_id = o.op_id
    WHERE s.location_id = $location_id
      AND s.created_on BETWEEN '$from_date' AND '$to_date' AND s.status = 1
    ORDER BY s.card_type, s.created_on
");

while ($row = mysqli_fetch_assoc($sales_q)) {
    $data[] = $row;
}
$total_card_sales = 0;
// Split the data in two
$total = count($data);
$half = ceil($total / 2);
$left_data = array_slice($data, 0, $half);
$right_data = array_slice($data, $half);
?>

<div class="row">
  <div class="col-md-6" style='padding:3px;'>
    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>SN</th>
          <th>Card Name</th>
          <th>Serial No</th>
          <th>Amount</th>
        </tr>
      </thead>
      <tbody>
        <?php $count = 1; foreach ($left_data as $sale): ?>
        <tr>
          <td align="center"><?= $count++ ?></td>
     <?php  if(isset($_REQUEST['cash']) && $_REQUEST['cash'] == '257b707bec895aee405e60cb19a6a608f8348bdc'){ ?>
            <td align="center">
              <a href="#" 
                class="card-type" 
                data-type="select" 
                data-pk="<?= $sale['id'] ?>" 
                data-name="card_type" 
                data-value="<?= $sale['card_type'] ?>" 
                data-title="Select Card Type"></a>
            </td>
            <td>
              <a href="#" 
                class="serial-number" 
                data-type="text" 
                data-pk="<?= $sale['id'] ?>" 
                data-name="serial_number" 
                data-value="<?= htmlspecialchars($sale['serial_number']) ?>" 
                data-title="Enter Serial Number"></a>
            </td> <?php } else { ?>
          <td align="center"><?= htmlspecialchars($sale['card_name']) ?></td>
          <td><?= htmlspecialchars($sale['serial_number']) ?></td>
             <?php } ?>
          <td align="right" style='padding-right:6px;'><?= number_format($sale['amount'], 2); $total_card_sales += $sale['amount']; ?></td>
        </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>

  <div class="col-md-6" style='padding:3px;'>
    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>SN</th>
          <th>Card Name</th>
          <th>Serial No</th>
          <th>Amount</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($right_data as $sale): ?>
        <tr>
          <td align="center"><?= $count++ ?></td>

          <?php  if(isset($_REQUEST['cash']) && $_REQUEST['cash'] == '257b707bec895aee405e60cb19a6a608f8348bdc'){ ?>
            <td align="center">
              <a href="#" 
                class="card-type" 
                data-type="select" 
                data-pk="<?= $sale['id'] ?>" 
                data-name="card_type" 
                data-value="<?= $sale['card_type'] ?>" 
                data-title="Select Card Type"></a>
            </td>
            <td>
              <a href="#" 
                class="serial-number" 
                data-type="text" 
                data-pk="<?= $sale['id'] ?>" 
                data-name="serial_number" 
                data-value="<?= htmlspecialchars($sale['serial_number']) ?>" 
                data-title="Enter Serial Number"></a>
            </td> <?php } else { ?>
          <td align="center"><?= htmlspecialchars($sale['card_name']) ?></td>
          <td><?= htmlspecialchars($sale['serial_number']) ?></td>
             <?php } ?>
                      


          <td align="right" style='padding-right:6px;'><?= number_format($sale['amount'], 2);  $total_card_sales += $sale['amount'];?></td>
        </tr>
        <?php endforeach; ?>
        <tr style="text-align:center; background-color:#aef6fa;">
  <th colspan="3" style="text-align:center;"><b>Total:</b></th>
  <th style="text-align:right; padding-right:6px;"><b><?= number_format($total_card_sales, 2) ?></b></th>
</tr>
      </tbody>
   
    </table>
   
  </div>
</div>

                              <table width='100%'>
                                 <tr>
                                    <td   >


                                     <div class="print-only"> 
                                          <table>
                                          
                                           <tr>
                                             <!-- <td align='center' width =200px;><br>---------------------------- <br> Prepared By </td> -->
                                              <td align='center' width =200px;><br>---------------------------- <br>  Checked By </td> 
                                               
                                          </tr>
                                          <tr>
                                            <td align='center' width =200px;><br>---------------------------- <br> Branch Manager </td>
                                            
                                          </tr>
                                           
                                       </table>
                              </div>



                                    </td>
                                    <td>
                                       <table>
                                           <tr>
                                               <td width =100px;> Total : </td>
                                             <td align='right'><?php echo number_format($total_card_sales,2) ; ?> </td>
                                          </tr>

                                          <tr>
                                               <td width =100px;> </td>
                                             <td align='right'> </td>
                                          </tr>
                                                 </table>
                                       



                                     
                                 </td>
                              </table>




                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

   </div>
</div>

 <?php
$card_type_result = mysqli_query($con, "SELECT card_id as value, card_name as text FROM shed_card_type WHERE status=1");
$card_types = [];
while($row = mysqli_fetch_assoc($card_type_result)){
    $card_types[] = $row;
}
?>
<script>
var cardTypes = <?= json_encode($card_types); ?>;

$(document).ready(function() {
  $.fn.editable.defaults.mode = 'inline'; // or 'popup'

  $('.card-type').editable({
    source: cardTypes,
    url: 'ajax_r/update_card_sales.php',
    success: function(response, newValue) {
      if(!response.success) return response.msg; // show error
    }
  });

  $('.serial-number').editable({
    url: 'ajax_r/update_card_sales.php',
    success: function(response, newValue) {
      if(!response.success) return response.msg; // show error
    }
  });
});


</script>
    


<?php include 'footer.php'; ?>

 <script>
   
  $('#example').dataTable( {
"pageLength": 50
} );
</script>