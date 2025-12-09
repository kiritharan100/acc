-- =====================================================
-- CLIENT REGISTRATION TABLE UPDATE SCRIPT
-- =====================================================
-- This script updates the client_registration table to match 
-- the new client management interface requirements.
-- 
-- IMPORTANT: Copy and run ONLY the SQL commands (not the comments)
-- Run each section separately in phpMyAdmin
-- =====================================================

-- STEP 1: CREATE BACKUP (RECOMMENDED - Run this first)
CREATE TABLE client_registration_backup AS SELECT * FROM client_registration;

-- STEP 2: REMOVE UNWANTED COLUMNS (Run this second)
ALTER TABLE `client_registration` 
DROP COLUMN IF EXISTS `client_type`,
DROP COLUMN IF EXISTS `district`,
DROP COLUMN IF EXISTS `supply_by`,
DROP COLUMN IF EXISTS `client_email`,
DROP COLUMN IF EXISTS `client_phone`,
DROP COLUMN IF EXISTS `contact_name`,
DROP COLUMN IF EXISTS `contact_email`,
DROP COLUMN IF EXISTS `contact_phone`,
DROP COLUMN IF EXISTS `status`,
DROP COLUMN IF EXISTS `regNumber`,
DROP COLUMN IF EXISTS `region`,
DROP COLUMN IF EXISTS `dmu_limit`;

-- STEP 3: ADD NEW COLUMNS (Run this third)
ALTER TABLE `client_registration` 
ADD COLUMN `business_start_date` DATE NULL AFTER `client_name`,
ADD COLUMN `book_start_from` DATE NULL AFTER `business_start_date`,
ADD COLUMN `year_end` VARCHAR(5) NULL AFTER `book_start_from`,
ADD COLUMN `primary_email` VARCHAR(255) NULL AFTER `year_end`,
ADD COLUMN `phone_number` VARCHAR(15) NULL AFTER `primary_email`,
ADD COLUMN `company_type` VARCHAR(50) NOT NULL AFTER `phone_number`,
ADD COLUMN `address_line1` VARCHAR(255) NULL AFTER `company_type`,
ADD COLUMN `address_line2` VARCHAR(255) NULL AFTER `address_line1`,
ADD COLUMN `city_town` VARCHAR(100) NULL AFTER `address_line2`,
ADD COLUMN `district` VARCHAR(50) NULL AFTER `city_town`,
ADD COLUMN `is_vat_registered` TINYINT(1) DEFAULT 0 AFTER `district`,
ADD COLUMN `vat_reg_no` VARCHAR(50) NULL AFTER `is_vat_registered`,
ADD COLUMN `vat_submit_type` ENUM('Monthly', 'Quarterly', 'Yearly') NULL AFTER `vat_reg_no`;

-- STEP 4: SET DEFAULT VALUES (Run this fourth)
UPDATE `client_registration` SET `is_vat_registered` = 0 WHERE `is_vat_registered` IS NULL;

-- STEP 5: VERIFY STRUCTURE (Optional - Run this to check)
DESCRIBE client_registration;

-- =====================================================
-- FIELDS BEING REMOVED FROM YOUR CURRENT TABLE:
-- =====================================================
-- Based on your current structure:
-- SELECT `c_id`, `md5_client`, `user_license`, `client_id`, `client_name`, 
-- `client_type`, `district`, `supply_by`, `client_email`, `client_phone`, 
-- `contact_name`, `contact_email`, `contact_phone`, `status`, `regNumber`, 
-- `region`, `dmu_limit` FROM `client_registration`
--
-- REMOVING: client_type, district (old), supply_by, client_email, 
-- client_phone, contact_name, contact_email, contact_phone, 
-- status, regNumber, region, dmu_limit

-- =====================================================
-- FIELDS BEING KEPT (NO CHANGES):
-- =====================================================
-- c_id                 (AUTO_INCREMENT PRIMARY KEY)
-- md5_client          (UNIQUE IDENTIFIER)
-- user_license        (STATUS: 1=Active, 0=Inactive)  
-- client_id           (CLIENT/STATION ID)
-- client_name         (CLIENT/STATION NAME)

-- =====================================================
-- NEW FIELDS BEING ADDED:
-- =====================================================
-- business_start_date (DATE)
-- book_start_from     (DATE)
-- year_end           (VARCHAR 5 - DD/MM format)
-- primary_email      (VARCHAR 255)
-- phone_number       (VARCHAR 15)
-- company_type       (VARCHAR 50)
-- address_line1      (VARCHAR 255)
-- address_line2      (VARCHAR 255)
-- city_town          (VARCHAR 100)
-- district           (VARCHAR 50) - NEW district field (replaces old one)
-- is_vat_registered  (TINYINT 1 - 0=No, 1=Yes)
-- vat_reg_no         (VARCHAR 50)
-- vat_submit_type    (ENUM: Monthly/Quarterly/Yearly)

-- Verification Query (Optional - Run after the above)
-- DESCRIBE client_registration;