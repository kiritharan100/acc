# Chart of Accounts System - User Instructions

## Overview
The Chart of Accounts system manages financial accounts across multiple locations with a master-client architecture that allows both global and location-specific account management.

## System Architecture

### 1. Database Structure
- **`accounts_coa_main`** - Master accounts (global template)
- **`accounts_coa_client`** - Location-specific accounts and customizations
- **`accounts_coa_category`** - Account categories and types
- **`accounts_vat_cat`** - VAT categories for tax management

### 2. Account Types
- **Master Accounts**: Global template accounts available to all locations
- **Client Accounts**: Location-specific custom accounts (ID ≥ 1000)
- **Customized Accounts**: Master accounts modified for specific locations

## How Location-Based Display Works

### Location Selection
1. **Select Location**: Use the dropdown in the header to choose your working location
2. **Cookie Storage**: Your selection is saved in browser cookies
3. **Session Persistence**: Location remains active until changed

### Display Priority Logic
The system uses intelligent prioritization to show the most relevant accounts:

```
IF (same account ID exists in both master and client tables for this location)
   THEN show only the CLIENT version (customized for this location)
ELSE
   THEN show the MASTER version (global template)
```

### Chart of Accounts Display Query Logic

When requesting a list of Chart of Accounts for a specific `location_id`, the system displays:

#### Accounts That WILL Be Displayed:
1. **Master Accounts** (from `accounts_coa_main`):
   - All master accounts that have NO corresponding entry in `accounts_coa_client` for this location
   - Shown with their original master data (code, name, category, status)
   - Labeled as account_type = 'master'

2. **Client Accounts** (from `accounts_coa_client`):
   - All accounts in `accounts_coa_client` where `location_id` matches the requested location
   - Includes both:
     - **Customized Master Accounts**: Where `master_id > 0` (modified versions of master accounts)
     - **Pure Client Accounts**: Where `master_id = 0` (location-specific custom accounts)
   - Shown with their location-specific data

#### Accounts That WILL NOT Be Displayed:
- Master accounts that have been customized for this location (to avoid duplicates)
- Accounts from other locations
- Master accounts where a client override exists for this location

#### SQL Query Structure:
```sql
-- Part 1: Master accounts without client overrides
SELECT cm.* FROM accounts_coa_main cm
WHERE NOT EXISTS (
    SELECT 1 FROM accounts_coa_client cc 
    WHERE cc.ca_id = cm.ca_id AND cc.location_id = [location_id]
)

UNION ALL

-- Part 2: All client accounts for this location
SELECT cc.* FROM accounts_coa_client cc
WHERE cc.location_id = [location_id]
```

#### Display Priority Examples:

**Scenario 1: No Customization**
- Master Account ID 100 exists in `accounts_coa_main`
- No entry for ID 100 in `accounts_coa_client` for this location
- **Result**: Shows master account data

**Scenario 2: Customized Master Account**
- Master Account ID 100 exists in `accounts_coa_main`
- Client Account ID 100 exists in `accounts_coa_client` for this location with `master_id = 100`
- **Result**: Shows ONLY client version (customized), master version hidden

**Scenario 3: Pure Client Account**
- Client Account ID 1001 exists in `accounts_coa_client` for this location with `master_id = 0`
- **Result**: Shows client account (location-specific custom account)

### Account Display Rules

#### Master Accounts (Blue Badge)
- **When Shown**: When no location-specific customization exists
- **Status**: Shows global status from master table
- **Editable**: Yes - first edit creates location copy

#### Client Accounts (Green Badge)
- **When Shown**: Always prioritized if exists for this location
- **Types**:
  - **Customized Master**: Modified version of master account
  - **Pure Client**: Custom account created for this location only
- **Status**: Shows location-specific status

#### Account Status Indicators
- **Active Accounts**: ✅ Green badge, normal row
- **Inactive Accounts**: ❌ Red badge, red-highlighted row

## User Operations

### 1. Adding New Accounts
- **Location**: New accounts are always created for current location
- **ID Assignment**: Auto-generates ID ≥ 1000 for client accounts
- **Validation**: Checks for duplicate codes in both master and client tables

### 2. Editing Accounts

#### Editing Master Accounts (First Time)
1. Click "Edit Account" on a master account
2. System automatically copies master data to client table
3. Your changes apply only to your location
4. Account status changes from "Master" to "Customized"

#### Editing Client Accounts
- Direct updates to location-specific data
- No impact on other locations
- Immediate effect

### 3. Account Status Management

#### Activating/Deactivating Master Accounts
1. **First Status Change**: 
   - System copies master account to client table
   - Applies new status to client copy
   - Other locations unaffected

2. **Subsequent Changes**:
   - Updates existing client record
   - Location-specific status control

#### Client Account Status
- Direct status updates in client table
- Immediate effect for current location only

### 4. Real-Time Code Validation
- **Live Checking**: Validates account codes as you type
- **Duplicate Prevention**: Checks both master and client tables
- **Visual Feedback**: 
  - ✅ Green checkmark = Available
  - ❌ Red warning = Already exists (shows conflicting account name)

## Visual Interface Guide

### Table Layout
| Code | Name | Type | Group | Status | Editable | Action |
|------|------|------|-------|--------|----------|--------|
| Account code | Account name | Category | Group | Badge | Status | Dropdown |

### Status Badges
- 🟢 **Active**: Green badge with checkmark
- 🔴 **Inactive**: Red badge with X mark

### Action Options
- **📝 Edit Account**: Modify account details
- **⏸️ Deactivate**: Make account inactive (for active accounts)
- **▶️ Activate**: Make account active (for inactive accounts)

### Row Highlighting
- **Normal Rows**: White background (active accounts)
- **Red Rows**: Light red background (inactive accounts)

## Best Practices

### 1. Location Management
- Always verify correct location is selected before making changes
- Use location-specific customization for local requirements
- Keep master accounts as global templates

### 2. Account Organization
- Use consistent coding schemes across locations
- Maintain clear account naming conventions
- Regular review of inactive accounts

### 3. Status Management
- Deactivate unused accounts rather than deleting
- Regular cleanup of inactive accounts
- Document reasons for account status changes

## Troubleshooting

### Common Issues

#### Dropdown Not Working
- Check browser console for JavaScript errors
- Ensure Bootstrap JavaScript is loaded
- Clear browser cache and reload

#### Code Validation Errors
- Ensure account codes are numeric only
- Check for existing codes in both tables
- Verify location selection is active

#### Missing Accounts
- Verify correct location is selected
- Check if account was deactivated
- Confirm account exists in current location context

### Support
For technical issues or questions:
1. Check browser console for error messages
2. Verify database connectivity
3. Contact system administrator with specific error details

## Database Queries Reference

### View All Accounts for Location
```sql
SELECT * FROM accounts_coa_client WHERE location_id = [your_location_id]
```

### Check Master Account Customizations
```sql
SELECT cm.ca_name as master_name, cc.ca_name as client_name 
FROM accounts_coa_main cm 
LEFT JOIN accounts_coa_client cc ON cm.ca_id = cc.master_id 
WHERE cc.location_id = [your_location_id]
```

### Account Status Summary
```sql
SELECT 
    COUNT(*) as total_accounts,
    SUM(status) as active_accounts,
    COUNT(*) - SUM(status) as inactive_accounts
FROM accounts_coa_client 
WHERE location_id = [your_location_id]
```

---
*Last Updated: October 29, 2025*
*System Version: Multi-Location Chart of Accounts v2.0*