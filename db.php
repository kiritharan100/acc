<?php
// $con = $conn = new mysqli("localhost", "root", "", "trincompcs");
$conn = $con = new mysqli("localhost", "root", "", "acc");

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
if (!$con->set_charset("utf8")) {
   // printf("Error loading character set utf8: %s\n", $con->error);
    exit();
} else {
    
}

 

    
function UserLog($module, $action, $detail) {
  if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
      // session_start();
      global $con;  
    
    if(isset($_COOKIE['client_cook'])){
       $selected_client= $_COOKIE['client_cook'];
         $sel_query="SELECT c_id from client_registration where md5_client='$selected_client'";
      $result = mysqli_query($con,$sel_query);
      $row = mysqli_fetch_assoc($result); 
      $location = $row['c_id'];
    }else {
         $location = '0';
    }
    

    $usr_id = $_SESSION['user_id'];
    $module = mysqli_real_escape_string($con, $module);
    $action = mysqli_real_escape_string($con, $action);
    $detail = mysqli_real_escape_string($con, $detail); 
 
    $sql = "INSERT INTO `user_log` (`usr_id`, `module`, `action`, `detail`,location) 
            VALUES ('$usr_id', '$module', '$action', '$detail','$location')";

    if (mysqli_query($con, $sql)) {
        return true; 
    } else {
       
        echo "Error: " . $sql . "<br>" . mysqli_error($con);
        return false; 
    }
}

     function f_number($number, $decimals = 2) {
  // Handle zero cases (consider both positive and negative)
  if ($number == 0) { // Use == to consider both 0 and -0 as equal to 0
    return ''; // Format zero with the specified number of decimals
  }

  // Use number_format for non-zero values
  $formatted = number_format(abs($number), $decimals);

  // Check if formatted string ends with ".00" (no significant decimals)
  if (substr($formatted, -3) === ".00") {
    // Remove trailing ".00" if no decimals are significant
    $formatted = substr($formatted, 0, -3);
  }

  // Prepend the sign for non-zero values
  return ($number < 0 ? '-' : '') . $formatted;
}


// Function to convert date from 'DD-MM-YYYY' or 'DD/MM/YYYY' to 'YYYY-MM-DD'
function save_date($d) {
    $d = str_replace('/', '-', $d);
    $dt = DateTime::createFromFormat('d-m-Y', $d);
    if ($dt) return $dt->format('Y-m-d');
    $dt = DateTime::createFromFormat('Y-m-d', $d);
    if ($dt) return $dt->format('Y-m-d');
    return '';
}

?>
