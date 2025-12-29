<?php
include("../../db.php");
include("../../auth.php");

// location_id is already set in auth.php

// Ensure this is an AJAX request
if (!isset($_POST['action'])) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Invalid request']);
    exit;
}

// Validate location_id exists
if (!isset($location_id) || empty($location_id)) {
    echo json_encode(['success' => false, 'message' => 'Location not selected. Please select a location first.']);
    exit;
}

// Debug log for location verification
error_log("Chart of Accounts AJAX - Location ID: " . $location_id . " - Action: " . $_POST['action']);

header('Content-Type: application/json');

switch ($_POST['action']) {
    case 'add':
        $cat_id = (int)$_POST['cat_id'];
        $ca_code = mysqli_real_escape_string($con, $_POST['ca_code']);
        $ca_name = mysqli_real_escape_string($con, $_POST['ca_name']);
        $vat_id = isset($_POST['vat_id']) ? (int)$_POST['vat_id'] : 0;
        $status = isset($_POST['status']) ? 1 : 0;
        
        // Validate code is numeric..
        if (!is_numeric($ca_code)) {
            echo json_encode(['success' => false, 'message' => 'Account code must be numeric']);
            exit;
        }
        
        // Check if code already exists in both tables
        $check_main = "SELECT ca_id FROM accounts_coa_main WHERE ca_code = '$ca_code'";
        $check_client = "SELECT ca_id FROM accounts_coa_client WHERE ca_code = '$ca_code' AND location_id = '$location_id'";
        
        $main_result = mysqli_query($con, $check_main);
        $client_result = mysqli_query($con, $check_client);
        
        if (mysqli_num_rows($main_result) > 0) {
            echo json_encode(['success' => false, 'message' => 'Account code already exists in master accounts']);
            exit;
        }
        
        if (mysqli_num_rows($client_result) > 0) {
            echo json_encode(['success' => false, 'message' => 'Account code already exists in location accounts']);
            exit;
        }
        
        // Generate new ca_id for custom accounts (1000+)
        $max_query = "SELECT MAX(ca_id) as max_id FROM accounts_coa_client WHERE ca_id >= 1000";
        $max_result = mysqli_query($con, $max_query);
        $max_row = mysqli_fetch_assoc($max_result);
        $new_ca_id = max(1000, ($max_row['max_id'] ?? 999) + 1);
        
        $query = "INSERT INTO accounts_coa_client (ca_id, master_id, cat_id, location_id, ca_code, ca_name, vat_id, status) 
                  VALUES ('$new_ca_id', 0, '$cat_id', '$location_id', '$ca_code', '$ca_name', '$vat_id', '$status')";
        
        if (mysqli_query($con, $query)) {
            echo json_encode(['success' => true, 'message' => 'Account added successfully']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Error adding account: ' . mysqli_error($con)]);
        }
        break;
        
    case 'edit':
        $ca_id = (int)$_POST['ca_id'];
        $cat_id = (int)$_POST['cat_id'];
        $ca_code = mysqli_real_escape_string($con, $_POST['ca_code']);
        $ca_name = mysqli_real_escape_string($con, $_POST['ca_name']);
        $vat_id = isset($_POST['vat_id']) ? (int)$_POST['vat_id'] : 0;
        $status = isset($_POST['status']) ? 1 : 0;
        $account_type = $_POST['account_type'];
        
        // Validate code is numeric
        if (!is_numeric($ca_code)) {
            echo json_encode(['success' => false, 'message' => 'Account code must be numeric']);
            exit;
        }
        
        // Check if code already exists (excluding current account)
        if ($account_type == 'master') {
            $check_main = "SELECT ca_id FROM accounts_coa_main WHERE ca_code = '$ca_code' AND ca_id != '$ca_id'";
            $check_client = "SELECT ca_id FROM accounts_coa_client WHERE ca_code = '$ca_code' AND location_id = '$location_id' AND master_id != '$ca_id'";
        } else {
            $check_main = "SELECT ca_id FROM accounts_coa_main WHERE ca_code = '$ca_code'";
            $check_client = "SELECT ca_id FROM accounts_coa_client WHERE ca_code = '$ca_code' AND location_id = '$location_id' AND ca_id != '$ca_id'";
        }
        
        $main_result = mysqli_query($con, $check_main);
        $client_result = mysqli_query($con, $check_client);
        
        if (mysqli_num_rows($main_result) > 0) {
            echo json_encode(['success' => false, 'message' => 'Account code already exists in master accounts']);
            exit;
        }
        
        if (mysqli_num_rows($client_result) > 0) {
            echo json_encode(['success' => false, 'message' => 'Account code already exists in location accounts']);
            exit;
        }
        
        if ($account_type == 'master') {
            // First time editing master account - copy to client table
            $check_client_exists = "SELECT id FROM accounts_coa_client WHERE master_id = '$ca_id' AND location_id = '$location_id'";
            $check_result = mysqli_query($con, $check_client_exists);
            
            if (mysqli_num_rows($check_result) == 0) {
                // First time edit - insert into client table
                $query = "INSERT INTO accounts_coa_client (ca_id, master_id, cat_id, location_id, ca_code, ca_name, vat_id, status) 
                          VALUES ('$ca_id', '$ca_id', '$cat_id', '$location_id', '$ca_code', '$ca_name', '$vat_id', '$status')";
            } else {
                // Already exists in client table - update it
                $query = "UPDATE accounts_coa_client SET 
                          cat_id = '$cat_id', 
                          ca_code = '$ca_code', 
                          ca_name = '$ca_name', 
                          vat_id = '$vat_id',
                          status = '$status'
                          WHERE master_id = '$ca_id' AND location_id = '$location_id'";
            }
        } else {
            // Editing client account - update directly
            $query = "UPDATE accounts_coa_client SET 
                      cat_id = '$cat_id', 
                      ca_code = '$ca_code', 
                      ca_name = '$ca_name', 
                      vat_id = '$vat_id',
                      status = '$status'
                      WHERE ca_id = '$ca_id' AND location_id = '$location_id'";
        }
        
        if (mysqli_query($con, $query)) {
            echo json_encode(['success' => true, 'message' => 'Account updated successfully']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Error updating account: ' . mysqli_error($con)]);
        }
        break;
        
    case 'get_account':
        $ca_id = (int)$_POST['ca_id'];
        $account_type = $_POST['account_type'];
        
        if ($account_type == 'master') {
            // Check if master account has been customized for this location
            $client_query = "SELECT cc.*, cat.id as category_id, cat.coa_nature, cat.main_category, cat.sub_category 
                           FROM accounts_coa_client cc 
                           LEFT JOIN accounts_coa_category cat ON cc.cat_id = cat.id 
                           WHERE cc.master_id = '$ca_id' AND cc.location_id = '$location_id'";
            $client_result = mysqli_query($con, $client_query);
            
            if (mysqli_num_rows($client_result) > 0) {
                // Return customized version
                $row = mysqli_fetch_assoc($client_result);
            } else {
                // Return master account data
                $master_query = "SELECT cm.*, cat.id as category_id, cat.coa_nature, cat.main_category, cat.sub_category 
                               FROM accounts_coa_main cm 
                               LEFT JOIN accounts_coa_category cat ON cm.cat_id = cat.id 
                               WHERE cm.ca_id = '$ca_id'";
                $master_result = mysqli_query($con, $master_query);
                $row = mysqli_fetch_assoc($master_result);
            }
        } else {
            // Get client account data
            $query = "SELECT cc.*, cat.id as category_id, cat.coa_nature, cat.main_category, cat.sub_category 
                     FROM accounts_coa_client cc 
                     LEFT JOIN accounts_coa_category cat ON cc.cat_id = cat.id 
                     WHERE cc.ca_id = '$ca_id' AND cc.location_id = '$location_id'";
            $result = mysqli_query($con, $query);
            $row = mysqli_fetch_assoc($result);
        }
        
        if ($row) {
            echo json_encode(['success' => true, 'data' => $row]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Account not found']);
        }
        break;
        
    case 'check_code':
        $ca_code = mysqli_real_escape_string($con, $_POST['ca_code']);
        $ca_id = isset($_POST['ca_id']) ? (int)$_POST['ca_id'] : 0;
        $account_type = isset($_POST['account_type']) ? $_POST['account_type'] : '';
        
        if (!is_numeric($ca_code)) {
            echo json_encode(['success' => false, 'exists' => false, 'message' => 'Account code must be numeric']);
            exit;
        }
        
        $exists_in_main = false;
        $exists_in_client = false;
        
        // Check in main accounts
        if ($account_type == 'master' && $ca_id > 0) {
            $check_main = "SELECT ca_id, ca_name FROM accounts_coa_main WHERE ca_code = '$ca_code' AND ca_id != '$ca_id'";
        } else {
            $check_main = "SELECT ca_id, ca_name FROM accounts_coa_main WHERE ca_code = '$ca_code'";
        }
        
        $main_result = mysqli_query($con, $check_main);
        if (mysqli_num_rows($main_result) > 0) {
            $main_row = mysqli_fetch_assoc($main_result);
            $exists_in_main = true;
        }
        
        // Check in client accounts
        if ($account_type == 'client' && $ca_id > 0) {
            $check_client = "SELECT ca_id, ca_name FROM accounts_coa_client WHERE ca_code = '$ca_code' AND location_id = '$location_id' AND ca_id != '$ca_id'";
        } elseif ($account_type == 'master' && $ca_id > 0) {
            $check_client = "SELECT ca_id, ca_name FROM accounts_coa_client WHERE ca_code = '$ca_code' AND location_id = '$location_id' AND master_id != '$ca_id'";
        } else {
            $check_client = "SELECT ca_id, ca_name FROM accounts_coa_client WHERE ca_code = '$ca_code' AND location_id = '$location_id'";
        }
        
        $client_result = mysqli_query($con, $check_client);
        if (mysqli_num_rows($client_result) > 0) {
            $client_row = mysqli_fetch_assoc($client_result);
            $exists_in_client = true;
        }
        
        if ($exists_in_main || $exists_in_client) {
            $message = 'Account code already exists';
            if ($exists_in_main) {
                $message .= ' in master accounts (' . $main_row['ca_name'] . ')';
            }
            if ($exists_in_client) {
                if ($exists_in_main) $message .= ' and';
                $message .= ' in location accounts (' . $client_row['ca_name'] . ')';
            }
            
            echo json_encode([
                'success' => false, 
                'exists' => true, 
                'message' => $message,
                'in_main' => $exists_in_main,
                'in_client' => $exists_in_client
            ]);
        } else {
            echo json_encode(['success' => true, 'exists' => false, 'message' => 'Account code is valide']);
        }
        break;
        
    case 'toggle_status':
        $ca_id = (int)$_POST['ca_id'];
        $status = (int)$_POST['status'];
        $account_type = $_POST['account_type']; // 'master' or 'client'
        
        if ($account_type == 'master') {
            // For master accounts, we need to copy to client table first
            // Check if client version already exists
            $check_client = "SELECT id FROM accounts_coa_client WHERE master_id = '$ca_id' AND location_id = '$location_id'";
            $check_result = mysqli_query($con, $check_client);
            
            if (mysqli_num_rows($check_result) == 0) {
                // Get master account data to copy to client table
                $master_query = "SELECT cm.*, cat.id as cat_id FROM accounts_coa_main cm 
                               LEFT JOIN accounts_coa_category cat ON cm.cat_id = cat.id 
                               WHERE cm.ca_id = '$ca_id'";
                $master_result = mysqli_query($con, $master_query);
                $master_data = mysqli_fetch_assoc($master_result);
                
                if ($master_data) {
                    // Copy master account to client table with new status
                    $insert_query = "INSERT INTO accounts_coa_client (ca_id, master_id, cat_id, location_id, ca_code, ca_name, vat_id, status) 
                                   VALUES ('$ca_id', '$ca_id', '{$master_data['cat_id']}', '$location_id', '{$master_data['ca_code']}', '{$master_data['ca_name']}', '{$master_data['vat_id']}', '$status')";
                    
                    if (mysqli_query($con, $insert_query)) {
                        echo json_encode(['success' => true, 'message' => 'Account status updated successfully (copied to location)']);
                    } else {
                        echo json_encode(['success' => false, 'message' => 'Error copying account to location: ' . mysqli_error($con)]);
                    }
                } else {
                    echo json_encode(['success' => false, 'message' => 'Master account not found']);
                }
            } else {
                // Client version exists, just update the status
                $query = "UPDATE accounts_coa_client SET status = '$status' WHERE master_id = '$ca_id' AND location_id = '$location_id'";
                
                if (mysqli_query($con, $query)) {
                    echo json_encode(['success' => true, 'message' => 'Account status updated successfully']);
                } else {
                    echo json_encode(['success' => false, 'message' => 'Error updating status: ' . mysqli_error($con)]);
                }
            }
        } else {
            // For client accounts, update directly in accounts_coa_client
            if ($ca_id >= 1000) {
                // Pure client account (ca_id >= 1000)
                $query = "UPDATE accounts_coa_client SET status = '$status' WHERE ca_id = '$ca_id' AND location_id = '$location_id'";
            } else {
                // Customized master account (master_id exists)
                $query = "UPDATE accounts_coa_client SET status = '$status' WHERE master_id = '$ca_id' AND location_id = '$location_id'";
            }
            
            if (mysqli_query($con, $query)) {
                echo json_encode(['success' => true, 'message' => 'Account status updated successfully']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Error updating status: ' . mysqli_error($con)]);
            }
        }
        break;
        
    default:
        echo json_encode(['success' => false, 'message' => 'Invalid action']);
        break;
}
?>