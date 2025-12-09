<!DOCTYPE html>
<html lang="en">

<head>
	<title>User Registration</title>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="codedthemes">
	<meta name="keywords" content=", Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
	<meta name="author" content="codedthemes">

	<!-- Favicon icon -->
	<link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
	<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

	<!-- Google font-->
	<link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700" rel="stylesheet">

	<!-- iconfont -->
	<link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">

	<!-- Required Fremwork -->
	<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap/css/bootstrap.min.css">

	<!-- waves css -->
	<link rel="stylesheet" type="text/css" href="assets/plugins/Waves/waves.min.css">

	<!-- Style.css -->
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">

	<!-- Responsive.css-->
	<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
	<!--color css-->
	<link rel="stylesheet" type="text/css" href="assets/css/color/color-1.min.css" id="color" />
 
	 
 
</head>

<body>

	<section class="login p-fixed d-flex text-center bg-primary common-img-bg">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<div class="login-card card-block">
					 
							<div class="text-center">
								 	<img src="assets/images/logo-black.png" alt="logo">
							</div>
		 
							<h3 class="text-primary text-center m-b-25">Password Reset Request </h3>
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
							ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

								require('db.php');
								
								    $queryx = "SELECT system_email,company_name,domain FROM letter_head LIMIT 1";
$resultx = mysqli_query($con, $queryx);
$rowx = mysqli_fetch_assoc($resultx);
$system_email = $rowx['system_email'];
$company_name = $rowx['company_name'];
$domain = $rowx['domain'];


								
								if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];

        $token = str_pad(mt_rand(0, 9999999999), 6, '0', STR_PAD_LEFT);
    $sql = "UPDATE user_license SET token='$token' WHERE username='$email'";

    if ($con->query($sql) === TRUE) {
        
        
               $to = $email;
       $message = " To reset your eShed account password:
    
    Token: $token
    Use this token with your mobile number to verify your identity and set a new password. ";
        $result = sendSMS($to, $message);
        
        
        $reset_link = $domain."/setup_password.php";
        
        header("Location: $reset_link");
        exit;
         
    } else {
        echo "<h4 class='text-primary text-center m-b-25'>Error: " . $sql . "<br></h4>" . $con->error;
    }

    $con->close();
}
								
								?>  
						 
                
                  <form method="post" action="">
            <!--    <p>Please enter your email address to reset your password:</p>-->
            <!--    <input type="email" name="email" required>-->
            <!--    <input type="submit" value="Submit">-->
            <!--</form>-->
            
            
            
                 
        
                
                
                               <div class="md-group" align='center'>
								<div class="md-input-wrapper">
								     <input type="number" name="email"     required class="md-form-control" style="width:200px;">
						 
									<label>Mobile Number </label>
								</div>
								  
							</div>
                
						 
							<div class="btn-forgot">
							    <input type="submit" value="Submit" class="btn btn-primary btn-md waves-effect waves-light text-center">
				 
								</button>
							</div>
							</form>  
							<div class="row">
								<div class="col-xs-12 text-center m-t-25">
  <a href="login.php" class="btn btn-outline-secondary btn-md waves-effect waves-light">Go to Login</a>
									 

								</div>
							</div>
							<!-- end of btn-forgot class-->
						</form>
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

	<script src="assets/plugins/jquery/dist/jquery.min.js"></script>
	<script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/plugins/tether/dist/js/tether.min.js"></script>

	<!-- Required Fremwork -->
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!-- waves effects.js -->
	<script src="assets/plugins/Waves/waves.min.js"></script>

	<!-- Custom js -->
	<script type="text/javascript" src="assets/pages/elements.js"></script>

</body>

</html>