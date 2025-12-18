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
 * Fetch active accounting periods for a location (latest first).
 */
function get_accounting_periods($con, $location_id) {
    $periods = [];
    $locEsc = mysqli_real_escape_string($con, $location_id);
    $res = mysqli_query($con, "
        SELECT id, perid_from, period_to, status
        FROM accounts_accounting_period
        WHERE location_id = '$locEsc' AND status = 1
        ORDER BY perid_from DESC
    ");
    if ($res) {
        while ($row = mysqli_fetch_assoc($res)) {
            $periods[] = $row;
        }
    }
    return $periods;
}

/**
 * Read persisted period selection from cookie for a location.
 * Returns ['selection' => string, 'start' => string, 'end' => string] or null.
 */
function get_period_cookie_selection($location_id) {
    $key = 'acc_period_' . (int)$location_id;
    if (empty($_COOKIE[$key])) {
        return null;
    }
    $raw = (string)$_COOKIE[$key];
    $parts = explode('|', $raw);
    if (count($parts) < 3) {
        return null;
    }
    return [
        'selection' => urldecode($parts[0]),
        'start' => urldecode($parts[1]),
        'end' => urldecode($parts[2]),
    ];
}
 
  
?>
