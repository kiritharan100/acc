 <?php include 'header.php'; ?>
<?php
$today = date('Y-m-d');
$location = $location_id;
?>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="main-header">
             
        </div>

        <div class="row">
            <!-- Card 1: Pending Day Ends -->

                    

            <!-- Card 2: Top Outstanding Customers -->
            <div class="col-md-6 col-xl-3">
                <h2>Dashboard</h2>


            </div>

             <div class="col-md-9">
 
</div>

            <!-- Card 3: Monthly Sales & Purchases Chart -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-block">
                        <h5 class="mb-3">Monthly Sales vs Purchases</h5>
                        <div id="monthly_sales_chart" style="height: 400px;"></div>
                    </div>
                </div>
            </div>

            <!-- Card 4: Daily Stock Balance Chart -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-block">
                        <h5 class="mb-3">Daily Stock Balance - Last 31 Days</h5>
                        <div id="daily_stock_balance_chart" style="height: 400px;"></div>
                    </div>
                </div>
            </div>

          
  

 



            
        </div>
    </div>
</div>

<!-- Load Highcharts -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script>
$(document).ready(function () {
    // Monthly Sales & Purchase
    $.get('ajax/dashboard_monthly_sales.php?location_id=<?php echo $location_id; ?>', function (data) {
        Highcharts.chart('monthly_sales_chart', {
            chart: { type: 'column' },
            credits: { enabled: false },
            title: { text: '' },
            xAxis: { categories: data.months },
            yAxis: { min: 0, title: { text: 'Amount (Rs)' } },
            series: [
                { name: 'Sales', data: data.sales },
                { name: 'Purchases', data: data.purchases }
            ]
        });
    });

    // Daily Stock Balance
    $.get('ajax/dashboard_daily_stock_balance.php?location_id=<?php echo $location_id; ?>', function (data) {
        Highcharts.chart('daily_stock_balance_chart', {
            chart: { type: 'line' },
            credits: { enabled: false },
            title: { text: '' },
            xAxis: { 
                categories: data.dates,
                title: { text: 'Date' }
            },
            yAxis: { 
                title: { text: 'Stock Balance' }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: false
                    },
                    enableMouseTracking: true
                }
            },
            series: data.series
        });
    });

    // Weekly Balance
    $.get('ajax/dashboard_weekly_balance.php?location_id=<?php echo $location_id; ?>', function (data) {
        Highcharts.chart('weekly_balance_chart', {
            chart: { type: 'line' },
            title: { text: '' },
            credits: { enabled: false },
            xAxis: { categories: data.weeks },
            yAxis: { title: { text: 'Balance (Rs)' } },
            series: data.series
        });
    });
});
</script>

<?php include 'footer.php'; ?>
