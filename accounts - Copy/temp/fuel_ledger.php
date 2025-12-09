<?php 
include 'header.php'; 

// Location is already set (assumed)
$location_id = $location_id ?? 1; // set default if not set

// Get fuel products for dropdown
$product_query = "SELECT p_id, p_name FROM product_master WHERE p_cat='Fuel' AND status=1";
$product_result = mysqli_query($con, $product_query);

$selected_product = $_REQUEST['product'] ?? '';
$from_date = $_REQUEST['from_date'] ?? date('Y-m-01');  // first day of current month
$to_date = $_REQUEST['to_date'] ?? date('Y-m-t');       // last day of current month

?>

<div class="content-wrapper">
   <div class="container-fluid">
      <div class="row">
         <div class="col-sm-12 p-0">
            <div class="main-header">
               <h4><i class="fas fa-book"></i> Fuel Ledger <?php echo $client_name;  ?></h4>
            </div>
         </div>
      </div>



<?php
if ($selected_product) {

    // Step 1: Get opening balance before from_date
    // Sum of debit - credit before from_date
    $opening_bal_query = "
        SELECT 
          IFNULL(SUM(debit),0) as total_debit, 
          IFNULL(SUM(credit),0) as total_credit 
        FROM fuel_stock_ledger 
        WHERE p_id = '$selected_product' AND location_id = '$location_id' AND date_time < '$from_date 00:00:00' AND status=1
    ";
    $bal_res = mysqli_query($con, $opening_bal_query);
    if (!$bal_res) {
    die("Opening balance query failed: " . mysqli_error($con));
}
    $bal_row = mysqli_fetch_assoc($bal_res);
    $opening_balance = $bal_row['total_debit'] - $bal_row['total_credit'];

    // Step 2: Get sales price for product (latest price or fixed price)
    $price_query = "SELECT last_price FROM product_master WHERE p_id = '$selected_product' LIMIT 1";
    $price_res = mysqli_query($con, $price_query);
    $price_row = mysqli_fetch_assoc($price_res);
    $sales_price = $price_row['last_price'] ?? 0;

 $last_sales_price=0;
$new_price =0;

$ledger_query = "
    SELECT 
        fsl.date_time,
        mp.pump_name,
        mpo.op_name AS operator_name,
        spa.opening_reading,
        spa.closing_reading,
        spa.total_test_reading,
        fsl.sales_price,
        fsl.purchase_price,
        fsl.debit,
        fsl.credit,
        fsl.description
    FROM fuel_stock_ledger fsl
    LEFT JOIN shed_operator_shift sos 
        ON sos.shift_id = fsl.shift_id
    LEFT JOIN shed_pump_assign spa 
        ON fsl.pump_assign = spa.id
    LEFT JOIN manage_pump mp 
        ON mp.id = spa.pump_id
    LEFT JOIN manage_pump_operator mpo 
        ON mpo.op_id = sos.operator_id
    WHERE 
        fsl.p_id = '$selected_product'
        AND fsl.location_id = '$location_id'
        AND fsl.date_time BETWEEN '$from_date 00:00:00' AND '$to_date 23:59:59'
        AND fsl.status = 1
    ORDER BY fsl.date_time ASC
";


//  $ledger_query = "
//     SELECT 
//         fsl.date_time,
//         mp.pump_name,
//         mpo.op_name AS operator_name,
//         spa.opening_reading,
//         spa.closing_reading,
//         spa.total_test_reading,
//         fsl.sales_price,
//          fsl.purchase_price,
//         fsl.debit,
//         fsl.credit,
//         fsl.description
//     FROM fuel_stock_ledger fsl
//     LEFT JOIN shed_operator_shift sos 
//         ON sos.shift_id = fsl.shift_id
//     LEFT JOIN (
//         SELECT 
//             shift_id, 
//             product_id, 
//             MIN(pump_id) AS pump_id,
//             MIN(opening_reading) AS opening_reading,
//             MIN(closing_reading) AS closing_reading,
//             MIN(total_test_reading) AS total_test_reading
//         FROM shed_pump_assign
//         GROUP BY shift_id, product_id
//     ) spa ON spa.shift_id = fsl.shift_id AND spa.product_id = fsl.p_id
//     LEFT JOIN manage_pump mp 
//         ON mp.id = spa.pump_id
//     LEFT JOIN manage_pump_operator mpo 
//         ON mpo.op_id = sos.operator_id
//     WHERE 
//         fsl.p_id = '$selected_product'
//         AND fsl.location_id = '$location_id'
//         AND fsl.date_time BETWEEN '$from_date 00:00:00' AND '$to_date 23:59:59'
//         AND fsl.status = 1
//     ORDER BY fsl.date_time ASC
// ";


    $ledger_result = mysqli_query($con, $ledger_query);

    // Prepare to calculate running balance
    $running_balance = $opening_balance;
    $rows = [];
$ledger_result = mysqli_query($con, $ledger_query);
if (!$ledger_result) {
    die("Ledger query failed: " . mysqli_error($con));
}
    while($row = mysqli_fetch_assoc($ledger_result)) {
        $running_balance += ($row['debit'] - $row['credit']);

        if($row['sales_price'] > 0){ $new_price = $row['sales_price'] ;}  
        $balance_value = $running_balance * $new_price;


        // if($row['sales_price'] == 0){
        //     $balance_value = $last_sales_price;
        // }  

        $rows[] = [
            'date_time' => $row['date_time'],
            'pump_name' => $row['pump_name'],
            'operator_name' => $row['operator_name']." ".$row['description'],
            'opening_reading' => $row['opening_reading'],
            'closing_reading' => $row['closing_reading'],
            'test_fuel' => $row['total_test_reading'],
            'debit' => $row['debit'],
            'credit' => $row['credit'],
            'balance' => $running_balance,
            'balance_value' => $balance_value,
            'sales_price' => $new_price //$row['sales_price']
        ];
        $last_sales_price =  $balance_value;
    }     
     

    // Display table
    ?>

    <div class="card">
        <div class="card-header">
             


      <div class="row mb-3">
         <div class="col-sm-12">
            <form method="get" class="form-inline">
               <label for="product">Select Fuel Product: </label>
               <select name="product" id="product" class="form-control mx-2" required>
                  <option value="">-- Select Product --</option>
                  <?php while($prod = mysqli_fetch_assoc($product_result)) { ?>
                     <option value="<?php echo $prod['p_id']; ?>" <?php if($selected_product == $prod['p_id']) echo 'selected';
                     if($selected_product == $prod['p_id']) $p_name = $prod['p_name'];  ?>>
                        <?php echo htmlspecialchars($prod['p_name']); ?>
                     </option>
                  <?php } ?>
               </select>

               <label for="from_date">From: </label>
               <input type="date" name="from_date" id="from_date" value="<?php echo $from_date; ?>" class="form-control mx-2" required>

               <label for="to_date">To: </label>
               <input type="date" name="to_date" id="to_date" value="<?php echo $to_date; ?>" class="form-control mx-2" required>

               <button type="submit" class="btn btn-primary">View Ledger</button>
                <button type='button' id="exportButton" filename='<?php echo "Ledger_".$p_name."_".$from_date."_".$to_date; ?>.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
            </form>
         </div>
      </div>


    
        <hr>
       
        <div class="card-body table-responsive">
            <table id='example'   class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Date Time</th>
                        <th>Pump Name</th>
                        <th>Name</th>
                        <th>Opening Reading</th>
                        <th>Closing Reading</th>
                        <th>Test Fuel</th>
                        <th>Debit</th>
                        <th>Credit</th>
                        <th>Balance</th>
                         <th>Sales Price</th>
                        <th>Balance Value</th>
                    </tr>
                </thead>
                <tbody>
              <tr class="table-info font-weight-bold">
    <td align='center'><?php echo $from_date; ?></td>
    <td colspan="1"></td>
    <td colspan="1"> Opening Balance</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td align='right'><?php echo number_format($opening_balance, 3); ?></td>
    <td></td>
    <td></td>
</tr>
                    <?php 
                    if(count($rows) == 0){
                        echo "<tr><td colspan='11' class='text-center'>No records found in this date range.</td></tr>";
                    } else {
                        foreach($rows as $r){ ?>
                         
                        <tr>
                                    <td align='center'><?php echo $r['date_time']; ?></td>
                                <td align='center'><?php echo htmlspecialchars($r['pump_name'] ?? ''); ?></td>
                                <td><?php echo htmlspecialchars($r['operator_name']); ?></td>
                                <td align="center"><?php echo $r['opening_reading']; ?></td>
                                <td align="center"><?php echo $r['closing_reading']; ?></td>
                              <td align="right"><?php echo ($r['test_fuel'] == 0 ? '' : number_format($r['test_fuel'], 3)); ?></td>
                                <td align="right"><?php echo ($r['debit'] == 0 ? '' : number_format($r['debit'], 3)); ?></td>
                                <td align="right"><?php echo ($r['credit'] == 0 ? '' : number_format($r['credit'], 3)); ?></td>
                                <td align="right"><?php echo number_format($r['balance'], 3); ?></td>
                                <td align="right"><?php echo number_format($r['sales_price'], 2); ?></td>
                                <td align="right"><?php echo number_format($r['balance_value'], 2); ?></td>
                            </tr>
                    <?php }} ?>
                </tbody>
            </table>
        </div>
    </div>

<?php 
} // end if product selected
?>

   </div>
</div>

  <script>
$(document).ready(function () {
    $('#example').DataTable({
        pageLength: 50,        // 👈 sets default rows per page
        lengthMenu: [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ], // 👈 menu options
        autoWidth: false,
        responsive: true
    });
});
</script>


<?php include 'footer.php'; ?> 