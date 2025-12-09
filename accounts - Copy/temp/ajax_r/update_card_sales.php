<?php
include '../../db.php'; // connect DB
$pk = $_POST['pk'];            // primary key id
$name = $_POST['name'];        // field name
$value = $_POST['value'];      // new value

if($name == 'card_type' || $name == 'serial_number'){
    $stmt = mysqli_prepare($con, "UPDATE shed_card_sales SET $name = ? WHERE id = ?");
    mysqli_stmt_bind_param($stmt, 'si', $value, $pk);
    if(mysqli_stmt_execute($stmt)){
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'msg' => 'DB update failed']);
    }
} else {
    echo json_encode(['success' => false, 'msg' => 'Invalid field']);
}
?>
