<?php
include("../../db.php");
include("../../auth.php");
$location_id = $_POST['location_id'];
$journal_id = $_POST['id'] ?? 0;
$date = $_POST['journal_date'];
$memo = mysqli_real_escape_string($con, $_POST['memo']);
$category = $_POST['category'];
$desc = $_POST['description'];
$debit = $_POST['debit'];
$credit = $_POST['credit'];

$totalDr = $totalCr = 0;

foreach ($debit as $i => $dr) {
  $totalDr += floatval($dr);
  $totalCr += floatval($credit[$i]);
}

if (number_format($totalDr, 2) !== number_format($totalCr, 2)) {
  echo "Debit and Credit mismatch."; exit;
}

$get_max = mysqli_query($con, "SELECT MAX(loc_no) as max_no FROM acc_journal WHERE location_id = '$location_id'");
$row = mysqli_fetch_assoc($get_max);
$next_loc_no = ($row['max_no'] ?? 0) + 1;



if ($journal_id > 0) {
  mysqli_query($con, "DELETE FROM acc_journal_detail WHERE journal_id = $journal_id");
  mysqli_query($con, "DELETE FROM acc_transaction WHERE ref_no = $journal_id AND tra_type = 'JOURNAL'");
  mysqli_query($con, "UPDATE acc_journal SET journal_date='$date', memo='$memo', total_debit=$totalDr, total_credit=$totalCr WHERE id = $journal_id");
} else {
  mysqli_query($con, "INSERT INTO acc_journal (journal_date, memo, total_debit, total_credit, user_id, created_on, status, location_id, loc_no) 
    VALUES ('$date', '$memo', $totalDr, $totalCr, '$user_id', NOW(), 1,'$location_id', '$next_loc_no')");
  $journal_id = mysqli_insert_id($con);
}

foreach ($category as $i => $acc_id) {
  $d = floatval($debit[$i]);
  $c = floatval($credit[$i]);
  $desc_text = mysqli_real_escape_string($con, $desc[$i]);
  if ($acc_id && ($d > 0 || $c > 0)) {
    mysqli_query($con, "INSERT INTO acc_journal_detail (journal_id, ca_id, description, debit, credit, status)
      VALUES ($journal_id, $acc_id, '$desc_text', $d, $c, 1)");
    mysqli_query($con, "INSERT INTO acc_transaction (ca_id, t_date, tra_type, ref_no, debit, credit, t_memo, credted_by, created_on,location_id)
      VALUES ($acc_id, '$date', 'JOURNAL', $journal_id, $d, $c, '$desc_text', $user_id, NOW(),'$location_id')");
  }
}

UserLog("3", "Journal Entry", "Memo: $memo");
echo "Journal saved.";
