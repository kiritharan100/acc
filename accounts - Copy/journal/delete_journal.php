<?php
include("../../db.php");
include("../../auth.php");

$id = intval($_POST['id']);
if (!$id) {
  echo "Invalid journal ID";
  exit;
}

$q1 = mysqli_query($con, "
    UPDATE accounts_journal 
    SET status = 0 
    WHERE id = $id AND location_id = '$location_id'
");


if ($q1 && mysqli_affected_rows($con) > 0) {
    mysqli_query($con, "
        UPDATE accounts_journal_detail 
        SET status = 0 
        WHERE journal_id = $id
    ");
}

mysqli_query($con, "UPDATE accounts_transaction SET reversed = 1, reversed_by = $user_id, reversed_at = NOW() WHERE ref_no = $id AND source = 'J' AND location_id = '$location_id'");

UserLog("3", "Journal Cancelled", "Journal ID $id");
echo "Journal cancelled successfully.";
