<?php
include '../../db.php';

header('Content-Type: text/html');

if (!isset($_POST['location_id'], $_POST['start'], $_POST['end'])) {
    echo "<div class='alert alert-danger'>Missing required parameters.</div>";
    exit;
}

$location_id = intval($_POST['location_id']);
$start = $_POST['start']; // Expecting format YYYY-MM-DD HH:MM:SS or YYYY-MM-DD
$end = $_POST['end'];

// Sanitize and validate dates
$start_date = date('Y-m-d H:i:s', strtotime($start));
$end_date = date('Y-m-d H:i:s', strtotime($end));

// Query operator-wise total credit sales in the date range
$query = "
    SELECT o.op_name, SUM(cs.total_sales) AS total_sales, COUNT(cs.cs_id) AS sales_count
    FROM shed_credit_sales cs
    JOIN shed_operator_shift s ON cs.shift_id = s.shift_id
    JOIN manage_pump_operator o ON s.operator_id = o.op_id
    WHERE cs.location_id = $location_id
      AND cs.date_time BETWEEN '$start_date' AND '$end_date'
      AND cs.status = 1
    GROUP BY o.op_name
    ORDER BY o.op_name
";

$result = mysqli_query($con, $query);

if (!$result || mysqli_num_rows($result) == 0) {
    echo "<div class='alert alert-warning'>No credit sales found for selected date range.</div>";
    exit;
}

echo "<table class='table table-bordered table-sm'>";
echo "<thead><tr><th>Operator</th><th>Total Sales</th><th>Number of Sales</th></tr></thead><tbody>";

$totalAll = 0;
while ($row = mysqli_fetch_assoc($result)) {
    echo "<tr>";
    echo "<td>" . htmlspecialchars($row['op_name']) . "</td>";
  echo "<td class='text-center'>" . intval($row['sales_count']) . "</td>";
    echo "<td class='text-right'>" . number_format($row['total_sales'], 2) . "</td>";
    
    echo "</tr>";
    $totalAll += $row['total_sales'];
}

echo "<tr class='font-weight-bold'>";
echo "<td>Total</td>";
echo "<td></td>";
echo "<td class='text-right'>" . number_format($totalAll, 2) . "</td>";

echo "</tr>";

echo "</tbody></table>";
?>
