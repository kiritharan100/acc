<?php include 'header.php'; ?>
<div class="modal fade" id="browserModal" tabindex="-1" role="dialog" aria-labelledby="browserModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="browserModalLabel">Suggestion for changing the browser</h4>
            </div>
            <div class="modal-body" align='center'>
                <p>It looks like you are not using Google Chrome. For the best experience, please use the Chrome browser.</p>
                <a href="https://www.google.com/chrome/" class="btn btn-primary" target="_blank">Download Google Chrome</a>
            </div>
        </div>
    </div>
</div>
    
<!-- <div class="content-wrapper"> -->
    <!-- Container-fluid starts -->
    <div class="container-fluid" style='padding-top: 50px;'  >
 
  
 
       <!-- Header Starts -->
       <div class="row">
          <div class="col-sm-12 p-0">
             <div class="main-header">
                <!-- <h4>Table</h4> -->
                <ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
                   <li class="breadcrumb-item">
                      <a href="index.php">
                         <i class="fa fa-home" aria-hidden="true"></i>
                      </a>
                   </li>
                   <li class="breadcrumb-item"><a href="#">Home Menu</a>
                   </li>
                   
                </ol>
                
 

 
                <div class="card-block">
                     <div class="row boot-ui">
                       
                     
                     
                        <?php  if($user_row['store'] == 1){ ?>   
                        <a href='shed'>  <div class="col-sm-3 col-xs-12 waves-effect waves-light">
                           <div class="grid-material bg-danger" style="opacity: .9;"><img src='img/Supply.png' width='120px;' ><br> FUEL STATION</div>
                        </div></a> <?php } ?>
                                              
                        <a href='accounts'>  <div class="col-sm-3 col-xs-12 waves-effect waves-light">
                           <div class="grid-material bg-danger" style="opacity: .9;"><img src='img/Supply.png' width='120px;' ><br> Accounts</div>
                        </div></a>  
                                                 

                       <?php  if($user_row['admin'] == 1){ ?>   <a href='admin'>  <div class="col-sm-3 col-xs-12 waves-effect waves-light">
                           <div class="grid-material bg-danger" style="opacity: .9;"><img src='img/admin1.png' width='120px;' ><br> ADMIN</div>
                        </div> </a> <?php } ?>
                            
                     
                                                  

                  </div>
                  </div>


             </div>
          </div>
       </div>
       <!-- Header end -->
 
       <div class="row">
          <div class="col-sm-12">
              
              
              
   <?php
// Assume $user_id and $con are already defined

// Check if the user has at least one location
$location_q = mysqli_query($con, "SELECT id FROM user_location WHERE usr_id = '$user_id'");
$has_location = mysqli_num_rows($location_q) > 0;

// Check if the user has at least one module
$module_q = mysqli_query($con, "
    SELECT accounts, store, admin, report 
    FROM user_license 
    WHERE usr_id = '$user_id' 
    LIMIT 1
");

$has_module = false;
if ($row = mysqli_fetch_assoc($module_q)) {
    $has_module = $row['accounts'] || $row['store'] || $row['admin'] || $row['report'];
}

// Determine message
$alertMessage = '';
if (!$has_location && !$has_module) {
    $alertMessage = "No modules or locations have been allocated to your account.<br>Please contact the system administrator.";
} elseif (!$has_location) {
    $alertMessage = "No location has been allocated to your account.<br>Please contact the system administrator.";
} elseif (!$has_module) {
    $alertMessage = "No module has been allocated to your account.<br>Please contact the system administrator.";
}

// Show alert if needed
if ($alertMessage !== '') {
    ?>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
      Swal.fire({
        icon: 'warning',
        title: 'Access Restricted',
        html: `<?= $alertMessage ?>`,
        confirmButtonText: 'OK'
      }).then(() => {
        // window.location.href = 'logout.php'; // Or redirect to a contact page
      });
    </script>
    <?php
   
}
?>




          <!------------------------------------------------------------------------------------------------------------------------------  -->
          
        
          </div>
       </div>
       <!-- Row end -->
       <!-- Tables end -->
    </div>

    <!-- Container-fluid ends -->
 </div>
  
    
    
 <?php include 'footer.php';?>
<!-- Include jQuery -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
<!-- Include Bootstrap JS -->
<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

<script>
$(document).ready(function() {

    function getBrowserInfo() {
        var ua = navigator.userAgent;
        var tem;
        var M = ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
        if (/trident/i.test(M[1])) {
            tem = /\brv[ :]+(\d+)/g.exec(ua) || [];
            return 'IE ' + (tem[1] || '');
        }
        if (M[1] === 'Chrome') {
            tem = ua.match(/\b(OPR|Edge)\/(\d+)/);
            if (tem != null) return tem.slice(1).join(' ').replace('OPR', 'Opera').replace('Edge', 'Edge ');
        }
        M = M[2] ? [M[1], M[2]] : [navigator.appName, navigator.appVersion, '-?'];
        if ((tem = ua.match(/version\/(\d+)/i)) != null) M.splice(1, 1, tem[1]);
        return M.join(' ');
    }

    var browserInfo = getBrowserInfo();
 

    var isLargeScreen = window.innerWidth > 1024;
    var isChrome = browserInfo.toLowerCase().includes('chrome');
    var isEdge = browserInfo.toLowerCase().includes('edge');
    var isUpdatedChrome = isChrome && parseInt(browserInfo.split(' ')[1], 10) >= 108;
    var isUpdatedEdge = isEdge && parseInt(browserInfo.split(' ')[1], 10) >= 108;

    if (isLargeScreen && (!isChrome || !isUpdatedChrome) && (!isEdge || !isUpdatedEdge)) {
        $('#browserModal').modal('show');
    }
});

</script>
<!-- Modal -->
<div class="modal fade" id="zoomModal" tabindex="-1" role="dialog" aria-labelledby="zoomModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="zoomModalLabel">Adjust Your Zoom</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>For the best experience, please set your browser zoom to <strong>90%</strong>.</p>
        <p>
            Press <kbd>Ctrl</kbd> + <kbd>-</kbd> <br>
           
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Got it</button>
      </div>
    </div>
  </div>
</div>


<script>
//   function estimateZoomLevel() {
//     const ratio = window.outerWidth / window.innerWidth;
//     return Math.round(ratio * 100);
//   }

//   $(document).ready(function () {
//     const zoom = estimateZoomLevel();

//     if (zoom !== 90) {
//       $('#zoomModal').modal('show');
//     }
//   });
</script>
   