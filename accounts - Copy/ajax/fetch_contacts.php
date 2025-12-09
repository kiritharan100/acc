<?php
include("../../db.php");
include("../../auth.php");

$query = "
SELECT 
    sup_id AS id,
    supplier_name AS contact_name,
    'Supplier' AS contact_type,
    location_id
FROM accounts_manage_supplier
WHERE status = 1 AND location_id = '$location_id'

UNION ALL

SELECT
    c_id AS id,
    customer_name AS contact_name,
    'Customer' AS contact_type,
    location_id
FROM accounts_manage_customer   /* FIXED NAME */
WHERE status = 1 AND location_id = '$location_id'

ORDER BY contact_name;
";

$result = mysqli_query($con, $query);

$contactOptions = "<option value=''>-- Select Contact --</option>";

while ($row = mysqli_fetch_assoc($result)) {
    $id = $row['id'];
    $contact_name = htmlspecialchars($row['contact_name']);
    $contact_type = htmlspecialchars($row['contact_type']);
    $label = "$contact_name ($contact_type)";

    $contactOptions .= "<option value='$id' data-contact_type='$contact_type'>$label</option>";
}

echo $contactOptions;
