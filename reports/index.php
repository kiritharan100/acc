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
                <div class="card bg-danger text-white">
                    <div class="card-block">
                        <?php
                        $day_end_q = mysqli_query($con, "SELECT COUNT(*) as total FROM day_end_process WHERE location_id = '$location' AND posted = 0");
                        $day_end_row = mysqli_fetch_assoc($day_end_q);
                        ?>
                        <h5 class="mb-2">Pending Day End Reviews</h5>
                        <h3><?= $day_end_row['total'] ?> Nos</h3>
                    </div>
                </div>


 <div class="card bg-warning text-dark">
    <div class="card-block p-3">
        <h5 class="mb-3">Top 10 Outstanding</h5>
        <div class="table-responsive">
     <table  width='100%'>
                <thead class="thead-dark">
                    <tr>
                        <th>Customer</th>
                        <th class="text-end">Balance (Rs.)</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $cust_sql = "SELECT LEFT(c.customer_name, 25) AS customer_name, SUM(t.debit - t.credit) AS balance
                                 FROM mange_customer c
                                 LEFT JOIN acc_transaction t ON c.c_id = t.cus_id  
                                 WHERE t.status = 1 AND c.c_id > 3 AND t.ca_id = 8
                                 GROUP BY c.c_id
                                 ORDER BY balance DESC
                                 LIMIT 10";
                    $cust_res = mysqli_query($con, $cust_sql);
                    while ($row = mysqli_fetch_assoc($cust_res)) {
                        echo '<tr>';
                        echo '<td>' . htmlspecialchars($row['customer_name']) . '</td>';
                        echo '<td class="text-end">Rs. ' . number_format($row['balance'], 2) . '</td>';
                        echo '</tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


            </div>

             <div class="col-md-9">
    <div class="card">
        <div class="card-block">
            <h5 class="mb-3">Classification of Expenses</h5>

            <form class="form-inline mb-2" id="expenseFilterForm">
                <input type="date" name="from" id="expense_from" class="form-control form-control-sm mr-2" value="<?= date('Y-m-d', strtotime('-30 days')) ?>">
                <input type="date" name="to" id="expense_to" class="form-control form-control-sm mr-2" value="<?= date('Y-m-d') ?>">
                <button type="submit" class="btn btn-sm btn-primary">Filter</button>
            </form>

            <div id="expense_chart" style="height: 400px;"></div>
        </div>
    </div>
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

            <!-- Card 4: Weekly Account Balances -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-block">
                        <h5 class="mb-3">Weekly Account Balances</h5>
                        <div id="weekly_balance_chart" style="height: 400px;"></div>
                    </div>
                </div>
            </div>

  

<script>
function loadExpenseChart(from, to) {
    $.get('../admin/ajax/dashboard_expense_classification.php?location_id=<?php echo $location_id; ?>', { from, to }, function (data) {
        Highcharts.chart('expense_chart', {
            chart: { type: 'pie' },
            title: { text: '' },
             credits: { enabled: false },
            tooltip: {
                pointFormat: '<b>{point.percentage:.1f}%</b> (Rs. {point.y:,.2f})'
            },
            accessibility: {
                point: { valueSuffix: '%' }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: { enabled: true, format: '{point.name}: {point.percentage:.1f} %' }
                }
            },
            series: [{
                name: 'Expenses',
                colorByPoint: true,
                data: data
            }]
        });
    });
}

$('#expenseFilterForm').on('submit', function (e) {
    e.preventDefault();
    const from = $('#expense_from').val();
    const to = $('#expense_to').val();
    loadExpenseChart(from, to);
});

$(document).ready(function () {
    loadExpenseChart($('#expense_from').val(), $('#expense_to').val());
});
</script>



            
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
