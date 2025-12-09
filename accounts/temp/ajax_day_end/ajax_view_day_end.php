<?php
include '../../db.php';

$serial_no = $_GET['serial_no'] ?? 0;
$location_id = $_REQUEST['location_id'] ?? 0;

$sql = "SELECT * FROM day_end_process WHERE serial_no = '$serial_no' AND location_id = '$location_id'";
$res = mysqli_query($con, $sql);
if (!$res || mysqli_num_rows($res) == 0) {
    echo "<p>No data found.</p>";
    exit;
}
$data = mysqli_fetch_assoc($res);
?>


<div class="table-responsive">
  <table class="table table-striped">
  
    <tr><th>Date Ended</th><td><?= $data['date_ended'] ?></td></tr>
    <tr><th>Fuel Sales</th><td ><?= number_format($data['fuel_sales'], 2) ?></td><td> <a href="manage_operator_shift.php?serial=<?= $serial_no ?>&date=<?= $data['date_ended'] ?>" target="_blank" class="btn btn-success btn-block mb-2">View Shifts</a></td></tr>
    <tr><th>Oil Sales</th><td  ><?= number_format($data['oil_sales'], 2) ?></td><td><a href="oil_sales_master.php?serial=<?= $serial_no ?>&date=<?= $data['date_ended'] ?>" target="_blank" class="btn btn-info btn-block mb-2">View Oil Sales</a></td></tr>
    <tr><th>Cash Settled</th><td  ><?= number_format($data['total_cash_settled'], 2) ?></td></tr>
    <tr><th>Card Settled</th><td ><?= number_format($data['total_card_settled'], 2) ?></td> <td><a href="card_sales.php?serial=<?= $serial_no ?>&date=<?= $data['date_ended'] ?>" target="_blank" class="btn btn-info btn-block mb-2">View Card Sales</a></td> </tr>
    <tr><th>Credit Settled</th><td ><?= number_format($data['total_credit_settle'], 2) ?></td><td>    <a href="credit_sales.php?serial=<?= $serial_no ?>&date=<?= $data['date_ended'] ?>" target="_blank" class="btn btn-info btn-block mb-2">View Credit Sales</a></td></tr>
    <tr><th>Fuel Short/Excess</th><td ><?= number_format($data['fuel_short_excess'], 2) ?></td></tr>
    <tr><th>Oil Short/Excess</th><td ><?= number_format($data['oil_short_excess'], 2) ?></td></tr>
    <tr><th>Fuel Purchase</th><td ><?= number_format($data['fuel_purchase'], 2) ?></td><td><a href="fuel_grn.php?serial=<?= $serial_no ?>&date=<?= $data['date_ended'] ?>" target="_blank" class="btn btn-info btn-block mb-2">View Fuel Purchase</a></td></tr>
    <tr><th>Oil Purchase</th><td ><?= number_format($data['oil_purchase'], 2) ?></td> <td> <a href="oil_grn_master.php?serial=<?= $serial_no ?>&date=<?= $data['date_ended'] ?>" target="_blank" class="btn btn-info btn-block mb-2">View Oil Purchase</a></td></tr>
    <tr><th>Created On</th><td><?= $data['created_on'] ?></td></tr>
  </table>
</div>
<input type="hidden" readonly name="serial_no" id="serial_no" value="<?php if($data['posted'] ==0) {echo $serial_no;} ?>" required>
<hr>

<div class="row">
  <div class="col-md-6">
   
 
     
  </div>
  <div class="col-md-6">
    
    

  </div>
</div>

 