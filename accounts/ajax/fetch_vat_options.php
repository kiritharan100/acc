<?php
include("../../db.php");
$options = "";
$q = mysqli_query($con, "SELECT vat_id, vat_name, percentage FROM accounts_vat_cat WHERE status=1");
while ($row = mysqli_fetch_assoc($q)) {
  $selected = ($row['vat_id'] == 1) ? 'selected' : '';
  $options .= "<option value='{$row['vat_id']}' data-percentage='{$row['percentage']}' $selected>{$row['vat_name']}</option>";
}
echo $options;
