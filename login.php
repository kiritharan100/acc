 <?php 
 

 
    function sendSMS($to, $message) {
    // Global credentials
    $user_id   = 290;
    $api_key   = 'a52147cf-ec5b-451d-b4c0-058c030a6d21';
    $sender_id = 'DtecStudio';
    $url       = "https://smslenz.lk/api/send-sms";

    $data = [
        'user_id'   => $user_id,
        'api_key'   => $api_key,
        'sender_id' => $sender_id,
        'contact'   => $to,
        'message'   => $message,
    ];

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $response = curl_exec($ch);
    $timestamp = date("Y-m-d H:i:s");

    if (curl_errno($ch)) {
        $error = curl_error($ch);
        $logMessage = "[$timestamp] ERROR sending to $to: $error\n";
        file_put_contents("sms_log.txt", $logMessage, FILE_APPEND);
        curl_close($ch);
        return ['success' => false, 'error' => $error];
    }

    curl_close($ch);

    // Log the response
    // $logMessage = "[$timestamp] SMS sent to $to: $response\n";
    // file_put_contents("sms_log.txt", $logMessage, FILE_APPEND);

    return ['success' => true, 'response' => $response];
}


?>
 <!DOCTYPE html>
 <html lang="en">

 <head>
     <title>App Login</title>
     <!-- Meta -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
     <meta http-equiv="X-UA-Compatible" content="IE=edge" />
     <meta name="description" content="codedthemes">
     <meta name="keywords" content=",  creative app">
     <meta name="author" content="codedthemes">

     <!-- Favicon icon -->
     <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
     <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
     <link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700" rel="stylesheet">
     <link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
     <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
     <link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap/css/bootstrap.min.css">
     <link rel="stylesheet" type="text/css" href="assets/plugins/Waves/waves.min.css">
     <link rel="stylesheet" type="text/css" href="assets/css/main.css">
     <link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
     <link rel="stylesheet" type="text/css" href="assets/css/color/color-1.min.css" id="color" />
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 </head>

 <body>
     <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
         <!-- Container-fluid starts -->
         <div class="container-fluid">
             <div class="row">

                 <?php if(isset($_REQUEST['multiple_sign_in'])){
    
    echo '<script>
    Swal.fire({
  title: "Logged Out Due to Multiple Sign-Ins",
  text: "You are being logged out because your account was accessed from another device. If this wasn\'t  you, please change your password immediately to protect your account",
  icon: "question"
});
</script>';
}?>


                 <div class="col-sm-12">
                     <div class="login-card card-block">

                         <form class="md-float-material" action="" method="POST" autocomplete="on">
                             <div class="text-center">
                                 <img src="img/logo_123.png" alt="logo" width='150px'>
                             </div>
                             <h3 class="text-center txt-success">

                                 <!--Sign In to your account-->

                                 <?php
					 
								
								
							 date_default_timezone_set("Asia/Colombo");
								// session_destroy(); 
								ini_set('session.gc_maxlifetime', 36000);
								ini_set('session.gc_probability', 1);
								ini_set('session.gc_divisor', 100);
								session_start();

								include 'db.php';
								function getSettings($con) {
								$result = mysqli_query($con, "SELECT * FROM letter_head WHERE id = 1");
								return mysqli_fetch_assoc($result);
									} 
									$settings = getSettings($con);
									$entity =  $settings['company_name'];
									$vat_no = $settings['vat_no'];
                                    $vat_client = !empty($vat_no) ? 1 : 0;
									echo  $entity;



								if (isset($_POST['LoginSubmit'])) {
								    
								    
								    					$ip = $_SERVER['REMOTE_ADDR'];
                                                        $limit_time = date("Y-m-d H:i:s", strtotime("-10 minutes"));
                                                        
                                                        // Count attempts in last 10 minutes
                                                        $sql = "SELECT COUNT(*) as attempt_count FROM login_attempts WHERE ip_address = '$ip' AND attempt_time > '$limit_time' AND try_for='login'";
                                                        $result = mysqli_query($con, $sql);
                                                        $row = mysqli_fetch_assoc($result);
                                                        
                                                        if ($row['attempt_count'] > 5) {
                                                            die("<h4 style='color:red;'>Too many attempts. Try again later.</h4>");
                                                        }
                                                        
									 
									$username = stripslashes($_POST['username']);  
									$username = mysqli_real_escape_string($con, $username);  
									$password = stripslashes($_POST['password']);
									$password = mysqli_real_escape_string($con, "893121129V".$password);
									  $password =md5($password);

									  $query = "SELECT * FROM user_license WHERE username='$username' AND password ='$password' and account_status = '1'";
									$result = mysqli_query($con, $query) or die(mysqli_error());
									$rows = mysqli_num_rows($result);
									$row = mysqli_fetch_assoc($result);
									if ($rows == 1) {
										$date = date('Y-m-d h:i', time());
										$token = md5(round(microtime(true)) / 0.2);
										$update = "UPDATE user_license SET `last_log_in`= '" . $date . "',`last_token`= '" . $token . "'  WHERE username = '" . $username . "'";
						                mysqli_query($con, $update); 
						               
						               
						                
										
										$_SESSION['username'] = $username;
										$_SESSION['user_id'] = $row['usr_id'];
										$_SESSION['customer'] = $row['customer'];
										$_SESSION['i_name'] = $row['i_name'];
										$_SESSION['app_name'] = "e-Shed";
										$_SESSION['company_name'] = $entity;
										$_SESSION['last_token'] = $token;
										$_SESSION['company'] =  $entity;
										$_SESSION['vat_reg_no'] =  $settings['VAT'];
										$_SESSION['vat_invpice_serial'] =  $settings['invoice_prefix'];
										$_SESSION['vat_applicable'] = $vat_client;
										  //$_SESSION['company'] = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
										$_SESSION['address1'] = "Eastern Province";
										$cookie_name = "ACC" . $row['usr_id'];
										$user_id = $row['usr_id'];
									   $encryption = $_COOKIE[$cookie_name];
										$ciphering = "AES-128-CTR";
										$iv_length = openssl_cipher_iv_length($ciphering);
										$options = 0;
										$decryption_iv = '1234567891011121';
										$decryption_key = "kiritharan100@gmail.com";
										$decryption = openssl_decrypt(
											$encryption,
											$ciphering,
											$decryption_key,
											$options,
											$decryption_iv
										);
										 $token = $decryption;
										 $query = "SELECT * from user_device where pf_no='" . $username . "' and token='$token'";
										$result = mysqli_query($con, $query) or die(mysqli_error());
										$count = mysqli_num_rows($result);
										
										 $ip= $_SERVER['REMOTE_ADDR']; 
										  $update123 = "INSERT INTO `user_log` (`usr_id`, `module`, `action`, `detail`) 
                                                     VALUES ('$user_id', '$0', 'Login', 'Login from $ip')";
						                mysqli_query($con, $update123);
										
										
										
									    	$sel_query="SELECT client_registration.md5_client, client_registration.client_name from client_registration 
                                             INNER JOIN
                                            user_location ON user_location.location_id  = client_registration.c_id AND user_location.usr_id ='$user_id' 
                                            where client_registration.user_license='1'";
                                              $result = mysqli_query($con,$sel_query);
                                            $rowcount=mysqli_num_rows($result);
                                            $row123 = mysqli_fetch_assoc($result);  
                                            $last_client = $row123['md5_client'];
                                            if($rowcount == 1){
                                                 $selected_client = $last_client;
                                             setcookie("client_cook",  $selected_client, time() + (86400 * 180), "/"); // 86400 = 1 day
                                            }
                                            
                                 
                    

										if (!isset($_COOKIE[$cookie_name]) || $count == 0) {
											$token = substr(round(microtime(true)*12345/325),5);
											$update="UPDATE user_license SET dr_token = '$token' WHERE  username= '$username'";
												mysqli_query($con, $update) or die(mysqli_error());
												 

                                                                                                     
																	if($settings['admin_device_approval'] == 1){
																		$to = $settings['gm_mobile'];
																		$user = $row['i_name'];
																		$message = "User $user is accessing eShed from a new device. Share this token if the location is valid: $token";
																	}else{
																		$to = $username;
																		$message = 'Your device registration token for eShed:' . $token;
																	}

																	$xxxx = sendSMS($to, $message);

																	if ($xxxx['success']) {
																		echo "SMS Sent  ";
																	} else {
																		echo "SMS Error: " . $result['error'];
																	}


   echo "<script>window.location.href = 'device_registration.php?ip=$ip';</script>";
   exit;
} else {
    echo "<script>window.location.href = 'index.php';</script>";
    exit;
}
                                                                                                     
 
								// 			header("Location: device_registration.php?ip=$ip");
								// 		} else {
								// 			header("Location: index.php");
								// 			exit;
								// 		}

 
									}else{
									    
									    

                                                        
                                                        // Log attempt
                                                        mysqli_query($con, "INSERT INTO login_attempts (ip_address, attempt_time , try_for) VALUES ('$ip', NOW(),'login')");
									    
									    
									    
									    
										echo "<script>
										 alert('Username or Password is incorrect');
										</script>";
									}


								}
								?>


                             </h3>


                             <div class="row">

                                 <div class="col-md-12">
                                     <div class="md-input-wrapper">
                                         <input type="text" name='username' id="username"
                                             class="md-form-control md-valid" required="required" />
                                         <label>User Name</label>
                                     </div>
                                 </div>
                                 <div class="col-md-12">
                                     <div class="md-input-wrapper">
                                         <input type="password" class="md-form-control md-valid" id="password"
                                             name='password' required="required" />
                                         <label>Password</label>
                                     </div>
                                 </div>
                                 <div class="col-sm-6 col-xs-12">
                                     <!-- <div class="rkmd-checkbox checkbox-rotate checkbox-ripple m-b-25">
										<label class="input-checkbox checkbox-primary">
											<input type="checkbox" id="checkbox">
											<span class="checkbox"></span>
										</label>
										<div class="captions">Remember Me</div>

									</div> -->
                                 </div>

                             </div>
                             <div class="row">
                                 <div class="col-xs-10 offset-xs-1">
                                     <!--<button type="submit" class="btn btn-success btn-md btn-block waves-effect text-center m-b-20" name='LoginSubmit'>LOGIN</button>-->
                                     <button type="submit"
                                         class="btn btn-success btn-md btn-block waves-effect text-center m-b-20"
                                         name="LoginSubmit"
                                         onclick="setTimeout(() => { this.disabled = true; this.innerText = 'Processing...'; }, 1)">
                                         LOGIN
                                     </button>
                                 </div>


                             </div>
                         </form>
                         <div class="card-footer">
                             <div class="text-center mt-3">
                                 <a href="reset_request.php" class="btn btn-outline-primary btn-sm">Forgot Password?</a>
                                 <a href="setup_password.php" class="btn btn-outline-primary btn-sm">New User?</a>
                             </div>
                             <div class="col-sm-6 col-xs-12 forgot-phone text-right">


                             </div>
                             <div class="col-sm-12 col-xs-12 text-center">


                                 <div align='center'>
                                     <a href="https://dtecstudio.com/" target='_blank' class="text-right f-w-600">
                                         Solution by : <img src='https://dtecstudio.com/img/logo.png' width='80px;'>
                                     </a>
                                     <!-- <br> <a href='https://chromewebstore.google.com/detail/google-input-tools/mclkkofklkfljcocdinagocijmpgbhab' target='_blank'><img src='https://lh3.googleusercontent.com/KxYKwMcAzhn_DBMVIb0mtvIOsAME2d8-csv5d_vnKYX6PL3D6BGbVy3hH68ky8nM9yTDGAPl6B77pA7tpu4_jeUkXw=s60' width='30px'>Google Input Tools</a> -->
                                 </div>
                                 <!-- <a href='mobile/'> 	 <button class='btn btn-success' type='button' > Staff Login </button></a> -->
                             </div>
                         </div>
                         <!-- </div> -->

                         <!-- end of form -->
                     </div>
                     <!-- end of login-card -->
                 </div>
                 <!-- end of col-sm-12 -->
             </div>
             <!-- end of row -->
         </div>
         <!-- end of container-fluid -->
     </section>

     <!-- Warning Section Starts -->
     <!-- Older IE warning message -->
     <!--[if lt IE 9]>
<div class="ie-warning">
	<h1>Warning!!</h1>
	<p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
	<div class="iew-container">
		<ul class="iew-download">
			<li>
				<a href="http://www.google.com/chrome/">
					<img src="assets/images/browser/chrome.png" alt="Chrome">
					<div>Chrome</div>
				</a>
			</li>
			<li>
				<a href="https://www.mozilla.org/en-US/firefox/new/">
					<img src="assets/images/browser/firefox.png" alt="Firefox">
					<div>Firefox</div>
				</a>
			</li>
			<li>
				<a href="http://www.opera.com">
					<img src="assets/images/browser/opera.png" alt="Opera">
					<div>Opera</div>
				</a>
			</li>
			<li>
				<a href="https://www.apple.com/safari/">
					<img src="assets/images/browser/safari.png" alt="Safari">
					<div>Safari</div>
				</a>
			</li>
			<li>
				<a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
					<img src="assets/images/browser/ie.png" alt="">
					<div>IE (9 & above)</div>
				</a>
			</li>
		</ul>
	</div>
	<p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
     <!-- Warning Section Ends -->
     <!-- Required Jqurey -->



     <script src="assets/plugins/jquery/dist/jquery.min.js"></script>
     <script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
     <script src="assets/plugins/tether/dist/js/tether.min.js"></script>

     <!-- Required Fremwork -->
     <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

     <!-- waves effects.js -->
     <script src="assets/plugins/waves/waves.min.js"></script>
     <!-- Custom js -->
     <script type="text/javascript" src="assets/pages/elements.js"></script>
     <script src="assets/plugins/notification/js/bootstrap-growl.min.js"></script>
     <script src="assets/pages/notification.js"></script>


 </body>

 </html>