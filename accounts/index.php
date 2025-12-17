<?php 
ini_set('display_errors', 1);
error_reporting(E_ALL);
include 'header.php'; ?>
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

                        <h5 class="mb-2">Pending Day End Reviews</h5>

                    </div>
                </div>


                <div class="card bg-warning text-dark">
                    <div class="card-block p-3">
                        <h5 class="mb-3">Top 10 Outstanding</h5>
                        <div class="table-responsive">
                            <table width='100%'>
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Customer</th>
                                        <th class="text-end">Balance (Rs.)</th>
                                    </tr>
                                </thead>
                                <tbody>

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
                            <input type="date" name="from" id="expense_from" class="form-control form-control-sm mr-2"
                                value="<?= date('Y-m-d', strtotime('-30 days')) ?>">
                            <input type="date" name="to" id="expense_to" class="form-control form-control-sm mr-2"
                                value="<?= date('Y-m-d') ?>">
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






        </div>
    </div>
</div>



<?php include 'footer.php'; ?>
