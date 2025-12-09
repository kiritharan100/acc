<?php
include("../../db.php");
 
$location_id = 3;
 $query = "
    SELECT 
        m.ca_id,
        m.ca_name,
        cat.sub_category AS ca_group,
        1 AS editable,
        'master' AS account_type,
        CASE WHEN c_check.master_id IS NOT NULL THEN 1 ELSE 0 END AS is_customized
    FROM accounts_coa_main m
    LEFT JOIN accounts_coa_category cat ON m.cat_id = cat.id
    LEFT JOIN accounts_coa_client c_check 
        ON c_check.master_id = m.ca_id 
        AND c_check.location_id = '$location_id'
    WHERE NOT EXISTS (
        SELECT 1 
        FROM accounts_coa_client c_exists 
        WHERE c_exists.ca_id = m.ca_id 
        AND c_exists.location_id = '$location_id'
    )
    AND m.status = 1

    UNION ALL

    SELECT 
        c.ca_id,
        c.ca_name,
        cat.sub_category AS ca_group,
        1 AS editable,
        CASE WHEN c.master_id > 0 THEN 'master' ELSE 'client' END AS account_type,
        CASE WHEN c.master_id > 0 THEN 1 ELSE 0 END AS is_customized
    FROM accounts_coa_client c
    LEFT JOIN accounts_coa_category cat ON c.cat_id = cat.id
    WHERE c.location_id = '$location_id'
    AND c.status = 1

    ORDER BY ca_name ASC
";

$result = mysqli_query($con, $query);

$options = "<option value=''>-- Select Account --</option>";

while ($row = mysqli_fetch_assoc($result)) {
    $account_id = $row['ca_id'];
    $account_name = htmlspecialchars($row['ca_name']);
    $account_group = htmlspecialchars($row['ca_group']);

    $label = "$account_name ($account_group)";
    $options .= "<option value='$account_id'>$label</option>";
}

echo $options;



 