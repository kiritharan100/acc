<?php
include("../../db.php");
include("../../auth.php");
 
// $location_id = 3;
//  $query = "
//     SELECT 
//         m.ca_id,
//         m.ca_name,
//         cat.sub_category AS ca_group,
//         1 AS editable,
//         'master' AS account_type,
//         CASE WHEN c_check.master_id IS NOT NULL THEN 1 ELSE 0 END AS is_customized
//     FROM accounts_coa_main m
//     LEFT JOIN accounts_coa_category cat ON m.cat_id = cat.id
//     LEFT JOIN accounts_coa_client c_check 
//         ON c_check.master_id = m.ca_id 
//         AND c_check.location_id = '$location_id'
//     WHERE NOT EXISTS (
//         SELECT 1 
//         FROM accounts_coa_client c_exists 
//         WHERE c_exists.ca_id = m.ca_id 
//         AND c_exists.location_id = '$location_id'
//     )
//     AND m.status = 1

//     UNION ALL

//     SELECT 
//         c.ca_id,
//         c.ca_name,
//         cat.sub_category AS ca_group,
//         1 AS editable,
//         CASE WHEN c.master_id > 0 THEN 'master' ELSE 'client' END AS account_type,
//         CASE WHEN c.master_id > 0 THEN 1 ELSE 0 END AS is_customized
//     FROM accounts_coa_client c
//     LEFT JOIN accounts_coa_category cat ON c.cat_id = cat.id
//     WHERE c.location_id = '$location_id'
//     AND c.status = 1

//     ORDER BY ca_name ASC
// ";


$query = "(
    SELECT 
        m.ca_id,
        m.ca_name,
        m.vat_id,
        cat.main_category AS ca_group,
        cat.coa_nature,
        cat.contact_required,
        1 AS editable,
        'master' AS account_type,
        CASE WHEN c_check.master_id IS NOT NULL THEN 1 ELSE 0 END AS is_customized
    FROM accounts_coa_main m
    LEFT JOIN accounts_coa_category cat ON m.cat_id = cat.id
    LEFT JOIN accounts_coa_client c_check 
        ON c_check.master_id = m.ca_id 
        AND c_check.location_id = '$location_id'

    -- ❗ Hide master if client version exists
    WHERE c_check.master_id IS NULL
    AND m.status = 1
)

UNION ALL

(
    SELECT 
        c.ca_id,
        c.ca_name,
        c.vat_id,
        cat.main_category AS ca_group,
        cat.coa_nature,
        cat.contact_required,
        1 AS editable,
        CASE WHEN c.master_id > 0 THEN 'master' ELSE 'client' END AS account_type,
        CASE WHEN c.master_id > 0 THEN 1 ELSE 0 END AS is_customized
    FROM accounts_coa_client c
    LEFT JOIN accounts_coa_category cat ON c.cat_id = cat.id
    WHERE c.location_id = '$location_id'
    AND c.status = 1
)

ORDER BY ca_group,ca_name ASC
";

$result = mysqli_query($con, $query);

$options = "<option value=''>-- Select Account --</option>";

while ($row = mysqli_fetch_assoc($result)) {
    $account_id = $row['ca_id'];
    $account_name = htmlspecialchars($row['ca_name']);
    $account_group = htmlspecialchars($row['ca_group']);
    $contact_required = $row['contact_required'];
    $coa_nature = htmlspecialchars($row['coa_nature']);

    $label = "$account_group > $account_name";
    $options .= "<option value='$account_id' data-contact-required='$contact_required' data-vat-id='{$row['vat_id']}' data-coa-nature='$coa_nature'>$label</option>";
}

echo $options;



 
