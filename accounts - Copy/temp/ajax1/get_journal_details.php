<?php
include("../../db.php");

$id = intval($_GET['id']);
$data = ['journal' => [], 'details' => []];

// Header
$q = mysqli_query($con, "SELECT * FROM acc_journal WHERE id = '$id' LIMIT 1");
if ($q && mysqli_num_rows($q)) {
    $data['journal'] = mysqli_fetch_assoc($q);
} else {
    echo json_encode(['error' => 'Journal not found']);
    exit;
}

// Lines
$d = mysqli_query($con, "SELECT * FROM acc_journal_detail WHERE journal_id = '$id'");
while ($row = mysqli_fetch_assoc($d)) {
    $data['details'][] = $row;
}

echo json_encode($data);
