<?php
$token = substr(round(microtime(true)*12345/325), 5);

// Email details
$to = 'kiritharan100@gmail.com';
$subject = 'Device Registration Token e assadsad';

// HTML email content
$message = '
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-color: #32CD32; /* Green background */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 20px auto;
            background-color: #E3E8E6; /* White background */
            padding: 20px;
            border: 1px solid #fffff; /* Green border */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header img {
            max-width: 150px;
        }
        .content {
            text-align: center;
            font-size: 16px;
        }
        .footer {
            text-align: center;
            font-size: 12px;
            color: #888;
            margin-top: 20px;
        }
        .footer a {
            color: #888;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="https://dtecstudio.com/PDIM/assets/images/logo-black.png" alt=" Logo">
        </div>
        <div class="content">
            <p>Dear User,</p>
            <p>Please enter the following device registration token to confirm your user login:</p>
            <p><strong>' . $token . '</strong></p>
        </div>
        <div class="footer">
            <p>If this email is not relevant to the software or you did not request it, please <a href="unsubscribe-link">unsubscribe</a>.</p>
        </div>
    </div>
</body>
</html>';

// Email headers
$headers = "MIME-Version: 1.0" . "\r\n";
$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
$headers .= 'From: Your Company <no-reply@dsthambalagamuwa.com/>' . "\r\n";

// Send email
if (mail($to, $subject, $message, $headers)) {
    echo 'Email sent successfully.';
} else {
    echo 'Failed to send email.';
}
?>
