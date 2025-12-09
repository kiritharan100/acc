 <?php include 'header.php'; ?>
 <div class="content-wrapper">
  <div class="container-fluid">
    <div class="main-header">
      <h5>ACCOUNTS | <?php echo $client_name; ?> | NEW CHART OF ACCOUNTS</h5>
    </div>

    <div class="row" style='z-index:-50;'>
      <div class="col-md-12"  >
        <div class="card" >
          <div class="card-block"  >
            <div class="table-responsive" style='z-index:99;' >

              <div align='right' >
                <button type='button' id="exportButton" filename='Chart_of_accounts.xlsx' class="btn btn-primary"><i class="ti-cloud-down"></i> Export</button>
                <button class="btn btn-success" onclick="openCreateModal()">+ Add </button>
              </div>
            <hr>
              <table id='example' class="table table-bordered table-striped table-hover table-sm">
                <thead>
                  <tr>
                    <th>Account ID</th>
                 
                  </tr>
                </thead>
                <tbody>
                  <!-- Data will be populated via AJAX -->
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>

    

  </div>
</div>

 <?php include 'footer.php';?>
 