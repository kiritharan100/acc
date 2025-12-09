<?php
include '../../db.php'; // adjust if needed

$id = $_POST['id'];
$idd = $_POST['idd'];
$field = $_POST['field'];
$value = $_POST['value'];

// Allowed fields to prevent injection

$allowed = ['invoice_no', 'ref_no', 'vehicle_no', 'c_id'];
if(!in_array($field, $allowed)){
    die('Invalid field');
}

// Sanitize
$id_safe = mysqli_real_escape_string($con, $id);
$value_safe = mysqli_real_escape_string($con, $value);

// Update: detect table by id or logic
// Example if using invoice_no to identify credit sale:
if($idd == "Oil Sale"){
    if($field =='c_id'){ $field = 'to_location';}
    
    $update_sql = "UPDATE oil_sales_master SET `$field` = '$value_safe' WHERE iss_id = '$id_safe' LIMIT 1";
    
}
else{
    $update_sql = "UPDATE shed_credit_sales SET `$field` = '$value_safe' WHERE cs_id = '$id_safe' LIMIT 1";
}







if(mysqli_query($con, $update_sql)){
    echo "Updated";
} else {
    echo "Error: ".mysqli_error($con);
}
?>
