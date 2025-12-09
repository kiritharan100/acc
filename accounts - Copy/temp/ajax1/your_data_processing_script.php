 <?php 
 
 function getOpeningStockValue($con, $location_id, $as_of_date) {
    $total_opening_value = 0;

    // -------------------------
    // FUEL OPENING VALUE
    // -------------------------
    $qty_sql = mysqli_query($con, "
        SELECT p_id, SUM(debit - credit) AS qty
        FROM fuel_stock_ledger
        WHERE status = 1
          AND location_id = '$location_id'
          AND DATE(date_time) < '$as_of_date'
        GROUP BY p_id
    ");

    while ($row = mysqli_fetch_assoc($qty_sql)) {
        $p_id = $row['p_id'];
        $rate_sql = mysqli_query($con, "
            SELECT new_price 
            FROM fuel_price_change
            WHERE p_id = '$p_id'
              AND status = 1 
              AND cancellation = 0
              AND date_time < '$as_of_date'
            ORDER BY date_time DESC 
            LIMIT 1
        ");
        $rate_row = mysqli_fetch_assoc($rate_sql);
        $price = isset($rate_row['new_price']) ? floatval($rate_row['new_price']) : 0;
        $total_opening_value += floatval($row['qty']) * $price;
    }

    // -------------------------
    // OIL OPENING VALUE
    // -------------------------
    $oil_sql = mysqli_query($con, "
        SELECT batch_id, purchase_qty, sales_price
        FROM oil_stock
        WHERE grn_status = 1
          AND store_id = '$location_id'
          AND source = 'GRN'
          AND DATE(batch_date) < '$as_of_date'
    ");

    while ($row = mysqli_fetch_assoc($oil_sql)) {
        $batch_id = $row['batch_id'];
        $purchase_qty = floatval($row['purchase_qty']);
        $sales_price = floatval($row['sales_price']);

        // Get total issued qty for this batch before $as_of_date
        $issue_sql = mysqli_query($con, "
            SELECT SUM(issue_qty) AS issued
            FROM oil_sales_detail osd
            INNER JOIN oil_sales_master osm ON osd.iss_id = osm.iss_id
            WHERE osd.batch_id = '$batch_id'
              AND osm.location = '$location_id'
              AND osm.issue_status = 1
              AND DATE(osm.issue_date) < '$as_of_date'
        ");
        $issue_row = mysqli_fetch_assoc($issue_sql);
        $issued_qty = floatval($issue_row['issued']);

        // Get total adjustment qty for this batch before $as_of_date
        $adj_sql = mysqli_query($con, "
            SELECT SUM(adj_qty) AS adjusted
            FROM oil_stock_adjustment
            WHERE batch_id = '$batch_id'
              AND DATE(adj_on) < '$as_of_date'
        ");
        $adj_row = mysqli_fetch_assoc($adj_sql);
        $adjusted_qty = floatval($adj_row['adjusted']);

        // Final available qty = purchase - issued + adjustment
        $available_qty = $purchase_qty - $issued_qty + $adjusted_qty;

        if ($available_qty > 0) {
            $total_opening_value += $available_qty * $sales_price;
        }
    }

    return $total_opening_value;
}

 function getClosingStockValue($con, $location_id, $as_of_date) {
    $total_closing_value = 0;

    // -----------------------------
    // FUEL CLOSING VALUE
    // -----------------------------
    $qty_sql = mysqli_query($con, "
        SELECT p_id, SUM(debit - credit) AS qty
        FROM fuel_stock_ledger
        WHERE status = 1
          AND location_id = '$location_id'
          AND DATE(date_time) <= '$as_of_date'
        GROUP BY p_id
    ");

    while ($row = mysqli_fetch_assoc($qty_sql)) {
        $p_id = $row['p_id'];
        $qty = floatval($row['qty']);

        $rate_sql = mysqli_query($con, "
            SELECT new_price 
            FROM fuel_price_change
            WHERE p_id = '$p_id'
              AND status = 1  
              AND date_time <= '$as_of_date'
            ORDER BY date_time DESC 
            LIMIT 1
        ");

        $rate_row = mysqli_fetch_assoc($rate_sql);
        $price = isset($rate_row['new_price']) ? floatval($rate_row['new_price']) : 0;

        $total_closing_value += $qty * $price;
    }

    // -----------------------------
    // OIL CLOSING VALUE
    // -----------------------------
    $oil_sql = mysqli_query($con, "
        SELECT batch_id, purchase_qty, sales_price
        FROM oil_stock
        WHERE grn_status = 1
          AND store_id = '$location_id'
          AND source = 'GRN'
          AND DATE(batch_date) <= '$as_of_date'
    ");

    while ($row = mysqli_fetch_assoc($oil_sql)) {
        $batch_id      = $row['batch_id'];
        $purchase_qty  = floatval($row['purchase_qty']);
        $sales_price   = floatval($row['sales_price']);

        // Total oil issued up to $as_of_date
        $issue_sql = mysqli_query($con, "
            SELECT SUM(issue_qty) AS issued
            FROM oil_sales_detail osd
            INNER JOIN oil_sales_master osm ON osd.iss_id = osm.iss_id
            WHERE osd.batch_id = '$batch_id'
              AND osm.location = '$location_id'
              AND osm.issue_status = 1
              AND DATE(osm.issue_date) <= '$as_of_date'
        ");
        $issue_row = mysqli_fetch_assoc($issue_sql);
        $issued_qty = floatval($issue_row['issued']);

        // Total adjustments up to $as_of_date
        $adj_sql = mysqli_query($con, "
            SELECT SUM(adj_qty) AS adjusted
            FROM oil_stock_adjustment
            WHERE batch_id = '$batch_id'
              AND DATE(adj_on) <= '$as_of_date'
        ");
        $adj_row = mysqli_fetch_assoc($adj_sql);
        $adjusted_qty = floatval($adj_row['adjusted']);

        // Closing quantity
        $closing_qty = $purchase_qty - $issued_qty - $adjusted_qty;

        if ($closing_qty > 0) {
            $total_closing_value += $closing_qty * $sales_price;
        }
    }

    return $total_closing_value;
}

//////////////////////// ========================================= End of  Opening Balacne Calculation 

 

 function getPurchaseValueByDate($con, $location_id, $date) {
    $total_purchase_value = 0.0;

    // -------------------------
    // FUEL PURCHASE VALUE
    // -------------------------
    $qty_sql = mysqli_query($con, "
        SELECT p_id, SUM(quantity) AS qty
        FROM fuel_purchase_master
        WHERE status = 1
          AND location_id = '$location_id'
          AND DATE(purchase_date) = '$date'
        GROUP BY p_id
    ");

    while ($row = mysqli_fetch_assoc($qty_sql)) {
        $p_id = $row['p_id'];
        $qty  = floatval($row['qty']);

        $price_sql = mysqli_query($con, "
            SELECT new_price
            FROM fuel_price_change
            WHERE p_id = '$p_id'
              AND status = 1
              AND cancellation = 0
              AND DATE(date_time) <= '$date'
            ORDER BY date_time DESC
            LIMIT 1
        ");

        if ($price_row = mysqli_fetch_assoc($price_sql)) {
            $price = floatval($price_row['new_price']);
            $total_purchase_value += $qty * $price;
        }
    }

    // -------------------------
    // OIL PURCHASE VALUE
    // -------------------------
    $oil_sql = mysqli_query($con, "
        SELECT purchase_qty, sales_price as price
        FROM oil_stock
        WHERE grn_status = 1
          AND store_id = '$location_id'
          AND source = 'GRN'
          AND DATE(batch_date) = '$date'
    ");

    while ($row = mysqli_fetch_assoc($oil_sql)) {
        $qty   = floatval($row['purchase_qty']);
        $price = floatval($row['price']);
        $total_purchase_value += $qty * $price;
    }

    return $total_purchase_value;
}


// ======================> Purchased up to yesterday 

// function getPurchaseValueUpToYesterday($con, $location_id, $from_date, $to_date) {
//     $total = 0;

//     $q = mysqli_query($con, "
//         SELECT SUM(quantity * rate) AS total_value
//         FROM fuel_purchase_master
//         WHERE location_id = '$location_id'
//           AND status = 1
//           AND DATE(purchase_date) BETWEEN '$from_date' AND '$to_date'
//     ");

//     if ($q && $row = mysqli_fetch_assoc($q)) {
//         $total = floatval($row['total_value']);
//     }

//     return $total;
// }
 function getPurchaseValueUpToYesterday($con, $location_id, $from_date, $to_date) {
    $total_purchase_value = 0.0;

    // -----------------------------
    // FUEL PURCHASE VALUE
    // -----------------------------
    $sql = mysqli_query($con, "
        SELECT p_id, DATE(purchase_date) AS pur_date, SUM(quantity) AS qty
        FROM fuel_purchase_master
        WHERE location_id = '$location_id'
          AND status = 1
          AND DATE(purchase_date) BETWEEN '$from_date' AND '$to_date'
        GROUP BY p_id, pur_date
    ");

    while ($row = mysqli_fetch_assoc($sql)) {
        $p_id     = $row['p_id'];
        $qty      = floatval($row['qty']);
        $pur_date = $row['pur_date'];

        $rate_q = mysqli_query($con, "
            SELECT new_price
            FROM fuel_price_change
            WHERE p_id = '$p_id'
              AND status = 1
              AND cancellation = 0
              AND DATE(date_time) <= '$pur_date'
            ORDER BY date_time DESC
            LIMIT 1
        ");

        if ($rate_row = mysqli_fetch_assoc($rate_q)) {
            $price = floatval($rate_row['new_price']);
            $total_purchase_value += $qty * $price;
        }
    }

    // -----------------------------
    // OIL PURCHASE VALUE
    // -----------------------------
    $oil_sql = mysqli_query($con, "
        SELECT purchase_qty, sales_price as price
        FROM oil_stock
        WHERE grn_status = 1
          AND store_id = '$location_id'
          AND source = 'GRN'
          AND DATE(batch_date) BETWEEN '$from_date' AND '$to_date'
    ");

    while ($row = mysqli_fetch_assoc($oil_sql)) {
        $qty   = floatval($row['purchase_qty']);
        $price = floatval($row['price']);
        $total_purchase_value += $qty * $price;
    }

    return $total_purchase_value;
}


//=======================> Stock Adjustment Today 
 function getAdjustmentToday($con, $location_id, $selected_date) {
    $total = 0;

    // -----------------------------
    // FUEL ADJUSTMENTS
    // -----------------------------
    $q_adjust = mysqli_query($con, "
        SELECT p_id, SUM(debit - credit) AS net_qty, MAX(sales_price) AS rate
        FROM fuel_stock_ledger
        WHERE shift_id = -2
          AND location_id = '$location_id'
          AND status = 1
          AND DATE(date_time) = '$selected_date'
        GROUP BY p_id
    ");

    while ($row = mysqli_fetch_assoc($q_adjust)) {
        $qty = floatval($row['net_qty']);
        $rate = floatval($row['rate']);
        $total += $qty * $rate;
    }

    // -----------------------------
    // OIL ADJUSTMENTS
    // -----------------------------
    $oil_adjust = mysqli_query($con, "
        SELECT osa.adj_qty, os.sales_price
        FROM oil_stock_adjustment osa
        INNER JOIN oil_stock os ON osa.batch_id = os.batch_id
        WHERE os.store_id = '$location_id'
          AND DATE(osa.adj_on) = '$selected_date'
    ");

    while ($row = mysqli_fetch_assoc($oil_adjust)) {
        $qty   = floatval($row['adj_qty']);
        $price = floatval($row['sales_price']);
        $total += $qty * $price;
    }

    return $total;
}


///============================= Stock Adjustmet up to yesterday 
 function getAdjustmentUpToYesterday($con, $location_id, $from_month_start, $yesterday) {
    $total = 0;

    // -----------------------------
    // FUEL ADJUSTMENTS
    // -----------------------------
    $q_adjust = mysqli_query($con, "
        SELECT p_id, SUM(debit - credit) AS net_qty, MAX(sales_price) AS rate
        FROM fuel_stock_ledger
        WHERE shift_id = -2
          AND location_id = '$location_id'
          AND status = 1
          AND DATE(date_time) BETWEEN '$from_month_start' AND '$yesterday'
        GROUP BY p_id
    ");

    while ($row = mysqli_fetch_assoc($q_adjust)) {
        $qty = floatval($row['net_qty']);
        $rate = floatval($row['rate']);
        $total += $qty * $rate;
    }

    // -----------------------------
    // OIL ADJUSTMENTS
    // -----------------------------
    $oil_adjust = mysqli_query($con, "
        SELECT osa.adj_qty, os.sales_price
        FROM oil_stock_adjustment osa
        INNER JOIN oil_stock os ON osa.batch_id = os.batch_id
        WHERE os.store_id = '$location_id'
          AND DATE(osa.adj_on) BETWEEN '$from_month_start' AND '$yesterday'
    ");

    while ($row = mysqli_fetch_assoc($oil_adjust)) {
        $qty   = floatval($row['adj_qty']);
        $price = floatval($row['sales_price']);
        $total += $qty * $price;
    }

    return $total;
}

//===================================================== Ptice change Today 
function getPriceChangeAdjustmentToday($con, $location_id, $selected_date) {
    $total_adjustment = 0;

    $price_changes = mysqli_query($con, "
        SELECT p_id, new_price, date_time 
        FROM fuel_price_change 
        WHERE DATE(date_time) = '$selected_date'
          AND status = 1
          AND cancellation = 0
    ");

    while ($change = mysqli_fetch_assoc($price_changes)) {
        $pid = $change['p_id'];
        $new_price = floatval($change['new_price']);
        $change_date = $change['date_time'];

        // Get old price before this date
        $old_q = mysqli_query($con, "
            SELECT new_price 
            FROM fuel_price_change 
            WHERE p_id = '$pid'
              AND DATE(date_time) < '$change_date'
              AND status = 1
              AND cancellation = 0
            ORDER BY date_time DESC 
            LIMIT 1
        ");
        if (!$old_q || mysqli_num_rows($old_q) == 0) continue;
        $old_price = floatval(mysqli_fetch_assoc($old_q)['new_price']);

        if ($new_price == $old_price) continue;

        // Get stock before change
        $qty_q = mysqli_query($con, "
            SELECT SUM(debit - credit) AS qty 
            FROM fuel_stock_ledger 
            WHERE p_id = '$pid'
              AND location_id = '$location_id'
              AND status = 1 
              AND DATE(date_time) < '$change_date'
        ");
        $qty = 0;
        if ($qty_q && mysqli_num_rows($qty_q) > 0) {
            $qty = floatval(mysqli_fetch_assoc($qty_q)['qty']);
        }

        if ($qty == 0) continue;

        $adjustment = $qty * ($new_price - $old_price);
        $total_adjustment += $adjustment;
    }

    return $total_adjustment;
}
//================================================================== price changes Yesterday 
function getPriceChangeAdjustmentUpToYesterday($con, $location_id, $from_month_start, $yesterday) {
    $total_adjustment = 0;

    $price_changes = mysqli_query($con, "
        SELECT p_id, new_price, date_time 
        FROM fuel_price_change 
        WHERE DATE(date_time) BETWEEN '$from_month_start' AND '$yesterday'
          AND status = 1
          AND cancellation = 0
    ");

    while ($change = mysqli_fetch_assoc($price_changes)) {
        $pid = $change['p_id'];
        $new_price = floatval($change['new_price']);
        $change_date = $change['date_time'];

        // Get old price before this date
        $old_q = mysqli_query($con, "
            SELECT new_price 
            FROM fuel_price_change 
            WHERE p_id = '$pid'
              AND DATE(date_time) < '$change_date'
              AND status = 1
              AND cancellation = 0
            ORDER BY date_time DESC 
            LIMIT 1
        ");
        if (!$old_q || mysqli_num_rows($old_q) == 0) continue;
        $old_price = floatval(mysqli_fetch_assoc($old_q)['new_price']);

        if ($new_price == $old_price) continue;

        // Get stock before change
        $qty_q = mysqli_query($con, "
            SELECT SUM(debit - credit) AS qty 
            FROM fuel_stock_ledger 
            WHERE p_id = '$pid'
              AND location_id = '$location_id'
              AND status = 1 
              AND DATE(date_time) < '$change_date'
        ");
        $qty = 0;
        if ($qty_q && mysqli_num_rows($qty_q) > 0) {
            $qty = floatval(mysqli_fetch_assoc($qty_q)['qty']);
        }

        if ($qty == 0) continue;

        $adjustment = $qty * ($new_price - $old_price);
        $total_adjustment += $adjustment;
    }

    return $total_adjustment;
}



//////////////////=============================================Credit card sales Today 
function getCardSalesToday($con, $location_id, $selected_date) {
    $total = 0;

    $q = mysqli_query($con, "
        SELECT SUM(amount) AS total 
        FROM shed_card_sales 
        WHERE location_id = '$location_id' 
          AND status = 1 
          AND DATE(created_on) = '$selected_date'
    ");

    if ($q && $row = mysqli_fetch_assoc($q)) {
        $total = floatval($row['total']);
    }

    return $total;
}

//==============================================================>>>>>> Credit card Sales up to yesterday 

function getCardSalesUpToYesterday($con, $location_id, $from_month_start, $yesterday) {
    $total = 0;

    $q = mysqli_query($con, "
        SELECT SUM(amount) AS total 
        FROM shed_card_sales 
        WHERE location_id = '$location_id' 
          AND status = 1 
          AND DATE(created_on) BETWEEN '$from_month_start' AND '$yesterday'
    ");

    if ($q && $row = mysqli_fetch_assoc($q)) {
        $total = floatval($row['total']);
    }

    return $total;
}


// ============================> credit sales Today 

function getCreditSalesTodayByCategory($con, $location_id, $selected_date, $ca_id) {
    $total = 0;

    // --- FUEL CREDIT SALES ---
    $fuel_sql = mysqli_query($con, "
        SELECT SUM(s.total_sales) AS total
        FROM shed_credit_sales s
        INNER JOIN mange_customer c ON s.c_id = c.c_id
        WHERE s.status = 1
          AND s.location_id = '$location_id'
          AND DATE(s.date_time) = '$selected_date'
          AND c.ca_id = '$ca_id'
          AND s.day_end <> '999999999'
    ");

    if ($fuel_sql && $row = mysqli_fetch_assoc($fuel_sql)) {
        $total += floatval($row['total']);
    }

    // --- OIL CREDIT SALES ---
    $oil_sql = mysqli_query($con, "
        SELECT SUM(o.issue_total) AS total
        FROM oil_sales_master o
        INNER JOIN mange_customer c ON o.to_location = c.c_id
        WHERE o.location = '$location_id'
          AND o.issue_status = 1
          AND o.to_location > 0
          AND DATE(o.issue_date) = '$selected_date'
          AND c.ca_id = '$ca_id'
          AND o.day_end <> '999999999'
    ");

    if ($oil_sql && $row = mysqli_fetch_assoc($oil_sql)) {
        $total += floatval($row['total']);
    }

    return $total;
}


//====================================== Credt sales up to yesteday 
function getCreditSalesUpToYesterdayByCategory($con, $location_id, $from_date, $to_date, $ca_id) {
    $total = 0;

    // --- FUEL CREDIT SALES ---
    $fuel_sql = mysqli_query($con, "
        SELECT SUM(s.total_sales) AS total
        FROM shed_credit_sales s
        INNER JOIN mange_customer c ON s.c_id = c.c_id
        WHERE s.status = 1
          AND s.location_id = '$location_id'
          AND DATE(s.date_time) BETWEEN '$from_date' AND '$to_date'
          AND c.ca_id = '$ca_id'
          AND s.day_end <> '999999999'
    ");

    if ($fuel_sql && $row = mysqli_fetch_assoc($fuel_sql)) {
        $total += floatval($row['total']);
    }

    // --- OIL CREDIT SALES ---
    $oil_sql = mysqli_query($con, "
        SELECT SUM(o.issue_total) AS total
        FROM oil_sales_master o
        INNER JOIN mange_customer c ON o.to_location = c.c_id
        WHERE o.location = '$location_id'
          AND o.issue_status = 1
          AND o.to_location > 0
          AND DATE(o.issue_date) BETWEEN '$from_date' AND '$to_date'
          AND c.ca_id = '$ca_id'
          AND o.day_end <> '999999999'
    ");

    if ($oil_sql && $row = mysqli_fetch_assoc($oil_sql)) {
        $total += floatval($row['total']);
    }

    return $total;
}

//============================ cash sales today 
function getCashSalesToday($con, $location_id, $selected_date) {
    $total = 0;

    $q = mysqli_query($con, "
        SELECT fuel_sales, oil_sales, total_card_settled, total_credit_settle
        FROM day_end_process
        WHERE location_id = '$location_id'
          AND status = 1
          AND DATE(date_ended) = '$selected_date'
    ");

    while ($row = mysqli_fetch_assoc($q)) {
        $fuel_sales  = floatval($row['fuel_sales']);
        $oil_sales   = floatval($row['oil_sales']);
        $card_sales  = floatval($row['total_card_settled']);
        $credit_sales = floatval($row['total_credit_settle']);

        $cash_sales = ($fuel_sales + $oil_sales) - $card_sales - $credit_sales;
        $total += $cash_sales;
    }

    return $total;
}

//============================ cash sales upto yesterday 
function getCashSalesUpToYesterday($con, $location_id, $from_date, $to_date) {
    $total = 0;

    $q = mysqli_query($con, "
        SELECT fuel_sales, oil_sales, total_card_settled, total_credit_settle
        FROM day_end_process
        WHERE location_id = '$location_id'
          AND status = 1
          AND DATE(date_ended) BETWEEN '$from_date' AND '$to_date'
    ");

    while ($row = mysqli_fetch_assoc($q)) {
        $fuel_sales  = floatval($row['fuel_sales']);
        $oil_sales   = floatval($row['oil_sales']);
        $card_sales  = floatval($row['total_card_settled']);
        $credit_sales = floatval($row['total_credit_settle']);

        $cash_sales = ($fuel_sales + $oil_sales) - $card_sales - $credit_sales;
        $total += $cash_sales;
    }

    return $total;
}


?>