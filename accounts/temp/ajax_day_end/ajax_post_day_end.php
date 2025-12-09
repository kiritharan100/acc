 <?php
 ini_set('display_errors', 1);
error_reporting(E_ALL);
include '../../db.php';
include '../../auth.php';
header('Content-Type: application/json');

$serial_no = $_POST['serial_no'] ?? null;
$location_id = $_REQUEST['location_id'] ?? 0;
if (!$serial_no) {
    echo json_encode(['success' => false, 'message' => 'Missing Serial Number']);
    exit;
}

// Fetch day end record
$query = "SELECT * FROM day_end_process WHERE serial_no = '$serial_no' AND location_id ='$location_id'";
$res = mysqli_query($con, $query);
if (!$res || mysqli_num_rows($res) === 0) {
    echo json_encode(['success' => false, 'message' => 'Day End record not found.']);
    exit;
}
$data = mysqli_fetch_assoc($res);
if ($data['posted'] == 1) {
    echo json_encode(['success' => false, 'message' => 'This transaction is already posted.']);
    exit;
}

$location_id = $data['location_id'];
$date_ended = $data['date_ended'];
$t_memo = "Day End Serial #$serial_no";

$fuel_sales         = floatval($data['fuel_sales']);
$oil_sales          = floatval($data['oil_sales']);
$card_sales         = floatval($data['total_card_settled']);
$credit_sales       = floatval($data['total_credit_settle']);
$fuel_short_excess  = floatval($data['fuel_short_excess']);
$oil_short_excess   = floatval($data['oil_short_excess']);

$total_sales = $fuel_sales + $oil_sales;
$sales_ledger = $total_sales - $card_sales - $credit_sales;
$short_excess = $fuel_short_excess + $oil_short_excess;
$cash_sales = $total_sales - $card_sales - $credit_sales + $short_excess;

// Validate credit sales match
$shed_credit = floatval(mysqli_fetch_assoc(mysqli_query($con, "
    SELECT IFNULL(SUM(total_sales), 0) as shed_credit
    FROM shed_credit_sales
    WHERE day_end = '$serial_no' AND status = 1 AND location_id = '$location_id'
"))['shed_credit']);

$oil_credit = floatval(mysqli_fetch_assoc(mysqli_query($con, "
    SELECT IFNULL(SUM(issue_total), 0) as oil_credit
    FROM oil_sales_master
    WHERE day_end = '$serial_no' AND issue_status = 1 AND to_location > 0 AND location = '$location_id'
"))['oil_credit']);

$combined_credit = $shed_credit + $oil_credit;
$expected_credit = $credit_sales;

if (abs($combined_credit - $expected_credit) > 0.01) {
    echo json_encode([
        'success' => false,
        'message' => 'Credit mismatch: expected ' . number_format($expected_credit, 2) . ', found ' . number_format($combined_credit, 2)
    ]);
    exit;
}

// Day-end journal summary
$entries = [
    ['ca_id' => 10, 'type' => 'credit', 'amount' => $sales_ledger],
    // ['ca_id' => 11, 'type' => 'credit', 'amount' => $credit_sales],
    ['ca_id' => 12, 'type' => 'credit', 'amount' => $card_sales],
    ['ca_id' => 7,  'type' => 'debit',  'amount' => $cash_sales],
    // ['ca_id' => 1,  'type' => 'debit',  'amount' => $card_sales],
];


if($card_sales > 0){
$card_sales_entries = [];
$query = "
    SELECT card.ca_id, card.card_name, SUM(amount) AS card_sales 
    FROM shed_card_sales card_sale
    INNER JOIN shed_card_type card ON card.card_id = card_sale.card_type
    WHERE card_sale.location_id = '$location_id' 
      AND card_sale.day_end = '$serial_no' 
      AND card_sale.status = 1
    GROUP BY card_sale.card_type
";


$result = mysqli_query($con, $query);
while ($row = mysqli_fetch_assoc($result)) {
    $card_sales_entries[] = [
        'ca_id' => $row['ca_id'],
        'type'  => 'debit',
        'amount' => $row['card_sales']
    ];
}
$entries = array_merge($entries, $card_sales_entries);
}




$credit_sql = "SELECT ca_id, SUM(total) AS total
FROM (
    SELECT mc.ca_id, SUM(scs.total_sales) AS total
    FROM shed_credit_sales scs
    INNER JOIN mange_customer mc ON mc.c_id = scs.c_id
    WHERE scs.day_end = '$serial_no' AND scs.status = 1 AND scs.location_id = '$location_id'
    GROUP BY mc.ca_id

    UNION ALL

    SELECT mc.ca_id, SUM(osm.issue_total) AS total
    FROM oil_sales_master osm
    INNER JOIN mange_customer mc ON mc.c_id = osm.to_location
    WHERE osm.day_end = '$serial_no' AND osm.location = '$location_id' AND osm.to_location > 0
    GROUP BY mc.ca_id
) AS combined
GROUP BY ca_id";
// $credit_sql = "
//     SELECT mc.ca_id, SUM(scs.total_sales) AS total
//     FROM shed_credit_sales scs
//     INNER JOIN mange_customer mc ON mc.c_id = scs.c_id
//     WHERE scs.day_end = '$serial_no' AND scs.status = 1 AND scs.location_id = '$location_id'
//     GROUP BY mc.ca_id
// ";
$res_credit = mysqli_query($con, $credit_sql);
while ($row = mysqli_fetch_assoc($res_credit)) {
    $entries[] = [
        'ca_id' => $row['ca_id'],
        'type'  => 'credit',
        'amount'=> floatval($row['total'])
    ];
}





if ($short_excess != 0) {
    $entries[] = [
        'ca_id' => 19,
        'type'  => $short_excess < 0 ? 'debit' : 'credit',
        'amount'=> abs($short_excess)
    ];
}

// Insert day-end summary
foreach ($entries as $entry) {
    $debit = $entry['type'] === 'debit' ? $entry['amount'] : 0;
    $credit = $entry['type'] === 'credit' ? $entry['amount'] : 0;
    $ca_id = $entry['ca_id'];
    $sql = "INSERT INTO acc_transaction (
        location_id, ca_id, t_date, tra_type, ref_no,
        debit, credit, vat_rate, debit_Vat, credit_vat,
        t_memo, credted_by, created_on, source
    ) VALUES (
        '$location_id', '$ca_id', '$date_ended', 'Day End', '$serial_no',
        '$debit', '$credit', 0, 0, 0,
        '$t_memo', '$user_id', NOW(), ''
    )";
    mysqli_query($con, $sql);
}

// 🔹 Fuel Credit Sales (Trade Receivable)
$res = mysqli_query($con, "
    SELECT cs_id, invoice_no, inv_id, vehicle_no, total_sales, ref_no, shed_credit_sales.c_id , mange_customer.ca_id
    FROM shed_credit_sales
    INNER JOIN mange_customer on mange_customer.c_id = shed_credit_sales.c_id
    WHERE day_end = '$serial_no' AND shed_credit_sales.status = 1 AND location_id = '$location_id'
");
while ($row = mysqli_fetch_assoc($res)) {
    $memo = "FU: OR# {$row['ref_no']},Inv#{$row['invoice_no']}, Veh:{$row['vehicle_no']}";
     
    $sql = "INSERT INTO acc_transaction (
        location_id, ca_id, t_date, tra_type, ref_no,
        debit, credit, vat_rate, debit_Vat, credit_vat,
        t_memo, credted_by, created_on, cus_id, source, source_id
    ) VALUES (
        '$location_id', '8', '$date_ended', 'Day End', '$serial_no',
        '{$row['total_sales']}', 0, 0, 0, 0,
        '$memo', '$user_id', NOW(), '{$row['c_id']}', 'Fuel Sales', '{$row['cs_id']}'
    )";
    mysqli_query($con, $sql);
}

// 🔹 Oil Credit Sales
$res = mysqli_query($con, "
    SELECT iss_id, invoice_no, issue_total, to_location, loc_id
    FROM oil_sales_master
    WHERE day_end = '$serial_no' AND issue_status = 1 AND to_location > 0 AND location = '$location_id'
");
while ($row = mysqli_fetch_assoc($res)) {
    $memo = "Oil Cr : Inv# {$row['loc_id']}";
    $sql = "INSERT INTO acc_transaction (
        location_id, ca_id, t_date, tra_type, ref_no,
        debit, credit, vat_rate, debit_Vat, credit_vat,
        t_memo, credted_by, created_on, cus_id, source, source_id
    ) VALUES (
        '$location_id', '8', '$date_ended', 'Day End', '$serial_no',
        '{$row['issue_total']}', 0, 0, 0, 0,
        '$memo', '$user_id', NOW(), '{$row['to_location']}', 'Oil Sales', '{$row['iss_id']}'
    )";
    mysqli_query($con, $sql);
}

 
// //   Mark as posted
mysqli_query($con, "UPDATE day_end_process SET posted = 1, posted_by = '$user_id' WHERE serial_no = '$serial_no'");


 

echo json_encode(['success' => true]);
