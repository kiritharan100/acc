<?php
include("../../db.php");
include("../../auth.php");

header('Content-Type: application/json');

// DataTables parameters
$draw   = intval($_POST['draw'] ?? 1);
$start  = intval($_POST['start'] ?? 0);
$length = intval($_POST['length'] ?? 25);
$search = mysqli_real_escape_string($con, $_POST['search']['value'] ?? '');
$orderColIndex = intval($_POST['order'][0]['column'] ?? 2);
$orderDir = strtolower($_POST['order'][0]['dir'] ?? 'desc') === 'asc' ? 'asc' : 'desc';

// Filters
$start_date_input = save_date($_POST['start_date'] ?? '');
$end_date_input   = save_date($_POST['end_date'] ?? '');
$show_deleted     = isset($_POST['show_deleted']) && $_POST['show_deleted'] == '1';
$status_filter    = $show_deleted ? "AND j.status = 0" : "AND j.status = 1";

$start_date = $start_date_input ?: date('Y-m-d', strtotime('-30 days'));
$end_date   = $end_date_input   ?: date('Y-m-d');
$start_datetime = $start_date . ' 00:00:00';
$end_datetime   = $end_date . ' 23:59:59';

$orderableColumns = [
    0 => 'j.id',           // checkbox (not used)
    1 => 'j.id',           // #
    2 => 'j.journal_date', // Journal Date
    3 => 'j.loc_no',       // Ref
    4 => 'j.memo',         // Memo
    5 => 'j.total_credit', // Amount
    6 => 'j.status'        // Status
];
$orderBy = $orderableColumns[$orderColIndex] ?? 'j.journal_date';

$where = "WHERE j.journal_date BETWEEN '$start_datetime' AND '$end_datetime' AND j.location_id = '$location_id' $status_filter";
if ($search !== '') {
    $where .= " AND (j.memo LIKE '%$search%' OR j.loc_no LIKE '%$search%' OR j.journal_date LIKE '%$search%')";
}

// Total count
$totalRes = mysqli_query($con, "SELECT COUNT(*) AS cnt FROM accounts_journal j WHERE j.location_id = '$location_id'");
$totalRow = mysqli_fetch_assoc($totalRes);
$recordsTotal = intval($totalRow['cnt'] ?? 0);

// Filtered count
$filteredRes = mysqli_query($con, "SELECT COUNT(*) AS cnt FROM accounts_journal j $where");
$filteredRow = mysqli_fetch_assoc($filteredRes);
$recordsFiltered = intval($filteredRow['cnt'] ?? 0);

// Data query
$dataSql = "
    SELECT j.*,
      EXISTS(
        SELECT 1 FROM accounts_transaction t
        WHERE t.source = 'J' AND t.source_id = j.id AND t.vat_filed_status = 1
        LIMIT 1
      ) AS has_filed_vat
    FROM accounts_journal j
    $where
    ORDER BY $orderBy $orderDir
    LIMIT $start, $length
";
$dataRes = mysqli_query($con, $dataSql);

$data = [];
$rowNumber = $start + 1;
while ($j = mysqli_fetch_assoc($dataRes)) {
    $disableCheckbox = ($j['has_filed_vat'] == 1) ? 'disabled title="VAT filed - cannot delete"' : '';
    $checkbox = "<input type='checkbox' class='journal-select' value='{$j['id']}' $disableCheckbox>";
    $ref = "<a class='dropdown-item' href='#' onclick='viewJournal({$j['id']})'>J{$j['loc_no']}</a>";
    $statusText = ($j['status'] ? 'Posted' : 'Cancelled');
    $actions = "<div class='dropdown'>
        <button class='btn btn-outline-primary btn-sm dropdown-toggle' type='button' id='act{$j['id']}' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
          <i class='fa fa-cog'></i> Action
        </button>
        <div class='dropdown-menu' aria-labelledby='act{$j['id']}'>
          <a class='dropdown-item' href='#' onclick='viewJournal({$j['id']})'><i class='fa fa-eye text-info'></i> View Journal</a>
          <a class='dropdown-item' href='#' onclick='editJournal({$j['id']})'><i class='fa fa-edit text-primary'></i> Edit Journal</a>
          <a class='dropdown-item' href='#' onclick='copyJournal({$j['id']})'><i class='fa fa-copy text-warning'></i> Copy Journal</a>";
    if ($j['status'] == 1) {
        $actions .= "<a class='dropdown-item' href='#' onclick='deleteJournal({$j['id']})'><i class='fa fa-trash text-danger'></i> Delete Journal</a>";
    } else {
        $actions .= "<a class='dropdown-item' href='#' onclick='RestoreJournal({$j['id']})'><i class='fa fa-undo text-success'></i> Restore Journal</a>";
    }
    $actions .= "</div></div>";

    $data[] = [
        $checkbox,
        $rowNumber++,
        $j['journal_date'],
        $ref,
        htmlspecialchars($j['memo']),
        number_format($j['total_credit'], 2),
        $statusText,
        $actions
    ];
}

echo json_encode([
    'draw' => $draw,
    'recordsTotal' => $recordsTotal,
    'recordsFiltered' => $recordsFiltered,
    'data' => $data
]);
