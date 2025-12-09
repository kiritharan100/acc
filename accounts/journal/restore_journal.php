<?php
include("../../db.php");
include("../../auth.php");

$id = intval($_POST['id']);
if (!$id) {
    echo "Invalid journal ID";
    exit;
}

// Restore main journal
$q1 = mysqli_query($con, "
    UPDATE accounts_journal
    SET status = 1
    WHERE id = $id AND location_id = '$location_id'
");

if (!$q1) {
    echo "Error restoring journal: " . mysqli_error($con);
    exit;
}

// Restore details only if header restored
if (mysqli_affected_rows($con) > 0) {

    $q2 = mysqli_query($con, "
        UPDATE accounts_journal_detail
        SET status = 1
        WHERE journal_id = $id
    ");

    if (!$q2) {
        echo "Error restoring journal details: " . mysqli_error($con);
        exit;
    }
}

// Remove reversal
mysqli_query($con, "
    UPDATE accounts_transaction
    SET 
        reversed = 0,
        reversed_by = NULL,
        reversed_at = NULL
    WHERE 
        ref_no = $id 
        AND source = 'J'
        AND location_id = '$location_id'
");

// Log
UserLog("3", "Journal Restored", "Journal ID $id");

echo "Journal restored successfully.";
