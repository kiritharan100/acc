<?php 
 if (isset($_GET['module']) && $_GET['module'] === 'report') {
        include '../reports/header.php';
    } else {
        include 'header.php';
    }
    ?>
    <?php
$customers = [];
$cust_res = mysqli_query($con, "SELECT c_id, customer_name FROM mange_customer WHERE status=1 ORDER BY customer_name ");
while($c = mysqli_fetch_assoc($cust_res)){
    $customers[$c['c_id']] = $c['customer_name'];
}
?>

<style>
  @media print {
 
     

    .no-print {
      display: none !important;
    }
     .card {
    margin-top: -100px; /* Adjust the value as needed */
    margin-left: -8px; /* Adjust the value as needed */
        }
         body {
    zoom: 76%;  /* Optional: works in most browsers like Chrome */
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
</style>
 


<?php
if (isset($_REQUEST['from_date'])) {
    $from_date = $_REQUEST['from_date'] . ' 00:00:00';
    $to_date   = $_REQUEST['to_date']   . ' 23:59:59';
} else {
    $from_date = date('Y-m-d') . ' 00:00:00';
    $to_date   = date('Y-m-d') . ' 23:59:59';
}
 




// $sales_q = mysqli_query($con, "
//     SELECT 
//         cs.cs_id,
//         cs.date_time,
//         cs.ref_no,
//         cs.vehicle_no,
//         cs.total_sales,
//         cs.status,
//         c.customer_name,
//         cs.inv_id,
//         cs.invoice_no,
//         cs.day_end,
//         GROUP_CONCAT(pm.p_name ORDER BY sd.id SEPARATOR ', ') AS items_sold,
//         GROUP_CONCAT(sd.qty ORDER BY sd.id SEPARATOR ', ') AS quantities
//     FROM shed_credit_sales cs
//     JOIN mange_customer c ON cs.c_id = c.c_id
//     LEFT JOIN shed_credit_sales_detail sd ON cs.cs_id = sd.cs_id
//     LEFT JOIN product_master pm ON sd.p_id = pm.p_id
//     WHERE cs.location_id = $location_id
//       AND cs.date_time BETWEEN '$from_date' AND '$to_date'AND cs.status = 1
//     GROUP BY cs.cs_id
//     ORDER BY cs.date_time DESC
// ");
 

?>



<div class="content-wrapper">
   <div class="container-fluid">

      <div class="row  no-print">
         <div class="col-sm-12">
            <div class="main-header" >
               <h4>Credit  Sales - 9C / <?= $client_name ?></h4>
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
<?php  if(isset($_REQUEST['cash']) && $_REQUEST['cash'] == '257b707bec895aee405e60cb19a6a608f8348bdc'){ ?>
                     <button type='button' class='btn btn-sm btn-primary edit-row'>Edit</button> <?php }?>
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
                        <div align='right' style='position: relative; left: -50px;'> <h5>F 9C</h5>
                           <h6 style='position: relative; left: -50px;'>
                               Date:
<?php 

$from_date_only = date('Y-m-d', strtotime($from_date));
$to_date_only = date('Y-m-d', strtotime($to_date));

if ($from_date_only === $to_date_only) {
    echo $date_show = date('d-m-Y', strtotime($from_date));
    $show_date = 0;
} else {
   echo $date_show = date('d-m-Y', strtotime($from_date)) . ' - ' . date('d-m-Y', strtotime($to_date));
   $show_date = 1;
}
?>
                           
                           </h6>
                          
                        </div>



                          <table   class="table table-bordered table-hover" style="width:100%">
        <thead>
          <tr>
            <th style='width:30px;'  >#</th>
            <!-- <th>ID</th> -->
       <?php if($show_date == 1){ echo "<th>Date </th>"; } ?>
             <th>Invoice No</th>
              <th style='width:100px;'>Order No</th>
             
              <th>Vehicle No</th>
            <th>Customer</th>
            <th>Item Sold</th>
          <th>Quantity</th>
            <th>Total Sales</th>
          
            
          
          </tr>
        </thead>
        <tbody>
          <?php
          $count = 1;
          $total_sum = 0;
 
           $query_sales= "
    (
        SELECT cs.cs_id as rep_id,
            'Credit Sale' AS sale_type,
            cs.date_time,
            cs.invoice_no,
            cs.ref_no,
            cs.vehicle_no,
            c.customer_name AS party_name,
            GROUP_CONCAT(pm.p_name ORDER BY sd.id SEPARATOR ', ') AS items_sold,
            GROUP_CONCAT(sd.qty ORDER BY sd.id SEPARATOR ', ') AS quantities,
            cs.total_sales AS total_amount
        FROM shed_credit_sales cs
        JOIN mange_customer c ON cs.c_id = c.c_id
        LEFT JOIN shed_credit_sales_detail sd ON cs.cs_id = sd.cs_id
        LEFT JOIN product_master pm ON sd.p_id = pm.p_id
        WHERE cs.location_id = $location_id
          AND cs.date_time BETWEEN '$from_date' AND '$to_date'
          AND cs.status = 1
        GROUP BY cs.cs_id
    )
    
    UNION
    
    (
      SELECT osm.iss_id as rep_id,
        'Oil Sale' AS sale_type,
        osm.issue_date AS date_time,
        osm.invoice_no AS invoice_no,
        osm.ref_no,
        osm.vehicle_no,
        c.customer_name AS party_name,
        GROUP_CONCAT(pm.p_name ORDER BY osd.id SEPARATOR ', ') AS items_sold,
        GROUP_CONCAT(osd.issue_qty ORDER BY osd.id SEPARATOR ', ') AS quantities,
        osm.issue_total AS total_amount
    FROM oil_sales_master osm
    LEFT JOIN mange_customer c ON osm.to_location = c.c_id
    LEFT JOIN oil_sales_detail osd ON osm.iss_id = osd.iss_id
    LEFT JOIN oil_stock on  oil_stock.batch_id = osd.batch_id
 

    LEFT JOIN product_master pm ON  oil_stock.s_id = pm.p_id
    WHERE osm.issue_status = 1 
      AND osm.to_location > 0
      AND osm.location= $location_id
      AND STR_TO_DATE(osm.issue_date, '%Y-%m-%d') BETWEEN '$from_date' AND '$to_date'
    GROUP BY osm.iss_id

    )
    
    ORDER BY date_time DESC;
    
";

$sales_q = mysqli_query($con,$query_sales);
        while($sale = mysqli_fetch_assoc($sales_q)) {
            
            $total_sum += $sale['total_amount'];
    echo "<tr>";
    echo "<td align='center'>{$count}</td>";
   //  echo "<td align='center'>" . htmlspecialchars($sale['sale_type']) . "</td>";
   if($show_date == 1){  echo "<td align='center'>" . date('Y-m-d', strtotime($sale['date_time'])) . "</td>"; }


 if(isset($_REQUEST['cash']) && $_REQUEST['cash'] == '257b707bec895aee405e60cb19a6a608f8348bdc'){ 

   echo "<td align='center'>
    <input type='text' 
           class='form-control form-control-sm text-center editable-field' 
           data-id='{$sale['rep_id']}' data-idd='{$sale['sale_type']}' 
           data-field='invoice_no' 
           value='" . htmlspecialchars($sale['invoice_no']) . "' disabled>
</td>";

// ref_no
echo "<td align='center'>
    <input type='text' 
           class='form-control form-control-sm text-center editable-field' 
           data-id='{$sale['rep_id']}'   data-idd='{$sale['sale_type']}' 
           data-field='ref_no' 
           value='" . htmlspecialchars($sale['ref_no']) . "' disabled>
</td>";

// vehicle_no
echo "<td align='center'>
    <input type='text' 
           class='form-control form-control-sm text-center editable-field' 
           data-id='{$sale['rep_id']}'  data-idd='{$sale['sale_type']}' 
           data-field='vehicle_no' 
           value='" . htmlspecialchars($sale['vehicle_no']) . "' disabled>
</td>";

// customer dropdown
echo "<td>
<select disabled class='form-control form-control-sm editable-field' 
        data-id='{$sale['rep_id']}'  data-idd='{$sale['sale_type']}' 
        data-field='c_id'>";
foreach($customers as $c_id => $c_name){
    $selected = ($sale['party_name'] == $c_name) ? "selected" : "";
    echo "<option value='$c_id' $selected>".htmlspecialchars($c_name)."</option>";
}
echo "</select >
</td>";
} else {

    echo "<td align='center'>" . htmlspecialchars($sale['invoice_no']) . "</td>";
    echo "<td align='center'>" . htmlspecialchars($sale['ref_no']) . "</td>";
    echo "<td align='center'>" . htmlspecialchars($sale['vehicle_no']) . "</td>";
    echo "<td style='padding-left:5px;'>" . htmlspecialchars($sale['party_name']) . "</td>"; }

    echo "<td style='padding-left:5px; text-align:center;'>" . htmlspecialchars($sale['items_sold']) . "</td>";
    echo "<td style='text-align:center;'>" . format_qty($sale['quantities']) . "</td>";
    echo "<td align='right' style='padding-right:5px;'>" . $sale['total_amount'] . "</td>";
    echo "</tr>";
    $count++;
}
          ?>
          <tr style='font-weight:bold; background:#f0f0f0;'>
    <td colspan='<?php if($show_date == 1){ echo "8"; } else {  echo "7"; } ?>' align='center'>Total</td>
    <td align='right' style='padding-right:5px;'><?= number_format($total_sum, 2) ?></td>
</tr>
        </tbody>
      </table>


                        

                      
    
   


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
                                               <td width =100px;>   </td>
                                             <td align='right'> </td>
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

 <script>
$(document).ready(function(){
 

   $('.edit-row').on('click', function(){
    Swal.fire({
        title: 'Are you sure?',
        text: "All the changes will update automatically.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#28a745',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Edit'
    }).then((result) => {
        if (result.isConfirmed) {
            $('.editable-field').prop('disabled', false); // enable all editable fields everywhere
        }else{
            $('.editable-field').prop('disabled', true);
        }
    });
});



    $('.editable-field').on('change blur', function(){
        var field = $(this).data('field');
        var id = $(this).data('id');
         var idd = $(this).data('idd');
        
        var value = $(this).val();

        $.ajax({
            url: 'ajax_r/update_credit_sale.php',
            type: 'POST',
            data: {
                id: id,
                idd:idd,
                field: field,
                value: value
            },
            success: function(response){
                // Optionally show success or handle error
                console.log(response);
            }
        });
    });
});
</script>

    


<?php include 'footer.php'; ?>

 <script>
   
  $('#example').dataTable( {
"pageLength": 50
} );
</script>