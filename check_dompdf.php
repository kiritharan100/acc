 <?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "CHECK DOMPDF SCRIPT STARTED<br>";

$base = __DIR__ . '/assets';

echo "Looking in: $base<br><br>";

if (!is_dir($base)) {
    die("❌ assets folder NOT found");
}

echo "<pre>";

$rii = new RecursiveIteratorIterator(
    new RecursiveDirectoryIterator($base, FilesystemIterator::SKIP_DOTS)
);

$found = false;
foreach ($rii as $file) {
    if ($file->getFilename() === 'Autoloader.php') {
        echo "FOUND: " . $file->getPathname() . PHP_EOL;
        $found = true;
    }
}

if (!$found) {
    echo "❌ Autoloader.php NOT FOUND anywhere under assets/\n";
}

echo "</pre>";