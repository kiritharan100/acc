<?php
// Assuming you have a database connection
include('../../db.php');

if(isset($_POST['md5_client']) && isset($_POST['status'])) {
    $md5_client = $_POST['md5_client'];
    
    $status = $_POST['status'];
    if($status == "Active"){
         $status = 1;
    }else{
         $status = 0;
        
    }

    

    // Update the client status in the database
    $query = "UPDATE client_registration SET user_license = '$status' WHERE md5_client = '$md5_client'";
    
    if(mysqli_query($con, $query)) {
        echo "success";
    } else {
        echo "error";
    }
}
?>
