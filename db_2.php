<?php
require_once 'db.php';

$tables = [];
$res = mysqli_query($con, "SHOW TABLES");
while ($row = mysqli_fetch_row($res)) {
    $tables[] = $row[0];
}

$output = "-- AUTO GENERATED SCHEMA\n\n";

foreach ($tables as $table) {
    $r = mysqli_query($con, "SHOW CREATE TABLE `$table`");
    $row = mysqli_fetch_row($r);
    $output .= $row[1] . ";\n\n";
}

file_put_contents(__DIR__ . '/schema.sql', $output);

echo "Schema exported successfully";


  