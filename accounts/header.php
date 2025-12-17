 <?php  
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
 error_reporting(E_ALL);
 
 require('../db.php');
require('../auth.php');
require_once('functions.php');

 $pending_count = "";
 
   $current_url = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);  
   if(isset($_POST['selected_client'])){
      $selected_client = $_POST['selected_client'];
      setcookie("client_cook", $selected_client, time() + (86400 * 180), "/"); // 86400 = 1 day
      header("Location: $current_url");
      die();
   }else{
      $selected_client = $_COOKIE['client_cook'];
   }


   if(isset($_POST['selected_language'])){
      $selected_language = $_POST['selected_language'];
      setcookie("language_cook", $selected_language, time() + (86400 * 180), "/"); // 86400 = 1 day
      header("Location: $current_url");
      die();
   }else{
      $client_language = isset($_COOKIE['language_cook']) ? $_COOKIE['language_cook'] : 'English';
   }


      $sel_query="SELECT * from client_registration where md5_client='$selected_client'";
      $result = mysqli_query($con,$sel_query);
      $row = mysqli_fetch_assoc($result);
      $client_cook = $row['md5_client'];
      $client_type = $row['client_type'];
      $client_name = $row['client_name'];
      $location_id = $row['c_id'];
      $reg_no = $row['client_id'];
      $is_vat_registered =   $row['is_vat_registered'];

      $client_id = $_SESSION['customer'];
      $company_id = $_SESSION['customer'];

      // Enforce at least one accounting period per location (skip on the period page itself)
      $currentScript = basename($_SERVER['SCRIPT_NAME']);
      if ($currentScript !== 'accounting_periods.php') {
         $locIdCheck = (int)$location_id;
         $period_q = mysqli_query($con, "SELECT 1 FROM accounts_accounting_period WHERE location_id = '$locIdCheck' AND status = 1 LIMIT 1");
         if ($period_q && mysqli_num_rows($period_q) === 0) {
            header("Location: accounting_periods.php?setup_required=1");
            exit;
         }
      }
                                                                // Format qty function
                                                                function format_qty($num) {
                                                                if ($num === null || trim($num) === '') {
                                                                    return '0';
                                                                }

                                                                if (strpos($num, ',') !== false) {
                                                                    $parts = explode(',', $num);
                                                                    $formatted = array_map(function($part) {
                                                                        $part = trim($part);
                                                                        if ($part === '') return 'N/A';
                                                                        return (intval($part) == $part) ? intval($part) : number_format((float)$part, 3, '.', '');
                                                                    }, $parts);
                                                                    return implode(', ', $formatted);
                                                                }
                                                                return (intval($num) == $num) ? intval($num) : number_format((float)$num, 3, '.', '');
                                                            }

      
  ?>
 <!DOCTYPE html>
 <html lang="en">

 <title><?php echo $_SESSION['app_name'].">".$_SESSION['company_name']; ?></title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <meta name="description" content="Quantum Able Bootstrap 4 Admin Dashboard Template by codedthemes">
 <meta name="keywords"
     content="appestia, Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
 <meta name="author" content="codedthemes">

 <!-- Favicon icon -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
 <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon">
 <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon">
 <!-- Custom style for datepicker icon alignment in accounts module -->
 <link rel="stylesheet" href="css/acc_style.css">
 <link rel="stylesheet" href="../assets/css/w3.css">
 <!-- Google font-->
 <link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700" rel="stylesheet">

 <link rel="stylesheet" href="../assets/fonts/font-awesome.min.css">

 <link rel="stylesheet" type="text/css" href="../assets/icon/themify-icons/themify-icons.css">

 <!-- added newly kiri -->
 <link rel="stylesheet" type="text/css" href="../assets/newtheme.css">
 <link rel="stylesheet" type="text/css" href="../assets/newtheme-alter.css">

 <!-- iconfont -->
 <link rel="stylesheet" type="text/css" href="../assets/icon/icofont/css/icofont.css">

 <!-- simple line icon -->
 <link rel="stylesheet" type="text/css" href="../assets/icon/simple-line-icons/css/simple-line-icons.css">

 <!-- Required Fremwork -->
 <link rel="stylesheet" type="text/css" href="../assets/plugins/bootstrap/css/bootstrap.min.css">

 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap.min.css">
 <!-- <link href="https://azukcdncp.azureedge.net/contents/css/bootstrap?v=4.1" rel="stylesheet"/> -->

 <!-- Style.css -->
 <link rel="stylesheet" type="text/css" href="../assets/css/main.css">

 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

 <!-- Responsive.css-->
 <link rel="stylesheet" type="text/css" href="../assets/css/responsive.css">
 <link rel="stylesheet" type="text/css" href="../assets/dataTables.bootstrap4.min.css">
 <link rel="stylesheet" href="../assets/css/bootstrap-select.min.css" />
 <script src="../assets/plugins/jquery/dist/jquery.min.js"></script>
 <script src="../assets/plugins/notification/js/bootstrap-growl.min.js"></script>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

 <link rel="stylesheet"
     href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />

 <style>
.datepicker {
    z-index: 9999 !important;
}
 </style>
 <?php

    function toDB($d){
    if (!$d) return '';
    $d = str_replace('/', '-', $d);
    $dt = DateTime::createFromFormat('d-m-Y', $d);
    return $dt ? $dt->format('Y-m-d') : '';
}
//$lease_date = toDB($_POST['lease_date']);


function toUser($d){
    if (!$d) return '';
    $dt = DateTime::createFromFormat('Y-m-d', $d);
    return $dt ? $dt->format('d/m/Y') : '';
}

//<input type="text" class="form-control date_input" value="<?php echo toUser($row['lease_date']); ">

    ?>




 <style>
@media print {
    .no-print {
        display: none !important;

    }
}

.no-scroll-on-print {
    overflow: hidden !important;

}

@media print {
    .print-only {
        display: block !important;
        width: 100% !important;
    }
}

@media screen {
    .print-only {
        display: none !important;

    }
}

.sidebar-menu .treeview-menu>li>a {
    padding: 5px 10px 8px 20px;
}

.sidebar-menu>li>a {
    padding: 8px 5px 8px 15px;
    display: block;
    position: relative;
    font-size: 15px;
    background-color: #fff;
}
 </style>


 <style>
.loader-bg {
    margin: auto;
    border: 10px solid #EAF0F6;
    border-radius: 50%;
    border-top: 10px solid green;
    width: 80px;
    height: 80px;
    animation: spinner 4s linear infinite;
}

@keyframes spinner {
    0% {
        transform: rotate(0deg);
    }

    100% {
        transform: rotate(360deg);
    }
}

.btn-sm {
    padding: 2px 11px;
    line-height: 16px;
    font-size: 11px;
}
 </style>




 <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css"> -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
 <link href="../assets/bootstrap5-toggle.min.css" rel="stylesheet">


 </head>

 <body class="sidebar-mini fixed" style='overflow-x: visible;'>

     <div class="wrapper ">
         <div class="loader-bg">
             <!--<div class="loader-bar">-->
             <!--</div>-->
         </div>
         <!-- Navbar-->
         <header class="main-header-top hidden-print">
             <a href="../index.php" class="logo"><img class="img-fluid able-logo" src="../assets/images/logo.png"
                     alt="Theme-logo"></a>
             <nav class="navbar navbar-static-top">
                 <!-- Sidebar toggle button-->
                 <a href="#!" data-toggle="offcanvas" class="sidebar-toggle"></a>
                 <ul class="top-nav lft-nav">

                     <li class="dropdown" id='language-select'>
                         <a href="#!" style='font-weight: 800;    font-size: 25px;' data-toggle="dropdown" role="button"
                             aria-haspopup="true" aria-expanded="false"
                             class="dropdown-toggle drop icon-circle drop-image">
                             <span> <i class="fas fa-gas-pump"></i> ACCOUNTS : <?php   echo $client_name; ?></span>
                         </a>

                     </li>


                 </ul>
                 <!-- Navbar Right Menu-->
                 <div class="navbar-custom-menu ">
                     <ul class="top-nav">





                         <li class="dropdown" id='ledger-select'>
                             <a href="#!" data-toggle="dropdown" role="button" aria-haspopup="true"
                                 aria-expanded="false" class="dropdown-toggle drop icon-circle drop-image">
                                 <span>Quick View</span>
                                 <i class="fa fa-arrow-down" aria-hidden="true"></i>
                             </a>
                             <ul class="dropdown-menu settings-menu">
                                 <li><a href="account_ledger.php?ca_id=7">Cash Book</a></li>
                                 <li><a href="account_ledger.php?ca_id=1">Current Account</a></li>
                                 <li><a href="customer_ledger.php">Customer Ledger</a></li>
                                 <li><a href="supplier_ledger.php?sup_id=1">Supplier Ledger</a></li>
                             </ul>
                         </li>


                         <script>
                         $("#language-select li").on("click", function() {
                             var language_select = $(this).attr('id');
                             var form = document.createElement("form");
                             var element2 = document.createElement("input");
                             form.method = "POST";
                             form.action = "";
                             element2.value = language_select;
                             element2.name = "selected_language";
                             form.appendChild(element2);
                             document.body.appendChild(form);
                             form.submit();

                         });
                         </script>

                         <?php $count_client = 0 ;
                        $sel_query="SELECT client_registration.md5_client, client_registration.client_name from client_registration 
                        INNER JOIN
                        user_location ON user_location.location_id  = client_registration.c_id AND user_location.usr_id ='$user_id'
                        
                        where client_registration.user_license='1'";
                        $result = mysqli_query($con,$sel_query);
                         $rowcount=mysqli_num_rows($result);
                         
                        //  if($rowcount > 1){
                         
                         ?>




                         <li class="dropdown" id='client-select'>
                             <form action='' method="POST">
                                 <select id="search_client" name="selected_client" class="form-control input-sm"
                                     style="width:300px;" onchange="this.form.submit()">
                                     <option value="0">Select Location</option>
                                     <?php while($row = mysqli_fetch_assoc($result)) { ?>
                                     <option value="<?php echo $row['md5_client']; ?>"
                                         <?php if ($client_cook == $row['md5_client']) { echo 'selected';  $count_client += 1; } ?>>
                                         <?php echo htmlspecialchars($row['client_name']); ?>
                                     </option>
                                     <?php } ?>
                                 </select>

                             </form>
                         </li> <?php   ?>






                         <!-- <li class="dropdown pc-rheader-submenu message-notification search-toggle">
                  <a href="#!" id="morphsearch-search" class="drop icon-circle txt-white">
                     <i class="ti-search"></i>
                  </a>
               </li> -->

                         <!--Notification Menu-->
                         <li class="dropdown pc-rheader-submenu message-notification search-toggle">
                             <a href="../" id="morphsearch-search" class="drop icon-circle txt-white">
                                 <i class="fa fa-home" aria-hidden="true"></i>
                             </a>
                         </li>

                         </li>
                         <!-- window screen -->
                         <li class="pc-rheader-submenu">
                             <a href="#!" class="drop icon-circle" onclick="javascript:toggleFullScreen()">
                                 <i class="icon-size-fullscreen"></i>
                             </a>

                         </li>
                         <!-- User Menu-->
                         <li class="dropdown">
                             <a href="#!" data-toggle="dropdown" role="button" aria-haspopup="true"
                                 aria-expanded="false" class="dropdown-toggle drop icon-circle drop-image">
                                 <span><img class="img-circle " src="../assets/images/avatar-1.png" style="width:40px;"
                                         alt="User Image"></span>
                                 <span><?php echo $_SESSION['i_name'] ?> <i class="fa fa-angle-down"
                                         aria-hidden="true"></i></span>

                             </a>
                             <ul class="dropdown-menu settings-menu">
                                 <!--<li><a href="#!"><i class="icon-settings"></i> Settings</a></li>-->
                                 <!--<li><a href="#"><i class="icon-user"></i> Profile</a></li>-->
                                 <!--<li><a href="#"><i class="icon-envelope-open"></i> My Messages</a></li>-->
                                 <!--<li class="p-0">-->
                                 <!--   <div class="dropdown-divider m-0"></div>-->
                                 <!--</li>-->
                                 <!--<li><a href="#"><i class="icon-lock"></i> Lock Screen</a></li>-->
                                 <li><a href="../logout.php"><i class="icon-logout"></i> Logout</a></li>

                             </ul>
                         </li>
                     </ul>


                 </div>
             </nav>
         </header>
         <!-- Side-Nav-->
         <aside class="main-sidebar hidden-print ">
             <section class="sidebar" id="sidebar-scroll">
                 <!-- Sidebar Menu-->
                 <ul class="sidebar-menu">
                     <li class="nav-level"> </li>
                     <li class="treeview">

                     </li>

                     <li class="<?php $url='index.php'; if($url == $current_url  ){echo "active";}?> treeview"> <a
                             class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                 class="fa-solid fa-gauge"></i><span> Dashboard</span></a></li>
                     </li>
                     <li class="<?php $url='journal_entry.php'; if($url == $current_url){echo "active";}?> treeview">
                         <a class="waves-effect waves-dark" href="<?php echo $url; ?>"> <i
                                 class="fa-solid fa-table-list"></i><span>
                                 Journal</span></a>
                     </li>



                     <li class="<?php
                        if (in_array($current_url, array('new_chart_of_accounts.php','accounting_periods.php', ''))) {
                            echo "active ";
                        }
                    ?>treeview">
                         <a class="waves-effect waves-dark" href="#!"> <i class="fa fa-cog"
                                 aria-hidden="true"></i><span> Settings </span><i class="icon-arrow-down"></i></a>
                         <ul class="treeview-menu">
                             <li
                                 class="<?php $url = 'new_chart_of_accounts.php'; if ($url == $current_url) { echo "active"; } ?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Chart Of Accounts</a>
                             </li>
                             <li
                                 class="<?php $url = 'accounting_periods.php'; if ($url == $current_url) { echo "active"; } ?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Accounting Periods</a>
                             </li>

                         </ul>
                     </li>




                     <li class="<?php
            if(in_array($current_url , array( 
               'manage_customer.php',
                'manage_supplier.php',
                'Bob'))) {
               echo "active ";
              } ?>treeview"><a class="waves-effect waves-dark" href="#!"> <i class="fas fa-users"></i><span> Contacts
                             </span><i class="icon-arrow-down"></i></a>
                         <ul class="treeview-menu">
                             <li class="<?php $url='manage_customer.php'; if($url == $current_url){echo "active";}?>"><a
                                     class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i>Manage Customer</a></li>
                             <li class="<?php $url='manage_supplier.php'; if($url == $current_url){echo "active";}?>"><a
                                     class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i>Manage Supplier</a></li>
                         </ul>
                     </li>















                     <li class="<?php
            if(in_array($current_url , array( 
               'trial_balance.php', 
               'profit&loss.php', 
               'account_transaction.php', 
               'account_ledger.php', 
               'report_vat_ledger.php',
                  'report_vat_report.php', 
                  'report_Input_vat_analysis.php',
                
              
              'report_purchase_detail.php',
               
                'Bob'))) {
               echo "active ";
              } ?>treeview"><a class="waves-effect waves-dark" href="#!"><i class="fas fa-folder-open"></i><span>
                                 Financial Report</span><i class="icon-arrow-down"></i></a>
                         <ul class="treeview-menu">
                             <li class="<?php $url='profit&loss.php'; if($url == $current_url){echo "active";}?>"><a
                                     class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i>Profit & Loss Statement</a></li>
                             <li class="<?php $url='trial_balance.php'; if($url == $current_url){echo "active";}?>"><a
                                     class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i>Trial Balance</a></li>
                             <li
                                 class="<?php $url='account_transaction.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i>Transactions</a>
                             </li>
                             <li class="<?php $url='account_ledger.php'; if($url == $current_url){echo "active";}?>"><a
                                     class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i>Ledger</a></li>
                             <li class="<?php $url='report_vat_ledger.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> VAT Ledger</a>
                             </li>

                             <li class="<?php $url='report_vat_report.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> VAT Report</a>
                             </li>
                             <li
                                 class="<?php $url='report_Input_vat_analysis.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Input VAT Analysis</a>
                             </li>
                             <li
                                 class="<?php $url='report_purchase_detail.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Purchase Detail F 16B</a>
                             </li>

                         </ul>
                     </li>





                     <li class="<?php
            if(in_array($current_url , array( 
                'report_stock_ledger.php',
                 'fuel_ledger.php', 
               
              'report_sales_monthly.php', 
              'report_sales_monthly_total.php', 
              'report_pump.php', 
               'report_credit_card.php','report_credit_sales.php', 
                'Bob'))) {
               echo "active ";
              } ?>treeview"><a class="waves-effect waves-dark" href="#!"><i class="fas fa-folder-open"></i><span>
                                 Report</span><i class="icon-arrow-down"></i></a>
                         <ul class="treeview-menu">


                             <li
                                 class="<?php $url='report_sales_monthly_total.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Sales F15</a>
                             </li>
                             <li
                                 class="<?php $url='report_sales_monthly.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Sales F 21C</a>
                             </li>
                             <li
                                 class="<?php $url='report_credit_card.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Card Sales - 9C</a>
                             </li>
                             <li
                                 class="<?php $url='report_credit_sales.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Credit Sales - F 9C</a>
                             </li>

                             <li
                                 class="<?php $url='fuel_ledger.php?product=1'; if($url == "fuel_ledger.php"){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Fuel Stock Ledger</a>
                             </li>
                             <li
                                 class="<?php $url='report_stock_ledger.php'; if($url == $current_url){echo "active";}?>">
                                 <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i
                                         class="icon-arrow-right"></i> Oil Stock Ledger </a>
                             </li>
                         </ul>
                     </li>





                     <li
                         class="<?php $url='mange_chart_of_accounts.php'; if($url == $current_url){echo "active";}?> treeview">
                         <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i class="fa fa-book"
                                 aria-hidden="true"></i><span> Chart Of Accounts (Old)</span></a>
                     </li>

                     </li>

                     <li
                         class="<?php $url='new_chart_of_accounts.php'; if($url == $current_url){echo "active";}?> treeview">
                         <a class="waves-effect waves-dark" href="<?php echo $url; ?>"><i class="fa fa-list-alt"
                                 aria-hidden="true"></i><span> New Chart Of Accounts</span></a>
                     </li>

                     </li>



                     <li class="<?php $url='report_user_log.php'; if($url == $current_url){echo "active";}?> treeview">
                         <a class="waves-effect waves-dark" href="<?php echo $url; ?>"> <i
                                 class="fa-solid fa-table-list"></i><span>
                                 User Log</span></a>
                     </li>





                 </ul>
             </section>
         </aside>
         <!-- Sidebar chat start -->
         <div id="sidebar" class="p-fixed header-users showChat">


         </div>
         <div class="showChat_inner">
             <div class="media chat-inner-header">
                 <a class="back_chatBox">
                     <i class="icofont icofont-rounded-left"></i> xxxxxxx
                 </a>
             </div>


         </div>
         <?php $user = $_SESSION['username'];
      $sel_query="SELECT * from user_license where username='$user'";
         $result = mysqli_query($con,$sel_query);
      $user_row = mysqli_fetch_assoc($result);
      if($user_row['accounts'] <> 1){ ?>
         <br><br>
         <div class="content-wrapper">
             <div class="container-fluid">
                 <div class="container permission-denied">
                     <div class="card text-center">
                         <div class="card">
                             <div class="card-header">
                                 <i class="fa fa-exclamation-triangle fa-3x" aria-hidden="true"></i><br>
                                 Access Denied
                             </div>
                             <div class="card-body">
                                 <h5 class="card-title">You don't have permission to access this module</h5>
                                 <p class="card-text">Please contact your administrator if you believe this is a
                                     mistake.
                                 </p><br>
                                 <a href="../index.php" class="btn btn-primary">Go to Homepage</a><br>.
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
         <?php  include 'footer.php';  exit;}   ?>

         <?php
      if($count_client == 0){ ?>
         <br><br>
         <div class="content-wrapper">
             <div class="container-fluid">
                 <div class="container permission-denied">
                     <div class="card text-center">
                         <div class="card">
                             <div class="card-header">
                                 <i class="fa fa-info-circle fa-3x" aria-hidden="true"></i><br>

                                 Select Client
                             </div>
                             <div class="card-body">
                                 <h5 class="card-title">Please select yout Working Location from List</h5>
                                 <p class="card-text">Please contact your administrator if you don't have your location
                                     in the list.
                                 </p><br>
                                 <a href="../index.php" class="btn btn-primary">Go to Homepage</a><br>.
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
         <style>
         .modal-content {
             height: 120px;
             width: 400px;
             margin-right: 20px;
         }

         .modal-arrow {
             top: 10vh;
             transform: translateY(-50%);
             content: "";
             left: 2.2em;
             transform: translateY(-50%) rotate(20deg);
             /* Rotate as needed */
             display: block;
             position: fixed;
             bottom: auto;
             width: 0;
             height: 0;
             border-style: solid;
             border-width: 25px 35px 25px 0;
             border-color: transparent #ffffff transparent transparent;
             -webkit-filter: drop-shadow(-2px 0px 1px rgba(0, 0, 0, .5));
             -moz-filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, .5));
             -ms-filter: drop-shadow(0 1px 2px rgba(0, 0, 0, .5));
             -o-filter: drop-shadow(0 1px 2px rgba(0, 0, 0, .5));
             filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, .5));
         }

         @media (min-width: 768px) {
             .modal-arrow {
                 right: calc(09px + 40%);
                 left: auto;
             }
         }
         </style>

         <script type="text/javascript">
         $(window).on('load', function() {
             $('#myModal').modal('show');
         });
         </script>
         <div class="modal fade in" id="myModal">
             <div class="modal-dialog">
                 <div class="modal-content">
                     <div class="modal-header">
                         <a data-dismiss="modal" class="pull-right">
                             Close
                         </a>
                     </div>
                     <div align='center'> <br> Please Select your Working Location to continue </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
             <div class="modal-arrow"></div>
         </div><!-- /.modal -->
         <?php  include 'footer.php';  exit;}   ?>

         <script>
         function notify(type, title, message1) {
             $.growl({
                 icon: '',
                 title: title,
                 message: message1,
                 url: ''

             }, {
                 element: 'body',
                 type: type,
                 allow_dismiss: true,
                 placement: {
                     from: 'top',
                     align: "right"
                 },
                 offset: {
                     x: 30,
                     y: 30
                 },
                 spacing: 10,
                 z_index: 999999,
                 delay: 4500,
                 timer: 1000,
                 url_target: '_blank',
                 mouse_over: false,
                 animate: {
                     enter: 'animated fadeInDown',
                     exit: 'animated fadeOutUp'
                 },
                 icon_type: 'class',
                 template: '<div data-growl="container" class="alert" role="alert">' +
                     '<button type="button" class="close" data-growl="dismiss">' +
                     '<span aria-hidden="true">&times;</span>' +
                     '<span class="sr-only">Close</span>' +
                     '</button>' +
                     '<span data-growl="icon"></span>' +
                     '<span data-growl="title"></span>' +
                     '<span data-growl="message"></span>' +
                     '<a href="#" data-growl="url"></a>' +
                     '</div>'
             });
         };
         </script>

         <style>
         .dropdown_change select {
             background: transparent;
             width: 100px;
             font-size: 16px;
             border: 1px solid #CCC;
             height: 30px;
         }

         .dropdown_change {
             margin: 0px;
             width: 90px;
             height: 24px;
             border: 2px solid #111;
             border-radius: 3px;
             overflow: hidden;
             /* background: url(down-arrow.ico) 96% / 20% no-repeat #EEE; */
         }

         .dataTables_length {
             position: absolute;
         }

         .table td,
         .table th {
             padding: 2px;
         }
         </style>