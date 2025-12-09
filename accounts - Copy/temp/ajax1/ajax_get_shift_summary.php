<?php
include '../../db.php';

if (!isset($_POST['shift_id']) || empty($_POST['shift_id'])) {
    echo "<div class='alert alert-danger'>Invalid shift ID.</div>";
    exit;
}

$shift_id = intval($_POST['shift_id']);

// Fetch shift info
$shift_q = mysqli_query($con, "
    SELECT s.*, o.op_name
    FROM shed_operator_shift s
    LEFT JOIN manage_pump_operator o ON s.operator_id = o.op_id
    WHERE s.shift_id = $shift_id
");
if (!$shift_q || mysqli_num_rows($shift_q) == 0) {
    echo "<div class='alert alert-warning'>Shift not found.</div>";
    exit;
}
$shift = mysqli_fetch_assoc($shift_q);

// Fetch pump assignments with tested fuel
$pumps_q = mysqli_query($con, "
    SELECT spa.id AS pump_assign_id,
           m.pump_name,
           p.p_name,
           spa.opening_reading,
           spa.closing_reading,
           spa.sales_price,
           spa.closing_stock,
           IFNULL(SUM(sft.tested_fuel), 0) AS total_tested_fuel
    FROM shed_pump_assign spa
    JOIN manage_pump m ON spa.pump_id = m.id
    JOIN product_master p ON spa.product_id = p.p_id
    LEFT JOIN shed_fuel_pump_test sft ON spa.id = sft.pump_assign_id
    WHERE spa.shift_id = $shift_id
    GROUP BY spa.id, m.pump_name, p.p_name, spa.opening_reading, spa.closing_reading, spa.sales_price
");
?>

<h5>Shift Details</h5>
<table class="table table-sm table-bordered">
  <tr><th>Operator</th><td><?= htmlspecialchars($shift['op_name']) ?></td></tr>
  <tr><th>Start Time</th><td><?= htmlspecialchars($shift['start_time']) ?></td></tr>
  <tr><th>End Time</th><td><?= htmlspecialchars($shift['end_time'] ?: 'N/A') ?></td></tr>
  <tr><th>Status</th><td><?= $shift['open_status'] == 1 ? 'Open' : 'Closed' ?></td></tr>
</table>

<h5>Pump Assignments</h5>
<?php if (!$pumps_q || mysqli_num_rows($pumps_q) == 0): ?>
    <div class='alert alert-warning'>No pump assignments found for this shift.</div>
<?php else: ?>
<table class="table table-sm table-bordered" id="sales-table">
  <thead>
    <tr>
      <th>Pump</th>
      <th>Product</th>
      <th>Opening Reading</th>
      <th>Closing Reading</th>
      <th>Test Fuel</th>
      <th>Fuel Sold</th>
      <th>Sales Price</th>
      <th>Line Total</th>
      <th>Closing Stock</th>
    </tr>
  </thead>
  <tbody>
    <?php 
    $grand_total = 0;
    while ($row = mysqli_fetch_assoc($pumps_q)): 
        $opening = floatval($row['opening_reading']);
        $closing = is_numeric($row['closing_reading']) ? floatval($row['closing_reading']) : null;
        $test_fuel = floatval($row['total_tested_fuel']);
        $price = floatval($row['sales_price']);
        $sold = $closing !== null ? max(0, $closing - $opening - $test_fuel) : null;
        $line_total = $sold !== null ? $sold * $price : null;

        if ($line_total !== null) {
            $grand_total += $line_total;
        }
    ?>
      <tr data-opening="<?= $opening ?>" data-test-fuel="<?= $test_fuel ?>" data-sales-price="<?= $price ?>">
        <td><?= htmlspecialchars($row['pump_name']) ?></td>
        <td><?= htmlspecialchars($row['p_name']) ?></td>
        <td align="center"><strong><?= $opening ?></strong></td>
        <td align="center">
          <?php if ($closing !== null): ?>
            <strong><?= $closing ?></strong>
           
          <?php else: ?>
            <input type="hidden" name="pump_ids[]" value="<?= intval($row['pump_assign_id']) ?>">
            <strong> Processing</strong>

            <!-- <input type="number" step="0.001" min="<?= $opening ?>" name="closing_readings[]" class="form-control closing-reading-input" placeholder="0000.000" style="border:3px solid black !important;" required> -->
          <?php endif; ?>
        </td>
        <td align="center"><?= number_format($test_fuel, 2) ?></td>
        <td align="center" class="fuel-sold-cell">
            <?= $sold !== null ? number_format($sold, 3) : "<span class='text-muted'>In Operation</span>" ?>
        </td>
        <td align="center"><?= number_format($price, 2) ?></td>
        <td align="right" class="line-total-cell" style="padding-right:15px;">
            <?= $line_total !== null ? number_format($line_total, 2) : "<span class='text-muted'>In Operation</span>" ?>
        </td>

        <td align="center"><?= htmlspecialchars($row['closing_stock']) ?></td>



      </tr>
    <?php endwhile; ?>
    <tr>
      <td colspan="7"><strong>Total Sales</strong></td>
      <td align="right">
        <?= number_format($grand_total, 2) ?>
      </td>
    </tr>
  </tbody>
</table>
<input id="total_sales_calculated" name="total_sales_calculated" type="hidden" value="<?= number_format($grand_total, 2) ?>">



<?php
// Shift summary (already fetched as $shift)
$total_sales = floatval($shift['total_sales']);
$card_sales = floatval($shift['total_card_sales']);
$credit_sales = floatval($shift['total_credit_sales']);
$cash_sales = floatval($shift['cash_received']);
$excess_short = floatval($shift['exces_short']);
?>

<h5>Shift Summary</h5>
<table class="table table-sm table-bordered" style="max-width:500px;">
    <tr>
        <th>Total Sales</th>
        <td align="right"><?= number_format($total_sales, 2) ?></td>
    </tr>
    <tr>
        <th>Card Sales</th>
        <td align="right"><?= number_format($card_sales, 2) ?></td>
    </tr>
    <tr>
        <th>Credit Sales</th>
        <td align="right"><?= number_format($credit_sales, 2) ?></td>
    </tr>
    <tr>
        <th>Cash Sales</th>
        <td align="right"><?= number_format($cash_sales, 2) ?></td>
    </tr>
    <tr>
        <th>Excess / Short</th>
        <td align="right"><?= number_format($excess_short, 2) ?></td>
    </tr>
</table>


<?php endif; ?>
