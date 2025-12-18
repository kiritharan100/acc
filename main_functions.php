<?php

use Dompdf\Dompdf;
use Dompdf\Options;

// Global URL signing secret (change to a long random string in production).
if (!defined('URL_SIGN_SECRET')) {
    define('URL_SIGN_SECRET', 'CHANGE_THIS_TO_A_LONG_RANDOM_KEY');
}

/**
 * Build a signed URL using HMAC-SHA256.
 *
 * @param string $baseUrl Base path (e.g., '/accounts/journal/journal_pdf.php')
 * @param array  $params  Query parameters to sign
 * @return string Signed URL with &sig= appended
 */
function generate_signed_url($baseUrl, array $params)
{
    ksort($params); // ensure deterministic ordering
    $query = http_build_query($params);
    $sig = hash_hmac('sha256', $query, URL_SIGN_SECRET);
    $glue = (strpos($baseUrl, '?') !== false) ? '&' : '?';
    return $baseUrl . $glue . $query . '&sig=' . $sig;
}

/**
 * Verify a signed request built by generate_signed_url().
 *
 * @param array $request Typically $_GET or $_POST
 * @return bool True if signature matches, false otherwise
 */
function verify_signed_request(array $request)
{
    if (!isset($request['sig'])) {
        return false;
    }

    $sig = $request['sig'];
    unset($request['sig']);

    ksort($request);
    $query = http_build_query($request);
    $expected = hash_hmac('sha256', $query, URL_SIGN_SECRET);

    return hash_equals($expected, $sig);
}

/**
 * Load Dompdf autoloader safely.
 */
function load_dompdf_autoloader()
{
    static $loaded = false;
    if ($loaded) {
        return;
    }

    $root = realpath(__DIR__);

    $paths = [
        // Composer (preferred)
        $root . '/vendor/autoload.php',

        // Manual installs
        $root . '/assets/dompdf/autoload.inc.php',
        $root . '/assets/dompdf-master/vendor/autoload.php',
        $root . '/assets/dompdf-master/autoload.inc.php',
        $root . '/assets/dompdf-master/dompdf/autoload.inc.php',
        $root . '/assets/dompdf-master/src/Autoloader.php',
    ];

    foreach ($paths as $path) {
        if (is_file($path)) {
            require_once $path;

            // Register if raw autoloader
            if (substr($path, -13) === 'Autoloader.php' && class_exists('Dompdf\\Autoloader')) {
                Dompdf\Autoloader::register();
            }

            $loaded = true;
            return;
        }
    }

    throw new RuntimeException(
        "Dompdf autoloader not found. Checked:\n" . implode("\n", $paths)
    );
}

/**
 * Get a Dompdf instance with sane defaults (remote assets enabled).
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
 * Render & download PDF.
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
