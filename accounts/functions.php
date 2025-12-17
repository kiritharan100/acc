<?php

/**
 * Ensure the given date falls within an unlocked accounting period for the location.
 * Returns [bool $ok, string $message].
 */
function ensure_open_period($con, $location_id, $date) {
    $date = save_date($date);
    if (!$date) {
        return [false, 'Invalid date.'];
    }
    $locEsc = mysqli_real_escape_string($con, $location_id);
    $dateEsc = mysqli_real_escape_string($con, $date);

    $res = mysqli_query($con, "
        SELECT lock_period 
        FROM accounts_accounting_period 
        WHERE location_id = '$locEsc' 
          AND '$dateEsc' BETWEEN perid_from AND period_to 
        LIMIT 1
    ");

    if (!$res) {
        return [false, 'Failed to validate accounting period.'];
    }
    if (mysqli_num_rows($res) === 0) {
        return [false, 'No accounting period available for this date.'];
    }

    $row = mysqli_fetch_assoc($res);
    if ((int)$row['lock_period'] === 1) {
        return [false, ' This accounting period is locked. Please adjust the date or unlock the period.'];
    }

    return [true, ''];
}

/**
 * Get a Dompdf instance with sane defaults (remote assets enabled).
 */ 

 
 

use Dompdf\Dompdf;
use Dompdf\Options;

/**
 * Load Dompdf autoloader safely
 */
function load_dompdf_autoloader()
{
    static $loaded = false;
    if ($loaded) return;

    // 🔹 PROJECT ROOT (acc/)
    $root = realpath(__DIR__ . '/..'); // accounts → acc

    $paths = [
        // Composer
        $root . '/vendor/autoload.php',

        // Manual installs
        $root . '/assets/dompdf/autoload.inc.php',
        $root . '/assets/dompdf-master/autoload.inc.php',
        $root . '/assets/dompdf-master/src/Autoloader.php',
    ];

    foreach ($paths as $path) {
        if (is_file($path)) {
            require_once $path;

            // Register if raw autoloader
            if (str_ends_with($path, 'Autoloader.php') && class_exists('Dompdf\\Autoloader')) {
                Dompdf\Autoloader::register();
            }

            $loaded = true;
            return;
        }
    }

    // ❌ If we reach here → show exact paths checked
    throw new RuntimeException(
        "Dompdf autoloader not found. Checked:\n" . implode("\n", $paths)
    );
}

/**
 * Get Dompdf instance
 */
function get_dompdf_instance()
{
    load_dompdf_autoloader();

    $options = new Options();
    $options->set('defaultFont', 'DejaVu Sans');
    $options->set('isRemoteEnabled', true);
    $options->set('isHtml5ParserEnabled', true);

    return new Dompdf($options);
}

/**
 * Render & download PDF
 */
function render_pdf($html, $filename = 'document.pdf', $orientation = 'portrait')
{
    $dompdf = get_dompdf_instance();
    $dompdf->loadHtml($html);
    $dompdf->setPaper('A4', $orientation);
    $dompdf->render();
    $dompdf->stream($filename, ['Attachment' => true]);
    exit;
}
?>