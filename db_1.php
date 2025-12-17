<?php
// require_once 'db.php';

// $tables = [];
// $res = mysqli_query($con, "SHOW TABLES");
// while ($row = mysqli_fetch_row($res)) {
//     $tables[] = $row[0];
// }

// $output = "-- AUTO GENERATED SCHEMA\n\n";

// foreach ($tables as $table) {
//     $r = mysqli_query($con, "SHOW CREATE TABLE `$table`");
//     $row = mysqli_fetch_row($r);
//     $output .= $row[1] . ";\n\n";
// }

// file_put_contents(__DIR__ . '/schema.sql', $output);

// echo "Schema exported successfully";


 
require_once 'db.php';

$tables = [];
$res = mysqli_query($con, "SHOW TABLES");
while ($row = mysqli_fetch_row($res)) {
    $tables[] = $row[0];
}

$output  = "-- AUTO GENERATED SCHEMA + DATA\n";
$output .= "-- Generated on: " . date('Y-m-d H:i:s') . "\n\n";

foreach ($tables as $table) {

    // ===== TABLE STRUCTURE =====
    $r = mysqli_query($con, "SHOW CREATE TABLE `$table`");
    $row = mysqli_fetch_row($r);

    $output .= "-- ----------------------------\n";
    $output .= "-- Table structure for `$table`\n";
    $output .= "-- ----------------------------\n";
    $output .= "DROP TABLE IF EXISTS `$table`;\n";
    $output .= $row[1] . ";\n\n";

    // ===== TABLE DATA =====
    $data = mysqli_query($con, "SELECT * FROM `$table`");
    if (mysqli_num_rows($data) > 0) {
        $output .= "-- Data for table `$table`\n";
        while ($d = mysqli_fetch_assoc($data)) {
            $cols = array_map(fn($c) => "`$c`", array_keys($d));
            $vals = array_map(fn($v) => is_null($v) ? "NULL" : "'" . mysqli_real_escape_string($con, $v) . "'", array_values($d));

            $output .= "INSERT INTO `$table` (" . implode(',', $cols) . ") VALUES (" . implode(',', $vals) . ");\n";
        }
        $output .= "\n";
    }
}

file_put_contents(__DIR__ . '/schema_with_data.sql', $output);

echo "Schema + data exported successfully";