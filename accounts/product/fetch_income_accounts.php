<?php
include("../../db.php");
include("../../auth.php");

$query = "(
    SELECT 
        m.ca_id,
        m.ca_name,
        cat.main_category AS ca_group,
        cat.coa_nature
    FROM accounts_coa_main m
    INNER JOIN accounts_coa_category cat 
        ON m.cat_id = cat.id 
        AND cat.main_category = 'Turnover'
        AND cat.status = 1
    LEFT JOIN accounts_coa_client c_check 
        ON c_check.master_id = m.ca_id 
        AND c_check.location_id = '$location_id'
    WHERE c_check.master_id IS NULL
      AND m.status = 1
)
UNION ALL
(
    SELECT 
        c.ca_id,
        c.ca_name,
        cat.main_category AS ca_group,
        cat.coa_nature
    FROM accounts_coa_client c
    INNER JOIN accounts_coa_category cat 
        ON c.cat_id = cat.id 
        AND cat.main_category = 'Turnover'
        AND cat.status = 1
    WHERE c.location_id = '$location_id'
      AND c.status = 1
)
ORDER BY   ca_name desc";

$result = mysqli_query($con, $query);

$options = "<option value=''>-- Select Account --</option>";
while ($row = mysqli_fetch_assoc($result)) {
    $account_id = $row['ca_id'];
    $account_name = htmlspecialchars($row['ca_name']);
    $account_group = htmlspecialchars($row['ca_group']);
    $label =   $account_name;
    $options .= "<option value='{$account_id}'>{$label}</option>";
}

echo $options;