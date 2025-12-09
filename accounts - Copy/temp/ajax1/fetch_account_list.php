<?php
include("../../db.php");

$query = "SELECT ca_id, ca_name, ca_group FROM acc_chart_of_accounts WHERE status = 1 ORDER BY ca_name ASC";
$result = mysqli_query($con, $query);

$options = "<option value=''>-- Select Account --</option>";

while ($row = mysqli_fetch_assoc($result)) {
    $account_id = $row['ca_id'];
    $account_name = htmlspecialchars($row['ca_name']);
    $account_group = htmlspecialchars($row['ca_group']);

    $label = "$account_name ($account_group)";
    $options .= "<option value='$account_id'>$label</option>";
}

echo $options;
