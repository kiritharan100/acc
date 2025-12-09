<?php
include("../../db.php");
include("../../auth.php");

function exec_or_fail($con, $sql, $context = '') {
  $ok = mysqli_query($con, $sql);
  if (!$ok) {
    $msg = "DB Error in $context: " . mysqli_error($con);
    error_log($msg . " | SQL: " . $sql);
    return [false, $msg];
  }
  return [true, null];
}

function getVatPercentage($con, $vat_id) {
  if (!$vat_id) return 0;
  $vat_id = intval($vat_id);
  $q = mysqli_query($con, "SELECT percentage FROM accounts_vat_cat WHERE vat_id = $vat_id");
  $row = mysqli_fetch_assoc($q);
  return $row ? floatval($row['percentage']) : 0;
}

function normalizeDateToSql($dateStr) {
  // Expecting input from UI as DD-MM-YYYY; also handle DD/MM/YYYY and already-in-SQL format
  $dateStr = trim($dateStr);
  if ($dateStr === '') return date('Y-m-d');
  $dt = DateTime::createFromFormat('d-m-Y', $dateStr);
  if ($dt instanceof DateTime) return $dt->format('Y-m-d');
  $dt = DateTime::createFromFormat('d/m/Y', $dateStr);
  if ($dt instanceof DateTime) return $dt->format('Y-m-d');
  // Fallback: try to parse any valid date string
  $ts = strtotime($dateStr);
  if ($ts !== false) return date('Y-m-d', $ts);
  // Last resort: today
  return date('Y-m-d');
}

function saveJournal($data, $con, $user_id) {
  $location_id = $data['location_id'];
  $journal_id = $data['id'] ?? 0;
  $date = normalizeDateToSql($data['journal_date']);
  $memo = mysqli_real_escape_string($con, $data['memo']);
  $category = $data['category'];
  $desc = $data['description'];
  $debit = $data['debit'];
  $credit = $data['credit'];
  $vat_ids = isset($data['vat_id']) ? $data['vat_id'] : [];

  $totalDr = $totalCr = 0;
  foreach ($debit as $i => $dr) {
    $totalDr += floatval($dr);
    $totalCr += floatval($credit[$i]);
  }
  if (number_format($totalDr, 2) !== number_format($totalCr, 2)) {
    return "Debit and Credit mismatch.";
  }

  list($okMax,) = exec_or_fail($con, "SELECT MAX(loc_no) as max_no FROM acc_journal WHERE location_id = '$location_id'", 'get max loc_no');
  $get_max = mysqli_query($con, "SELECT MAX(loc_no) as max_no FROM acc_journal WHERE location_id = '$location_id'");
  $row = $get_max ? mysqli_fetch_assoc($get_max) : ['max_no' => 0];
  $next_loc_no = ($row['max_no'] ?? 0) + 1;

  if ($journal_id > 0) {
    list($ok1,$e1) = exec_or_fail($con, "DELETE FROM acc_journal_detail WHERE journal_id = $journal_id", 'delete details');
    if(!$ok1) return $e1;
    list($ok2,$e2) = exec_or_fail($con, "DELETE FROM accounts_transaction WHERE source = 'J' AND source_id = $journal_id", 'delete transactions');
    if(!$ok2) return $e2;
    list($ok3,$e3) = exec_or_fail($con, "UPDATE acc_journal SET journal_date='$date', memo='$memo', total_debit=$totalDr, total_credit=$totalCr WHERE id = $journal_id", 'update journal');
    if(!$ok3) return $e3;
  } else {
    list($ok4,$e4) = exec_or_fail($con, "INSERT INTO acc_journal (journal_date, memo, total_debit, total_credit, user_id, created_on, status, location_id, loc_no) 
      VALUES ('$date', '$memo', $totalDr, $totalCr, '$user_id', NOW(), 1,'$location_id', '$next_loc_no')", 'insert journal');
    if(!$ok4) return $e4;
    $journal_id = mysqli_insert_id($con);
  }

  foreach ($category as $i => $acc_id) {
    $d = floatval($debit[$i]);
    $c = floatval($credit[$i]);
    $desc_text = mysqli_real_escape_string($con, $desc[$i]);
    $vat_id = isset($vat_ids[$i]) ? intval($vat_ids[$i]) : 0;
    $vat_rate = getVatPercentage($con, $vat_id);
    $debit_vat = $d > 0 ? round($d * $vat_rate / 100, 2) : 0;
    $credit_vat = $c > 0 ? round($c * $vat_rate / 100, 2) : 0;
    if ($acc_id && ($d > 0 || $c > 0)) {
      // Save to acc_journal_detail
      list($okd,$ed) = exec_or_fail($con, "INSERT INTO acc_journal_detail (journal_id, ca_id, description, debit, vat_id, credit, debit_vat, credit_vat, status)
        VALUES ($journal_id, $acc_id, '$desc_text', $d, $vat_id, $c, $debit_vat, $credit_vat, 1)", 'insert detail');
      if(!$okd) return $ed;
      // Save to accounts_transaction (new schema)
      list($okt,$et) = exec_or_fail($con, "INSERT INTO accounts_transaction (
          tra_date, location_id, ca_id, sup_id, cus_id,
          debit, credit, vat_id, debit_vat_amount, credit_vat_amount, vat_filed_status,
          ref_no, source, source_id, tra_type, memo,
          posted, approved, created_by, created_at
        ) VALUES (
          '$date', '$location_id', $acc_id, NULL, NULL,
          $d, $c, $vat_id, $debit_vat, $credit_vat, 0,
          $journal_id, 'J', $journal_id, 'J', '$desc_text',
          1, 0, $user_id, NOW()
        )", 'insert transaction');
      if(!$okt) return $et;
    }
  }

  // Set cookie for next default transaction date (24 hours)
  @setcookie('transaction_date', $date, time() + 86400, '/');

  UserLog("3", "Journal Entry", "Memo: $memo");
  return "Journal saved.";
}

$result = saveJournal($_POST, $con, $user_id);
echo $result;
