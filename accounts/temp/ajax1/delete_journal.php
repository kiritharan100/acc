<?php
include("../../db.php");
include("../../auth.php");

$id = intval($_POST['id']);
if (!$id) {
  echo "Invalid journal ID";
  exit;
}

mysqli_query($con, "UPDATE acc_journal SET status = 0 WHERE id = $id");
mysqli_query($con, "UPDATE acc_journal_detail SET status = 0 WHERE journal_id = $id");
mysqli_query($con, "DELETE FROM acc_transaction WHERE ref_no = $id AND tra_type = 'JOURNAL'");

UserLog("3", "Journal Cancelled", "Journal ID $id");
echo "Journal cancelled successfully.";
