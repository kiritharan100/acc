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
 
  
?>