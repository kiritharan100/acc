<?php
include("../../db.php");
include("../../auth.php");
include("../functions.php");

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

function resolveContactMeta($con, $location_id, $contact_id, array &$cache) {
  $contact_id = intval($contact_id);
  if ($contact_id <= 0) {
    return [null, null, null];
  }

  if (isset($cache[$contact_id])) {
    return $cache[$contact_id];
  }

  $location_id = intval($location_id);
  $contactType = null;
  $supplierId = null;
  $customerId = null;

  $supplierRes = mysqli_query($con, "SELECT sup_id FROM accounts_manage_supplier WHERE sup_id = $contact_id AND location_id = '$location_id' AND status = 1 LIMIT 1");
  if ($supplierRes && mysqli_num_rows($supplierRes) > 0) {
    $contactType = 'Supplier';
    $supplierId = $contact_id;
  } else {
    $customerRes = mysqli_query($con, "SELECT c_id FROM accounts_manage_customer WHERE c_id = $contact_id AND location_id = '$location_id' AND status = 1 LIMIT 1");
    if ($customerRes && mysqli_num_rows($customerRes) > 0) {
      $contactType = 'Customer';
      $customerId = $contact_id;
    }
  }

  $cache[$contact_id] = [$contactType, $supplierId, $customerId];
  return $cache[$contact_id];
}

 

function saveJournal($data, $con, $user_id) {
  $location_id = $data['location_id'];
  $journal_id = $data['id'] ?? 0;
  $date = save_date($data['journal_date']);
  $memo = mysqli_real_escape_string($con, $data['memo']);
  $category = $data['category'];
  $desc = $data['description'];
  $debit = $data['debit'];
  $credit = $data['credit'];
  $vat_ids = isset($data['vat_id']) ? $data['vat_id'] : [];
  $contact_ids = isset($data['contact_id']) ? $data['contact_id'] : [];
  $contactCache = [];

  $totalDr = $totalCr = 0;
  foreach ($debit as $i => $dr) {
    $totalDr += floatval($dr);
    $totalCr += floatval($credit[$i]);
  }
  if (number_format($totalDr, 2) !== number_format($totalCr, 2)) {
    return "Debit and Credit mismatch.";
  }

  // Validate accounting period is open (lock_period = 0)
  list($periodOk, $periodMsg) = ensure_open_period($con, $location_id, $date);
  if (!$periodOk) {
    return $periodMsg;
  }

  list($okMax,) = exec_or_fail($con, "SELECT MAX(loc_no) as max_no FROM accounts_journal WHERE location_id = '$location_id'", 'get max loc_no');
  $get_max = mysqli_query($con, "SELECT MAX(loc_no) as max_no FROM accounts_journal WHERE location_id = '$location_id'");
  $row = $get_max ? mysqli_fetch_assoc($get_max) : ['max_no' => 0];
  $next_loc_no = ($row['max_no'] ?? 0) + 1;

  if ($journal_id > 0) {
    list($ok1,$e1) = exec_or_fail($con, "DELETE FROM accounts_journal_detail WHERE journal_id = $journal_id", 'delete details');
    if(!$ok1) return $e1;
    list($ok2,$e2) = exec_or_fail($con, "DELETE FROM accounts_transaction WHERE source = 'J' AND source_id = $journal_id", 'delete transactions');
    if(!$ok2) return $e2;
    list($ok3,$e3) = exec_or_fail($con, "UPDATE accounts_journal SET journal_date='$date', memo='$memo', total_debit=$totalDr, total_credit=$totalCr WHERE id = $journal_id", 'update journal');
    if(!$ok3) return $e3;
  } else {
    list($ok4,$e4) = exec_or_fail($con, "INSERT INTO accounts_journal (journal_date, memo, total_debit, total_credit, user_id, created_on, status, location_id, loc_no) 
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
    $contact_id = isset($contact_ids[$i]) ? intval($contact_ids[$i]) : 0;
    list($contact_type, $sup_id_val, $cus_id_val) = resolveContactMeta($con, $location_id, $contact_id, $contactCache);
    $contact_id_sql = ($contact_type && $contact_id > 0) ? $contact_id : 'NULL';
    $contact_type_sql = $contact_type ? "'" . mysqli_real_escape_string($con, $contact_type) . "'" : "''";
    $sup_id_sql = ($sup_id_val && $sup_id_val > 0) ? $sup_id_val : 'NULL';
    $cus_id_sql = ($cus_id_val && $cus_id_val > 0) ? $cus_id_val : 'NULL';

    if ($acc_id && ($d > 0 || $c > 0)) {
      // Save to accounts_journal_detail
      list($okd,$ed) = exec_or_fail($con, "INSERT INTO accounts_journal_detail (journal_id, ca_id, description, debit, vat_id, credit, debit_vat, credit_vat, status, contact_id, contact_type)
        VALUES ($journal_id, $acc_id, '$desc_text', $d, $vat_id, $c, $debit_vat, $credit_vat, 1, $contact_id_sql, $contact_type_sql)", 'insert detail');
      if(!$okd) return $ed;
      // Save to accounts_transaction (new schema)
      list($okt,$et) = exec_or_fail($con, "INSERT INTO accounts_transaction (
          tra_date, location_id, ca_id, sup_id, cus_id,
          debit, credit, vat_id, debit_vat_amount, credit_vat_amount, vat_filed_status,
          ref_no, source, source_id, tra_type, memo,
          posted, approved, created_by, created_at
        ) VALUES (
          '$date', '$location_id', $acc_id, $sup_id_sql, $cus_id_sql,
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
  return "Journal saved.|" . $journal_id;
}

$result = saveJournal($_POST, $con, $user_id);
echo $result;
