-- AUTO GENERATED SCHEMA

CREATE TABLE `accounts_accounting_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `perid_from` date NOT NULL,
  `period_to` date NOT NULL,
  `due_date` date NOT NULL,
  `log_old_period` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `accounts_coa_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coa_nature` varchar(50) NOT NULL,
  `main_category` varchar(50) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `contact_required` varchar(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `accounts_coa_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ca_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL DEFAULT 0,
  `cat_id` int(11) NOT NULL,
  `location_id` varchar(32) NOT NULL,
  `ca_code` varchar(12) NOT NULL,
  `ca_name` varchar(150) NOT NULL,
  `vat_id` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `cat_id` (`cat_id`),
  KEY `master_id` (`master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `accounts_coa_main` (
  `ca_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `ca_code` varchar(10) NOT NULL,
  `ca_name` varchar(150) NOT NULL,
  `vat_id` int(1) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ca_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `accounts_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `loc_no` int(11) NOT NULL,
  `journal_date` date NOT NULL,
  `memo` varchar(100) NOT NULL,
  `total_debit` decimal(10,2) NOT NULL,
  `total_credit` decimal(10,2) NOT NULL,
  `contact_type` varchar(30) NOT NULL,
  `contact_id` varchar(30) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `accounts_journal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL,
  `ca_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `vat_id` int(11) NOT NULL,
  `debit` decimal(15,2) DEFAULT 0.00,
  `credit` decimal(15,2) DEFAULT 0.00,
  `debit_vat` decimal(10,2) NOT NULL,
  `credit_vat` decimal(10,2) NOT NULL,
  `status` int(1) DEFAULT 1,
  `contact_id` int(11) DEFAULT NULL,
  `contact_type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `acc_journal_detail_ibfk_1` (`journal_id`),
  CONSTRAINT `accounts_journal_detail_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `accounts_journal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `accounts_manage_customer` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(200) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `condact_number` varchar(30) NOT NULL,
  `max_limit` decimal(20,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `ca_id` int(11) NOT NULL DEFAULT 11,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `accounts_manage_supplier` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) NOT NULL,
  `address` varchar(80) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `location_id` int(11) NOT NULL,
  `tin_no` varchar(30) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `accounts_transaction` (
  `tra_id` int(11) NOT NULL AUTO_INCREMENT,
  `tra_date` date NOT NULL,
  `location_id` int(11) NOT NULL,
  `ca_id` int(11) NOT NULL,
  `sup_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `debit` decimal(15,2) DEFAULT 0.00,
  `credit` decimal(15,2) DEFAULT 0.00,
  `vat_id` int(11) DEFAULT NULL,
  `debit_vat_amount` decimal(15,2) DEFAULT 0.00,
  `credit_vat_amount` decimal(15,2) DEFAULT 0.00,
  `vat_filed_status` tinyint(1) DEFAULT 0,
  `ref_no` varchar(50) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `source_id` varchar(50) DEFAULT NULL,
  `tra_type` varchar(50) DEFAULT NULL,
  `memo` text DEFAULT NULL,
  `posted` tinyint(1) DEFAULT 0,
  `approved` tinyint(1) DEFAULT 0,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `reversed` tinyint(1) DEFAULT 0,
  `reversed_by` int(11) DEFAULT NULL,
  `reversed_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`tra_id`),
  KEY `idx_location_date` (`location_id`,`tra_date`),
  KEY `idx_ca_id` (`ca_id`),
  KEY `idx_cus_sup_id` (`sup_id`),
  KEY `idx_vat_id` (`vat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `accounts_vat_cat` (
  `vat_id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_name` varchar(30) NOT NULL,
  `apply_for` varchar(30) NOT NULL DEFAULT 'all',
  `status` int(11) NOT NULL DEFAULT 1,
  `percentage` decimal(10,2) NOT NULL,
  PRIMARY KEY (`vat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `acounts_accounting_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `period_from` date NOT NULL,
  `period_to` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `client_registration` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `md5_client` varchar(250) NOT NULL,
  `subscription` varchar(255) NOT NULL,
  `user_license` int(10) NOT NULL DEFAULT 1,
  `client_id` varchar(100) NOT NULL,
  `client_name` varchar(300) NOT NULL,
  `business_start_date` date DEFAULT NULL,
  `book_start_from` date DEFAULT NULL,
  `year_end` varchar(5) DEFAULT NULL,
  `primary_email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `company_type` varchar(50) DEFAULT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city_town` varchar(100) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `is_vat_registered` tinyint(1) DEFAULT 0,
  `vat_reg_no` varchar(50) DEFAULT NULL,
  `vat_submit_type` enum('Monthly','Quarterly','Yearly') DEFAULT NULL,
  `client_type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `client_registration_backup` (
  `c_id` int(10) NOT NULL DEFAULT 0,
  `md5_client` varchar(250) NOT NULL,
  `user_license` int(10) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `client_name` varchar(300) NOT NULL,
  `client_type` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `supply_by` varchar(50) NOT NULL,
  `client_email` varchar(100) NOT NULL,
  `client_phone` varchar(30) NOT NULL,
  `contact_name` varchar(80) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `regNumber` varchar(80) NOT NULL,
  `region` varchar(50) NOT NULL,
  `dmu_limit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `letter_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(60) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `vat_no` varchar(20) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `invoice_prefix` varchar(10) NOT NULL,
  `admin_device_approval` int(11) NOT NULL DEFAULT 0,
  `company_name` varchar(100) NOT NULL,
  `VAT` varchar(50) NOT NULL,
  `gm_mobile` varchar(12) NOT NULL,
  `system_email` varchar(50) NOT NULL,
  `domain` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `login_attempts` (
  `ip_address` varchar(45) DEFAULT NULL,
  `attempt_time` datetime DEFAULT NULL,
  `try_for` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `product_master` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_code` varchar(20) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_cat` varchar(30) NOT NULL,
  `p_unit` varchar(50) NOT NULL,
  `vat_rate` decimal(10,1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `last_price` varchar(50) NOT NULL,
  `measurement` varchar(10) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `user_device` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pf_no` varchar(100) NOT NULL,
  `token` varchar(200) NOT NULL,
  `v_from` datetime NOT NULL DEFAULT current_timestamp(),
  `IP` varchar(200) NOT NULL,
  `last_used` varchar(20) NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `user_license` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `subscription` varchar(250) NOT NULL,
  `mobile_no` varchar(12) NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(500) NOT NULL,
  `user_rights` varchar(100) NOT NULL,
  `account_status` int(5) NOT NULL DEFAULT 2,
  `i_name` varchar(50) NOT NULL,
  `company` varchar(500) NOT NULL,
  `token` varchar(112) NOT NULL,
  `dr_token` varchar(112) NOT NULL,
  `last_log_in` varchar(50) NOT NULL,
  `last_token` varchar(180) NOT NULL,
  `material` int(11) NOT NULL,
  `accounts` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `admin` int(11) NOT NULL,
  `report` int(11) NOT NULL,
  `opd` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `user_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `detail` varchar(250) NOT NULL,
  `log_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1831 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `vat_sales_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iss_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `issue_qty` varchar(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `req_id` int(11) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `sales_price` decimal(10,2) NOT NULL,
  `vat_rate` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `vat_sales_master` (
  `iss_id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) NOT NULL,
  `location` int(90) NOT NULL,
  `to_location` varchar(110) NOT NULL,
  `invoice_no` varchar(20) NOT NULL,
  `tin_number` varchar(30) NOT NULL,
  `invoice_date_range` varchar(80) NOT NULL,
  `issue_date` varchar(50) NOT NULL,
  `sup_id` int(10) NOT NULL,
  `issue_total` varchar(50) NOT NULL,
  `issue_status` int(11) NOT NULL DEFAULT 1,
  `record_by` varchar(50) NOT NULL,
  `record_date` varchar(20) NOT NULL,
  `deleted_by` varchar(50) NOT NULL,
  `received_status` int(11) NOT NULL DEFAULT 0,
  `received_by` varchar(50) NOT NULL,
  `received_on` varchar(50) NOT NULL,
  `req_id` int(11) NOT NULL,
  `day_end` int(11) NOT NULL DEFAULT 0,
  `vat_rate` decimal(10,2) NOT NULL,
  PRIMARY KEY (`iss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `vat_sales_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `s_id` varchar(10) NOT NULL,
  `qty` varchar(50) NOT NULL,
  `req_qty` varchar(20) NOT NULL,
  `qoh` varchar(20) NOT NULL,
  `balance_qty` varchar(10) NOT NULL,
  `cost` varchar(50) NOT NULL,
  `rate` varchar(50) NOT NULL,
  `row_count` int(10) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `vat_rate` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

