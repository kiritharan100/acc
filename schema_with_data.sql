-- AUTO GENERATED SCHEMA + DATA
-- Generated on: 2025-12-16 07:24:46

-- ----------------------------
-- Table structure for `accounts_accounting_period`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_accounting_period`;
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

-- Data for table `accounts_accounting_period`
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('5','82','2025-11-01','2025-11-01','2025-11-01','1','0');
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('6','82','2025-11-15','2025-11-16','2025-11-17','1','0');
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('7','82','2025-11-19','2025-11-20','2025-11-21','0','0');
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('8','82','2023-04-01','2024-03-31','2024-04-01','1','1');
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('9','82','2024-04-01','2025-03-31','2025-03-31','1','1');
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('10','82','2025-04-01','2026-03-30','2026-09-30','0','0');
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('11','82','2025-04-01','2026-03-31','2026-10-01','0','0');
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('12','82','2025-04-01','2026-03-31','2026-10-01','0','1');
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('13','4','2025-04-01','2026-04-01','2026-10-01','0','1');
INSERT INTO `accounts_accounting_period` (`id`,`location_id`,`perid_from`,`period_to`,`due_date`,`log_old_period`,`status`) VALUES ('14','4','2026-04-02','2027-04-01','2027-10-01','0','1');

-- ----------------------------
-- Table structure for `accounts_coa_category`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_coa_category`;
CREATE TABLE `accounts_coa_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coa_nature` varchar(50) NOT NULL,
  `main_category` varchar(50) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `contact_required` varchar(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data for table `accounts_coa_category`
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('2','Income','Turnover','Turnover','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('3','Expenses','Cost of Sales','Opening Stock','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('4','Expenses','Cost of Sales','Purchases','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('5','Income','Cost of Sales','Closing Stock','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('6','Expenses','Cost of Sales','Staff Costs','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('7','Expenses','Cost of Sales','Depreciation Charges','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('8','Expenses','Cost of Sales','Profit/Loss on Sale of Fixed Assets','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('9','Expenses','Cost of Sales','Impairment Losses','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('10','Expenses','Cost of Sales','Other Direct Costs','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('11','Expenses','Cost of Sales','Operating Leases','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('12','Expenses','Cost of Sales','Research and development','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('13','Expenses','Cost of Sales','Other exceptional items','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('14','Expenses','Cost of Sales','Directors Emoluments','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('15','Expenses','Selling and Distribution Costs','Staff Costs','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('16','Expenses','Selling and Distribution Costs','Depreciation Charges','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('17','Expenses','Selling and Distribution Costs','Profit/Loss on Sale of Fixed Assets','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('18','Expenses','Selling and Distribution Costs','Impairment Losses','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('19','Expenses','Selling and Distribution Costs','Other Selling and Distribution Costs','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('20','Expenses','Selling and Distribution Costs','Operating Leases','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('21','Expenses','Selling and Distribution Costs','Other exceptional items','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('22','Expenses','Selling and Distribution Costs','Directors Emoluments','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('23','Expenses','Administrative Expenses','Staff Costs','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('24','Expenses','Administrative Expenses','Other staff costs','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('25','Expenses','Administrative Expenses','Directors Emoluments','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('26','Expenses','Administrative Expenses','Professional Fees','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('27','Expenses','Administrative Expenses','Premises Costs','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('28','Expenses','Administrative Expenses','Motor & Travel Costs','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('29','Expenses','Administrative Expenses','Finance Costs','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('30','Expenses','Administrative Expenses','Exchange Rate Losses and Gains','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('31','Expenses','Administrative Expenses','Depreciation Charges','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('32','Expenses','Administrative Expenses','Profit/Loss on Sale of Fixed Assets','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('33','Expenses','Administrative Expenses','Impairment Losses','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('34','Expenses','Administrative Expenses','Other Administrative Expenses','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('35','Expenses','Administrative Expenses','Operating Leases','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('36','Expenses','Administrative Expenses','Other exceptional items','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('37','Expenses','FRS 3 Exceptional Items','Exceptional Items','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('38','Income','Other Operating Income','Grants','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('39','Income','Other Operating Income','Exchange Rate Gains','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('40','Income','Other Operating Income','Other exceptional items','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('41','Income','Other Operating Income','Other Operating Income','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('42','Income','Other Operating Income','Profit on Sale of Fixed Assets','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('43','Income','Investment Income','Shares in Group Undertakings','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('44','Income','Investment Income','Participating Interests','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('45','Income','Investment Income','Other Fixed Asset Investments (FII)','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('46','Income','Investment Income','Other Fixed Asset Investments (UnFII)','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('47','Income','Investment Income','Interest Receivable','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('48','Income','Investment Income','Current Asset Investment Income','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('49','Income','Investment Income','Other exceptional items','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('50','Expenses','Amounts Written Off Investments','Amounts Written Off Investments','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('51','Expenses','Interest Payable & Similar Charges','Interest Payable & Similar Charges','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('52','Expenses','Taxation','Corporation Tax','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('53','Expenses','Taxation','Deferred Tax','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('54','-','Suspense','Suspense Account','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('55','Expenses','Other Operating Expenses','Property income related Expenses','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('56','Assets','Fixed Assets','Intangible Fixed Assets - Goodwill','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('57','Assets','Fixed Assets','Other Intangible Assets','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('58','Assets','Fixed Assets','Tangible Fixed Assets - Land & Buildings Freehold','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('59','Assets','Fixed Assets','Tangible Fixed Assets - Land & Buildings Leasehold','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('60','Assets','Fixed Assets','Tangible Fixed Assets - Plant & Machinery','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('61','Assets','Fixed Assets','Tangible Fixed Assets - Motor Vehicles','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('62','Assets','Fixed Assets','Tangible Fixed Assets - Fixtures & Fittings','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('63','Assets','Fixed Assets','Tangible Fixed Assets - Computer Equipment','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('64','Assets','Fixed Assets','Intangible Fixed Assets - R&D','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('65','Assets','Fixed Assets','Tangible Fixed Assets - InvestmentProperties','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('66','Assets','Fixed Assets','Intangible Fixed Assets - Patents','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('67','Assets','Fixed Assets','Intangible Fixed Assets - Trade Mark','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('68','Assets','Fixed Assets','Intangible Fixed Assets - Franchise Fees','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('69','Assets','Fixed Assets','Intangible Fixed Assets - Copy Rights','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('70','Assets','Fixed Assets','Intangible Fixed Assets - Software License','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('71','Assets','Fixed Assets','Tangible Fixed Assets - Improvements to property','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('72','Assets','Fixed Assets ? Leased','Land & buildings - Leased & HP','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('73','Assets','Fixed Assets ? Leased','Plant & machinery - Leased & HP','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('74','Assets','Fixed Assets ? Leased','Motor vehicles - Leased & HP','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('75','Assets','Fixed Assets ? Leased','Fixtures & fittings - Leased & HP','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('76','Assets','Fixed Assets ? Leased','Computer equipment - Leased & HP','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('77','Assets','Fixed Assets ? Leased','InvestmentProperties - Leased & HP','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('78','Assets','Fixed Assets ? Leased','Improvements to property - Leased & HP','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('79','Assets','Fixed Asset Investments','Shares in Group Undertakings','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('80','Assets','Fixed Asset Investments','Loans to Group Undertakings','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('81','Assets','Fixed Asset Investments','Participating Interests','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('82','Assets','Fixed Asset Investments','Loans to Participating Interests','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('83','Assets','Fixed Asset Investments','Investment in own shares','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('84','Assets','Fixed Asset Investments','Other investments ? Listed','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('85','Assets','Fixed Asset Investments','Other investments ? Unlisted','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('86','Assets','Fixed Asset Investments','Investment in Assets','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('87','Assets','Stocks','Stocks','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('88','Assets','Stocks','Payments on Account','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('89','Assets','Stocks','Long Term Contracts','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('90','Assets','Debtors Less than One Year','Trade Debtors','Customer','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('91','Assets','Debtors Less than One Year','Amounts Owed by Group Undertakings & Participating','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('92','Assets','Debtors Less than One Year','Called Up Share Capital Not Paid','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('93','Assets','Debtors Less than One Year','Prepayments & Accrued Income','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('94','Assets','Debtors Less than One Year','Other Debtors Less Than One Year','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('95','Assets','Debtors More than One Year','Trade Debtors','Customer','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('96','Assets','Debtors More than One Year','Amounts Owed by Group Undertakings & Participating','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('97','Assets','Debtors More than One Year','Called Up Share Capital Not Paid','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('98','Assets','Debtors More than One Year','Prepayments & Accrued Income','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('99','Assets','Debtors More than One Year','Other Debtors More Than One Year','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('100','Assets','Debtors More than One Year','Directors Loan accounts','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('101','Assets','Current Asset Investments','Shares in Group Undertakings','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('102','Assets','Current Asset Investments','Investment in own shares','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('103','Assets','Current Asset Investments','Other investments ? Listed','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('104','Assets','Current Asset Investments','Other investments ? Unlisted','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('105','Assets','Cash at Bank & in Hand','Cash in Hand','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('106','Assets','Cash at Bank & in Hand','Bank Accounts','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('107','Liability','Creditors Less Than One Year','Trade Creditors','Supplier','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('108','Liability','Creditors Less Than One Year','Bank Loans & Overdrafts','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('109','Liability','Creditors Less Than One Year','Amounts Owed to Group Undertakings & Participating','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('110','Liability','Creditors Less Than One Year','Taxation & Social Security','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('111','Liability','Creditors Less Than One Year','Accruals & Deferred Income','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('112','Liability','Creditors Less Than One Year','Other Creditors','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('113','Liability','Creditors Less Than One Year','Debenture Loans','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('114','Liability','Creditors Less Than One Year','Non-equity Preference Shares','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('115','Liability','Creditors Less Than One Year','Directors\' current accounts','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('116','Liability','Creditors Less Than One Year','VAT Control Account','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('117','Liability','Creditors More Than One Year','Trade Creditors','Supplier','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('118','Liability','Creditors More Than One Year','Bank Loans & Overdrafts','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('119','Liability','Creditors More Than One Year','Amounts Owed to Group Undertakings & Participating','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('120','Liability','Creditors More Than One Year','Accruals & Deferred Income','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('121','Liability','Creditors More Than One Year','Other Creditors','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('122','Liability','Creditors More Than One Year','Debenture Loans','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('123','Liability','Creditors More Than One Year','Non-equity Preference Shares','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('124','Liability','Creditors More Than One Year','Directors\' Loan accounts','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('125','Liability','Provisions for Liabilities','Provisions for Deferred Tax','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('126','Liability','Provisions for Liabilities','Other Provisions','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('127','Liability','Pension Asset/Liability','Defined Benefit Pension Scheme','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('128','Liability','Capital & Reserves','Equity Share Capital','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('129','Liability','Capital & Reserves','Preference Share Capital','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('130','Liability','Capital & Reserves','Accumulated Profit & Loss','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('131','Liability','Capital & Reserves','Equity Share Premium','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('132','Liability','Capital & Reserves','Preference Share Premium','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('133','Liability','Capital & Reserves','Revaluation Reserve','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('134','Liability','Capital & Reserves','Capital Redemption Reserve','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('135','Liability','Capital & Reserves','Share Options Reserve','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('136','Liability','Capital & Reserves','Special Reserves','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('137','Liability','Capital & Reserves','Other Comprehensive Income','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('138','Liability','Capital & Reserves','Fair Value Reserve','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('139','Liability','Capital & Reserves','General Reserve','','1');
INSERT INTO `accounts_coa_category` (`id`,`coa_nature`,`main_category`,`sub_category`,`contact_required`,`status`) VALUES ('140','Liability','Accruals & Deferred income','Accruals & Deferred income','','1');

-- ----------------------------
-- Table structure for `accounts_coa_client`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_coa_client`;
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

-- Data for table `accounts_coa_client`
INSERT INTO `accounts_coa_client` (`id`,`ca_id`,`master_id`,`cat_id`,`location_id`,`ca_code`,`ca_name`,`vat_id`,`status`,`created_at`,`updated_at`) VALUES ('1','5','501','113','3','1245','sadsadsadsadsadsad','1','1','2025-10-28 15:14:33','2025-10-28 15:27:49');
INSERT INTO `accounts_coa_client` (`id`,`ca_id`,`master_id`,`cat_id`,`location_id`,`ca_code`,`ca_name`,`vat_id`,`status`,`created_at`,`updated_at`) VALUES ('7','2','2','2','3','1000','Sales1','4','0','2025-10-28 20:08:50','2025-10-28 21:05:40');
INSERT INTO `accounts_coa_client` (`id`,`ca_id`,`master_id`,`cat_id`,`location_id`,`ca_code`,`ca_name`,`vat_id`,`status`,`created_at`,`updated_at`) VALUES ('8','3','3','2','3','1010','Fee Income','4','0','2025-10-28 20:48:14','2025-10-28 21:08:30');
INSERT INTO `accounts_coa_client` (`id`,`ca_id`,`master_id`,`cat_id`,`location_id`,`ca_code`,`ca_name`,`vat_id`,`status`,`created_at`,`updated_at`) VALUES ('9','4','4','2','3','1020','Domestic Sales','1','0','2025-10-28 21:05:50','2025-10-28 21:05:50');
INSERT INTO `accounts_coa_client` (`id`,`ca_id`,`master_id`,`cat_id`,`location_id`,`ca_code`,`ca_name`,`vat_id`,`status`,`created_at`,`updated_at`) VALUES ('10','5','5','2','3','1030','Export Sales','1','0','2025-10-28 21:07:38','2025-10-28 21:07:38');
INSERT INTO `accounts_coa_client` (`id`,`ca_id`,`master_id`,`cat_id`,`location_id`,`ca_code`,`ca_name`,`vat_id`,`status`,`created_at`,`updated_at`) VALUES ('11','1000','0','105','3','88888','customer 11111111111','0','0','2025-10-28 21:09:09','2025-10-28 21:09:19');
INSERT INTO `accounts_coa_client` (`id`,`ca_id`,`master_id`,`cat_id`,`location_id`,`ca_code`,`ca_name`,`vat_id`,`status`,`created_at`,`updated_at`) VALUES ('12','1001','0','54','4','33','333','0','0','2025-11-29 21:53:57','2025-11-29 21:54:15');
INSERT INTO `accounts_coa_client` (`id`,`ca_id`,`master_id`,`cat_id`,`location_id`,`ca_code`,`ca_name`,`vat_id`,`status`,`created_at`,`updated_at`) VALUES ('13','2','2','2','82','1000','Sales','4','1','2025-12-05 10:30:29','2025-12-05 10:30:29');

-- ----------------------------
-- Table structure for `accounts_coa_main`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_coa_main`;
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

-- Data for table `accounts_coa_main`
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('2','2','1000','Sales','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('3','2','1010','Fee Income','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('4','2','1020','Domestic Sales','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('5','2','1030','Export Sales','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('6','2','1050','Bank Interest','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('7','2','10600','Other Income','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('8','3','1122','Opening Stock','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('9','3','1200','Opening Stock - Raw Materials','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('10','3','1201','Opening WIP','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('11','3','1202','Opening Stock - Finished Goods','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('12','3','1203','Opening Stock - Other Resale','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('13','4','1210','Purchases','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('14','4','12130','Domestic Purchase','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('15','4','12140','Import Purchase','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('16','5','1220','Closing Stock - Raw Materials','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('17','5','1221','Closing WIP','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('18','5','1222','Closing Stock - Finished Goods','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('19','5','1223','Closing Stock - Other Resale','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('20','5','6667','Closing Stock','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('21','6','1230','Direct Wages & Salaries','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('22','6','1231','Employer\'s PAYE & NI Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('23','6','1232','Pension Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('24','6','1233','Commissions Payable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('25','7','1240','Depreciation Charge: Freehold Properties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('26','7','1241','Depreciation Charge: Leasehold Properties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('27','7','1242','Depreciation Charge: Plant & Machinery','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('28','7','1243','Depreciation Charge: Motor Vehicles','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('29','7','1244','Depreciation Charge: Fixtures & Fittings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('30','7','1245','Depreciation Charge: Computer Equipment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('31','7','1246','Depreciation Charge: Land & Buildings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('32','7','8508','Depreciation Charge: Improvements to property','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('33','8','1250','Profit/Loss on Sale (Tangible Fixed Assets)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('34','9','1260','Impairment Losses (Tangible Fixed Assets)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('35','10','1270','Sub-Contract Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('36','10','1271','Motor Vehicles Hire','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('37','10','1272','Plant Hire','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('38','10','1273','Rent','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('39','10','1274','Other Direct Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('40','10','12790','Customs Duty','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('41','11','1275','Operating Lease Charges - Plant & Equipment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('42','11','1276','Operating Lease Charges - Others','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('43','11','1277','Operating Lease - Land & Buildings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('44','12','1280','Research and Development Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('45','13','1290','Exceptional Items','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('46','13','1291','Reorganisation and Restructuring Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('47','13','1292','Profit/Loss on Sale or Termination of an Operation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('48','14','14200','Directors Salaries','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('49','14','14210','Directors Fees','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('50','14','14220','Directors Employers PAYE & NI Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('51','14','14230','Directors Pension Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('52','14','14240','Directors Pension Current Service Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('53','14','14250','Directors Pension Past Service Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('54','14','14260','Directors Benefits in Kind','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('55','14','14270','Directors Compensation for Loss of Office','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('56','14','14280','Directors Payments to Third Parties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('57','15','1300','Wages & Salaries','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('58','15','1301','Employer\'s PAYE & NI Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('59','15','1302','Pension Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('60','16','1340','Depreciation Charge: Freehold Properties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('61','16','1341','Depreciation Charge: Leasehold Properties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('62','16','1342','Depreciation Charge: Plant & Machinery','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('63','16','1343','Depreciation Charge: Motor Vehicles','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('64','16','1344','Depreciation Charge: Fixtures & Fittings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('65','16','1345','Depreciation Charge: Computer Equipment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('66','16','1346','Depreciation Charge: Land & Buildings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('67','16','8509','Depreciation Charge: Improvements to property','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('68','17','1350','Profit/Loss on Sale (Tangible Fixed Assets)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('69','18','1360','Impairment Losses (Tangible Fixed Assets)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('70','19','1370','Packaging Materials','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('71','19','1371','Transport, Freight & Carriage','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('72','19','1372','Courier Service','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('73','19','1373','Vehicle Hire','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('74','19','1374','Vehicle Leasing Charges','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('75','19','1375','Vehicle Maintenance','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('76','19','1376','Vehicle Insurance','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('77','19','1377','Diesel and Petrol','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('78','19','1378','Commissions Payable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('79','19','1379','Advertising','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('80','19','1380','Exhibitions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('81','19','1381','Website Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('82','19','1382','Entertainment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('83','19','1383','Storage','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('84','19','1384','Cash Discount','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('85','19','1388','Entertainment (Disallowable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('86','20','1385','Operating Lease Charges - Plant & Equipment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('87','20','1386','Operating Lease Charges - Others','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('88','20','1387','Operating Lease - Land & Buildings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('89','21','1390','Exceptional Items','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('90','21','1391','Reorganisation and Restructuring Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('91','21','1392','Profit/Loss on Sale or Termination of an Operation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('92','22','14201','Directors Salaries','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('93','22','14211','Directors Fees','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('94','22','14222','Directors Employers PAYE & NI Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('95','22','14233','Directors Pension Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('96','22','14244','Directors Pension Current Service Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('97','22','14255','Directors Pension Past Service Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('98','22','14266','Directors Benefits in Kind','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('99','22','14277','Directors Compensation for Loss of Office','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('100','22','14288','Directors Payments to Third Parties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('101','23','1400','Wages & Salaries','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('102','23','1401','Employer\'s PAYE & NI Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('103','23','1402','Pension Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('104','23','1403','Pension Current Service Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('105','23','1404','Pension Past Service Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('106','23','1405','Equity-Settled Share-Based Payments','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('107','23','14080','Bonus','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('108','24','1410','Staff Training','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('109','24','1411','Staff Welfare','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('110','24','1412','Temporary Staff & Recruitment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('111','24','1413','Other Staff-Related Expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('112','25','1420','Directors Salaries','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('113','25','1421','Directors Fees','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('114','25','1422','Directors Employer\'s PAYE & NI Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('115','25','1423','Directors Pension Contributions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('116','25','1424','Directors Pension Current Service Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('117','25','1425','Directors Pension Past Service Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('118','25','1426','Directors Benefits in Kind','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('119','25','1427','Directors Compensation for Loss of Office','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('120','25','1428','Directors Payments to Third Parties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('121','26','1430','Auditors Remuneration','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('122','26','1431','Accountancy Fees','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('123','26','1432','Legal and Professional Fees (Allowable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('124','26','1433','Legal and Professional Fees (Disallowable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('125','26','14340','Management & Consultancy fees','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('126','27','1440','Rates & Water','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('127','27','1441','Rent','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('128','27','1442','Light, Heat & Power','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('129','27','1443','Property Insurance','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('130','27','1444','Property Maintenance (Allowable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('131','27','1445','Property Maintenance (Disallowable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('132','27','1446','Cleaning of Premises','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('133','27','1447','Other Premises Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('134','27','1457','Use of Home as Office','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('135','28','1460','Petrol and Oil','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('136','28','1461','Motor Licenses and Insurances','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('137','28','1462','Motor Repairs and Servicing','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('138','28','1463','General Travel Expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('139','28','1464','Overseas Travel','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('140','29','1510','Discount Allowed','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('141','29','1511','Bad Debts Written Off (Specific)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('142','29','1512','Provision for Doubtful Debts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('143','29','1517','Bank Charges','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('144','29','15170','Payment Gateway Charges','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('145','30','1520','Exchange Rate Losses/Gains','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('146','31','1540','Depreciation Charge: Freehold Properties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('147','31','1541','Depreciation Charge: Leasehold Properties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('148','31','1542','Depreciation Charge: Plant & Machinery','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('149','31','1543','Depreciation Charge: Motor Vehicles','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('150','31','1544','Depreciation Charge: Fixtures & Fittings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('151','31','1545','Depreciation Charge: Computer Equipment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('152','31','1546','Amortisation (Intangible Fixed Assets) - Goodwill','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('153','31','1547','Amortisation (Intangible Fixed Assets) - R&D','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('154','31','1548','Amortisation (Intangible Fixed Assets) - Other','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('155','31','1549','Depreciation Charge: Land & Buildings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('156','31','8300','Amortisation (Intangible Fixed Assets) - Patents','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('157','31','8301','Amortisation (Intangible Fixed Assets) - Trade Mark','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('158','31','8302','Amortisation (Intangible Fixed Assets) - Franchise Fees','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('159','31','8303','Amortisation (Intangible Fixed Assets) - Copy Rights','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('160','31','8304','Amortisation (Intangible Fixed Assets) - Software License','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('161','31','8510','Depreciation Charge: Improvements to property','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('162','31','8511','Depreciation Charge - Investment in Properties','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('163','32','1550','Profit/Loss on Sale (Tangible Fixed Assets)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('164','32','1551','Profit/Loss on Sale (Intangible Fixed Assets)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('165','32','1552','Profit/Loss on Sale (Fixed Assets Investment)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('166','33','1560','Impairment Losses (Tangible FA)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('167','33','1561','Impairment Losses (Intangible FA)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('168','34','1571','Advertising','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('169','34','1572','Entertainment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('170','34','1573','General Insurance','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('171','34','1574','Computer Expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('172','34','1575','Repairs & Renewals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('173','34','1576','Stationery & Postage','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('174','34','1577','Telephone, Fax & Internet','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('175','34','1578','Canteen','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('176','34','1579','Sundry Expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('177','34','1580','Donations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('178','34','1581','Donations (Disallowable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('179','34','1582','Entertainment (Disallowable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('180','34','1583','Equipment leasing','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('181','35','1585','Operating Lease Charges - Plant & Equipment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('182','35','1586','Operating Lease Charges - Others','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('183','35','1587','Operating Lease - Land & Buildings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('184','36','1590','Exceptional Item','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('185','36','1591','Reorganisation and Restructuring Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('186','36','1592','Profit/Loss on Sale or Termination of an Operation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('187','36','15930','Loss on theft of Asset','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('188','37','1600','Exceptional Items','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('189','37','1601','Profit/Loss on Sale or Termination of an Operation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('190','37','1602','Reorganisation and Restructuring Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('191','37','1603','Exceptional Profits/Losses on Disposal of Fixed Assets','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('192','38','2000','Government Grants','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('193','38','2060','SEISS Grant','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('194','39','2010','Exchange Rate Gains','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('195','40','2020','Exceptional item','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('196','41','2030','Rents Received','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('197','41','2031','Discount Received','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('198','41','2032','Commissions Received','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('199','41','2033','Other Operating Income (Taxable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('200','41','2034','Other Operating Income (Not-Taxable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('201','41','2035','Management Charges Receivable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('202','41','2036','VAT Flat Rate Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('203','41','2134','Revaluation of Investment Properties(Non-taxable)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('204','42','2220','Profit on Sale (Tangible Fixed Assets)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('205','42','2221','Profit on Sale (Intangible Fixed Assets)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('206','42','2222','Profit on Sale (Fixed Assets Investment)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('207','43','2300','Shares in Group Undertakings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('208','44','2310','Participating Interests','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('209','45','2320','Other Fixed Asset Investments (FII)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('210','46','2330','Other Fixed Asset Investments (UnFII)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('211','47','2340','Deposit Account Interest','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('212','47','2341','Loan Interest','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('213','47','2342','Net Finance Income - Defined Benefit Pension Scheme','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('214','47','2600','Interest Receivable and Other Income','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('215','48','2350','Current Asset Investment Income','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('216','49','2360','Exceptional Item','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('217','50','2400','Amounts W/O Investments','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('218','51','2500','Bank & Other Loan Interest','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('219','51','2501','Interest Payable to Group Undertakings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('220','51','2502','Mortgage Interest','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('221','51','2503','Operating Lease: Rent of Buildings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('222','51','2504','Operating Lease: Equipment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('223','51','2505','Other Operating Leases','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('224','51','2506','Factoring Charges','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('225','51','2507','Hire Purchase','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('226','51','2508','Dividends on Non-Equity Preference Shares','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('227','51','2509','Other Interest Payable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('228','51','2510','Other Finance Costs','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('229','51','2800','Interest Payable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('230','51','2820','Interest Payable on Hire Purchase Contracts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('231','52','3000','Corporation Tax','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('232','53','3010','Current Year Deferred Tax','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('233','53','3020','Adjustment in Respect of Prior Period Deferred Tax','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('234','54','9999','Suspense Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('235','55','17000','Property Taxes','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('236','55','17010','Property Expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('237','55','17020','Repairs & Maintenance','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('238','56','4020','Goodwill - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('239','56','4021','Goodwill - Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('240','56','4022','Goodwill - Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('241','56','4023','Goodwill - Revaluation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('242','56','4024','Goodwill - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('243','56','4025','Goodwill - Accumulated Amortisation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('244','56','4026','Goodwill - Amortisation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('245','56','4027','Goodwill - Amortisation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('246','57','4030','Other Intangible - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('247','57','4031','Other Intangible - Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('248','57','4032','Other Intangible - Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('249','57','4033','Other Intangible - Revaluation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('250','57','4034','Other Intangible - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('251','57','4035','Other Intangible - Accumulated Amortisation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('252','57','4036','Other Intangible - Amortisation Charge for Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('253','57','4037','Other Intangible - Amortisation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('254','58','4040','Freehold Property - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('255','58','4041','Freehold Property - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('256','58','4042','Freehold Property - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('257','58','4043','Freehold Property - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('258','58','4044','Freehold Property - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('259','58','4045','Freehold Property - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('260','58','4046','Freehold Property - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('261','58','4047','Freehold Property - Depreciation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('262','59','4050','Leasehold Property - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('263','59','4051','Leasehold Property - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('264','59','4052','Leasehold Property - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('265','59','4053','Leasehold Property - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('266','59','4054','Leasehold Property - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('267','59','4055','Leasehold Property - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('268','59','4056','Leasehold Property - Depreciation Charge for Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('269','59','4057','Leasehold Property - Depreciation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('270','60','4060','Plant & Machinery - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('271','60','4061','Plant & Machinery - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('272','60','4062','Plant & Machinery - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('273','60','4063','Plant & Machinery - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('274','60','4064','Plant & Machinery - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('275','60','4065','Plant & Machinery - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('276','60','4066','Plant & Machinery - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('277','60','4067','Plant & Machinery - Depreciation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('278','61','4080','Motor Vehicles - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('279','61','4081','Motor Vehicles - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('280','61','4082','Motor Vehicles - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('281','61','4083','Motor Vehicles - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('282','61','4084','Motor Vehicles - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('283','61','4085','Motor Vehicles - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('284','61','4086','Motor Vehicles - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('285','61','4087','Motor Vehicles - Depreciation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('286','62','4100','Fixtures & Fittings - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('287','62','4101','Fixtures & Fittings - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('288','62','4102','Fixtures & Fittings - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('289','62','4103','Fixtures & Fittings - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('290','62','4104','Fixtures & Fittings - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('291','62','4105','Fixtures & Fittings - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('292','62','4106','Fixtures & Fittings - Depreciation Charge for Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('293','62','4107','Fixtures & Fittings - Depreciation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('294','63','4120','Computer Equipment - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('295','63','4121','Computer Equipment - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('296','63','4122','Computer Equipment - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('297','63','4123','Computer Equipment - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('298','63','4124','Computer Equipment - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('299','63','4125','Computer Equipment - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('300','63','4126','Computer Equipment - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('301','63','4127','Computer Equipment - Depreciation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('302','64','4010','R&D - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('303','64','4011','R&D - Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('304','64','4012','R&D - Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('305','64','4013','R&D - Revaluation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('306','64','4014','R&D - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('307','64','4015','R&D - Accumulated Amortisation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('308','64','4016','R&D - Amortisation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('309','64','4017','R&D - Amortisation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('310','65','4072','Investment Properties - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('311','65','4073','Investment Properties - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('312','65','4074','Investment Properties - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('313','65','4090','Investment Properties - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('314','65','4091','Investment Properties - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('315','65','4095','Investment Properties - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('316','65','4097','Investment Properties - Depreciation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('317','65','4506','Investment Properties - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('318','66','4800','Patents - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('319','66','4801','Patents - Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('320','66','4802','Patents - Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('321','66','4803','Patents - Revaluation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('322','66','4804','Patents - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('323','66','4805','Patents - Accumulated Amortisation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('324','66','4806','Patents - Amortisation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('325','66','4807','Patents - Amortisation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('326','67','4810','Trade Mark - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('327','67','4811','Trade Mark - Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('328','67','4812','Trade Mark - Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('329','67','4813','Trade Mark - Revaluation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('330','67','4814','Trade Mark - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('331','67','4815','Trade Mark - Accumulated Amortisation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('332','67','4816','Trade Mark - Amortisation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('333','67','4817','Trade Mark - Amortisation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('334','68','4820','Franchise Fees - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('335','68','4821','Franchise Fees - Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('336','68','4822','Franchise Fees - Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('337','68','4823','Franchise Fees - Revaluation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('338','68','4824','Franchise Fees - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('339','68','4825','Franchise Fees - Accumulated Amortisation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('340','68','4826','Franchise Fees - Amortisation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('341','68','4827','Franchise Fees - Amortisation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('342','69','4830','Copy Rights - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('343','69','4831','Copy Rights - Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('344','69','4832','Copy Rights - Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('345','69','4833','Copy Rights - Revaluation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('346','69','4834','Copy Rights - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('347','69','4835','Copy Rights - Accumulated Amortisation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('348','69','4836','Copy Rights - Amortisation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('349','69','4837','Copy Rights - Amortisation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('350','70','4840','Software License - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('351','70','4841','Software License - Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('352','70','4842','Software License - Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('353','70','4843','Software License - Revaluation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('354','70','4844','Software License - Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('355','70','4845','Software License - Accumulated Amortisation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('356','70','4846','Software License - Amortisation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('357','70','4847','Software License - Amortisation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('358','71','8500','Improvements to property - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('359','71','8501','Improvements to property - Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('360','71','8502','Improvements to property - Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('361','71','8503','Improvements to property - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('362','71','8504','Improvements to property - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('363','71','8505','Improvements to property - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('364','71','8506','Improvements to property - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('365','71','8507','Improvements to property - Depreciation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('366','72','4130','Land & Buildings Leased - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('367','72','4131','Land & Buildings Leased - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('368','72','4132','Land & Buildings Leased - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('369','72','4133','Land & Buildings Leased - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('370','72','4134','Land & Buildings Leased - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('371','72','4135','Land & Buildings Leased - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('372','72','4136','Land & Buildings Leased - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('373','72','4137','Land & Buildings Leased - Depreciation on Disposal','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('374','73','4140','Plant & Machinery  Leased - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('375','73','4141','Plant & Machinery  Leased - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('376','73','4142','Plant & Machinery - Disposals - Cost  Leased','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('377','73','4143','Plant & Machinery  Leased - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('378','73','4144','Plant & Machinery  Leased - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('379','73','4145','Plant & Machinery Leased - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('380','73','4146','Plant & Machinery Leased - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('381','73','4147','Plant & Machinery Leased - Depreciation on Disposal','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('382','74','4150','Motor Vehicles  Leased - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('383','74','4151','Motor Vehicles  Leased - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('384','74','4152','Motor Vehicles Leased - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('385','74','4153','Motor Vehicles  Leased - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('386','74','4154','Motor Vehicles  Leased - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('387','74','4155','Motor Vehicles Leased - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('388','74','4156','Motor Vehicles Leased - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('389','74','4157','Motor Vehicles Leased - Depreciation on Disposal','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('390','75','4160','Fixtures & Fittings Leased - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('391','75','4161','Fixtures & Fittings Leased - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('392','75','4162','Fixtures & Fittings Leased - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('393','75','4163','Fixtures & Fittings Leased - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('394','75','4164','Fixtures & Fittings Leased - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('395','75','4165','Fixtures & Fittings Leased - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('396','75','4166','Fixtures & Fittings Leased - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('397','75','4167','Fixtures & Fittings Leased - Depreciation on Disposal','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('398','76','4170','Computer Equipment  Leased - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('399','76','4171','Computer Equipment  Leased - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('400','76','4172','Computer Equipment Leased - Disposals - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('401','76','4173','Computer Equipment  Leased - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('402','76','4174','Computer Equipment  Leased - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('403','76','4175','Computer Equipment Leased - Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('404','76','4176','Computer Equipment Leased - Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('405','76','4177','Computer Equipment Leased - Depreciation on Disposal','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('406','77','4190','Investment Properties Leased - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('407','77','4191','Investment Properties Leased - Additions - Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('408','77','4192','Investment Properties - Disposals - Cost Leased','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('409','77','4193','Investment Properties - Leased - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('410','77','4194','Investment Properties - Leased - Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('411','78','4310','Improvements to property leased- Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('412','78','4311','Improvements to property leased- Additions Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('413','78','4312','Improvements to property leased- Disposals Cost','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('414','78','4313','Improvements to property leased- Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('415','78','4314','Improvements to property leased- Transfers','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('416','78','4315','Improvements to property leased- Accumulated Depreciation b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('417','78','4316','Improvements to property leased- Depreciation Charge for the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('418','78','4317','Improvements to property leased- Depreciation on Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('419','79','4200','Shares in Group - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('420','79','4201','Shares in Group - Additions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('421','79','4202','Shares in Group - Cost of Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('422','79','4203','Shares in Group - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('423','79','4204','Shares in Group - Aggregate Amount W/Off','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('424','80','4210','Loans to Group - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('425','80','4211','Loans to Group - Additions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('426','80','4212','Loans to Group - Cost of Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('427','80','4213','Loans to Group - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('428','80','4214','Loans to Group - Aggregate Amount W/Off','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('429','81','4220','Participating Ints - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('430','81','4221','Participating Ints - Additions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('431','81','4222','Participating Ints - Cost of Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('432','81','4223','Participating Ints - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('433','81','4224','Participating Ints - Aggregate Amount W/Off','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('434','82','4230','Loans to Participating Ints - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('435','82','4231','Loans to Participating Ints - Additions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('436','82','4232','Loans to Participating Ints - Cost of Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('437','82','4233','Loans to Participating Ints - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('438','82','4234','Loans to Participating Ints - Aggregate Amount W/Off','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('439','83','4240','Investment in Own Shares - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('440','83','4241','Investment in Own Shares - Additions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('441','83','4242','Investment in Own Shares - Cost of Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('442','83','4243','Investment in Own Shares - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('443','83','4244','Investment in Own Shares - Aggregate Amount W/Off','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('444','84','4250','Other Investments - Listed - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('445','84','4251','Other Investments - Listed - Additions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('446','84','4252','Other Investments - Listed - Cost of Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('447','84','4253','Other Investments - Listed - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('448','84','4254','Other Investments - Listed - Aggregate Amount W/Off','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('449','85','4260','Other Investments - Unlisted - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('450','85','4261','Other Investments - Unlisted - Additions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('451','85','4262','Other Investments - Unlisted - Cost of Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('452','85','4263','Other Investments - Unlisted - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('453','85','4264','Other Investments - Unlisted - Aggregate Amount W/Off','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('454','86','4270','Investment in Assets - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('455','86','4271','Investment in Assets - Additions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('456','86','4272','Investment in Assets - Cost of Disposals','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('457','86','4273','Investment in Assets - Revaluations','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('458','86','4274','Investment in Assets - Aggregate Amount W/Off','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('459','86','4275','Investment in Assets - Transfer to/ From Tangible fixed assets','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('460','87','4420','Finished Goods','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('461','87','4421','Work in Progress','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('462','87','4422','Raw Materials','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('463','87','4423','Stocks','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('464','88','4440','Payments on Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('465','89','4460','Long Term Contracts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('466','90','4600','Trade Debtors','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('467','90','4601','Provision for Doubtful Debts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('468','91','4610','Amount Owed by Group Undertakings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('469','91','4611','Amount Owed by Participating Interests','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('470','92','4620','Called up Share Capital Not Paid','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('471','92','4621','Premium on Called up Share Capital Not Paid','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('472','93','4630','Prepayments & Accrued Income','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('473','93','4631','Accrued Income','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('474','93','4632','Accrued Interest Receivable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('475','93','4633','Advance Received','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('476','93','4634','Deposits paid','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('477','94','4640','Amounts Recoverable on Contracts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('478','94','4641','Debts Factored without Recourse','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('479','94','4642','Other Debtors','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('480','94','4643','Interest Receivable and Other Income','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('481','94','4644','Lottery control account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('482','94','4645','Paypoint Control Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('483','95','4700','Trade Debtors','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('484','95','4701','Provision for Doubtful Debts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('485','96','4710','Amount Owed by Group Undertakings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('486','96','4711','Amount Owed by Participating Interests','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('487','97','4720','Called Up Share Capital Not Paid','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('488','97','4721','Premium on Called up Share Capital Not Paid','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('489','98','4730','Prepayments','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('490','98','4731','Accrued Income','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('491','98','4732','Accrued Interest Receivable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('492','98','4733','Deposits paid','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('493','99','4740','Amounts Recoverable on Contracts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('494','99','4741','Debts Factored Without Recourse','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('495','99','4742','Other Debtors','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('496','100','4750','Directors Loan Accounts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('497','101','5000','Shares in Group - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('498','102','5040','Investment in Own Shares - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('499','103','5050','Other Investments - Listed - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('500','104','5060','Other Investments - Unlisted - Cost b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('501','105','5220','Cash in Hand','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('502','106','5242','Current Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('503','107','5400','Trade Creditors','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('504','108','5410','Bank Loans & Overdrafts (Secured)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('505','108','5411','Bank Loans & Overdrafts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('506','109','5420','Amounts Owed to Group Undertakings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('507','109','5421','Amounts Owed to Participating Interests','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('508','110','5430','Corporation Tax','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('509','110','5431','PAYE & Social Security','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('510','110','5435','CIS Control Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('511','111','5440','Accrued Expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('512','111','5441','Deferred Grants','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('513','111','5442','Advance Paid','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('514','112','5450','Other Creditors','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('515','112','5451','Bills of Exchange Payable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('516','112','5452','Dividends Payable - Equity','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('517','112','5453','Dividends Payable - Non-Equity','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('518','112','5454','Obligations under HP/Financial Leases','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('519','112','5455','Payments Received on Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('520','112','5456','Wages & Salaries Control Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('521','112','5457','Interest Payable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('522','112','5458','Intra-Group Interest Payable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('523','112','5459','Attachment of Earnings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('524','112','5476','Proposed Dividend','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('525','113','5460','Debenture Loans','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('526','113','5461','Debenture Loans - Convertible','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('527','114','5470','Preference Shares b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('528','114','5471','Issue of New Preference Share Capital at Par','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('529','114','5472','Other Issues','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('530','114','5473','Purchase of Own Shares','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('531','114','5474','Prior Year Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('532','114','5475','Transfers from NEPS Less than 1 Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('533','115','5480','Directors\' Current Accounts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('534','116','5432','VAT','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('535','117','5500','Trade Creditors','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('536','118','5510','Bank Loans & Overdrafts (secured)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('537','118','5511','Bank Loans & Overdrafts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('538','119','5520','Amounts Owed to Group Undertakings','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('539','119','5521','Amounts Owed to Participating Interests','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('540','120','5540','Accrued Expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('541','120','5541','Deferred Grants','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('542','121','5550','Other Creditors','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('543','121','5551','Bills of Exchange Payable','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('544','121','5552','Dividends Payable - Equity','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('545','121','5553','Dividends Payable - Non-Equity','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('546','121','5554','Obligations Under HP/Financial Leases','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('547','121','5555','Payments Received on Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('548','122','5560','Debenture Loans','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('549','122','5561','Debenture Loans - Convertible','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('550','123','5570','Preference Shares b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('551','123','5571','Issue of New Preference Share Capital at Par','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('552','123','5572','Other Issues','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('553','123','5573','Purchase of Own Shares','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('554','123','5574','Prior Year Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('555','123','5575','Transfers from NEPS greater than 1 Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('556','124','5580','Directors\' Loan Accounts','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('557','125','5820','Deferred Tax','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('558','125','5821','Charged to Profit & Loss','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('559','126','5840','Pension Provisions','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('560','127','6030','Defined Benefit Pension Scheme Asset/Liability b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('561','127','6031','DBPS : Actuarial Gain/Loss in Current Accounting Period','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('562','128','7010','Equity Share Capital b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('563','128','7011','Issue of New Equity Share Capital at Par','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('564','128','7012','Scrip/Rights Issues','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('565','128','7013','Purchase of Own Shares','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('566','128','7014','Other Equity Share capital','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('567','128','7015','Prior period adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('568','128','1/1/7016','Reduction of share capital','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('569','129','7020','Preference Share Capital b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('570','129','7021','Issue of New Preference Share Capital at Par','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('571','129','7022','Other Issues','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('572','129','7023','Purchase of Own Shares','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('573','129','7024','Prior Year Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('574','129','1/1/7025','Reduction of share capital','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('575','130','8000','Profit & Loss Account b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('576','130','8002','Equity Dividends Proposed','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('577','130','8003','Equity Dividends Paid','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('578','130','8005','Transfer from Reserves','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('579','130','8006','Purchase of Own Shares','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('580','130','8007','Prior Year Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('581','130','8008','Transfer To Reserves','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('582','130','8099','Donation to parent company','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('583','130','8152','Transfer to Profit and Loss Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('584','130','1/1/8153','Reduction of share capital','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('585','131','8010','Equity Share Premium b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('586','131','8011','Equity Share Premium - New Issue','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('587','131','8012','Qualifying Equity Share Issue Expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('588','131','8013','Prior Year Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('589','131','1/1/8014','Reduction of share capital','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('590','132','8020','Preference Share Premium b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('591','132','8021','Preference Share Premium - New Issue','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('592','132','8022','Qualifying Preference Share Issue Expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('593','132','8023','Prior Year Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('594','132','1/1/8024','Reduction of share capital','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('595','133','8030','Revaluation Reserve b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('596','133','8031','Revaluation of Fixed Assets','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('597','133','8032','Transfer to Profit and Loss Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('598','133','8033','Investments w/off Revalued','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('599','133','8034','Transfers to/from Other Reserves','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('600','133','8035','Deferred Tax Provided on Revaluation','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('601','133','8036','Prior Year Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('602','133','8037','Deferred Tax Provided on Revaluation of Trade Investments','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('603','134','8040','Capital Redemption Reserve b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('604','134','8041','Purchase of Own Shares (Nominal Value)','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('605','134','8042','Transfer to Profit and Loss account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('606','134','8044','Transfers to/from Other Reserves','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('607','134','8046','Prior Year Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('608','134','1/1/8047','Reduction of share capital','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('609','135','8050','Share Options Reserve b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('610','135','8051','Equity-Settled Share-Based Payments in Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('611','135','8052','Exercise of Options during the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('612','135','8053','Transfer to Profit and Loss Account','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('613','135','8054','Expiry of Share Options in the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('614','135','8055','Forfeiture of Share Options in the Year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('615','135','8056','Prior Year Adjustment','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('616','136','8070','Special reserves b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('617','136','8071','Created during the year','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('618','136','8072','Transfer','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('619','137','8080','Other Comprehensive Income b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('620','137','8081','Actuarial Gain','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('621','137','8091','Unrealized Gains or losses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('622','137','8111','Foreign currency adjustments','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('623','137','8121','Gains on cash flow hedges','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('624','138','8150','Fair Value Reserve','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('625','138','8151','Fair Value Reserve b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('626','139','8160','General Reserve','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('627','139','8161','General Reserve b/fwd','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('628','140','5660','Accrued expenses','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('629','140','5661','Deferred Grants','1','1');
INSERT INTO `accounts_coa_main` (`ca_id`,`cat_id`,`ca_code`,`ca_name`,`vat_id`,`status`) VALUES ('630','140','5662','Accrued& Deferred income','1','1');

-- ----------------------------
-- Table structure for `accounts_journal`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_journal`;
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

-- Data for table `accounts_journal`
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('3','82','1','0000-00-00','asaSA','250000.00','250000.00','','','1','2025-11-01 21:17:48','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('4','82','2','0000-00-00','test','500.00','500.00','','','1','2025-11-01 21:34:34','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('5','82','3','0000-00-00','wqe','5000.00','5000.00','','','1','2025-11-01 21:37:46','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('6','82','4','0000-00-00','wqe','5000.00','5000.00','','','1','2025-11-01 21:39:08','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('7','82','5','2025-11-01','sdfaf','2500.00','2500.00','','','1','2025-11-01 21:47:44','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('8','82','6','2025-10-29','tesyt','250.00','250.00','','','1','2025-11-01 21:52:58','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('9','82','7','2025-11-14','dsadsdsd','50000.00','50000.00','','','1','2025-11-01 22:14:22','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('10','82','8','2024-11-14','asdsad','25000.00','25000.00','','','1','2025-11-01 22:15:27','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('11','4','1','2025-11-30','asdsad','250000.00','250000.00','','','1','2025-11-30 07:51:17','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('12','4','2','2025-01-05','test','5000.00','5000.00','','','1','2025-11-30 07:59:38','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('13','4','3','2025-11-24','test koutnal','60000.00','60000.00','','','1','2025-11-30 08:09:14','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('14','4','4','2025-11-24','sa','2000.00','2000.00','','','1','2025-11-30 08:18:49','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('15','82','9','2025-11-24','test','5000.00','5000.00','','','1','2025-11-30 19:15:35','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('16','4','5','2025-11-24','ds','5000.00','5000.00','','','1','2025-11-30 20:49:01','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('17','4','6','2025-11-24','aa','2500.00','2500.00','','','1','2025-11-30 20:52:07','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('18','4','7','2025-11-24','234234','2500.00','2500.00','','','1','2025-11-30 20:57:06','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('19','4','8','2025-11-24','w','100.00','100.00','','','1','2025-11-30 20:57:47','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('20','4','9','2025-11-24','ss','25.00','25.00','','','1','2025-11-30 20:58:02','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('21','4','10','2025-11-24','12','12.00','12.00','','','1','2025-11-30 21:05:43','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('22','4','11','2025-11-24','as','12.00','12.00','','','1','2025-11-30 21:10:27','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('23','4','12','2025-12-02','tesr','120.00','120.00','Supplier','12','1','2025-12-02 05:55:46','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('24','82','10','2025-12-02','sadsad','5.00','5.00','','','1','2025-12-02 18:54:50','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('25','82','11','2025-12-02','dd','1.00','1.00','','','1','2025-12-02 20:17:24','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('26','82','12','2025-12-02','1','1.00','1.00','','','1','2025-12-02 20:26:33','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('27','82','13','2025-12-02','1','1.00','1.00','','','1','2025-12-02 20:27:49','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('28','82','14','2025-12-02','12','12.00','12.00','','','1','2025-12-02 20:28:20','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('29','82','15','2025-12-02','s','250.00','250.00','','','1','2025-12-02 20:39:48','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('30','82','16','2025-12-02','sdf','12.00','12.00','','','1','2025-12-02 20:40:38','0');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('31','82','17','2025-12-02','2','12.00','12.00','','','1','2025-12-02 20:50:33','0');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('32','82','18','2025-12-05','Depreciation for computer expenses','250.00','250.00','','','1','2025-12-05 09:19:36','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('33','82','19','2025-12-05','Depreciation for computer expenses','250.00','250.00','','','1','2025-12-05 09:20:07','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('34','82','20','2025-12-05','222','0.00','0.00','','','1','2025-12-05 09:21:50','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('51','82','21','2025-12-05','d','50.00','50.00','',NULL,'1','2025-12-05 09:32:35','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('52','82','22','2025-12-05','2','22.00','22.00','',NULL,'1','2025-12-05 10:42:44','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('53','82','23','2025-12-05','w','50.00','50.00','',NULL,'1','2025-12-05 11:07:29','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('54','4','13','2025-12-05','sadasd','500000.00','500000.00','',NULL,'1','2025-12-05 14:20:24','1');
INSERT INTO `accounts_journal` (`id`,`location_id`,`loc_no`,`journal_date`,`memo`,`total_debit`,`total_credit`,`contact_type`,`contact_id`,`user_id`,`created_on`,`status`) VALUES ('55','82','24','2025-12-05','cash sales','5000.00','5000.00','',NULL,'1','2025-12-05 15:26:50','1');

-- ----------------------------
-- Table structure for `accounts_journal_detail`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_journal_detail`;
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

-- Data for table `accounts_journal_detail`
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('8','3','122','','5','250000.00','0.00','37500.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('9','3','511','','1','0.00','250000.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('10','4','122','','1','500.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('11','4','511','','1','0.00','500.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('12','5','122','','1','5000.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('13','6','122','','1','5000.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('14','6','628','','1','0.00','5000.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('17','8','122','','1','250.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('18','8','511','','1','0.00','250.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('19','9','122','','1','50000.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('20','9','473','','1','0.00','50000.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('21','10','628','sad','1','25000.00','0.00','0.00','0.00','0','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('22','10','122','','1','0.00','25000.00','0.00','0.00','0','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('25','7','122','','4','2500.00','0.00','450.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('26','7','122','25','1','0.00','2500.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('27','11','628','','0','250000.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('28','11','540','','0','0.00','250000.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('31','12','122','','0','5000.00','0.00','0.00','0.00','0','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('32','12','502','','0','0.00','5000.00','0.00','0.00','0','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('33','13','122','','0','5000.00','0.00','0.00','0.00','0','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('34','13','502','','0','0.00','60000.00','0.00','0.00','0','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('35','13','156','','0','55000.00','0.00','0.00','0.00','0','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('36','14','122','','0','2000.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('37','14','502','','0','0.00','2000.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('38','15','122','','1','5000.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('39','15','540','','1','0.00','5000.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('40','16','513','','0','5000.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('41','16','628','','0','0.00','5000.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('42','17','122','','0','2500.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('43','17','540','','0','0.00','2500.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('44','18','511','','0','2500.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('45','19','122','','0','100.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('46','19','511','','0','0.00','100.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('47','20','122','','0','25.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('48','21','122','','0','12.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('49','22','122','','0','12.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('50','22','540','','0','0.00','12.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('57','23','122','12','0','120.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('58','23','540','','0','0.00','120.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('59','24','511','','1','5.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('60','24','628','','1','0.00','5.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('61','25','628','','1','1.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('62','25','540','','1','0.00','1.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('63','26','122','','1','1.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('64','26','628','','1','0.00','1.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('65','27','122','','1','1.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('66','27','511','','1','0.00','1.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('69','28','122','','1','12.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('70','28','540','','1','0.00','12.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('73','29','540','5','1','250.00','0.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('74','29','540','','1','0.00','250.00','0.00','0.00','1','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('75','30','511','','1','12.00','0.00','0.00','0.00','0','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('76','30','511','','1','0.00','12.00','0.00','0.00','0','0','');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('79','31','511','','1','12.00','0.00','0.00','0.00','0','14','Supplier');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('80','31','540','','1','0.00','12.00','0.00','0.00','0','14','Supplier');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('85','51','628','','1','50.00','0.00','0.00','0.00','1','14','Supplier');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('86','51','629','','1','0.00','50.00','0.00','0.00','1',NULL,'');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('87','52','2','qw','1','22.00','0.00','0.00','0.00','1',NULL,'');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('88','52','629','','1','0.00','22.00','0.00','0.00','1',NULL,'');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('93','53','2','','3','50.00','0.00','0.00','0.00','1','14','Supplier');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('94','53','501','','1','0.00','50.00','0.00','0.00','1','232','Customer');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('95','54','2','','0','0.00','500000.00','0.00','0.00','1',NULL,'');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('96','54','466','','0','500000.00','0.00','0.00','0.00','1','12','Supplier');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('101','55','2','','3','0.00','5000.00','0.00','0.00','1',NULL,'');
INSERT INTO `accounts_journal_detail` (`id`,`journal_id`,`ca_id`,`description`,`vat_id`,`debit`,`credit`,`debit_vat`,`credit_vat`,`status`,`contact_id`,`contact_type`) VALUES ('102','55','501','','1','5000.00','0.00','0.00','0.00','1',NULL,'');

-- ----------------------------
-- Table structure for `accounts_manage_customer`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_manage_customer`;
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

-- Data for table `accounts_manage_customer`
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('0','Cash Sales','Cash Sales\r\n','','','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('1','Sales to MPCS Branches','','','','0.00','1','13','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('2','Sales to MPCS Vehicle Section','','','','0.00','1','14','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('3','Sales to MPCS Other Needs','','','','0.00','1','15','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('213','sripura police station','padavi sripura','','','300000.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('214','padavi sripura pradeshiya sabha','padavi sripura','','','200000.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('215','Divisional secretariat office','padavi sripura','','0252255236','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('216','Divisional hospital','padavi sripura','','','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('217','M.O.H Office','padavi sripura','','','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('218','Veterinary office','padavi sripura','','','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('219','MPCS rural bank','padavi sripura','','0252255125','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('220','civil security department','galkulama','','','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('221','MPCS Genarator','padavi sripura','','','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('222','hospital CKD Unit','padavi sripura','','','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('223','police station pulmuddai (SSP)','pulmuddai','','0262256221','300000.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('224',' pradheshiya sabha kuchchaweli (KPS)','pulmuddai','','0717873821','300000.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('225','lanka mineral sand (LMSL)','pulmuddai','','0714526806','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('226','Ceylon electricity board (CEB) ','trincomalee','','0718378667','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('227','Base hospital pulmoddai (RDHS)','pulmuddai','','0262222263','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('228','specials task force (STF)','pulmuddai','','0263261815','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('229','secret intelligent service (SIS) ','Colombo ','','','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('230','Peoples Bank - Pulmuddai (PPB)','Pulmuddai','','0262256188','0.00','1','11','0');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('231','Test name','','','','0.00','1','11','4');
INSERT INTO `accounts_manage_customer` (`c_id`,`customer_name`,`customer_address`,`customer_email`,`condact_number`,`max_limit`,`status`,`ca_id`,`location_id`) VALUES ('232','test customer ','','','','0.00','1','11','82');

-- ----------------------------
-- Table structure for `accounts_manage_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_manage_supplier`;
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

-- Data for table `accounts_manage_supplier`
INSERT INTO `accounts_manage_supplier` (`sup_id`,`supplier_name`,`address`,`contact_number`,`location_id`,`tin_no`,`status`) VALUES ('1','Ceylon Petroleum Corporation','','','0','','1');
INSERT INTO `accounts_manage_supplier` (`sup_id`,`supplier_name`,`address`,`contact_number`,`location_id`,`tin_no`,`status`) VALUES ('9','CEYPETCO LUBRICANTS','','','0','','1');
INSERT INTO `accounts_manage_supplier` (`sup_id`,`supplier_name`,`address`,`contact_number`,`location_id`,`tin_no`,`status`) VALUES ('10','Opening Stock','','','0','','1');
INSERT INTO `accounts_manage_supplier` (`sup_id`,`supplier_name`,`address`,`contact_number`,`location_id`,`tin_no`,`status`) VALUES ('11','apple','2222','222','4','21212-64545','1');
INSERT INTO `accounts_manage_supplier` (`sup_id`,`supplier_name`,`address`,`contact_number`,`location_id`,`tin_no`,`status`) VALUES ('12','asdsadsa','dsadsa','dasdasd','4','asdsadsa','1');
INSERT INTO `accounts_manage_supplier` (`sup_id`,`supplier_name`,`address`,`contact_number`,`location_id`,`tin_no`,`status`) VALUES ('13','sadsad','dsadsa','dsa','4','sadsa','1');
INSERT INTO `accounts_manage_supplier` (`sup_id`,`supplier_name`,`address`,`contact_number`,`location_id`,`tin_no`,`status`) VALUES ('14','tesrr','','','82','','1');

-- ----------------------------
-- Table structure for `accounts_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_transaction`;
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

-- Data for table `accounts_transaction`
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('1','0000-00-00','82','122',NULL,NULL,'5000.00','0.00','1','0.00','0.00','0','6','J','6','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-01 21:39:08','2025-11-01 21:39:08');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('2','0000-00-00','82','628',NULL,NULL,'0.00','5000.00','1','0.00','0.00','0','6','J','6','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-01 21:39:08','2025-11-01 21:39:08');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('5','2025-10-29','82','122',NULL,NULL,'250.00','0.00','1','0.00','0.00','0','8','J','8','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-01 21:52:58','2025-11-01 21:52:58');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('6','2025-10-29','82','511',NULL,NULL,'0.00','250.00','1','0.00','0.00','0','8','J','8','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-01 21:52:58','2025-11-01 21:52:58');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('7','2025-11-14','82','122',NULL,NULL,'50000.00','0.00','1','0.00','0.00','0','9','J','9','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-01 22:14:22','2025-11-30 19:01:04');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('8','2025-11-14','82','473',NULL,NULL,'0.00','50000.00','1','0.00','0.00','0','9','J','9','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-01 22:14:22','2025-11-30 19:01:04');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('9','2024-11-14','82','628',NULL,NULL,'25000.00','0.00','1','0.00','0.00','0','10','J','10','J','sad','1','0',NULL,NULL,'1','1','2025-11-30 10:18:39','1',NULL,'2025-11-01 22:15:27','2025-11-30 10:18:39');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('10','2024-11-14','82','122',NULL,NULL,'0.00','25000.00','1','0.00','0.00','0','10','J','10','J','','1','0',NULL,NULL,'1','1','2025-11-30 10:18:39','1',NULL,'2025-11-01 22:15:27','2025-11-30 10:18:39');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('13','2025-11-01','82','122',NULL,NULL,'2500.00','0.00','4','450.00','0.00','0','7','J','7','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-02 17:57:17','2025-11-02 17:57:17');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('14','2025-11-01','82','122',NULL,NULL,'0.00','2500.00','1','0.00','0.00','0','7','J','7','J','25','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-02 17:57:17','2025-11-02 17:57:17');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('15','2025-11-30','4','628',NULL,NULL,'250000.00','0.00','0','0.00','0.00','0','11','J','11','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 07:51:17','2025-11-30 10:49:36');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('16','2025-11-30','4','540',NULL,NULL,'0.00','250000.00','0','0.00','0.00','0','11','J','11','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 07:51:17','2025-11-30 10:49:36');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('19','2025-01-05','4','122',NULL,NULL,'5000.00','0.00','0','0.00','0.00','0','12','J','12','J','','1','0',NULL,NULL,'1','1','2025-11-30 09:50:01','1',NULL,'2025-11-30 08:00:00','2025-11-30 09:50:01');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('20','2025-01-05','4','502',NULL,NULL,'0.00','5000.00','0','0.00','0.00','0','12','J','12','J','','1','0',NULL,NULL,'1','1','2025-11-30 09:50:01','1',NULL,'2025-11-30 08:00:00','2025-11-30 09:50:01');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('24','2025-11-24','4','122',NULL,NULL,'2000.00','0.00','0','0.00','0.00','0','14','J','14','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 08:18:49','2025-11-30 10:49:33');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('25','2025-11-24','4','502',NULL,NULL,'0.00','2000.00','0','0.00','0.00','0','14','J','14','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 08:18:49','2025-11-30 10:49:33');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('26','2025-11-24','82','122',NULL,NULL,'5000.00','0.00','1','0.00','0.00','0','15','J','15','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 19:15:35','2025-11-30 19:15:35');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('27','2025-11-24','82','540',NULL,NULL,'0.00','5000.00','1','0.00','0.00','0','15','J','15','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 19:15:35','2025-11-30 19:15:35');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('28','2025-11-24','4','513',NULL,NULL,'5000.00','0.00','0','0.00','0.00','0','16','J','16','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 20:49:01','2025-11-30 20:49:01');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('29','2025-11-24','4','628',NULL,NULL,'0.00','5000.00','0','0.00','0.00','0','16','J','16','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 20:49:01','2025-11-30 20:49:01');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('30','2025-11-24','4','122',NULL,NULL,'2500.00','0.00','0','0.00','0.00','0','17','J','17','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 20:52:07','2025-11-30 20:52:07');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('31','2025-11-24','4','540',NULL,NULL,'0.00','2500.00','0','0.00','0.00','0','17','J','17','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 20:52:07','2025-11-30 20:52:07');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('32','2025-11-24','4','511',NULL,NULL,'2500.00','0.00','0','0.00','0.00','0','18','J','18','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 20:57:06','2025-11-30 20:57:06');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('33','2025-11-24','4','122',NULL,NULL,'100.00','0.00','0','0.00','0.00','0','19','J','19','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 20:57:47','2025-11-30 20:57:47');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('34','2025-11-24','4','511',NULL,NULL,'0.00','100.00','0','0.00','0.00','0','19','J','19','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 20:57:47','2025-11-30 20:57:47');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('35','2025-11-24','4','122',NULL,NULL,'25.00','0.00','0','0.00','0.00','0','20','J','20','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 20:58:02','2025-11-30 20:58:02');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('36','2025-11-24','4','122',NULL,NULL,'12.00','0.00','0','0.00','0.00','0','21','J','21','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 21:05:43','2025-11-30 21:05:43');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('37','2025-11-24','4','122',NULL,NULL,'12.00','0.00','0','0.00','0.00','0','22','J','22','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 21:10:27','2025-11-30 21:10:27');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('38','2025-11-24','4','540',NULL,NULL,'0.00','12.00','0','0.00','0.00','0','22','J','22','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-11-30 21:10:27','2025-11-30 21:10:27');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('45','2025-12-02','4','122','12',NULL,'120.00','0.00','0','0.00','0.00','0','23','J','23','J','12','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 17:46:44','2025-12-02 17:46:44');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('46','2025-12-02','4','540',NULL,'231','0.00','120.00','0','0.00','0.00','0','23','J','23','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 17:46:44','2025-12-02 17:46:44');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('47','2025-12-02','82','511',NULL,NULL,'5.00','0.00','1','0.00','0.00','0','24','J','24','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 18:54:50','2025-12-02 18:54:50');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('48','2025-12-02','82','628',NULL,NULL,'0.00','5.00','1','0.00','0.00','0','24','J','24','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 18:54:50','2025-12-02 18:54:50');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('49','2025-12-02','82','628',NULL,NULL,'1.00','0.00','1','0.00','0.00','0','25','J','25','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:17:24','2025-12-02 20:17:24');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('50','2025-12-02','82','540',NULL,NULL,'0.00','1.00','1','0.00','0.00','0','25','J','25','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:17:24','2025-12-02 20:17:24');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('51','2025-12-02','82','122',NULL,NULL,'1.00','0.00','1','0.00','0.00','0','26','J','26','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:26:33','2025-12-02 20:26:33');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('52','2025-12-02','82','628',NULL,NULL,'0.00','1.00','1','0.00','0.00','0','26','J','26','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:26:33','2025-12-02 20:26:33');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('53','2025-12-02','82','122',NULL,NULL,'1.00','0.00','1','0.00','0.00','0','27','J','27','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:27:49','2025-12-02 20:27:49');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('54','2025-12-02','82','511',NULL,NULL,'0.00','1.00','1','0.00','0.00','0','27','J','27','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:27:49','2025-12-02 20:27:49');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('57','2025-12-02','82','122',NULL,NULL,'12.00','0.00','1','0.00','0.00','0','28','J','28','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:30:58','2025-12-02 20:30:58');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('58','2025-12-02','82','540',NULL,NULL,'0.00','12.00','1','0.00','0.00','0','28','J','28','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:30:58','2025-12-02 20:30:58');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('61','2025-12-02','82','540',NULL,NULL,'250.00','0.00','1','0.00','0.00','0','29','J','29','J','5','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:39:54','2025-12-02 20:39:54');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('62','2025-12-02','82','540',NULL,NULL,'0.00','250.00','1','0.00','0.00','0','29','J','29','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-02 20:39:54','2025-12-02 20:39:54');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('63','2025-12-02','82','511',NULL,NULL,'12.00','0.00','1','0.00','0.00','0','30','J','30','J','','1','0',NULL,NULL,'1','1','2025-12-05 09:02:39','1',NULL,'2025-12-02 20:40:38','2025-12-05 09:02:39');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('64','2025-12-02','82','511',NULL,NULL,'0.00','12.00','1','0.00','0.00','0','30','J','30','J','','1','0',NULL,NULL,'1','1','2025-12-05 09:02:39','1',NULL,'2025-12-02 20:40:38','2025-12-05 09:02:39');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('67','2025-12-02','82','511','14',NULL,'12.00','0.00','1','0.00','0.00','0','31','J','31','J','','1','0',NULL,NULL,'1','1','2025-12-05 09:02:19','1',NULL,'2025-12-02 20:50:57','2025-12-05 09:02:19');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('68','2025-12-02','82','540','14',NULL,'0.00','12.00','1','0.00','0.00','0','31','J','31','J','','1','0',NULL,NULL,'1','1','2025-12-05 09:02:19','1',NULL,'2025-12-02 20:50:57','2025-12-05 09:02:19');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('69','2025-12-05','82','122',NULL,NULL,'50.00','0.00','1','0.00','0.00','0','50','J','50','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 09:31:16','2025-12-05 09:31:16');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('70','2025-12-05','82','630',NULL,NULL,'0.00','50.00','1','0.00','0.00','0','50','J','50','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 09:31:16','2025-12-05 09:31:16');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('73','2025-12-05','82','628','14',NULL,'50.00','0.00','1','0.00','0.00','0','51','J','51','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 09:33:06','2025-12-05 09:33:06');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('74','2025-12-05','82','629',NULL,NULL,'0.00','50.00','1','0.00','0.00','0','51','J','51','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 09:33:06','2025-12-05 09:33:06');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('75','2025-12-05','82','2',NULL,NULL,'22.00','0.00','1','0.00','0.00','0','52','J','52','J','qw','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 10:42:44','2025-12-05 10:42:44');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('76','2025-12-05','82','629',NULL,NULL,'0.00','22.00','1','0.00','0.00','0','52','J','52','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 10:42:44','2025-12-05 10:42:44');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('81','2025-12-05','82','2','14',NULL,'50.00','0.00','3','0.00','0.00','0','53','J','53','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 11:48:34','2025-12-05 11:48:34');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('82','2025-12-05','82','501',NULL,'232','0.00','50.00','1','0.00','0.00','0','53','J','53','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 11:48:34','2025-12-05 11:48:34');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('83','2025-12-05','4','2',NULL,NULL,'0.00','500000.00','0','0.00','0.00','0','54','J','54','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 14:20:24','2025-12-05 14:20:24');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('84','2025-12-05','4','466','12',NULL,'500000.00','0.00','0','0.00','0.00','0','54','J','54','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 14:20:24','2025-12-05 14:20:24');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('89','2025-12-05','82','2',NULL,NULL,'0.00','5000.00','3','0.00','0.00','0','55','J','55','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 15:27:29','2025-12-05 15:27:29');
INSERT INTO `accounts_transaction` (`tra_id`,`tra_date`,`location_id`,`ca_id`,`sup_id`,`cus_id`,`debit`,`credit`,`vat_id`,`debit_vat_amount`,`credit_vat_amount`,`vat_filed_status`,`ref_no`,`source`,`source_id`,`tra_type`,`memo`,`posted`,`approved`,`approved_by`,`approved_at`,`reversed`,`reversed_by`,`reversed_at`,`created_by`,`updated_by`,`created_at`,`updated_at`) VALUES ('90','2025-12-05','82','501',NULL,NULL,'5000.00','0.00','1','0.00','0.00','0','55','J','55','J','','1','0',NULL,NULL,'0',NULL,NULL,'1',NULL,'2025-12-05 15:27:29','2025-12-05 15:27:29');

-- ----------------------------
-- Table structure for `accounts_vat_cat`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_vat_cat`;
CREATE TABLE `accounts_vat_cat` (
  `vat_id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_name` varchar(30) NOT NULL,
  `apply_for` varchar(30) NOT NULL DEFAULT 'all',
  `status` int(11) NOT NULL DEFAULT 1,
  `percentage` decimal(10,2) NOT NULL,
  PRIMARY KEY (`vat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data for table `accounts_vat_cat`
INSERT INTO `accounts_vat_cat` (`vat_id`,`vat_name`,`apply_for`,`status`,`percentage`) VALUES ('1','No VAT','all','1','0.00');
INSERT INTO `accounts_vat_cat` (`vat_id`,`vat_name`,`apply_for`,`status`,`percentage`) VALUES ('2','Exampt','all','1','0.00');
INSERT INTO `accounts_vat_cat` (`vat_id`,`vat_name`,`apply_for`,`status`,`percentage`) VALUES ('3','Zero','all','1','0.00');
INSERT INTO `accounts_vat_cat` (`vat_id`,`vat_name`,`apply_for`,`status`,`percentage`) VALUES ('4','VAT 18%','all','1','18.00');
INSERT INTO `accounts_vat_cat` (`vat_id`,`vat_name`,`apply_for`,`status`,`percentage`) VALUES ('5','VAT 15%','all','1','15.00');
INSERT INTO `accounts_vat_cat` (`vat_id`,`vat_name`,`apply_for`,`status`,`percentage`) VALUES ('6','VAT 12%','all','1','12.00');

-- ----------------------------
-- Table structure for `acounts_accounting_period`
-- ----------------------------
DROP TABLE IF EXISTS `acounts_accounting_period`;
CREATE TABLE `acounts_accounting_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `period_from` date NOT NULL,
  `period_to` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Table structure for `client_registration`
-- ----------------------------
DROP TABLE IF EXISTS `client_registration`;
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

-- Data for table `client_registration`
INSERT INTO `client_registration` (`c_id`,`md5_client`,`subscription`,`user_license`,`client_id`,`client_name`,`business_start_date`,`book_start_from`,`year_end`,`primary_email`,`phone_number`,`company_type`,`address_line1`,`address_line2`,`city_town`,`district`,`is_vat_registered`,`vat_reg_no`,`vat_submit_type`,`client_type`) VALUES ('3','2506dd83bf5709caefd360330805348e','a48b42bd70972b7477196e1efbaa7634','1','100517','SRIPURA 100517','2025-11-28','2025-11-28','05/25','','','Sole Proprietorship','','','','','1','123123','Monthly','1');
INSERT INTO `client_registration` (`c_id`,`md5_client`,`subscription`,`user_license`,`client_id`,`client_name`,`business_start_date`,`book_start_from`,`year_end`,`primary_email`,`phone_number`,`company_type`,`address_line1`,`address_line2`,`city_town`,`district`,`is_vat_registered`,`vat_reg_no`,`vat_submit_type`,`client_type`) VALUES ('4','0a94b07eb5f62909e3a9309421a48eb2','a48b42bd70972b7477196e1efssss634','1','100998','PULMODDAI 100998','2025-10-01','2025-10-02','02/12','','','Private Limited Company','','','','','0','','','1');
INSERT INTO `client_registration` (`c_id`,`md5_client`,`subscription`,`user_license`,`client_id`,`client_name`,`business_start_date`,`book_start_from`,`year_end`,`primary_email`,`phone_number`,`company_type`,`address_line1`,`address_line2`,`city_town`,`district`,`is_vat_registered`,`vat_reg_no`,`vat_submit_type`,`client_type`) VALUES ('82','1903f1658c650e368f8d3fa09f8eab9a','a48b42bd70972b7477196e1efbaa7634','1','121212','AAAAA Pvt LTd','2025-10-06','2025-10-23','05/02','dsad@sdsa.sado','213213213213','Private Limited Company','','','','Trincomalee','1','asdsadsad','Quarterly','1');

-- ----------------------------
-- Table structure for `client_registration_backup`
-- ----------------------------
DROP TABLE IF EXISTS `client_registration_backup`;
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

-- Data for table `client_registration_backup`
INSERT INTO `client_registration_backup` (`c_id`,`md5_client`,`user_license`,`client_id`,`client_name`,`client_type`,`district`,`supply_by`,`client_email`,`client_phone`,`contact_name`,`contact_email`,`contact_phone`,`status`,`regNumber`,`region`,`dmu_limit`) VALUES ('3','2506dd83bf5709caefd360330805348e','1','100517','SRIPURA 100517','Station','','','','','','','','1','Trincomalee','Trincomalee','');
INSERT INTO `client_registration_backup` (`c_id`,`md5_client`,`user_license`,`client_id`,`client_name`,`client_type`,`district`,`supply_by`,`client_email`,`client_phone`,`contact_name`,`contact_email`,`contact_phone`,`status`,`regNumber`,`region`,`dmu_limit`) VALUES ('4','0a94b07eb5f62909e3a9309421a48eb2','1','100998','PULMODDAI 100998','Station','','','','','','','','0','Trincomalee','Trincomalee','');

-- ----------------------------
-- Table structure for `letter_head`
-- ----------------------------
DROP TABLE IF EXISTS `letter_head`;
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

-- Data for table `letter_head`
INSERT INTO `letter_head` (`id`,`entity`,`address`,`email`,`telephone`,`vat_no`,`reg_no`,`invoice_prefix`,`admin_device_approval`,`company_name`,`VAT`,`gm_mobile`,`system_email`,`domain`) VALUES ('1','PADAVI SIRIPURA SEVA JANAPADA MPCS','PADAVI SIRIPURA SEVA JANAPADA MPCS, SIRIPURA','E-Mail:padavisripurampcs@gmail.com','Phone 0252255200','','REGISTERED NUMBER TRI 527 OF 06.03.1971','','0','PADAVI SIRIPURA SEVA JANAPADA MPCS','','0770888501','','https://www.sripurampcs.com/shed');

-- ----------------------------
-- Table structure for `login_attempts`
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts` (
  `ip_address` varchar(45) DEFAULT NULL,
  `attempt_time` datetime DEFAULT NULL,
  `try_for` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data for table `login_attempts`
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('61.245.170.7','2025-07-05 12:43:00','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.22.175','2025-07-07 17:33:19','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.56','2025-07-08 12:22:12','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.56','2025-07-08 12:22:44','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.127.161','2025-07-08 12:43:17','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('212.104.231.196','2025-07-09 18:56:22','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.116.154','2025-07-10 06:08:32','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.116.154','2025-07-10 06:08:43','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.116.154','2025-07-10 06:08:51','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.74.74','2025-07-17 10:58:31','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.67.21','2025-07-17 16:36:06','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.67.21','2025-07-17 16:36:24','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.67.21','2025-07-17 16:37:00','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.67.21','2025-07-17 16:37:33','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.71.120','2025-07-19 13:13:10','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.48.208','2025-07-31 12:45:38','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.48.208','2025-07-31 12:58:16','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.48.208','2025-07-31 12:58:49','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.48.208','2025-07-31 12:58:59','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.48.208','2025-07-31 12:59:17','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.68.115','2025-07-31 14:26:56','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.68.115','2025-07-31 14:27:33','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.68.115','2025-07-31 14:28:16','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.68.115','2025-07-31 14:28:33','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.68.115','2025-07-31 14:30:15','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.68.115','2025-07-31 14:31:17','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.68.115','2025-07-31 14:33:40','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.77.175','2025-08-06 09:57:27','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.77.175','2025-08-06 10:05:07','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.237','2025-08-07 16:13:29','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.66.3','2025-08-09 10:41:36','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.66.3','2025-08-09 10:41:56','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.66.3','2025-08-09 10:55:33','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.66.3','2025-08-09 12:28:43','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.68.171','2025-08-11 08:41:36','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('111.223.180.231','2025-08-11 10:24:39','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.75.132','2025-08-11 10:57:48','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:06:05','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:07:50','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:07:51','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:07:51','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:07:51','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:07:51','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:23:49','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:24:35','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:25:34','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 12:27:00','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.72.104','2025-08-11 14:45:54','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.50.149','2025-08-11 15:00:42','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.50.149','2025-08-11 15:00:59','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.50.149','2025-08-11 15:01:15','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.50.149','2025-08-11 15:01:47','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.50.149','2025-08-11 15:02:45','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('111.223.183.165','2025-08-11 18:28:47','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.65.61','2025-08-14 15:20:46','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('111.223.180.38','2025-08-18 09:37:03','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('111.223.180.38','2025-08-18 12:06:06','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.76.212','2025-08-18 14:15:00','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.66.240','2025-08-19 13:31:28','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.75.140','2025-08-19 14:18:39','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.75.140','2025-08-19 14:19:31','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.124.8','2025-08-21 17:50:35','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.67.133','2025-08-22 18:58:43','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.67.133','2025-08-22 18:59:25','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.67.133','2025-08-22 19:00:29','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.67.133','2025-08-22 19:01:08','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.16.7','2025-08-26 14:39:56','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.16.7','2025-08-26 16:02:57','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('123.231.124.168','2025-09-01 07:37:51','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('123.231.124.168','2025-09-01 07:38:09','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.69.131','2025-09-02 09:12:30','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('111.223.186.231','2025-09-06 08:28:02','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.77.238','2025-09-08 20:55:02','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.65.68','2025-09-09 08:59:16','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.65.68','2025-09-09 08:59:30','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.65.68','2025-09-09 08:59:49','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.65.68','2025-09-09 09:00:46','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.65.68','2025-09-09 09:04:38','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.65.68','2025-09-09 11:01:06','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.76.81','2025-09-13 13:43:33','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.41.216','2025-09-15 08:29:36','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.41.216','2025-09-15 08:29:58','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.41.216','2025-09-15 08:30:14','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.189.26','2025-09-17 11:31:17','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.74.83','2025-09-19 13:11:00','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('123.231.85.42','2025-09-22 17:03:54','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('123.231.85.42','2025-09-22 17:04:27','setup_password');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('123.231.125.8','2025-10-01 06:19:35','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('123.231.125.8','2025-10-01 06:19:50','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.184.47','2025-10-03 11:11:35','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.184.47','2025-10-03 11:37:21','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.191.189','2025-10-04 12:09:37','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.185.115','2025-10-07 11:03:36','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.78.46','2025-10-07 14:22:03','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.78.46','2025-10-07 14:23:19','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.135.78.46','2025-10-07 14:23:55','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.184.248','2025-10-10 14:32:09','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.184.248','2025-10-10 14:32:58','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.184.248','2025-10-10 14:34:47','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('175.157.25.172','2025-10-13 10:11:53','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.185.124','2025-10-15 17:28:09','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.188.227','2025-10-16 11:02:03','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.188.227','2025-10-16 11:03:53','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.188.227','2025-10-16 11:05:25','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.188.227','2025-10-16 11:17:44','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.191.76','2025-10-20 13:47:20','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('112.134.191.76','2025-10-20 13:47:30','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-21 18:31:17','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-22 08:39:02','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-24 08:29:51','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-24 10:57:55','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-24 11:24:33','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-28 11:00:27','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-28 11:01:20','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-28 14:31:36','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-29 20:56:20','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-10-29 20:59:13','login');
INSERT INTO `login_attempts` (`ip_address`,`attempt_time`,`try_for`) VALUES ('::1','2025-11-02 17:46:03','login');

-- ----------------------------
-- Table structure for `product_master`
-- ----------------------------
DROP TABLE IF EXISTS `product_master`;
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

-- Data for table `product_master`
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('1','P1','Petrol','Fuel','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('2','P2','Super Petrol','Fuel','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('3','D1','Diesel','Fuel','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('4','D2','Super Diesel','Fuel','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('5','K1','Kerosene','Fuel','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('6','O1','Super Plus 04Lt','Oil','Nos','0.0','1','150','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('7','O2','Super Plus 01Lt','Oil','Nos','0.0','1','30','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('8','O3','DS 40 Bulk','Oil','L','0.0','1','1113.8','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('9','O4','DS 40 05Lt','Oil','Nos','0.0','1','8066','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('10','O5','DS 40 01Lt','Oil','Nos','0.0','1','1288.75','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('11','O6','Gear Oil 05Lt 140','Oil','Nos','0.0','1','8749.47','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('12','O7','Gear Oil 01Lt 140','Oil','Nos','0.0','1','1944.04','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('13','O8','2T Oil Bulk','Oil','L','0.0','1','1128.66','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('14','O9','2T 20Lt','Oil','Nos','0.0','1','1144','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('15','O10','2T 01Lt','Oil','Nos','0.0','1','0','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('16','O11','2T 500ml','Oil','Nos','0.0','1','100','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('17','O12','Break Oil 500ml','Oil','Nos','0.0','1','1479','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('18','O13','Break Oil 250ml','Oil','Nos','0.0','1','903.45','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('19','O14','Break Oil 100ml','Oil','Nos','0.0','1','635.55','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('20','O15','Grease 250g','Oil','Nos','0.0','1','0','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('21','O16','Grease 500g','Oil','Nos','0.0','1','0','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('22','O17','Grease 01Kg','Oil','Nos','0.0','1','4195.25','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('23','O18','Grease 10Kg','Oil','Nos','0.0','1','0','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('24','O19','Power Steering 01Lt','Oil','Nos','0.0','1','1767.96','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('25','O20','Power Steering 500ml','Oil','Nos','0.0','1','1043.64','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('26','O21','R. Cooler 04Lt','Oil','Nos','0.0','1','4926.93','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('27','O22','R. Cooler 01Lt','Oil','Nos','0.0','1','528','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('28','O23','4T Oil Bulk','Oil','L','0.0','1','1250.96','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('29','O24','4T Oil 01Lt','Oil','Nos','0.0','1','1810.09','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('30','O25','H D 68 05Lt','Oil','Nos','0.0','1','7769.8','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('31','O26','H D 68 20Lt','Oil','Nos','0.0','1','1520.05','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('32','O27','Out Board Oil 20Lt','Oil','Nos','0.0','1','1750','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('33','O28','Car Wash 500 ml','Oil','Nos','0.0','1','240','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('34','O29','Car Wash 1L','Oil','Nos','0.0','1','774','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('35','O30','Car Wash','Oil','Nos','0.0','1','150','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('36','O31','Glass Cleaner','Oil','Nos','0.0','1','240','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('37','O32','Tyre Polish','Oil','Nos','0.0','1','431','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('38','O33','D.B Cleaner','Oil','Nos','0.0','1','519.2','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('39','O34','Soltron 100ml','Oil','Nos','0.0','1','376','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('40','O35','Soltron 50ml','Oil','Nos','0.0','1','144','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('41','O36','Polishing Cloth','Oil','Nos','0.0','1','70','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('42','O37','D Water','Oil','Nos','0.0','1','140','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('43','O38','B Acid','Oil','Nos','0.0','1','300','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('44','O39','A F Spray','Oil','Nos','0.0','1','0','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('45','O40','A F Spray (Sol)','Oil','Nos','0.0','1','0','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('46','O41','Gear 15Kg','Oil','Nos','0.0','1','200','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('47','O42','A/Freshner Spray 500ml','Oil','Nos','0.0','1','638','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('48','O43','A/Freshner Gel','Oil','Nos','0.0','1','269.7','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('49','O44','A/Freshner Cube','Oil','Nos','0.0','1','0','0');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('89','O601','Gear Oil 05Lt 90','Oil','Nos','0.0','1','0','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('90','OI1','Gear Oil 01Lt 90','Oil','Nos','0.0','1','1875.44','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('91','Oi15','Soltron 30ml','Oil','Nos','0.0','1','144','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('92','O421','A/Freshner Spray 150ml','Oil','Nos','0.0','1','308','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('110','n147','Battery acid','Other','Nos','0.0','1','300','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('111','A59','Battery water','Oil','Nos','0.0','1','110','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('112','n63','Coolant 2','Oil','Nos','0.0','1','528','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('113','n69','H D 68 oil','Oil','L','0.0','1','1114.29','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('114','n81','H D 68 oil','Oil','L','0.0','1','1521.35','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('115','n83','D S 40 oil(5x1)','Oil','L','0.0','1','9990','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('116','n87','90 oil','Oil','L','0.0','1','1725','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('117','n91','ATF oil (1x1)','Oil','Nos','0.0','1','1808.9','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('118','n93','ATF oil (4x1)','Oil','Nos','0.0','1','6557.82','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('119','n101','DS 40 oil (1x1)','Oil','Nos','0.0','1','1515','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('120','n103','10 oil','Oil','L','0.0','1','1642.2','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('121','n107','Eco tablets','Other','Nos','0.0','1','80','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('122','n109','4T oil (1x1)','Oil','Nos','0.0','1','1455','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('123','n125','50 oil','Oil','L','0.0','1','1359.99','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('124','n131','Grease','Oil','L','0.0','1','2050','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('125','n135','90 oil','Oil','L','0.0','1','1725','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('126','n149','Battery acid 1L','Other','Nos','0.0','1','350','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('127','n157','40 oil 2','Oil','L','0.0','1','1360','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('128','n160','40 oil 3','Oil','L','0.0','1','1515','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('129','n95','90 oil (20x1)','Oil','L','0.0','1','1204.62','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('130','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('131','N162','Air freshener','Other','Nos','0.0','1','230','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('132','N164','Toilet cleaner','Other','Nos','0.0','1','305','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('133','N166','Car wash','Other','Nos','0.0','1','370','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('134','UT','UTF (20x1)','Oil','Nos','0.0','1','16000','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('135','MP 90 (1x1)','MP 90 (1x1)','Oil','Nos','0.0','1','1827.18','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('136','MP 90','MP 90 (20x1)','Oil','Nos','0.0','1','24092.76','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('137','4T1','4T (20w -40)','Oil','Nos','0.0','1','2501.93 \n \n','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('138','42','4T (20w -30)','Oil','Nos','0.0','1','1778.87','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('139','10k','DS 40 (20x1) 15W 40','Oil','Nos','0.0','1','1285.75','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('140','aa','MP 90 (5X1)','Oil','Nos','0.0','1','6845','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('141','aa','ATF Oil (20x1)','Oil','Nos','0.0','1','1386.5','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('142','123','DOT 3 (100mL)','Oil','Nos','0.0','1','635','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('143','22','Petrol (Old)','Oil','L','0.0','1','130','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('144','n65','grease lo','Oil','Nos','0.0','1','4000','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('145','124','DOT 3 (1L)','Oil','Nos','0.0','1','2662.07','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('146','125','DOT 3 (500ml)','Oil','Nos','0.0','1','1479.79','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('147','124','DOT 3 (250ml)','Oil','Nos','0.0','1','903.45','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('148','N117','break oil (1l)','Oil','L','0.0','1','2602.07','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('149','N149','Battery acid 500ml','Other','Nos','0.0','1','200','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('150','N68','HD68 oil 2','Oil','L','0.0','1','1114.29','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('152','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('153','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('154','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('155','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('156','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('157','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('158','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('159','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('160','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('161','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('162','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('163','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('164','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('165','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('166','OIL-0','OIL','Oil','L','0.0','1','0.00','');
INSERT INTO `product_master` (`p_id`,`p_code`,`p_name`,`p_cat`,`p_unit`,`vat_rate`,`status`,`last_price`,`measurement`) VALUES ('167','OIL-0','OIL','Oil','L','0.0','1','0.00','');

-- ----------------------------
-- Table structure for `user_device`
-- ----------------------------
DROP TABLE IF EXISTS `user_device`;
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

-- Data for table `user_device`
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('1','0','kiritharan100@gmail.com','f0dd4a99fba6075a9494772b58f95280','2025-06-20 08:59:32','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('2','0','kiritharan100@gmail.com','a284df1155ec3e67286080500df36a9a','2025-06-20 12:01:22','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('3','0','dtecstudiolk@gmail.com','d9731321ef4e063ebbee79298fa36f56','2025-06-20 12:27:28','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('4','0','kiritharan100@gmail.com','456ac9b0d15a8b7f1e71073221059886','2025-06-28 11:44:55','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('5','0','dtecstudiolk@gmail.com','ba1b3eba322eab5d895aa3023fe78b9c','2025-06-29 18:58:12','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('6','0','dtecstudiolk@gmail.com','5cf21ce30208cfffaa832c6e44bb567d','2025-06-29 19:06:26','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('7','0','dtecstudiolk@gmail.com','9a1de01f893e0d2551ecbb7ce4dc963e','2025-06-29 19:14:01','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('8','0','dtecstudiolk@gmail.com','8c3039bd5842dca3d944faab91447818','2025-06-29 19:18:50','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('9','0','kiritharan100@gmail.com','e3251075554389fe91d17a794861d47b','2025-06-29 20:28:09','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('10','0','kiritharan100@gmail.com','f197002b9a0853eca5e046d9ca4663d5','2025-06-30 08:34:41','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('11','0','sivarasagunalan52@gmail.com','ad3019b856147c17e82a5bead782d2a8','2025-07-01 06:20:46','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('12','0','mahesvaran54@gmail.com','77f959f119f4fb2321e9ce801e2f5163','2025-07-01 07:36:51','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('13','0','kiritharan100@gmail.com','375c71349b295fbe2dcdca9206f20a06','2025-07-01 07:44:01','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('14','0','kiritharan100@gmail.com','a368b0de8b91cfb3f91892fbf1ebd4b2','2025-07-01 09:08:59','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('15','0','geethanvino26@gmail.com','5c50b4df4b176845cd235b6a510c6903','2025-07-01 13:23:11','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('16','0','gjenikan@gmail.com','059fdcd96baeb75112f09fa1dcc740cc','2025-07-01 15:22:59','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('17','0','gjenikan@gmail.com','4da04049a062f5adfe81b67dd755cecc','2025-07-01 15:26:42','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('18','0','mahesvaran54@gmail.com','e0ab531ec312161511493b002f9be2ee','2025-07-02 11:08:16','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('19','0','kiritharan100@gmail.com','b24d516bb65a5a58079f0f3526c87c57','2025-07-05 09:43:43','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('20','0','kiritharan100@gmail.com','2de5d16682c3c35007e4e92982f1a2ba','2025-07-05 10:23:11','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('21','0','0740888501','b60c5ab647a27045b462934977ccad9a','2025-07-05 10:59:05','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('22','0','0740888501','2387337ba1e0b0249ba90f55b2ba2521','2025-07-05 11:30:08','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('23','0','kiritharan100@gmail.com','3fab5890d8113d0b5a4178201dc842ad','2025-07-05 12:50:20','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('24','0','0740888501','9246444d94f081e3549803b928260f56','2025-07-05 13:37:19','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('25','0','0740888501','21be9a4bd4f81549a9d1d241981cec3c','2025-07-06 10:10:12','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('26','0','0740888501','39dcaf7a053dc372fbc391d4e6b5d693','2025-07-08 09:58:39','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('27','0','0716147073','1f71e393b3809197ed66df836fe833e5','2025-07-08 12:24:52','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('28','0','0711107211','1896a3bf730516dd643ba67b4c447d36','2025-07-08 12:44:59','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('29','0','0716147073','13168e6a2e6c84b4b7de9390c0ef5ec5','2025-07-31 12:38:31','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('30','0','0710931234','06a81a4fb98d149f2d31c68828fa6eb2','2025-07-31 12:50:10','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('31','0','0711107211','a0833c8a1817526ac555f8d67727caf6','2025-07-31 14:34:17','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('32','0','0711107211','944626adf9e3b76a3919b50dc0b080a4','2025-07-31 21:46:23','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('33','0','0711107211','ef50c335cca9f340bde656363ebd02fd','2025-07-31 21:48:04','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('34','0','0703161150','a34bacf839b923770b2c360eefa26748','2025-08-06 10:06:31','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('35','0','0716147073','f93882cbd8fc7fb794c1011d63be6fb6','2025-08-07 08:28:52','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('36','0','0703161150','c5a4e7e6882845ea7bb4d9462868219b','2025-08-07 15:17:43','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('37','0','0711107211','98986c005e5def2da341b4e0627d4712','2025-08-09 10:56:46','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('38','0','0711107211','c5b2cebf15b205503560c4e8e6d1ea78','2025-08-09 12:29:44','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('39','0','0740888501','3546ab441e56fa333f8b44b610d95691','2025-08-11 15:02:59','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('40','0','0711107211','efb76cff97aaf057654ef2f38cd77d73','2025-08-11 16:46:42','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('41','0','0711107211','147702db07145348245dc5a2f2fe5683','2025-08-12 15:08:51','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('42','0','0711107211','818f4654ed39a1c147d1e51a00ffb4cb','2025-08-14 11:57:48','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('43','0','0703161150','d91d1b4d82419de8a614abce9cc0e6d4','2025-08-19 13:33:32','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('44','0','0716147073','2612aa892d962d6f8056b195ca6e550d','2025-08-20 15:07:21','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('45','0','0711107211','2d1b2a5ff364606ff041650887723470','2025-08-28 12:43:09','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('46','0','0703161150','856fc81623da2150ba2210ba1b51d241','2025-09-09 11:02:07','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('47','0','0710931234','d6ef5f7fa914c19931a55bb262ec879c','2025-10-07 14:24:46','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('48','0','0740888501','09fb05dd477d4ae6479985ca56c5a12d','2025-10-21 14:02:02','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('49','0','0740888501','bffc98347ee35b3ead06728d6f073c68','2025-10-21 18:31:41','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('50','0','0740888501','404dcc91b2aeaa7caa47487d1483e48a','2025-10-28 11:01:43','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('51','0','0740888501','1e913e1b06ead0b66e30b6867bf63549','2025-10-29 20:57:16','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('52','0','0740888501','201d7288b4c18a679e48b31c72c30ded','2025-11-02 17:46:19','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('53','0','0740888501','ae5e3ce40e0404a45ecacaaf05e5f735','2025-11-25 20:08:44','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('54','0','0740888501','82c2559140b95ccda9c6ca4a8b981f1e','2025-11-29 06:51:26','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('55','0','0740888501','148510031349642de5ca0c544f31b2ef','2025-11-29 08:32:53','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('56','0','0740888501','cda72177eba360ff16b7f836e2754370','2025-12-02 17:43:18','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('57','0','0740888501','7ffd85d93a3e4de5c490d304ccd9f864','2025-12-05 08:44:27','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('58','0','0740888501','d63fbf8c3173730f82b150c5ef38b8ff','2025-12-07 08:56:58','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('59','0','0740888501','1714726c817af50457d810aae9d27a2e','2025-12-09 11:32:17','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('60','0','0740888501','53c04118df112c13a8c34b38343b9c10','2025-12-16 11:35:07','','');
INSERT INTO `user_device` (`d_id`,`user_id`,`pf_no`,`token`,`v_from`,`IP`,`last_used`) VALUES ('61','0','0740888501','ff1418e8cc993fe8abcfe3ce2003e5c5','2025-12-16 11:36:51','','');

-- ----------------------------
-- Table structure for `user_license`
-- ----------------------------
DROP TABLE IF EXISTS `user_license`;
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

-- Data for table `user_license`
INSERT INTO `user_license` (`usr_id`,`customer`,`username`,`subscription`,`mobile_no`,`role_id`,`password`,`user_rights`,`account_status`,`i_name`,`company`,`token`,`dr_token`,`last_log_in`,`last_token`,`material`,`accounts`,`store`,`admin`,`report`,`opd`,`ip`) VALUES ('1','1','0740888501','a48b42bd70972b7477196e1efbaa7634','','0','9cd564e4e5254925ed4f3f8882ff625f','','1','kiritharan ','','Expired','710283','2025-12-16 11:36','5b2abb50abf9296327fc98136512b463','0','1','1','1','1','0','0');
INSERT INTO `user_license` (`usr_id`,`customer`,`username`,`subscription`,`mobile_no`,`role_id`,`password`,`user_rights`,`account_status`,`i_name`,`company`,`token`,`dr_token`,`last_log_in`,`last_token`,`material`,`accounts`,`store`,`admin`,`report`,`opd`,`ip`) VALUES ('94','0','0716147073','','','0','721ffe85c3355b8e33e301fa8490b3ff','','1','B.A.I Saumya','','Expired','928642','2025-10-16 02:09','1d54f0c340bfa63bd069c2e3098fdd56','0','1','1','1','0','0','0');
INSERT INTO `user_license` (`usr_id`,`customer`,`username`,`subscription`,`mobile_no`,`role_id`,`password`,`user_rights`,`account_status`,`i_name`,`company`,`token`,`dr_token`,`last_log_in`,`last_token`,`material`,`accounts`,`store`,`admin`,`report`,`opd`,`ip`) VALUES ('95','0','0711107211','','','0','c6780ca1a6a75dbf20b34e2e59678023','','1','Y.L.M.jabeer','','Expired','854740','2025-10-19 08:56','b7b91dc18542dbd178aaf4af7e24cbff','0','0','1','0','0','0','0');
INSERT INTO `user_license` (`usr_id`,`customer`,`username`,`subscription`,`mobile_no`,`role_id`,`password`,`user_rights`,`account_status`,`i_name`,`company`,`token`,`dr_token`,`last_log_in`,`last_token`,`material`,`accounts`,`store`,`admin`,`report`,`opd`,`ip`) VALUES ('96','0','0710931234','','','0','ceea2596a4e39beb78567bf7e72b1be5','','1','P.R. Wijitha panditharathna','','Expired','361289','2025-10-20 01:57','62701b5e9a6fb367bbdbc3be8a541a50','0','0','1','0','0','0','0');
INSERT INTO `user_license` (`usr_id`,`customer`,`username`,`subscription`,`mobile_no`,`role_id`,`password`,`user_rights`,`account_status`,`i_name`,`company`,`token`,`dr_token`,`last_log_in`,`last_token`,`material`,`accounts`,`store`,`admin`,`report`,`opd`,`ip`) VALUES ('97','0','0703161150','','','0','16f4417c0b37fd4cc73516b8354d6cb8','','1','S.M.A.M. Nawarathna','','Expired','007027','2025-10-15 03:07','10ea73a9084e511624b6fc54c2a7d8a5','0','1','1','1','0','0','0');

-- ----------------------------
-- Table structure for `user_location`
-- ----------------------------
DROP TABLE IF EXISTS `user_location`;
CREATE TABLE `user_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data for table `user_location`
INSERT INTO `user_location` (`id`,`usr_id`,`location_id`) VALUES ('36','95','4');
INSERT INTO `user_location` (`id`,`usr_id`,`location_id`) VALUES ('37','94','4');
INSERT INTO `user_location` (`id`,`usr_id`,`location_id`) VALUES ('38','94','3');
INSERT INTO `user_location` (`id`,`usr_id`,`location_id`) VALUES ('40','97','4');
INSERT INTO `user_location` (`id`,`usr_id`,`location_id`) VALUES ('41','97','3');
INSERT INTO `user_location` (`id`,`usr_id`,`location_id`) VALUES ('42','96','3');
INSERT INTO `user_location` (`id`,`usr_id`,`location_id`) VALUES ('46','1','82');
INSERT INTO `user_location` (`id`,`usr_id`,`location_id`) VALUES ('47','1','4');
INSERT INTO `user_location` (`id`,`usr_id`,`location_id`) VALUES ('48','1','3');

-- ----------------------------
-- Table structure for `user_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
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

-- Data for table `user_log`
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1','93','1','3','System Setup','Default OIL created with p_id = 0','2025-07-05 15:28:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('2','93','0','0','Login','Login from 61.245.170.7','2025-07-05 20:08:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('3','93','0','0','Login','Login from 175.157.22.175','2025-07-06 10:05:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('4','1','0','0','Login','Login from 175.157.22.175','2025-07-06 10:09:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('5','1','1','3','System Setup','Default OIL created with p_id = 0','2025-07-06 10:10:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('6','1','1','3','Fuel Capacity','Fuel Capacity Updated For SRIPURA 100517.','2025-07-06 10:11:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('7','1','0','0','Login','Login from 112.134.246.114','2025-07-07 08:25:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('8','1','0','0','Login','Login from 112.134.246.114','2025-07-07 14:47:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('9','1','0','0','Login','Login from 175.157.22.175','2025-07-07 17:33:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('10','1','0','0','Login','Login from 175.157.22.175','2025-07-07 17:42:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('11','1','1','3','System Setup','Default OIL created with p_id = 0','2025-07-07 17:42:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('12','1','0','3','Updated Settings','Letter head settings updated','2025-07-07 17:42:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('13','1','1','3','System Setup','Default OIL created with p_id = 0','2025-07-07 17:42:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('14','1','0','0','Login','Login from 175.157.22.175','2025-07-07 17:42:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('15','1','2','3','New Pump Operator Added','New pump operator test added with NIC 2.','2025-07-07 17:43:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('16','1','1','3','Pump Detail Edited',' Pump Detail Edited  Diesel Pump 1   ','2025-07-07 17:45:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('17','1','1','3','System Setup','Default OIL created with p_id = 0','2025-07-07 17:48:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('18','1','0','3','Updated Settings','Letter head settings updated','2025-07-07 17:49:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('19','1','1','3','System Setup','Default OIL created with p_id = 0','2025-07-07 17:49:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('20','1','0','3','Updated Settings','Letter head settings updated','2025-07-07 17:49:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('21','1','1','3','System Setup','Default OIL created with p_id = 0','2025-07-07 17:49:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('22','1','0','0','Login','Login from 175.157.22.175','2025-07-07 19:37:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('23','1','1','3','Edit Product','Product  Petrol edited','2025-07-07 19:37:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('24','1','1','3','Edit Product','Product  Super Petrol edited','2025-07-07 19:38:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('25','1','1','3','Edit Product','Product  Diesel edited','2025-07-07 19:38:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('26','1','1','3','Edit Product','Product  Super Diesel edited','2025-07-07 19:38:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('27','1','0','0','Login','Login from 175.157.117.75','2025-07-08 09:57:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('28','1','1','3','System Setup','Default OIL created with p_id = 0','2025-07-08 10:07:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('29','1','0','3','Updated Settings','Letter head settings updated','2025-07-08 10:11:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('30','1','1','3','System Setup','Default OIL created with p_id = 0','2025-07-08 10:11:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('31','0','1','3','New pump added ','New pump Petrol Pump 1 Added   ','2025-07-08 12:28:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('32','0','1','3','New pump added ','New pump Petrol Pump 2 Added   ','2025-07-08 12:28:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('33','0','1','3','New pump added ','New pump Diesel Pump 1 Added   ','2025-07-08 12:29:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('34','0','1','3','New pump added ','New pump Diesel Pump 2 Added   ','2025-07-08 12:29:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('35','0','1','3','New pump added ','New pump Kerosene Pump Added   ','2025-07-08 12:29:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('36','0','1','3','Fuel Capacity','Fuel Capacity Updated For SRIPURA 100517.','2025-07-08 12:31:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('37','0','1','3','System Setup','Default OIL created with p_id = 0','2025-07-08 12:31:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('38','94','0','0','Login','Login from 112.135.72.56','2025-07-08 12:38:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('39','1','0','0','Login','Login from 175.157.117.75','2025-07-08 12:45:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('40','94','0','0','Login','Login from 112.135.72.56','2025-07-08 12:51:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('41','94','0','0','Login','Login from 112.135.72.56','2025-07-08 13:32:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('42','94','1','3','New customer added','New customer sripura police station added with Max Limit 300000','2025-07-08 13:44:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('43','94','1','3','Customer Detail edited','Customer Detail of sripura police station Edited','2025-07-08 13:45:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('44','94','0','0','Login','Login from 112.135.72.217','2025-07-08 14:15:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('45','1','0','0','Login','Login from 212.104.231.196','2025-07-09 18:56:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('46','1','0','0','Login','Login from 175.157.116.154','2025-07-10 06:09:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('47','94','0','0','Login','Login from 112.135.73.184','2025-07-16 13:46:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('48','94','0','0','Login','Login from 112.135.75.125','2025-07-16 13:49:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('49','94','0','0','Login','Login from 112.135.65.171','2025-07-17 08:54:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('50','94','2','3','New Pump Operator Added','New pump operator G.K. Krishanka madhushan added with NIC 891642881 V.','2025-07-17 08:57:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('51','94','2','3','New Pump Operator Added','New pump operator W.R.A. Krishan nirmal added with NIC 971080515 V.','2025-07-17 09:00:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('52','94','2','3','New Pump Operator Added','New pump operator K.G.K. Janakarathna added with NIC 0768831241.','2025-07-17 09:02:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('53','94','2','3','New Pump Operator Added','New pump operator E.K. Pradeep kumara added with NIC 903070048 V.','2025-07-17 09:03:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('54','94','2','3','Pump Operator Edited','Pump operator K.G.K. Janakarathna updated.','2025-07-17 09:06:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('55','94','0','0','Login','Login from 112.135.74.74','2025-07-17 10:58:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('56','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Petrol, Excess: 10,322.000 Ltr','2025-07-17 11:23:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('57','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Diesel, Excess: 15,182.000 Ltr','2025-07-17 11:27:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('58','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Kerosene, Excess: 5,534.000 Ltr','2025-07-17 11:28:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('59','94','1','3','New customer added','New customer padavi sripura pradeshiya sabha added with Max Limit 200000','2025-07-17 11:42:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('60','1','0','0','Login','Login from 112.134.240.182','2025-07-17 11:52:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('61','94','0','0','Login','Login from 112.135.66.146','2025-07-17 12:08:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('62','1','0','0','Login','Login from 112.134.243.226','2025-07-17 12:59:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('63','94','2','3','New GRN','Add new GRN id: 1 GRN NO:1','2025-07-17 13:00:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('64','94','0','0','Login','Login from 112.135.66.146','2025-07-17 13:37:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('65','94','2','3','New GRN','Add new GRN id: 2 GRN NO:2','2025-07-17 13:56:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('66','94','1','3','New Product added','New Item added Battery acid ','2025-07-17 14:00:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('67','94','1','3','Edit Product','Product  Battery acid edited','2025-07-17 14:01:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('68','94','1','3','New Product added','New Item added Battery water ','2025-07-17 14:02:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('69','94','1','3','New Product added','New Item added Coolant 2 ','2025-07-17 14:04:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('70','94','1','3','New Product added','New Item added H D 68 oil ','2025-07-17 14:08:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('71','94','1','3','New Product added','New Item added H D 68 oil ','2025-07-17 14:09:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('72','94','1','3','New Product added','New Item added D S 40 oil(5x1) ','2025-07-17 14:15:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('73','94','1','3','New Product added','New Item added 90 oil ','2025-07-17 14:16:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('74','94','1','3','New Product added','New Item added ATF oil (1x1) ','2025-07-17 14:19:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('75','94','1','3','New Product added','New Item added ATF oil (4x1) ','2025-07-17 14:20:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('76','94','1','3','New Product added','New Item added DS 40 oil (1x1) ','2025-07-17 14:22:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('77','94','1','3','New Product added','New Item added 10 oil ','2025-07-17 14:23:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('78','94','1','3','New Product added','New Item added Eco tablets ','2025-07-17 14:25:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('79','94','1','3','New Product added','New Item added 4T oil (1x1) ','2025-07-17 14:27:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('80','94','1','3','Edit Product','Product  Break Oil 250ml edited','2025-07-17 14:29:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('81','94','1','3','New Product added','New Item added 50 oil ','2025-07-17 14:30:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('82','94','1','3','New Product added','New Item added Grease ','2025-07-17 14:32:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('83','94','1','3','New Product added','New Item added 90 oil ','2025-07-17 14:35:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('84','94','1','3','Edit Product','Product  Battery acid edited','2025-07-17 14:38:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('85','94','1','3','New Product added','New Item added Battery acid 1L ','2025-07-17 14:39:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('86','94','1','3','New Product added','New Item added 40 oil 2 ','2025-07-17 14:42:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('87','94','1','3','New Product added','New Item added 40 oil 3 ','2025-07-17 14:43:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('88','94','1','3','New Product added','New Item added 90 oil (20x1) ','2025-07-17 14:45:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('89','1','0','0','Login','Login from 112.134.243.226','2025-07-17 14:52:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('90','94','2','3','New GRN','Add new GRN id: 3 GRN NO:3','2025-07-17 15:53:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('91','1','0','0','Login','Login from 112.134.243.226','2025-07-17 16:13:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('92','94','1','3','Pump Detail Edited',' Pump Detail Edited  Diesel Pump 1   ','2025-07-17 16:16:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('93','94','1','3','Pump Detail Edited',' Pump Detail Edited  Diesel Pump 2   ','2025-07-17 16:17:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('94','94','1','3','Pump Detail Edited',' Pump Detail Edited  Kerosene Pump   ','2025-07-17 16:17:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('95','94','1','3','Pump Detail Edited',' Pump Detail Edited  Petrol Pump 1   ','2025-07-17 16:18:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('96','94','1','3','Pump Detail Edited',' Pump Detail Edited  Petrol Pump 2   ','2025-07-17 16:18:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('97','1','0','0','Login','Login from 175.157.119.120','2025-07-18 06:11:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('98','1','0','0','Login','Login from 175.157.98.55','2025-07-18 08:42:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('99','94','0','0','Login','Login from 112.135.64.227','2025-07-18 09:14:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('100','94','0','0','Login','Login from 112.135.64.227','2025-07-18 09:18:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('101','1','0','0','Login','Login from 112.134.243.121','2025-07-18 09:31:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('102','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 4 with tested fuel 10','2025-07-18 09:43:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('103','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 5 with tested fuel 5','2025-07-18 09:43:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('104','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 6 with tested fuel 10','2025-07-18 09:43:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('105','94','0','0','Login','Login from 112.135.76.49','2025-07-18 10:59:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('106','94','1','3','New customer added','New customer Divisional secretariat office added with Max Limit ','2025-07-18 11:01:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('107','94','1','3','New customer added','New customer Divisional hospital added with Max Limit ','2025-07-18 11:04:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('108','94','1','3','New customer added','New customer M.O.H Office added with Max Limit ','2025-07-18 11:06:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('109','94','1','3','New customer added','New customer Veterinary office added with Max Limit ','2025-07-18 11:36:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('110','94','1','3','New customer added','New customer MPCS rural bank added with Max Limit ','2025-07-18 11:37:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('111','94','1','3','New customer added','New customer civil security department added with Max Limit ','2025-07-18 11:39:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('112','94','1','3','New customer added','New customer MPCS Genarator added with Max Limit ','2025-07-18 11:40:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('113','1','0','0','Login','Login from 112.134.243.121','2025-07-18 11:41:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('114','94','0','0','Login','Login from 112.135.76.49','2025-07-18 12:59:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('115','1','0','0','Login','Login from 112.134.243.121','2025-07-18 13:05:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('116','94','0','0','Login','Login from 112.135.76.49','2025-07-18 14:33:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('117','94','2','3','Oil sales ','Oil sales recoded  id: 1 TR NO:1','2025-07-18 14:44:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('118','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 10 with tested fuel 10','2025-07-18 15:22:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('119','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 13 with tested fuel 10','2025-07-18 15:46:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('120','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 14 with tested fuel 05','2025-07-18 16:01:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('121','1','0','0','Login','Login from 175.157.41.80','2025-07-18 20:03:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('122','94','0','0','Login','Login from 112.135.71.120','2025-07-19 09:18:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('123','1','0','0','Login','Login from 175.157.41.80','2025-07-19 09:19:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('124','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO32267,  Total: 1.00','2025-07-19 09:24:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('125','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO13850,  Total: 1.00','2025-07-19 11:06:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('126','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 15 with tested fuel 5','2025-07-19 11:14:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('127','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 17 with tested fuel 5','2025-07-19 11:31:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('128','1','0','0','Login','Login from 175.157.41.80','2025-07-19 11:35:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('129','94','0','0','Login','Login from 112.135.71.120','2025-07-19 13:13:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('130','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 19 with tested fuel 10','2025-07-19 13:29:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('131','1','0','0','Login','Login from 175.157.41.80','2025-07-19 13:29:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('132','1','0','0','Login','Login from 212.104.231.54','2025-07-20 10:16:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('133','1','0','0','Login','Login from 212.104.231.54','2025-07-20 18:56:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('134','1','1','3','System Setup','Default OIL created with p_id = 0','2025-07-20 18:58:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('135','94','0','0','Login','Login from 112.135.74.231','2025-07-21 10:20:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('136','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 20 with tested fuel 05','2025-07-21 10:32:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('137','1','0','0','Login','Login from 175.157.246.81','2025-07-21 10:43:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('138','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO32541,  Total: 1.00','2025-07-21 10:58:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('139','94','0','0','Login','Login from 112.135.67.133','2025-07-21 13:19:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('140','1','0','0','Login','Login from 112.134.241.233','2025-07-21 13:33:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('141','94','0','0','Login','Login from 112.135.67.133','2025-07-21 14:43:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('142','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO32793,  Total: 1.00','2025-07-21 14:45:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('143','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO32794,  Total: 1.00','2025-07-21 14:46:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('144','1','0','0','Login','Login from 112.134.241.233','2025-07-21 14:48:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('145','94','2','3','New GRN','Add new GRN id: 4 GRN NO:4','2025-07-21 15:13:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('146','94','1','3','New Product added','New Item added Air freshener ','2025-07-21 15:16:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('147','94','1','3','New Product added','New Item added Toilet cleaner ','2025-07-21 15:19:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('148','94','1','3','New Product added','New Item added Car wash ','2025-07-21 15:20:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('149','94','2','3','New GRN','Add new GRN id: 5 GRN NO:5','2025-07-21 15:24:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('150','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 22 with tested fuel 10','2025-07-21 15:47:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('151','1','0','0','Login','Login from 112.134.241.233','2025-07-21 15:56:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('152','1','0','0','Login','Login from 175.157.41.80','2025-07-21 17:14:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('153','1','0','0','Login','Login from 212.104.229.37','2025-07-21 20:42:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('154','94','0','0','Login','Login from 112.135.76.246','2025-07-22 10:08:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('155','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 23 with tested fuel 10','2025-07-22 10:12:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('156','94','2','3','Cancelled Credit Sale','Credit sale cancelled. Vehicle No: 2156, Total Sales: 3,050.00','2025-07-22 10:14:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('157','94','2','3','Cancelled Credit Sale','Credit sale cancelled. Vehicle No: 2156, Total Sales: 3,050.00','2025-07-22 10:19:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('158','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 25 with tested fuel 05','2025-07-22 10:27:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('159','94','2','3','Oil sales ','Oil sales recoded  id: 2 TR NO:2','2025-07-22 10:31:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('160','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 26 with tested fuel 10','2025-07-22 10:52:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('161','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 27 with tested fuel 05','2025-07-22 11:18:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('162','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 28 with tested fuel 10','2025-07-22 11:22:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('163','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 31 with tested fuel 10','2025-07-22 11:41:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('164','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO32948,  Total: 1.00','2025-07-22 11:45:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('165','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO32949,  Total: 1.00','2025-07-22 11:47:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('166','94','1','3','New customer added','New customer hospital CKD Unit added with Max Limit ','2025-07-22 11:59:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('167','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 34 with tested fuel 10','2025-07-22 12:04:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('168','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 35 with tested fuel 05','2025-07-22 12:04:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('169','1','0','0','Login','Login from 175.157.41.80','2025-07-22 20:38:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('170','94','0','0','Login','Login from 112.135.73.118','2025-07-23 11:16:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('171','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO33180,  Total: 1.00','2025-07-23 11:40:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('172','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO1470,  Total: 1.00','2025-07-23 11:42:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('173','94','2','3','Cancelled Fuel Purchase','Fuel purchase cancelled. Invoice No: BO1470, Qty: 6600, Amount: 1.00','2025-07-23 11:42:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('174','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO14070,  Total: 1.00','2025-07-23 11:45:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('175','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 36 with tested fuel 10','2025-07-23 11:47:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('176','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 37 with tested fuel 05','2025-07-23 11:53:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('177','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 38 with tested fuel 10','2025-07-23 11:56:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('178','1','0','0','Login','Login from 112.134.245.223','2025-07-23 15:13:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('179','1','0','0','Login','Login from 43.250.242.224','2025-07-24 05:01:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('180','1','0','0','Login','Login from 175.157.41.80','2025-07-24 06:54:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('181','1','0','0','Login','Login from 61.245.171.100','2025-07-26 13:22:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('182','1','0','0','Login','Login from 61.245.171.100','2025-07-26 19:58:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('183','1','0','0','Login','Login from 212.104.231.155','2025-07-27 10:36:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('184','1','0','0','Login','Login from 212.104.231.155','2025-07-27 10:36:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('185','1','0','0','Login','Login from 175.157.41.80','2025-07-28 03:09:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('186','94','0','0','Login','Login from 112.135.66.132','2025-07-28 10:02:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('187','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO33347,  Total: 1,863,972.00','2025-07-28 10:07:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('188','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 41 with tested fuel 10','2025-07-28 10:09:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('189','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 42 with tested fuel 5','2025-07-28 10:09:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('190','94','0','0','Login','Login from 112.135.66.132','2025-07-28 11:00:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('191','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 43 with tested fuel 10','2025-07-28 11:01:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('192','94','2','3','Oil sales ','Oil sales recoded  id: 3 TR NO:3','2025-07-28 11:12:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('193','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 45 with tested fuel 10','2025-07-28 11:38:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('194','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 46 with tested fuel 05','2025-07-28 11:39:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('195','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 47 with tested fuel 10','2025-07-28 12:11:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('196','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO33593,  Total: 1,959,724.14','2025-07-28 12:29:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('197','94','2','3','Oil sales ','Oil sales recoded  id: 4 TR NO:4','2025-07-28 12:31:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('198','94','0','0','Login','Login from 112.135.66.132','2025-07-28 14:28:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('199','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 50 with tested fuel 10','2025-07-28 14:31:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('200','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO14252,  Total: 1,863,972.00','2025-07-28 14:37:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('201','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 53 with tested fuel 10','2025-07-28 14:56:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('202','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 54 with tested fuel 5','2025-07-28 14:56:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('203','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO33999,  Total: 1,863,972.00','2025-07-28 15:16:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('204','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO14340,  Total: 1,959,724.14','2025-07-28 15:17:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('205','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 55 with tested fuel 10','2025-07-28 15:19:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('206','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 58 with tested fuel 10','2025-07-28 15:33:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('207','1','0','0','Login','Login from 112.134.241.90','2025-07-28 15:36:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('208','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 59 with tested fuel 05','2025-07-28 15:42:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('209','94','2','3','Oil sales ','Oil sales recoded  id: 5 TR NO:5','2025-07-28 15:48:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('210','1','0','0','Login','Login from 112.134.244.157','2025-07-29 15:55:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('211','1','0','0','Login','Login from 212.104.229.64','2025-07-29 21:11:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('212','1','0','0','Login','Login from 112.134.245.64','2025-07-30 15:33:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('213','94','0','0','Login','Login from 175.157.235.191','2025-07-31 12:35:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('214','94','0','0','Login','Login from 175.157.48.208','2025-07-31 12:37:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('215','94','0','0','Login','Login from 175.157.48.208','2025-07-31 12:37:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('216','96','0','0','Login','Login from 175.157.48.208','2025-07-31 12:51:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('217','94','0','0','Login','Login from 175.157.48.208','2025-07-31 12:54:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('218','96','0','0','Login','Login from 175.157.48.208','2025-07-31 12:55:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('219','95','0','0','Login','Login from 175.157.43.31','2025-07-31 21:45:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('220','95','0','0','Login','Login from 175.157.43.31','2025-07-31 21:45:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('221','95','0','0','Login','Login from 175.157.43.31','2025-07-31 21:45:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('222','95','0','0','Login','Login from 175.157.43.31','2025-07-31 21:45:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('223','95','0','0','Login','Login from 175.157.43.31','2025-07-31 21:45:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('224','95','0','0','Login','Login from 175.157.43.31','2025-07-31 21:45:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('225','1','0','0','Login','Login from 175.157.170.151','2025-08-01 06:58:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('226','95','0','0','Login','Login from 175.157.43.31','2025-08-01 08:43:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('227','95','0','0','Login','Login from 111.223.180.231','2025-08-02 07:22:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('228','1','0','0','Login','Login from 112.134.246.93','2025-08-04 10:07:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('229','1','0','0','Login','Login from 112.134.246.93','2025-08-04 14:49:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('230','94','0','0','Login','Login from 112.135.77.175','2025-08-06 09:58:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('231','97','0','0','Login','Login from 112.135.77.175','2025-08-06 10:26:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('232','1','0','0','Login','Login from 112.134.245.5','2025-08-06 11:35:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('233','1','1','4','New pump added ','New pump Petrol Pump 1 Added   ','2025-08-06 11:39:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('234','1','1','4','New pump added ','New pump Petrol Pump 2 Added   ','2025-08-06 11:39:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('235','1','1','4','New pump added ','New pump Diesel Pump 1 Added   ','2025-08-06 11:40:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('236','1','1','4','New pump added ','New pump Diesel Pump 2 Added   ','2025-08-06 11:40:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('237','1','1','4','New pump added ','New pump Kerosene Pump 01 Added   ','2025-08-06 11:41:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('238','1','1','4','New pump added ','New pump Kerosene Pump 02 Added   ','2025-08-06 11:41:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('239','1','1','4','New pump added ','New pump Kerosene Pump 03 Added   ','2025-08-06 11:41:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('240','1','1','4','Pump Detail Edited',' Pump Detail Edited  Petrol Pump 1   ','2025-08-06 11:42:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('241','1','1','4','Pump Detail Edited',' Pump Detail Edited  Petrol Pump 2   ','2025-08-06 11:42:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('242','1','1','4','Pump Detail Edited',' Pump Detail Edited  Diesel Pump 1   ','2025-08-06 11:43:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('243','1','1','4','Pump Detail Edited',' Pump Detail Edited  Diesel Pump 2   ','2025-08-06 11:43:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('244','1','1','4','Pump Detail Edited',' Pump Detail Edited  Kerosene Pump 01   ','2025-08-06 11:44:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('245','1','1','4','Pump Detail Edited',' Pump Detail Edited  Kerosene Pump 02   ','2025-08-06 11:44:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('246','1','1','4','Pump Detail Edited',' Pump Detail Edited  Kerosene Pump 03   ','2025-08-06 11:44:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('247','1','1','4','Fuel Capacity','Fuel Capacity Updated For PULMODDAI 100998.','2025-08-06 11:45:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('248','1','1','4','Fuel Adjustment','Fuel Stock Adjusted - Location: 4, Product: Petrol, Excess: 8,956.000 Ltr','2025-08-06 11:47:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('249','1','1','4','Fuel Adjustment','Fuel Stock Adjusted - Location: 4, Product: Diesel, Excess: 3,392.000 Ltr','2025-08-06 11:49:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('250','1','1','4','Fuel Adjustment','Fuel Stock Adjusted - Location: 4, Product: Kerosene, Excess: 10,263.000 Ltr','2025-08-06 11:49:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('251','1','1','4','New Product added','New Item added UTF (20x1) ','2025-08-06 11:50:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('252','1','1','4','New Product added','New Item added MP 90 (1x1) ','2025-08-06 12:02:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('253','1','1','4','New Product added','New Item added MP 90 (20x1) ','2025-08-06 12:03:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('254','1','1','4','New Product added','New Item added 4T (20w -40) ','2025-08-06 12:06:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('255','1','1','4','New Product added','New Item added 4T (20w -30) ','2025-08-06 12:07:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('256','1','1','4','New Product added','New Item added DS 40 (20x1) 15W 40 ','2025-08-06 12:11:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('257','1','1','4','New Product added','New Item added MP 90 (5X1) ','2025-08-06 12:16:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('258','1','1','4','New Product added','New Item added ATF Oil (20x1) ','2025-08-06 12:17:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('259','1','1','4','New Product added','New Item added DOT 3 (100mL) ','2025-08-06 12:18:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('260','1','1','4','Fuel Capacity','Fuel Capacity Updated For PULMODDAI 100998.','2025-08-06 12:20:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('261','1','1','4','New Product added','New Item added Petrol (Old) ','2025-08-06 12:22:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('262','1','0','0','Login','Login from 112.134.245.5','2025-08-06 14:33:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('263','1','2','3','New GRN','Add new GRN id: 6 GRN NO:6','2025-08-06 14:58:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('264','97','0','0','Login','Login from 112.135.77.161','2025-08-06 15:06:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('265','94','0','0','Login','Login from 112.135.69.23','2025-08-06 16:02:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('266','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 60 with tested fuel 10','2025-08-06 16:11:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('267','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 61 with tested fuel 10','2025-08-06 16:17:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('268','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 62 with tested fuel 05','2025-08-06 16:17:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('269','94','2','3','Oil sales ','Oil sales recoded  id: 6 TR NO:6','2025-08-06 16:27:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('270','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO34247,  Total: 1,863,972.00','2025-08-06 16:33:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('271','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 63 with tested fuel 10','2025-08-06 16:36:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('272','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 64 with tested fuel 5','2025-08-06 16:36:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('273','1','0','0','Login','Login from 175.157.137.86','2025-08-06 16:47:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('274','94','0','0','Login','Login from 112.135.67.69','2025-08-07 08:28:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('275','1','0','0','Login','Login from 112.134.245.5','2025-08-07 11:16:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('276','94','0','0','Login','Login from 112.135.76.50','2025-08-07 15:15:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('277','97','0','0','Login','Login from 112.135.76.50','2025-08-07 15:16:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('278','97','2','4','New Pump Operator Added','New pump operator M.N.M.Nishath added with NIC 200123702197.','2025-08-07 15:19:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('279','97','2','4','New Pump Operator Added','New pump operator M.S.M.Ifras added with NIC 200106300040.','2025-08-07 15:20:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('280','97','2','4','Pump Operator Edited','Pump operator M.S.M.Ifras updated.','2025-08-07 15:20:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('281','97','2','4','New Pump Operator Added','New pump operator M.F.M.Fazal added with NIC 200115601875.','2025-08-07 15:21:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('282','97','2','4','New Pump Operator Added','New pump operator I.M.Atheef added with NIC 200131903750.','2025-08-07 15:22:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('283','97','1','4','Fuel Capacity','Fuel Capacity Updated For PULMODDAI 100998.','2025-08-07 15:23:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('284','97','0','0','Login','Login from 112.135.76.50','2025-08-07 15:28:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('285','1','0','0','Login','Login from 175.157.137.86','2025-08-07 16:11:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('286','97','0','0','Login','Login from 112.135.72.237','2025-08-07 16:14:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('287','94','0','0','Login','Login from 112.135.75.8','2025-08-07 16:32:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('288','1','0','0','Login','Login from 175.157.137.86','2025-08-07 17:35:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('289','94','0','0','Login','Login from 112.135.66.3','2025-08-09 10:18:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('290','96','0','0','Login','Login from 112.135.66.3','2025-08-09 10:32:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('291','96','0','0','Login','Login from 112.135.66.3','2025-08-09 10:48:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('292','95','0','0','Login','Login from 112.135.66.3','2025-08-09 10:56:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('293','95','0','0','Login','Login from 112.135.66.3','2025-08-09 10:56:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('294','95','0','0','Login','Login from 112.135.66.3','2025-08-09 10:56:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('295','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: Bo35034,  Total: 1,851,630.00','2025-08-09 10:59:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('296','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 65 with tested fuel 10','2025-08-09 11:12:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('297','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 67 with tested fuel 10','2025-08-09 11:19:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('298','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 68 with tested fuel 5','2025-08-09 11:23:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('299','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 69 with tested fuel 5','2025-08-09 11:25:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('300','95','2','4','Oil sales ','Oil sales recoded  id: 7 TR NO:1','2025-08-09 11:27:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('301','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B014737,  Total: 1,947,443.85','2025-08-09 11:33:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('302','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B014735,  Total: 1,851,630.00','2025-08-09 11:34:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('303','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B035279,B035280,B035281,  Total: 3,589,740.00','2025-08-09 11:36:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('304','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 70 with tested fuel 10','2025-08-09 11:38:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('305','94','0','0','Login','Login from 112.135.66.3','2025-08-09 11:40:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('306','94','1','4','New customer added','New customer police station pulmuddai (SSP) added with Max Limit 300000','2025-08-09 11:42:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('307','94','1','4','New customer added','New customer  pradheshiya sabha kuchchaweli (KPS) added with Max Limit 300000','2025-08-09 11:44:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('308','94','1','4','New customer added','New customer lanka mineral sand (LMSL) added with Max Limit 00','2025-08-09 11:47:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('309','94','1','4','New customer added','New customer Ceylon electricity board (CEB)  added with Max Limit ','2025-08-09 11:49:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('310','94','1','4','New customer added','New customer Base hospital pulmoddai (RDHS) added with Max Limit ','2025-08-09 11:50:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('311','94','1','4','New customer added','New customer specials task force (STF) added with Max Limit ','2025-08-09 11:52:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('312','95','0','0','Login','Login from 112.135.66.3','2025-08-09 11:53:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('313','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 72 with tested fuel 10','2025-08-09 12:11:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('314','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 73 with tested fuel 10','2025-08-09 12:17:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('315','95','2','4','Oil sales ','Oil sales recoded  id: 8 TR NO:2','2025-08-09 12:18:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('316','95','0','0','Login','Login from 112.135.66.3','2025-08-09 12:26:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('317','95','0','0','Login','Login from 112.135.66.3','2025-08-09 12:26:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('318','95','0','0','Login','Login from 112.135.66.3','2025-08-09 12:27:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('319','1','0','0','Login','Login from 212.104.231.138','2025-08-10 12:54:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('320','97','0','0','Login','Login from 112.135.68.171','2025-08-11 08:42:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('321','97','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO33538,  Total: 1,863,972.00','2025-08-11 08:51:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('322','97','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 74 with tested fuel 5','2025-08-11 09:35:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('323','1','0','0','Login','Login from 112.134.245.33','2025-08-11 10:08:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('324','95','0','0','Login','Login from 111.223.180.231','2025-08-11 10:25:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('325','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 75 with tested fuel 5','2025-08-11 10:29:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('326','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 75 with tested fuel 5','2025-08-11 10:32:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('327','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 77 with tested fuel 10','2025-08-11 10:38:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('328','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 79 with tested fuel 5','2025-08-11 10:47:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('329','95','2','4','Oil sales ','Oil sales recoded  id: 9 TR NO:3','2025-08-11 10:50:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('330','94','0','0','Login','Login from 112.135.75.132','2025-08-11 10:58:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('331','95','0','0','Login','Login from 111.223.180.231','2025-08-11 11:48:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('332','95','0','0','Login','Login from 111.223.180.231','2025-08-11 11:52:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('333','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 81 with tested fuel 5','2025-08-11 11:56:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('334','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 82 with tested fuel 5','2025-08-11 11:58:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('335','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 83 with tested fuel 10','2025-08-11 11:59:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('336','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 85 with tested fuel 5','2025-08-11 12:01:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('337','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 85 with tested fuel 5','2025-08-11 12:02:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('338','95','0','0','Login','Login from 111.223.180.231','2025-08-11 12:15:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('339','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B035519,  Total: 1,196,580.00','2025-08-11 12:21:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('340','94','0','0','Login','Login from 112.135.75.132','2025-08-11 14:29:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('341','94','2','3','Fuel Pump Test Cancelled','Fuel pump test 47 cancelled','2025-08-11 14:36:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('342','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 74 with tested fuel 10','2025-08-11 14:36:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('343','94','0','0','Login','Login from 112.135.72.104','2025-08-11 14:46:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('344','94','0','0','Login','Login from 112.135.72.104','2025-08-11 15:05:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('345','94','2','3','Oil sales ','Oil sales recoded  id: 10 TR NO:7','2025-08-11 15:07:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('346','94','2','3','Oil sales ','Oil sales recoded  id: 11 TR NO:8','2025-08-11 15:08:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('347','94','2','3','Oil sales ','Oil sales recoded  id: 12 TR NO:9','2025-08-11 15:09:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('348','94','2','3','Oil sales ','Oil sales recoded  id: 13 TR NO:10','2025-08-11 15:09:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('349','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO14494,  Total: 1,959,724.14','2025-08-11 15:20:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('350','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO34421,  Total: 1,863,972.00','2025-08-11 15:20:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('351','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO344236,  Total: 1,863,972.00','2025-08-11 15:21:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('352','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 89 with tested fuel 10','2025-08-11 15:23:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('353','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 90 with tested fuel 05','2025-08-11 15:26:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('354','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 91 with tested fuel 10','2025-08-11 15:30:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('355','94','2','3','Oil sales ','Oil sales recoded  id: 14 TR NO:11','2025-08-11 15:48:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('356','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO34597,  Total: 1,863,972.00','2025-08-11 15:52:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('357','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 94 with tested fuel 10','2025-08-11 15:58:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('358','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 97 with tested fuel 10','2025-08-11 16:10:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('359','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 98 with tested fuel 05','2025-08-11 16:15:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('360','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO14617,  Total: 1,963,533.00','2025-08-11 16:26:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('361','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO34814,  Total: 1,863,972.00','2025-08-11 16:26:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('362','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 99 with tested fuel 10','2025-08-11 16:28:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('363','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 100 with tested fuel 05','2025-08-11 16:35:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('364','95','0','0','Login','Login from 111.223.180.231','2025-08-11 16:40:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('365','95','0','0','Login','Login from 111.223.180.231','2025-08-11 16:41:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('366','95','0','0','Login','Login from 111.223.180.231','2025-08-11 16:41:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('367','95','0','0','Login','Login from 111.223.180.231','2025-08-11 16:41:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('368','95','0','0','Login','Login from 111.223.180.231','2025-08-11 16:46:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('369','95','0','0','Login','Login from 111.223.180.231','2025-08-11 16:46:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('370','95','2','4','Oil sales ','Oil sales recoded  id: 15 TR NO:4','2025-08-11 16:52:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('371','95','0','0','Login','Login from 111.223.180.231','2025-08-11 17:13:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('372','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 101 with tested fuel 5','2025-08-11 17:16:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('373','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 102 with tested fuel 5','2025-08-11 17:18:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('374','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 103 with tested fuel 10','2025-08-11 17:26:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('375','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 105 with tested fuel 5','2025-08-11 17:31:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('376','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 106 with tested fuel 5','2025-08-11 17:32:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('377','1','0','0','Login','Login from 111.223.183.165','2025-08-11 18:29:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('378','1','0','0','Login','Login from 112.134.245.33','2025-08-12 08:31:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('379','94','0','0','Login','Login from 112.135.66.146','2025-08-12 09:28:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('380','94','0','0','Login','Login from 112.135.66.146','2025-08-12 09:59:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('381','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 107 with tested fuel 10','2025-08-12 10:05:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('382','94','2','3','Oil sales ','Oil sales recoded  id: 16 TR NO:12','2025-08-12 10:15:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('383','1','0','0','Login','Login from 112.134.245.33','2025-08-12 10:22:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('384','95','0','0','Login','Login from 111.223.180.231','2025-08-12 11:20:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('385','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 110 with tested fuel 10','2025-08-12 11:34:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('386','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 111 with tested fuel 10','2025-08-12 11:36:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('387','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B035763,  Total: 1,851,630.00','2025-08-12 11:47:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('388','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B035764,  Total: 1,196,580.00','2025-08-12 11:48:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('389','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B014945,  Total: 1,947,443.85','2025-08-12 11:49:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('390','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B035919,  Total: 1,196,580.00','2025-08-12 11:49:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('391','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B035920,  Total: 1,196,580.00','2025-08-12 11:50:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('392','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 113 with tested fuel 5','2025-08-12 11:54:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('393','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 114 with tested fuel 5','2025-08-12 11:58:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('394','95','2','4','Oil sales ','Oil sales recoded  id: 17 TR NO:5','2025-08-12 12:01:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('395','1','0','0','Login','Login from 112.134.245.33','2025-08-12 13:53:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('396','94','0','0','Login','Login from 112.135.74.220','2025-08-12 13:54:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('397','94','3','3','stock Adjustment',' Adjusted Batch ID : 18 Adjusted Qty : -1 reason:Losses','2025-08-12 13:57:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('398','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Petrol, Short: 411.000 Ltr','2025-08-12 14:01:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('399','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Petrol, Short: 1,130.300 Ltr','2025-08-12 14:06:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('400','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Diesel, Excess: 2,841.700 Ltr','2025-08-12 14:09:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('401','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Kerosene, Excess: 0.800 Ltr','2025-08-12 14:53:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('402','94','3','3','stock Adjustment',' Adjusted Batch ID : 7 Adjusted Qty : -3.7 reason:Losses','2025-08-12 15:01:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('403','95','0','0','Login','Login from 175.157.243.230','2025-08-12 15:02:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('404','95','0','0','Login','Login from 175.157.243.230','2025-08-12 15:04:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('405','94','1','3','New Product added','New Item added grease lo ','2025-08-12 15:05:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('406','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 115 with tested fuel 10','2025-08-12 15:11:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('407','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B036186,  Total: 1,947,443.85','2025-08-12 15:14:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('408','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 117 with tested fuel 5','2025-08-12 15:17:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('409','94','3','3','stock Adjustment',' Adjusted Batch ID : 15 Adjusted Qty : -6 reason:Losses','2025-08-12 15:17:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('410','94','3','3','stock Adjustment',' Adjusted Batch ID : 16 Adjusted Qty : -14 reason:Losses','2025-08-12 15:19:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('411','1','0','0','Login','Login from 112.134.245.33','2025-08-12 15:20:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('412','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 118 with tested fuel 5','2025-08-12 15:22:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('413','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 119 with tested fuel 10','2025-08-12 15:24:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('414','94','2','3','New GRN','Add new GRN id: 7 GRN NO:6','2025-08-12 15:28:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('415','94','1','3','Expire Date','Price change updated batch id: 64 new date: 4000','2025-08-12 15:29:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('416','94','1','4','New Product added','New Item added DOT 3 (1L) ','2025-08-12 15:42:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('417','94','1','4','New Product added','New Item added DOT 3 (500ml) ','2025-08-12 15:43:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('418','94','1','4','New Product added','New Item added DOT 3 (250ml) ','2025-08-12 15:44:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('419','94','2','4','New GRN','Add new GRN id: 8 GRN NO:2','2025-08-12 15:47:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('420','94','1','3','New Product added','New Item added break oil (1l) ','2025-08-12 16:11:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('421','94','2','3','New GRN','Add new GRN id: 9 GRN NO:7','2025-08-12 16:13:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('422','94','1','3','New Product added','New Item added Battery acid 500ml ','2025-08-12 16:29:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('423','94','2','3','New GRN','Add new GRN id: 10 GRN NO:8','2025-08-12 16:33:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('424','94','0','0','Login','Login from 112.135.74.190','2025-08-13 09:47:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('425','94','3','3','stock Adjustment',' Adjusted Batch ID : 19 Adjusted Qty : -40 reason:Losses','2025-08-13 10:17:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('426','94','1','3','New Product added','New Item added HD68 oil 2 ','2025-08-13 10:40:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('427','94','2','3','New GRN','Add new GRN id: 11 GRN NO:9','2025-08-13 10:42:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('428','1','0','0','Login','Login from 112.134.245.33','2025-08-13 10:48:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('429','94','0','0','Login','Login from 112.135.74.190','2025-08-13 10:57:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('430','1','1','3','Expire Date','Price change updated batch id: 32 new date: 1650','2025-08-13 11:47:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('431','94','0','0','Login','Login from 112.135.74.190','2025-08-13 15:57:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('432','94','0','0','Login','Login from 112.135.65.31','2025-08-13 16:15:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('433','95','0','0','Login','Login from 175.157.124.140','2025-08-13 23:22:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('434','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 120 with tested fuel 10','2025-08-13 23:23:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('435','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 122 with tested fuel 5','2025-08-13 23:28:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('436','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 123 with tested fuel 5','2025-08-13 23:31:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('437','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 124 with tested fuel 10','2025-08-13 23:32:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('438','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B036383,  Total: 1,851,630.00','2025-08-13 23:35:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('439','95','2','4','Oil sales ','Oil sales recoded  id: 18 TR NO:6','2025-08-13 23:36:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('440','95','0','0','Login','Login from 175.157.124.140','2025-08-14 03:49:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('441','95','2','4','Pump Operator Edited','Pump operator M.F.M.Fazal updated.','2025-08-14 04:07:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('442','97','0','0','Login','Login from 112.135.64.148','2025-08-14 10:17:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('443','94','0','0','Login','Login from 112.135.74.8','2025-08-14 10:22:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('444','1','0','0','Login','Login from 112.134.245.33','2025-08-14 10:29:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('445','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 126 with tested fuel 10','2025-08-14 11:38:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('446','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 129 with tested fuel 5','2025-08-14 11:40:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('447','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO35032,  Total: 1,855,524.00','2025-08-14 11:44:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('448','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 127 with tested fuel 10','2025-08-14 11:45:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('449','95','0','0','Login','Login from 112.135.77.21','2025-08-14 11:57:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('450','1','0','0','Login','Login from 112.134.245.33','2025-08-14 12:02:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('451','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 125 with tested fuel 10','2025-08-14 12:16:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('452','95','0','0','Login','Login from 112.135.77.21','2025-08-14 12:28:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('453','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 132 with tested fuel 10','2025-08-14 12:35:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('454','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 133 with tested fuel 5','2025-08-14 12:37:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('455','97','0','0','Login','Login from 112.135.64.148','2025-08-14 12:38:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('456','97','1','4','New customer added','New customer secret intelligent service (SIS)  added with Max Limit ','2025-08-14 12:41:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('457','97','1','4','New customer added','New customer Peoples Bank - Pulmuddai (PPB) added with Max Limit ','2025-08-14 12:44:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('458','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 134 with tested fuel 5','2025-08-14 12:44:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('459','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B036606,  Total: 1,196,580.00','2025-08-14 12:47:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('460','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B036604,  Total: 1,851,630.00','2025-08-14 12:48:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('461','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B015137,  Total: 1,947,443.85','2025-08-14 12:49:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('462','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 135 with tested fuel 10','2025-08-14 12:50:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('463','1','0','0','Login','Login from 112.134.245.33','2025-08-14 13:11:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('464','95','2','4','Oil sales ','Oil sales recoded  id: 19 TR NO:7','2025-08-14 13:14:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('465','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 137 with tested fuel 10','2025-08-14 13:16:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('466','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 139 with tested fuel 5','2025-08-14 13:20:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('467','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 140 with tested fuel 5','2025-08-14 13:23:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('468','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 141 with tested fuel 10','2025-08-14 13:27:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('469','94','0','0','Login','Login from 112.135.64.148','2025-08-14 13:27:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('470','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 143 with tested fuel 236.8','2025-08-14 13:33:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('471','95','2','4','Oil sales ','Oil sales recoded  id: 20 TR NO:8','2025-08-14 13:35:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('472','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO14718,  Total: 1,196,580.00','2025-08-14 13:38:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('473','95','2','4','Oil sales ','Oil sales recoded  id: 21 TR NO:9','2025-08-14 13:38:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('474','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO35265,  Total: 1,951,318.38','2025-08-14 13:39:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('475','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO35266,  Total: 1,855,524.00','2025-08-14 13:40:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('476','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 145 with tested fuel 10','2025-08-14 13:44:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('477','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 148 with tested fuel 10','2025-08-14 13:56:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('478','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 149 with tested fuel 5','2025-08-14 14:01:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('479','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 150 with tested fuel 10','2025-08-14 14:09:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('480','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 150 with tested fuel 248','2025-08-14 14:13:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('481','1','0','0','Login','Login from 112.134.245.33','2025-08-14 14:34:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('482','94','0','0','Login','Login from 112.135.65.61','2025-08-14 15:21:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('483','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 151 with tested fuel 5','2025-08-14 15:22:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('484','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 152 with tested fuel 3','2025-08-14 15:25:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('485','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 153 with tested fuel 10','2025-08-14 15:30:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('486','1','0','0','Login','Login from 111.223.183.165','2025-08-14 16:25:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('487','94','0','0','Login','Login from 112.135.67.97','2025-08-14 16:28:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('488','94','0','0','Login','Login from 112.135.65.240','2025-08-15 08:51:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('489','1','0','0','Login','Login from 112.134.245.33','2025-08-15 09:27:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('490','94','0','0','Login','Login from 112.135.75.88','2025-08-15 10:06:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('491','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 156 with tested fuel 10','2025-08-15 10:08:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('492','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 157 with tested fuel 241','2025-08-15 10:22:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('493','1','0','0','Login','Login from 112.134.245.33','2025-08-15 10:25:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('494','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 158 with tested fuel 10','2025-08-15 10:31:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('495','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO35517,  Total: 1,855,524.00','2025-08-15 10:35:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('496','1','0','0','Login','Login from 112.134.245.33','2025-08-15 10:37:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('497','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 159 with tested fuel 5','2025-08-15 10:41:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('498','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 160 with tested fuel 10','2025-08-15 11:06:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('499','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 160 with tested fuel 10','2025-08-15 11:06:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('500','94','2','3','Fuel Pump Test Cancelled','Fuel pump test 110 cancelled','2025-08-15 11:07:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('501','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 163 with tested fuel 10','2025-08-15 11:17:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('502','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 164 with tested fuel 5','2025-08-15 11:23:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('503','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 165 with tested fuel 10','2025-08-15 11:25:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('504','94','2','3','Oil sales ','Oil sales recoded  id: 22 TR NO:13','2025-08-15 11:33:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('505','94','0','0','Login','Login from 112.135.73.255','2025-08-15 15:33:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('506','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 169 with tested fuel 10','2025-08-15 15:36:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('507','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO36187,  Total: 1,951,318.38','2025-08-15 15:51:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('508','1','0','0','Login','Login from 112.134.245.33','2025-08-15 15:54:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('509','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO36188,  Total: 1,855,524.00','2025-08-15 15:57:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('510','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 170 with tested fuel 5','2025-08-15 15:59:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('511','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 171 with tested fuel 10','2025-08-15 16:04:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('512','94','2','3','Oil sales ','Oil sales recoded  id: 23 TR NO:14','2025-08-15 16:09:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('513','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO149447,  Total: 1,951,318.38','2025-08-15 16:17:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('514','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO35996,  Total: 1,855,524.00','2025-08-15 16:20:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('515','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 174 with tested fuel 10','2025-08-15 16:21:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('516','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 175 with tested fuel 5','2025-08-15 16:28:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('517','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 176 with tested fuel 10','2025-08-15 16:33:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('518','96','0','0','Login','Login from 112.135.70.212','2025-08-16 11:21:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('519','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO36648,  Total: 1,855,524.00','2025-08-16 11:27:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('520','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO36649,  Total: 1,855,524.00','2025-08-16 11:28:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('521','96','2','3','Cancelled Fuel Purchase','Fuel purchase cancelled. Invoice No: BO36649, Qty: 6600, Amount: 1,855,524.00','2025-08-16 11:29:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('522','96','2','3','Cancelled Fuel Purchase','Fuel purchase cancelled. Invoice No: BO36648, Qty: 6600, Amount: 1,855,524.00','2025-08-16 11:29:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('523','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO36381,  Total: 1,855,524.00','2025-08-16 11:30:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('524','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 180 with tested fuel 10','2025-08-16 11:38:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('525','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 181 with tested fuel 5','2025-08-16 11:42:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('526','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 182 with tested fuel 10','2025-08-16 11:51:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('527','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO36648.,  Total: 1,855,524.00','2025-08-16 12:07:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('528','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO36649.,  Total: 1,855,524.00','2025-08-16 12:08:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('529','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 185 with tested fuel 10','2025-08-16 12:15:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('530','96','2','3','Oil sales ','Oil sales recoded  id: 24 TR NO:15','2025-08-16 12:20:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('531','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 189 with tested fuel 10','2025-08-16 12:30:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('532','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 190 with tested fuel 5','2025-08-16 12:34:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('533','94','0','0','Login','Login from 112.135.67.135','2025-08-16 12:44:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('534','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 191 with tested fuel 10','2025-08-16 12:46:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('535','1','0','0','Login','Login from 111.223.183.165','2025-08-17 13:53:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('536','94','0','0','Login','Login from 112.135.75.91','2025-08-18 09:22:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('537','95','0','0','Login','Login from 111.223.180.38','2025-08-18 09:37:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('538','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 192 with tested fuel 10','2025-08-18 09:44:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('539','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B036949,  Total: 1,947,443.85','2025-08-18 09:46:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('540','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B036951,  Total: 1,851,630.00','2025-08-18 09:47:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('541','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 194 with tested fuel 5','2025-08-18 09:50:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('542','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 195 with tested fuel 5','2025-08-18 09:52:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('543','97','0','0','Login','Login from 112.135.75.91','2025-08-18 09:53:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('544','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 196 with tested fuel 10','2025-08-18 09:55:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('545','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 197 with tested fuel 10','2025-08-18 10:05:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('546','94','0','0','Login','Login from 112.135.75.91','2025-08-18 10:06:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('547','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 200 with tested fuel 10','2025-08-18 10:35:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('548','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 201 with tested fuel 5','2025-08-18 10:46:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('549','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 202 with tested fuel 5','2025-08-18 10:50:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('550','94','2','3','Oil sales ','Oil sales recoded  id: 25 TR NO:16','2025-08-18 10:53:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('551','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO36917,  Total: 1,855,524.00','2025-08-18 11:03:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('552','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO36918,  Total: 1,951,318.38','2025-08-18 11:04:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('553','1','0','0','Login','Login from 112.134.246.178','2025-08-18 11:09:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('554','95','0','0','Login','Login from 111.223.180.38','2025-08-18 12:06:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('555','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 203 with tested fuel 5','2025-08-18 12:12:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('556','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 204 with tested fuel 10','2025-08-18 12:16:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('557','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 205 with tested fuel 10','2025-08-18 12:46:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('558','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B015355,  Total: 1,947,443.85','2025-08-18 13:06:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('559','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B037268,  Total: 1,851,630.00','2025-08-18 13:08:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('560','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 208 with tested fuel 5','2025-08-18 13:10:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('561','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 209 with tested fuel 5','2025-08-18 13:11:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('562','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 210 with tested fuel 5','2025-08-18 13:15:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('563','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 211 with tested fuel 5','2025-08-18 13:19:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('564','97','0','0','Login','Login from 112.135.72.15','2025-08-18 13:37:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('565','1','0','0','Login','Login from 112.134.245.33','2025-08-18 13:59:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('566','97','0','0','Login','Login from 112.135.76.212','2025-08-18 14:15:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('567','1','0','0','Login','Login from 112.134.245.33','2025-08-18 15:40:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('568','97','0','0','Login','Login from 112.135.66.240','2025-08-19 13:32:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('569','96','0','0','Login','Login from 112.135.75.140','2025-08-19 14:20:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('570','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 212 with tested fuel 10','2025-08-19 14:27:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('571','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 216 with tested fuel 10','2025-08-19 14:52:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('572','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 217 with tested fuel 05','2025-08-19 15:07:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('573','1','0','0','Login','Login from 111.223.183.165','2025-08-20 03:19:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('574','94','0','0','Login','Login from 112.135.72.9','2025-08-20 15:06:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('575','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO15283,  Total: 1,959,724.14','2025-08-20 15:11:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('576','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO37087,  Total: 1,855,524.00','2025-08-20 15:13:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('577','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO37088,  Total: 1,855,524.00','2025-08-20 15:15:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('578','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 218 with tested fuel 10','2025-08-20 15:21:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('579','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 220 with tested fuel 10','2025-08-20 15:25:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('580','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 221 with tested fuel 5','2025-08-20 15:32:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('581','94','2','3','Oil sales ','Oil sales recoded  id: 26 TR NO:17','2025-08-20 15:33:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('582','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO37267,  Total: 1,863,972.00','2025-08-20 15:37:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('583','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 222 with tested fuel 10','2025-08-20 15:40:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('584','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 223 with tested fuel 5','2025-08-20 15:49:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('585','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 224 with tested fuel 10','2025-08-20 15:51:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('586','94','2','3','Oil sales ','Oil sales recoded  id: 27 TR NO:18','2025-08-20 15:54:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('587','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO15391,  Total: 1,863,972.00','2025-08-20 16:01:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('588','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO37479,  Total: 1,863,972.00','2025-08-20 16:01:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('589','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 226 with tested fuel 10','2025-08-20 16:04:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('590','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 227 with tested fuel 5','2025-08-20 16:20:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('591','94','0','0','Login','Login from 112.135.68.79','2025-08-20 16:25:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('592','97','0','0','Login','Login from 112.135.71.152','2025-08-21 09:27:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('593','95','0','0','Login','Login from 175.157.124.8','2025-08-21 17:50:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('594','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 228 with tested fuel 10','2025-08-21 17:52:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('595','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 230 with tested fuel 10','2025-08-21 18:07:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('596','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B037480,B037481,  Total: 3,703,260.00','2025-08-21 18:14:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('597','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 231 with tested fuel 5','2025-08-21 18:17:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('598','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 232 with tested fuel 10','2025-08-21 18:20:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('599','95','2','4','Oil sales ','Oil sales recoded  id: 28 TR NO:10','2025-08-21 18:25:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('600','96','0','0','Login','Login from 112.135.67.133','2025-08-22 19:01:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('601','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO1539137479,  Total: 1,863,972.00','2025-08-22 19:11:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('602','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 233 with tested fuel 10','2025-08-22 19:29:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('603','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 234 with tested fuel 10','2025-08-22 19:36:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('604','97','0','0','Login','Login from 112.135.71.3','2025-08-23 10:56:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('605','1','0','0','Login','Login from 111.223.183.165','2025-08-24 11:32:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('606','97','0','0','Login','Login from 112.135.72.130','2025-08-25 14:09:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('607','97','0','0','Login','Login from 112.135.72.130','2025-08-25 14:11:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('608','97','0','0','Login','Login from 112.135.66.65','2025-08-26 11:08:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('609','95','0','0','Login','Login from 175.157.16.7','2025-08-26 14:40:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('610','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 235 with tested fuel 10','2025-08-26 14:41:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('611','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 237 with tested fuel 5','2025-08-26 14:45:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('612','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 238 with tested fuel 5','2025-08-26 14:46:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('613','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B037631,B037632,  Total: 2,393,160.00','2025-08-26 14:49:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('614','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 239 with tested fuel 5','2025-08-26 14:50:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('615','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 240 with tested fuel 5','2025-08-26 14:52:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('616','95','2','4','Oil sales ','Oil sales recoded  id: 29 TR NO:11','2025-08-26 14:54:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('617','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 241 with tested fuel 10','2025-08-26 14:57:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('618','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 243 with tested fuel 5','2025-08-26 15:06:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('619','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 244 with tested fuel 5','2025-08-26 15:07:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('620','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B015559,B037726,  Total: 3,720,156.00','2025-08-26 15:10:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('621','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B037724/25,  Total: 2,393,160.00','2025-08-26 15:11:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('622','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 245 with tested fuel 10','2025-08-26 15:12:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('623','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 246 with tested fuel 10','2025-08-26 15:15:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('624','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 247 with tested fuel 5','2025-08-26 15:27:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('625','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 248 with tested fuel 5','2025-08-26 15:37:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('626','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 249 with tested fuel 10','2025-08-26 15:40:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('627','95','0','0','Login','Login from 175.157.16.7','2025-08-26 16:03:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('628','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 251 with tested fuel 10','2025-08-26 16:11:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('629','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B015616,614,  Total: 3,911,699.22','2025-08-26 16:13:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('630','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 253 with tested fuel 5','2025-08-26 16:17:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('631','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 254 with tested fuel 5','2025-08-26 16:23:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('632','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 255 with tested fuel 5','2025-08-26 16:24:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('633','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 256 with tested fuel 5','2025-08-26 16:26:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('634','95','2','4','Oil sales ','Oil sales recoded  id: 30 TR NO:12','2025-08-26 16:29:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('635','96','0','0','Login','Login from 112.135.74.252','2025-08-26 16:41:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('636','96','2','3','Fuel Pump Test Cancelled','Fuel pump test 158 cancelled','2025-08-26 16:58:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('637','1','0','0','Login','Login from 123.231.127.204','2025-08-26 17:53:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('638','1','2','3','Cancelled Credit Sale','Credit sale cancelled. Vehicle No: jeep, Total Sales: 28,900.00','2025-08-26 17:59:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('639','1','2','3','Cancelled Credit Sale','Credit sale cancelled. Vehicle No: cab, Total Sales: 10,982.00','2025-08-26 17:59:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('640','1','2','3','Cancelled Credit Sale','Credit sale cancelled. Vehicle No: van, Total Sales: 16,473.00','2025-08-26 18:00:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('641','1','2','3','Cancelled Credit Sale','Credit sale cancelled. Vehicle No: van, Total Sales: 17,051.00','2025-08-26 18:00:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('642','1','2','3','Cancelled Credit Sale','Credit sale cancelled. Vehicle No: cab, Total Sales: 20,230.00','2025-08-26 18:00:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('643','95','0','0','Login','Login from 175.157.16.7','2025-08-27 10:52:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('644','95','0','0','Login','Login from 111.223.176.61','2025-08-27 19:11:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('645','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 257 with tested fuel 10','2025-08-27 19:12:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('646','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B037981,  Total: 1,955,849.61','2025-08-27 19:24:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('647','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B037924/22,  Total: 2,393,160.00','2025-08-27 19:25:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('648','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 259 with tested fuel 5','2025-08-27 19:27:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('649','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 260 with tested fuel 5','2025-08-27 19:34:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('650','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 261 with tested fuel 5','2025-08-27 19:36:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('651','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 262 with tested fuel 5','2025-08-27 19:42:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('652','95','0','0','Login','Login from 175.157.15.150','2025-08-28 08:50:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('653','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 263 with tested fuel 10','2025-08-28 08:51:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('654','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 265 with tested fuel 5','2025-08-28 08:54:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('655','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 266 with tested fuel 5','2025-08-28 08:56:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('656','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 267 with tested fuel 10','2025-08-28 08:57:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('657','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B038134,  Total: 1,196,580.00','2025-08-28 08:58:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('658','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 268 with tested fuel 10','2025-08-28 09:02:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('659','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 270 with tested fuel 5','2025-08-28 09:04:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('660','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 271 with tested fuel 5','2025-08-28 09:05:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('661','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 272 with tested fuel 10','2025-08-28 09:06:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('662','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B038317,15,  Total: 2,393,160.00','2025-08-28 09:08:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('663','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 273 with tested fuel 10','2025-08-28 09:11:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('664','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B038594,  Total: 1,955,849.61','2025-08-28 09:12:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('665','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B038595,  Total: 1,860,078.00','2025-08-28 09:23:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('666','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 275 with tested fuel 5','2025-08-28 09:23:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('667','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 276 with tested fuel 5','2025-08-28 09:27:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('668','96','0','0','Login','Login from 112.135.69.127','2025-08-28 09:28:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('669','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 277 with tested fuel 10','2025-08-28 09:29:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('670','95','2','4','Oil sales ','Oil sales recoded  id: 31 TR NO:13','2025-08-28 09:32:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('671','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 278 with tested fuel 10','2025-08-28 09:34:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('672','96','2','3','Oil sales ','Oil sales recoded  id: 32 TR NO:19','2025-08-28 09:34:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('673','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B038840,  Total: 1,955,849.61','2025-08-28 09:35:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('674','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 280 with tested fuel 5','2025-08-28 09:36:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('675','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 281 with tested fuel 5','2025-08-28 09:38:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('676','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B038754,  Total: 1,860,078.00','2025-08-28 09:39:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('677','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B038755,  Total: 1,196,580.00','2025-08-28 09:40:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('678','1','0','0','Login','Login from 112.134.240.78','2025-08-28 09:40:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('679','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 282 with tested fuel 10','2025-08-28 09:41:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('680','95','2','4','Oil sales ','Oil sales recoded  id: 33 TR NO:14','2025-08-28 09:43:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('681','95','2','4','Oil sales ','Oil sales recoded  id: 34 TR NO:15','2025-08-28 09:44:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('682','1','2','3','Cancelled Fuel Purchase','Fuel purchase cancelled. Invoice No: BO1539137479, Qty: 6600, Amount: 1,863,972.00','2025-08-28 09:44:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('683','96','0','0','Login','Login from 112.135.69.127','2025-08-28 09:46:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('684','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 283 with tested fuel 10','2025-08-28 09:46:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('685','96','0','0','Login','Login from 112.135.69.127','2025-08-28 09:47:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('686','96','0','0','Login','Login from 112.135.69.127','2025-08-28 09:53:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('687','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 285 with tested fuel 5','2025-08-28 09:53:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('688','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 286 with tested fuel 5','2025-08-28 09:55:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('689','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 287 with tested fuel 5','2025-08-28 09:57:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('690','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 288 with tested fuel 10','2025-08-28 09:58:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('691','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 289 with tested fuel 5','2025-08-28 09:58:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('692','95','2','4','Oil sales ','Oil sales recoded  id: 35 TR NO:16','2025-08-28 10:00:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('693','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 290 with tested fuel 10','2025-08-28 10:01:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('694','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 291 with tested fuel 5','2025-08-28 10:02:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('695','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 292 with tested fuel 10','2025-08-28 10:04:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('696','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B039033,  Total: 1,955,849.61','2025-08-28 10:05:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('697','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B039017,  Total: 1,860,078.00','2025-08-28 10:06:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('698','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO15558,  Total: 1,979,724.14','2025-08-28 10:09:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('699','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 293 with tested fuel 10','2025-08-28 10:10:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('700','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 294 with tested fuel 05','2025-08-28 10:14:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('701','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 295 with tested fuel 10','2025-08-28 10:15:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('702','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 297 with tested fuel 5','2025-08-28 10:16:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('703','96','2','3','Oil sales ','Oil sales recoded  id: 36 TR NO:20','2025-08-28 10:19:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('704','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 298 with tested fuel 5','2025-08-28 10:20:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('705','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 299 with tested fuel 10','2025-08-28 10:22:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('706','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 300 with tested fuel 5','2025-08-28 10:22:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('707','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 301 with tested fuel 05','2025-08-28 10:23:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('708','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 302 with tested fuel 5','2025-08-28 10:24:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('709','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 303 with tested fuel 10','2025-08-28 10:26:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('710','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B0039017,  Total: 1,196,580.00','2025-08-28 10:26:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('711','95','2','4','Oil sales ','Oil sales recoded  id: 37 TR NO:17','2025-08-28 10:27:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('712','95','2','4','Oil sales ','Oil sales recoded  id: 38 TR NO:18','2025-08-28 10:27:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('713','96','2','3','Oil sales ','Oil sales recoded  id: 39 TR NO:21','2025-08-28 10:29:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('714','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO15596,  Total: 1,959,724.14','2025-08-28 10:34:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('715','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO51824,  Total: 1,863,972.00','2025-08-28 10:35:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('716','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO37817,  Total: 1,863,972.00','2025-08-28 10:35:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('717','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 305 with tested fuel 10','2025-08-28 10:38:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('718','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 306 with tested fuel 10','2025-08-28 10:43:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('719','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 307 with tested fuel 05','2025-08-28 10:56:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('720','96','2','3','Oil sales ','Oil sales recoded  id: 40 TR NO:22','2025-08-28 10:57:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('721','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO37980,  Total: 1,959,724.14','2025-08-28 11:01:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('722','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO37979,  Total: 1,863,972.00','2025-08-28 11:02:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('723','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 308 with tested fuel 10','2025-08-28 11:04:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('724','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 310 with tested fuel 10','2025-08-28 11:09:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('725','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 311 with tested fuel 05','2025-08-28 11:16:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('726','96','2','3','Oil sales ','Oil sales recoded  id: 41 TR NO:23','2025-08-28 11:17:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('727','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 312 with tested fuel 10','2025-08-28 11:21:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('728','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 313 with tested fuel 05','2025-08-28 11:24:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('729','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 314 with tested fuel 10','2025-08-28 11:26:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('730','95','0','0','Login','Login from 112.135.65.148','2025-08-28 12:42:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('731','95','2','4','New GRN','Add new GRN id: 12 GRN NO:3','2025-08-28 12:50:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('732','96','0','0','Login','Login from 112.135.64.80','2025-08-28 19:12:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('733','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO38326,  Total: 1,863,972.00','2025-08-28 19:27:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('734','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO38314,  Total: 1,196,580.00','2025-08-28 19:29:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('735','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 315 with tested fuel 10','2025-08-28 19:31:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('736','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 317 with tested fuel 05','2025-08-28 19:38:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('737','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 318 with tested fuel 10','2025-08-28 19:40:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('738','96','2','3','Oil sales ','Oil sales recoded  id: 42 TR NO:24','2025-08-28 19:48:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('739','96','2','3','Oil sales ','Oil sales recoded  id: 43 TR NO:25','2025-08-28 19:56:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('740','96','3','3','Cancelled Transfer','Stock Transfer Cancelled : 42 ','2025-08-28 20:00:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('741','96','0','0','Login','Login from 112.135.64.80','2025-08-28 20:32:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('742','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 319 with tested fuel 10','2025-08-28 20:38:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('743','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 320 with tested fuel 10','2025-08-28 20:40:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('744','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 321 with tested fuel 05','2025-08-28 20:46:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('745','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO15934,  Total: 1,959,724.14','2025-08-28 20:52:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('746','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO38753,  Total: 1,863,972.00','2025-08-28 20:54:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('747','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 322 with tested fuel 10','2025-08-28 20:56:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('748','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 323 with tested fuel 10','2025-08-28 21:16:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('749','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 324 with tested fuel 05','2025-08-28 21:23:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('750','96','2','3','Oil sales ','Oil sales recoded  id: 44 TR NO:26','2025-08-28 21:25:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('751','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 325 with tested fuel 10','2025-08-28 21:31:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('752','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 326 with tested fuel 10','2025-08-28 21:33:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('753','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 327 with tested fuel 05','2025-08-28 21:38:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('754','96','2','3','Oil sales ','Oil sales recoded  id: 45 TR NO:27','2025-08-28 21:41:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('755','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO16047,  Total: 1,959,724.14','2025-08-28 21:42:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('756','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO1863972,  Total: 1,863,972.00','2025-08-28 21:43:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('757','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 328 with tested fuel 10','2025-08-28 21:44:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('758','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 329 with tested fuel 10','2025-08-28 21:48:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('759','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 330 with tested fuel 05','2025-08-28 21:53:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('760','94','0','0','Login','Login from 112.135.66.42','2025-08-29 08:42:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('761','95','0','0','Login','Login from 175.157.15.150','2025-08-30 15:08:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('762','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 331 with tested fuel 10','2025-08-30 15:09:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('763','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 333 with tested fuel 5','2025-08-30 15:11:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('764','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 334 with tested fuel 5','2025-08-30 15:12:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('765','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 335 with tested fuel 10','2025-08-30 15:13:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('766','95','2','4','Oil sales ','Oil sales recoded  id: 46 TR NO:19','2025-08-30 15:15:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('767','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 336 with tested fuel 10','2025-08-30 15:16:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('768','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 338 with tested fuel 5','2025-08-30 15:23:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('769','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 339 with tested fuel 5','2025-08-30 15:25:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('770','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 340 with tested fuel 10','2025-08-30 15:27:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('771','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B039373,4,  Total: 2,393,160.00','2025-08-30 15:28:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('772','95','0','0','Login','Login from 175.157.15.150','2025-08-30 15:43:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('773','96','0','0','Login','Login from 112.135.65.138','2025-08-31 10:10:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('774','96','2','3','Oil sales ','Oil sales recoded  id: 47 TR NO:28','2025-08-31 10:12:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('775','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 341 with tested fuel 10','2025-08-31 10:17:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('776','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 342 with tested fuel 05','2025-08-31 10:24:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('777','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 343 with tested fuel 10','2025-08-31 10:25:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('778','96','2','3','Oil sales ','Oil sales recoded  id: 48 TR NO:29','2025-08-31 10:31:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('779','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO16208,  Total: 1,963,533.00','2025-08-31 10:35:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('780','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO39382,  Total: 1,867,800.00','2025-08-31 10:35:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('781','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 344 with tested fuel 10','2025-08-31 10:36:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('782','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 345 with tested fuel 10','2025-08-31 10:41:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('783','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 346 with tested fuel 05','2025-08-31 10:47:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('784','96','2','3','Oil sales ','Oil sales recoded  id: 49 TR NO:30','2025-08-31 10:52:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('785','95','0','0','Login','Login from 123.231.124.168','2025-08-31 22:55:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('786','95','0','0','Login','Login from 123.231.124.168','2025-09-01 01:23:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('787','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 347 with tested fuel 10','2025-09-01 01:24:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('788','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B016276,  Total: 1,955,849.61','2025-09-01 01:25:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('789','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 349 with tested fuel 5','2025-09-01 01:27:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('790','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 350 with tested fuel 5','2025-09-01 01:28:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('791','95','2','4','Fuel Pump Test Cancelled','Fuel pump test 257 cancelled','2025-09-01 01:28:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('792','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 350 with tested fuel 5','2025-09-01 01:28:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('793','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 351 with tested fuel 10','2025-09-01 01:30:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('794','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 352 with tested fuel 10','2025-09-01 01:32:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('795','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B039744,  Total: 1,860,078.00','2025-09-01 01:36:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('796','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 355 with tested fuel 10','2025-09-01 01:42:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('797','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 356 with tested fuel 10','2025-09-01 01:43:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('798','95','2','4','Oil sales ','Oil sales recoded  id: 50 TR NO:20','2025-09-01 01:45:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('799','95','2','4','Oil sales ','Oil sales recoded  id: 51 TR NO:21','2025-09-01 01:45:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('800','95','2','4','Oil sales ','Oil sales recoded  id: 52 TR NO:22','2025-09-01 01:45:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('801','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B039983,  Total: 1,196,580.00','2025-09-01 01:53:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('802','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B039981,  Total: 186,500.00','2025-09-01 01:53:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('803','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 357 with tested fuel 10','2025-09-01 01:54:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('804','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 359 with tested fuel 5','2025-09-01 01:56:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('805','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 360 with tested fuel 5','2025-09-01 01:57:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('806','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 361 with tested fuel 5','2025-09-01 02:11:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('807','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 362 with tested fuel 5','2025-09-01 02:12:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('808','95','2','4','Oil sales ','Oil sales recoded  id: 53 TR NO:23','2025-09-01 02:13:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('809','95','2','4','Oil sales ','Oil sales recoded  id: 54 TR NO:24','2025-09-01 02:13:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('810','95','2','4','Oil sales ','Oil sales recoded  id: 55 TR NO:25','2025-09-01 02:14:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('811','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 363 with tested fuel 10','2025-09-01 02:15:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('812','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 364 with tested fuel 5','2025-09-01 02:20:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('813','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 365 with tested fuel 5','2025-09-01 02:25:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('814','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 366 with tested fuel 5','2025-09-01 02:26:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('815','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 367 with tested fuel 5','2025-09-01 02:27:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('816','95','2','4','Oil sales ','Oil sales recoded  id: 56 TR NO:26','2025-09-01 02:28:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('817','95','2','4','Oil sales ','Oil sales recoded  id: 57 TR NO:27','2025-09-01 02:28:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('818','95','2','4','Oil sales ','Oil sales recoded  id: 58 TR NO:28','2025-09-01 02:29:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('819','95','0','0','Login','Login from 123.231.124.168','2025-09-01 07:38:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('820','1','0','0','Login','Login from 112.134.240.141','2025-09-01 10:41:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('821','97','0','0','Login','Login from 112.135.69.131','2025-09-02 09:12:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('822','95','0','0','Login','Login from 175.157.14.4','2025-09-02 10:16:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('823','97','0','0','Login','Login from 112.135.76.9','2025-09-02 10:21:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('824','97','1','4','Price Changes','Fuel Price changes added p_id 1 , Price Rs. 299  time of effect  2025-09-01T00:00 00:01:00 ','2025-09-02 10:28:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('825','97','1','4','Price Changes','Fuel Price changes added p_id 3 , Price Rs. 283  time of effect  2025-09-01T00:00 00:01:00 ','2025-09-02 10:29:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('826','95','0','0','Login','Login from 175.157.14.4','2025-09-02 12:28:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('827','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B016518,  Total: 1,908,041.85','2025-09-02 12:31:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('828','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 368 with tested fuel 10','2025-09-02 12:31:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('829','95','0','0','Login','Login from 175.157.14.4','2025-09-02 12:41:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('830','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 370 with tested fuel 5','2025-09-02 12:43:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('831','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 371 with tested fuel 5','2025-09-02 12:45:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('832','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 372 with tested fuel 10','2025-09-02 12:47:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('833','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B040195,96,  Total: 2,393,160.00','2025-09-02 12:48:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('834','1','0','0','Login','Login from 212.104.231.82','2025-09-02 18:00:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('835','96','0','0','Login','Login from 112.135.71.1','2025-09-03 19:51:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('836','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 374 with tested fuel 10','2025-09-03 19:55:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('837','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 376 with tested fuel 130','2025-09-03 20:04:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('838','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 378 with tested fuel 05','2025-09-03 20:07:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('839','96','2','3','Oil sales ','Oil sales recoded  id: 59 TR NO:31','2025-09-03 20:10:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('840','96','2','3','Oil sales ','Oil sales recoded  id: 60 TR NO:32','2025-09-03 20:10:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('841','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO296,  Total: 1,963,538.00','2025-09-03 20:16:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('842','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 379 with tested fuel 10','2025-09-03 20:18:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('843','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 380 with tested fuel 05','2025-09-03 20:25:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('844','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 381 with tested fuel 10','2025-09-03 20:26:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('845','96','2','3','Oil sales ','Oil sales recoded  id: 61 TR NO:33','2025-09-03 20:38:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('846','96','2','3','Oil sales ','Oil sales recoded  id: 62 TR NO:34','2025-09-03 20:39:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('847','96','2','3','Oil sales ','Oil sales recoded  id: 63 TR NO:35','2025-09-03 20:39:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('848','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO4004,  Total: 1,963,533.00','2025-09-03 20:41:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('849','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 383 with tested fuel 10','2025-09-03 20:42:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('850','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 384 with tested fuel 10','2025-09-03 20:47:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('851','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 386 with tested fuel 05','2025-09-03 20:52:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('852','96','2','3','Oil sales ','Oil sales recoded  id: 64 TR NO:36','2025-09-03 20:53:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('853','96','2','3','Oil sales ','Oil sales recoded  id: 65 TR NO:37','2025-09-03 20:54:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('854','96','2','3','Oil sales ','Oil sales recoded  id: 66 TR NO:38','2025-09-03 20:54:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('855','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 387 with tested fuel 10','2025-09-03 21:07:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('856','96','0','0','Login','Login from 112.135.72.56','2025-09-03 21:16:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('857','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 389 with tested fuel 10','2025-09-03 21:19:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('858','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 391 with tested fuel 05','2025-09-03 21:22:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('859','96','2','3','Oil sales ','Oil sales recoded  id: 67 TR NO:39','2025-09-03 21:24:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('860','96','2','3','Oil sales ','Oil sales recoded  id: 68 TR NO:40','2025-09-03 21:25:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('861','1','0','0','Login','Login from 112.134.241.173','2025-09-04 08:13:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('862','1','0','0','Login','Login from 112.134.241.173','2025-09-04 08:38:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('863','96','0','0','Login','Login from 112.135.77.103','2025-09-04 19:48:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('864','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO40197,  Total: 1,815,924.00','2025-09-04 19:50:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('865','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO16519,  Total: 1,911,916.38','2025-09-04 19:51:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('866','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 392 with tested fuel 10','2025-09-04 19:51:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('867','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 393 with tested fuel 10','2025-09-04 19:55:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('868','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 395 with tested fuel 05','2025-09-04 19:59:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('869','96','2','3','Oil sales ','Oil sales recoded  id: 69 TR NO:41','2025-09-04 20:02:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('870','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 396 with tested fuel 10','2025-09-04 20:04:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('871','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 397 with tested fuel 10','2025-09-04 20:07:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('872','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 399 with tested fuel 05','2025-09-04 20:21:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('873','96','2','3','Oil sales ','Oil sales recoded  id: 70 TR NO:42','2025-09-04 20:25:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('874','95','0','0','Login','Login from 111.223.186.231','2025-09-06 08:28:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('875','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 400 with tested fuel 10','2025-09-06 08:30:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('876','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B016531,  Total: 1,908,041.85','2025-09-06 08:31:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('877','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B016529,  Total: 1,812,030.00','2025-09-06 08:31:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('878','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 402 with tested fuel 5','2025-09-06 08:33:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('879','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 403 with tested fuel 5','2025-09-06 08:34:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('880','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 404 with tested fuel 10','2025-09-06 08:35:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('881','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 405 with tested fuel 10','2025-09-06 08:38:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('882','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B040671,  Total: 1,908,041.85','2025-09-06 08:39:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('883','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B040657,58,  Total: 2,393,160.00','2025-09-06 08:40:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('884','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 407 with tested fuel 5','2025-09-06 08:50:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('885','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 408 with tested fuel 5','2025-09-06 08:55:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('886','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 409 with tested fuel 5','2025-09-06 08:56:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('887','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 410 with tested fuel 5','2025-09-06 08:58:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('888','95','2','4','Oil sales ','Oil sales recoded  id: 71 TR NO:29','2025-09-06 09:01:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('889','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 411 with tested fuel 5','2025-09-06 09:03:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('890','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 411 with tested fuel 5','2025-09-06 09:04:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('891','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 413 with tested fuel 5','2025-09-06 09:06:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('892','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 414 with tested fuel 5','2025-09-06 09:06:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('893','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 415 with tested fuel 10','2025-09-06 09:10:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('894','95','2','4','Oil sales ','Oil sales recoded  id: 72 TR NO:30','2025-09-06 09:11:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('895','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 416 with tested fuel 10','2025-09-06 09:24:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('896','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B041190,  Total: 1,908,041.85','2025-09-06 09:25:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('897','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 418 with tested fuel 5','2025-09-06 09:29:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('898','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B041191,B016796,  Total: 3,624,060.00','2025-09-06 09:31:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('899','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 419 with tested fuel 5','2025-09-06 09:32:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('900','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 420 with tested fuel 5','2025-09-06 09:33:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('901','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 421 with tested fuel 5','2025-09-06 09:34:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('902','1','0','0','Login','Login from 212.104.231.37','2025-09-07 20:45:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('903','97','0','0','Login','Login from 112.135.71.228','2025-09-08 14:55:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('904','97','0','0','Login','Login from 112.135.78.30','2025-09-09 08:31:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('905','95','0','0','Login','Login from 175.157.16.235','2025-09-09 08:58:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('906','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 422 with tested fuel 10','2025-09-09 09:00:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('907','96','0','0','Login','Login from 112.135.65.68','2025-09-09 09:05:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('908','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 424 with tested fuel 5','2025-09-09 09:06:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('909','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B041361,  Total: 1,812,030.00','2025-09-09 09:08:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('910','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B041362,  Total: 1,196,580.00','2025-09-09 09:08:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('911','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 425 with tested fuel 10','2025-09-09 09:09:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('912','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 426 with tested fuel 5','2025-09-09 09:11:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('913','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 427 with tested fuel 10','2025-09-09 09:11:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('914','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 428 with tested fuel 10','2025-09-09 09:12:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('915','95','2','4','Oil sales ','Oil sales recoded  id: 73 TR NO:31','2025-09-09 09:13:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('916','95','2','4','Oil sales ','Oil sales recoded  id: 74 TR NO:32','2025-09-09 09:13:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('917','95','2','4','Oil sales ','Oil sales recoded  id: 75 TR NO:33','2025-09-09 09:14:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('918','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 430 with tested fuel 05','2025-09-09 09:16:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('919','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 431 with tested fuel 10','2025-09-09 09:16:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('920','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 432 with tested fuel 10','2025-09-09 09:19:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('921','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 433 with tested fuel 10','2025-09-09 09:20:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('922','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 434 with tested fuel 05','2025-09-09 09:21:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('923','96','0','0','Login','Login from 112.135.65.68','2025-09-09 09:25:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('924','94','0','0','Login','Login from 112.135.68.228','2025-09-09 09:27:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('925','1','0','0','Login','Login from 212.104.231.254','2025-09-09 09:31:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('926','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 436 with tested fuel 10','2025-09-09 09:31:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('927','96','2','3','Oil sales ','Oil sales recoded  id: 76 TR NO:43','2025-09-09 09:49:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('928','96','2','3','Oil sales ','Oil sales recoded  id: 77 TR NO:44','2025-09-09 09:49:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('929','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 438 with tested fuel 10','2025-09-09 09:54:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('930','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 439 with tested fuel 10','2025-09-09 10:03:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('931','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 441 with tested fuel 05','2025-09-09 10:05:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('932','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO40934,  Total: 1,815,924.00','2025-09-09 10:07:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('933','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 442 with tested fuel 5','2025-09-09 10:28:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('934','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 443 with tested fuel 5','2025-09-09 10:31:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('935','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 444 with tested fuel 10','2025-09-09 10:32:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('936','95','2','4','Oil sales ','Oil sales recoded  id: 78 TR NO:34','2025-09-09 10:35:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('937','95','2','4','Oil sales ','Oil sales recoded  id: 79 TR NO:35','2025-09-09 10:36:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('938','97','0','0','Login','Login from 112.135.65.68','2025-09-09 11:01:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('939','95','0','0','Login','Login from 175.157.16.235','2025-09-09 12:30:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('940','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 445 with tested fuel 10','2025-09-09 12:31:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('941','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 446 with tested fuel 5','2025-09-09 12:36:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('942','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 447 with tested fuel 5','2025-09-09 12:39:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('943','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B016967,  Total: 1,908,041.85','2025-09-09 13:03:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('944','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B041579,  Total: 1,812,030.00','2025-09-09 13:04:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('945','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B041576,  Total: 1,196,580.00','2025-09-09 13:04:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('946','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 451 with tested fuel 10','2025-09-09 13:07:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('947','1','0','0','Login','Login from 175.157.123.252','2025-09-09 18:05:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('948','1','1','4','System Setup','Default OIL created with p_id = 0','2025-09-09 18:07:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('949','1','0','0','Login','Login from 175.157.123.252','2025-09-09 19:04:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('950','1','0','0','Login','Login from 175.157.123.252','2025-09-09 19:09:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('951','1','0','0','Login','Login from 175.157.123.252','2025-09-09 20:34:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('952','96','0','0','Login','Login from 112.135.76.93','2025-09-09 21:08:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('953','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 453 with tested fuel 10','2025-09-09 21:17:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('954','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 454 with tested fuel 10','2025-09-09 21:20:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('955','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 456 with tested fuel 05','2025-09-09 21:23:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('956','96','2','3','Oil sales ','Oil sales recoded  id: 80 TR NO:45','2025-09-09 21:25:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('957','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 457 with tested fuel 10','2025-09-09 21:26:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('958','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 458 with tested fuel 10','2025-09-09 21:28:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('959','96','2','3','Oil sales ','Oil sales recoded  id: 81 TR NO:46','2025-09-09 21:33:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('960','95','0','0','Login','Login from 175.157.16.235','2025-09-10 09:09:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('961','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 461 with tested fuel 10','2025-09-10 09:10:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('962','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 462 with tested fuel 5','2025-09-10 09:11:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('963','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 463 with tested fuel 5','2025-09-10 09:12:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('964','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 464 with tested fuel 10','2025-09-10 09:13:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('965','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B041803,  Total: 1,908,041.85','2025-09-10 09:15:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('966','97','0','0','Login','Login from 112.135.68.66','2025-09-10 16:04:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('967','95','0','0','Login','Login from 111.223.176.43','2025-09-11 08:48:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('968','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 465 with tested fuel 10','2025-09-11 08:50:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('969','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B017098,  Total: 1,908,041.85','2025-09-11 09:05:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('970','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B014960/61,  Total: 2,393,160.00','2025-09-11 09:07:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('971','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 466 with tested fuel 5','2025-09-11 09:10:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('972','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 467 with tested fuel 5','2025-09-11 09:14:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('973','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 468 with tested fuel 5','2025-09-11 09:17:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('974','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 469 with tested fuel 5','2025-09-11 09:19:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('975','95','2','4','Oil sales ','Oil sales recoded  id: 82 TR NO:36','2025-09-11 09:24:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('976','95','2','4','Oil sales ','Oil sales recoded  id: 83 TR NO:37','2025-09-11 09:27:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('977','96','0','0','Login','Login from 112.135.69.180','2025-09-11 10:05:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('978','96','2','3','New GRN','Add new GRN id: 13 GRN NO:10','2025-09-11 10:07:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('979','96','2','3','New GRN','Add new GRN id: 14 GRN NO:11','2025-09-11 10:21:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('980','96','0','0','Login','Login from 112.135.69.180','2025-09-11 10:37:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('981','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: Bo16795,  Total: 1,911,916.36','2025-09-11 10:48:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('982','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO16968,  Total: 1,911,916.38','2025-09-11 10:51:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('983','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO41582,  Total: 1,815,924.00','2025-09-11 10:51:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('984','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 470 with tested fuel 10','2025-09-11 10:53:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('985','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 471 with tested fuel 10','2025-09-11 10:57:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('986','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 473 with tested fuel 05','2025-09-11 11:03:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('987','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO17013,  Total: 1,196,580.00','2025-09-11 11:08:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('988','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO41802,  Total: 1,815,924.00','2025-09-11 11:09:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('989','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 474 with tested fuel 10','2025-09-11 11:10:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('990','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 475 with tested fuel 10','2025-09-11 11:37:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('991','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 477 with tested fuel 05','2025-09-11 11:41:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('992','95','0','0','Login','Login from 111.223.176.43','2025-09-12 08:46:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('993','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 478 with tested fuel 10','2025-09-12 08:48:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('994','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 479 with tested fuel 5','2025-09-12 08:50:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('995','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 480 with tested fuel 5','2025-09-12 08:51:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('996','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 481 with tested fuel 5','2025-09-12 08:52:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('997','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 482 with tested fuel 5','2025-09-12 08:53:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('998','96','0','0','Login','Login from 112.135.73.56','2025-09-12 10:03:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('999','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 483 with tested fuel 10','2025-09-12 10:06:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1000','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 484 with tested fuel 10','2025-09-12 10:10:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1001','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 485 with tested fuel 05','2025-09-12 10:13:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1002','96','2','3','Oil sales ','Oil sales recoded  id: 84 TR NO:47','2025-09-12 10:16:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1003','97','0','0','Login','Login from 112.135.68.179','2025-09-12 13:55:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1004','96','0','0','Login','Login from 112.135.71.167','2025-09-12 16:29:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1005','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO42108,  Total: 1,911,916.38','2025-09-12 16:31:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1006','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO42019,  Total: 1,815,924.00','2025-09-12 16:31:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1007','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 487 with tested fuel 10','2025-09-12 16:32:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1008','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 488 with tested fuel 10','2025-09-12 16:34:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1009','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 490 with tested fuel 05','2025-09-12 16:39:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1010','96','2','3','Oil sales ','Oil sales recoded  id: 85 TR NO:48','2025-09-12 16:41:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1011','96','2','3','Oil sales ','Oil sales recoded  id: 86 TR NO:49','2025-09-12 16:41:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1012','96','2','3','Oil sales ','Oil sales recoded  id: 87 TR NO:50','2025-09-12 16:42:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1013','95','0','0','Login','Login from 175.157.141.85','2025-09-12 17:20:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1014','95','0','0','Login','Login from 175.157.141.85','2025-09-13 08:22:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1015','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B042308,  Total: 1,812,030.00','2025-09-13 08:23:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1016','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 491 with tested fuel 10','2025-09-13 08:23:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1017','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 492 with tested fuel 5','2025-09-13 08:27:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1018','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 493 with tested fuel 5','2025-09-13 08:30:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1019','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 494 with tested fuel 10','2025-09-13 08:32:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1020','95','2','4','Oil sales ','Oil sales recoded  id: 88 TR NO:38','2025-09-13 08:33:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1021','1','0','0','Login','Login from 111.223.184.196','2025-09-13 11:13:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1022','1','0','0','Login','Login from 111.223.184.196','2025-09-13 13:00:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1023','96','0','0','Login','Login from 112.135.76.81','2025-09-13 13:44:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1024','96','0','0','Login','Login from 112.135.76.81','2025-09-13 13:46:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1025','96','0','0','Login','Login from 112.135.76.81','2025-09-13 13:47:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1026','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 495 with tested fuel 10','2025-09-13 13:50:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1027','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 497 with tested fuel 5','2025-09-13 14:06:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1028','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 498 with tested fuel 5','2025-09-13 14:15:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1029','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 499 with tested fuel 5','2025-09-13 14:21:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1030','95','0','0','Login','Login from 175.157.139.40','2025-09-14 07:48:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1031','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B017291,  Total: 1,916,447.61','2025-09-14 07:49:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1032','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B017290/B042559/B042560,  Total: 5,436,090.00','2025-09-14 07:50:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1033','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B017289/B042561,  Total: 2,393,160.00','2025-09-14 07:51:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1034','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 500 with tested fuel 10','2025-09-14 07:52:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1035','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 501 with tested fuel 5','2025-09-14 07:53:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1036','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 502 with tested fuel 5','2025-09-14 07:54:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1037','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 503 with tested fuel 10','2025-09-14 07:55:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1038','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 503 with tested fuel 10','2025-09-14 07:56:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1039','96','0','0','Login','Login from 112.135.69.126','2025-09-14 19:21:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1040','96','0','0','Login','Login from 112.135.69.126','2025-09-14 19:25:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1041','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO17312,  Total: 1,911,916.38','2025-09-14 19:34:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1042','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO42598,  Total: 1,815,924.00','2025-09-14 19:35:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1043','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 504 with tested fuel 10','2025-09-14 19:37:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1044','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 505 with tested fuel 10','2025-09-14 19:45:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1045','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 507 with tested fuel 05','2025-09-14 19:53:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1046','96','2','3','Oil sales ','Oil sales recoded  id: 89 TR NO:51','2025-09-14 19:55:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1047','95','0','0','Login','Login from 175.157.41.216','2025-09-15 08:30:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1048','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 508 with tested fuel 10','2025-09-15 08:33:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1049','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 509 with tested fuel 5','2025-09-15 08:38:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1050','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 510 with tested fuel 5','2025-09-15 08:52:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1051','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 511 with tested fuel 5','2025-09-15 08:59:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1052','96','0','0','Login','Login from 112.135.67.215','2025-09-15 10:06:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1053','95','0','0','Login','Login from 175.157.41.216','2025-09-15 10:08:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1054','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO42306,  Total: 1,815,924.00','2025-09-15 10:08:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1055','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO42307,  Total: 1,815,924.00','2025-09-15 10:09:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1056','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 512 with tested fuel 10','2025-09-15 10:10:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1057','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 513 with tested fuel 10','2025-09-15 10:15:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1058','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 515 with tested fuel 5','2025-09-15 10:23:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1059','96','2','3','Oil sales ','Oil sales recoded  id: 90 TR NO:52','2025-09-15 10:25:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1060','96','0','0','Login','Login from 112.135.67.215','2025-09-15 10:36:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1061','95','0','0','Login','Login from 175.157.41.216','2025-09-15 22:22:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1062','95','0','0','Login','Login from 175.157.41.216','2025-09-15 22:29:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1063','95','0','0','Login','Login from 175.157.41.216','2025-09-16 07:50:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1064','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 516 with tested fuel 10','2025-09-16 07:50:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1065','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B042871,  Total: 1,916,447.61','2025-09-16 07:51:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1066','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B0042871,  Total: 3,640,956.00','2025-09-16 07:52:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1067','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 518 with tested fuel 5','2025-09-16 07:58:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1068','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 519 with tested fuel 5','2025-09-16 08:01:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1069','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 520 with tested fuel 10','2025-09-16 08:02:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1070','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 520 with tested fuel 10','2025-09-16 08:02:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1071','95','2','4','Fuel Pump Test Cancelled','Fuel pump test 393 cancelled','2025-09-16 08:03:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1072','95','2','4','Oil sales ','Oil sales recoded  id: 91 TR NO:39','2025-09-16 08:12:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1073','96','0','0','Login','Login from 112.135.68.75','2025-09-16 10:21:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1074','96','0','0','Login','Login from 112.135.68.75','2025-09-16 11:28:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1075','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO17431,  Total: 1,917,826.68','2025-09-16 11:31:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1076','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO42921,  Total: 1,815,924.00','2025-09-16 11:34:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1077','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO42922,  Total: 1,815,924.00','2025-09-16 11:35:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1078','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 521 with tested fuel 10','2025-09-16 11:38:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1079','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 522 with tested fuel 10','2025-09-16 11:53:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1080','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 524 with tested fuel 5','2025-09-16 12:09:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1081','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:23:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1082','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:29:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1083','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:32:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1084','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:34:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1085','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:34:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1086','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:35:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1087','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:35:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1088','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:36:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1089','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:36:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1090','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:37:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1091','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:38:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1092','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:38:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1093','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:39:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1094','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:40:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1095','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:41:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1096','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:41:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1097','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:42:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1098','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:43:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1099','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:44:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1100','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:45:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1101','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:45:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1102','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:46:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1103','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:47:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1104','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:53:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1105','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:54:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1106','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:54:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1107','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:55:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1108','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:55:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1109','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:55:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1110','96','0','0','Login','Login from 112.135.78.90','2025-09-16 12:56:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1111','97','0','0','Login','Login from 112.135.78.183','2025-09-16 14:01:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1112','96','0','0','Login','Login from 112.134.185.98','2025-09-16 18:06:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1113','96','0','0','Login','Login from 112.134.185.98','2025-09-16 18:06:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1114','96','0','0','Login','Login from 112.134.185.98','2025-09-16 18:08:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1115','96','0','0','Login','Login from 112.134.185.98','2025-09-16 18:31:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1116','96','0','0','Login','Login from 112.134.185.98','2025-09-16 20:52:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1117','95','0','0','Login','Login from 175.157.41.216','2025-09-17 07:43:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1118','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 525 with tested fuel 10','2025-09-17 07:44:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1119','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 527 with tested fuel 5','2025-09-17 07:47:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1120','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 528 with tested fuel 5','2025-09-17 07:52:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1121','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 529 with tested fuel 10','2025-09-17 07:53:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1122','95','2','4','Fuel Pump Test Cancelled','Fuel pump test 401 cancelled','2025-09-17 07:54:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1123','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 529 with tested fuel 15','2025-09-17 07:54:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1124','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B043070,71,  Total: 2,393,160.00','2025-09-17 07:56:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1125','97','0','0','Login','Login from 112.135.76.85','2025-09-17 10:16:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1126','96','0','0','Login','Login from 112.134.186.186','2025-09-17 10:53:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1127','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 530 with tested fuel 10','2025-09-17 11:11:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1128','96','0','0','Login','Login from 112.134.189.26','2025-09-17 11:31:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1129','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 531 with tested fuel 10','2025-09-17 11:49:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1130','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 533 with tested fuel 5','2025-09-17 11:59:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1131','96','2','3','Oil sales ','Oil sales recoded  id: 92 TR NO:53','2025-09-17 12:07:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1132','96','0','0','Login','Login from 112.134.189.26','2025-09-17 12:18:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1133','97','0','0','Login','Login from 112.135.76.85','2025-09-17 13:48:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1134','97','0','0','Login','Login from 112.135.76.85','2025-09-17 13:51:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1135','96','0','0','Login','Login from 112.134.189.26','2025-09-17 21:09:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1136','95','0','0','Login','Login from 175.157.138.71','2025-09-18 07:22:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1137','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 534 with tested fuel 10','2025-09-18 07:23:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1138','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B017555,  Total: 1,916,447.61','2025-09-18 07:24:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1139','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B017553,  Total: 1,196,580.00','2025-09-18 07:25:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1140','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 536 with tested fuel 5','2025-09-18 07:26:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1141','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 537 with tested fuel 5','2025-09-18 07:28:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1142','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 538 with tested fuel 10','2025-09-18 07:29:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1143','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 538 with tested fuel 10','2025-09-18 07:29:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1144','95','2','4','Fuel Pump Test Cancelled','Fuel pump test 409 cancelled','2025-09-18 07:29:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1145','95','2','4','Oil sales ','Oil sales recoded  id: 93 TR NO:40','2025-09-18 07:31:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1146','96','0','0','Login','Login from 112.134.184.183','2025-09-18 15:13:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1147','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 539 with tested fuel 10','2025-09-18 15:16:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1148','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 540 with tested fuel 10','2025-09-18 15:18:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1149','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 542 with tested fuel 5','2025-09-18 15:26:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1150','96','0','0','Login','Login from 124.43.240.39','2025-09-18 15:34:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1151','95','0','0','Login','Login from 175.157.138.71','2025-09-18 22:29:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1152','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 543 with tested fuel 10','2025-09-18 22:30:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1153','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 544 with tested fuel 5','2025-09-18 22:37:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1154','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 545 with tested fuel 5','2025-09-18 22:38:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1155','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 546 with tested fuel 10','2025-09-18 22:39:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1156','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B043413,414,  Total: 2,393,160.00','2025-09-18 22:41:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1157','95','0','0','Login','Login from 175.157.138.71','2025-09-19 07:45:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1158','95','0','0','Login','Login from 175.157.138.71','2025-09-19 10:45:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1159','96','0','0','Login','Login from 112.134.185.0','2025-09-19 13:01:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1160','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO43461,  Total: 1,917,826.68','2025-09-19 13:04:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1161','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO43460,  Total: 1,821,864.00','2025-09-19 13:08:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1162','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 548 with tested fuel 10','2025-09-19 13:10:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1163','97','0','0','Login','Login from 112.135.74.83','2025-09-19 13:11:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1164','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 549 with tested fuel 10','2025-09-19 13:23:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1165','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 551 with tested fuel 5','2025-09-19 13:36:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1166','96','2','3','Oil sales ','Oil sales recoded  id: 94 TR NO:54','2025-09-19 13:41:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1167','95','0','0','Login','Login from 175.157.139.202','2025-09-19 21:44:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1168','95','0','0','Login','Login from 175.157.139.202','2025-09-20 07:46:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1169','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 552 with tested fuel 10','2025-09-20 07:46:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1170','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 554 with tested fuel 5','2025-09-20 07:48:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1171','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 555 with tested fuel 5','2025-09-20 07:49:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1172','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 556 with tested fuel 10','2025-09-20 07:51:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1173','95','2','4','Oil sales ','Oil sales recoded  id: 95 TR NO:41','2025-09-20 07:52:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1174','1','0','0','Login','Login from 112.134.242.157','2025-09-22 10:15:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1175','96','0','0','Login','Login from 112.134.187.68','2025-09-22 10:16:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1176','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 557 with tested fuel 10','2025-09-22 10:21:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1177','95','0','0','Login','Login from 123.231.86.157','2025-09-22 10:21:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1178','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 559 with tested fuel 10','2025-09-22 10:24:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1179','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 561 with tested fuel 5','2025-09-22 10:28:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1180','96','2','3','Oil sales ','Oil sales recoded  id: 96 TR NO:55','2025-09-22 10:29:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1181','96','2','3','Cancelled Credit Sale','Credit sale cancelled. Vehicle No: CAB, Total Sales: 19,527.00','2025-09-22 10:33:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1182','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO43792,  Total: 1,917,826.68','2025-09-22 10:36:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1183','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO43791,  Total: 1,821,804.00','2025-09-22 10:37:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1184','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 562 with tested fuel 10','2025-09-22 10:39:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1185','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 563 with tested fuel 10','2025-09-22 10:43:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1186','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 565 with tested fuel 05','2025-09-22 10:44:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1187','96','2','3','Oil sales ','Oil sales recoded  id: 97 TR NO:56','2025-09-22 10:45:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1188','95','0','0','Login','Login from 123.231.86.157','2025-09-22 11:21:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1189','96','0','0','Login','Login from 112.134.186.161','2025-09-22 12:40:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1190','95','0','0','Login','Login from 123.231.86.157','2025-09-22 12:50:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1191','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 566 with tested fuel 10','2025-09-22 12:52:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1192','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 568 with tested fuel 5','2025-09-22 12:55:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1193','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 569 with tested fuel 5','2025-09-22 12:57:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1194','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 570 with tested fuel 10','2025-09-22 12:57:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1195','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B043803,  Total: 1,916,447.61','2025-09-22 12:58:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1196','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B043801,802,  Total: 3,640,956.00','2025-09-22 12:59:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1197','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 571 with tested fuel 10','2025-09-22 13:00:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1198','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 573 with tested fuel 5','2025-09-22 13:02:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1199','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 574 with tested fuel 5','2025-09-22 13:03:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1200','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 575 with tested fuel 10','2025-09-22 13:03:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1201','96','0','0','Login','Login from 112.134.186.161','2025-09-22 15:20:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1202','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 576 with tested fuel 10','2025-09-22 15:21:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1203','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 577 with tested fuel 10','2025-09-22 15:25:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1204','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 579 with tested fuel 5','2025-09-22 15:30:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1205','96','2','3','Oil sales ','Oil sales recoded  id: 98 TR NO:57','2025-09-22 15:31:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1206','96','0','0','Login','Login from 112.134.186.161','2025-09-22 17:14:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1207','96','0','0','Login','Login from 112.134.186.161','2025-09-22 21:57:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1208','95','0','0','Login','Login from 112.134.185.158','2025-09-23 10:15:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1209','94','0','0','Login','Login from 112.134.185.158','2025-09-23 10:20:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1210','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Petrol, Short: 441.000 Ltr','2025-09-23 10:25:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1211','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Diesel, Short: 4.000 Ltr','2025-09-23 10:29:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1212','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Kerosene, Short: 3.000 Ltr','2025-09-23 10:30:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1213','94','1','4','Fuel Capacity','Fuel Capacity Updated For PULMODDAI 100998.','2025-09-23 11:27:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1214','94','1','3','Fuel Capacity','Fuel Capacity Updated For SRIPURA 100517.','2025-09-23 11:28:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1215','97','0','0','Login','Login from 112.134.185.158','2025-09-23 15:50:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1216','96','0','0','Login','Login from 112.134.185.158','2025-09-23 15:50:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1217','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO17820,  Total: 1,917,826.68','2025-09-23 15:52:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1218','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO44013,44015,  Total: 3,643,728.00','2025-09-23 15:53:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1219','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 580 with tested fuel 10','2025-09-23 15:53:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1220','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 581 with tested fuel 10','2025-09-23 15:56:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1221','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 583 with tested fuel 5','2025-09-23 16:00:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1222','96','0','0','Login','Login from 112.134.185.158','2025-09-23 16:04:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1223','1','0','0','Login','Login from 111.223.191.128','2025-09-23 21:03:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1224','1','2','3','Settlement Added','Settlement added: Date 2025-09-23, Source Cash, Amount 123, Memo ','2025-09-23 21:27:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1225','1','2','3','Settlement Cancelled','Settlement 0 cancelled','2025-09-23 21:27:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1226','1','2','3','Settlement Added','Settlement added: Date 2025-09-23, Source Cash, Amount 2510, Memo ','2025-09-23 21:29:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1227','96','0','0','Login','Login from 112.134.191.85','2025-09-23 21:39:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1228','1','2','3','Settlement Added','Settlement added: Date 2025-09-02, Source Cash, Amount 2500, Memo 123','2025-09-23 21:49:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1229','96','0','0','Login','Login from 112.134.191.85','2025-09-24 10:12:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1230','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 584 with tested fuel 10','2025-09-24 10:15:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1231','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 585 with tested fuel 10','2025-09-24 10:21:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1232','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 587 with tested fuel 5','2025-09-24 10:40:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1233','96','2','3','Oil sales ','Oil sales recoded  id: 99 TR NO:58','2025-09-24 10:45:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1234','1','0','0','Login','Login from 112.134.242.157','2025-09-24 10:56:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1235','1','2','3','Settlement Added','Settlement added: Date 2025-09-22, Source Cash, Amount 2500, Memo sadsad','2025-09-24 11:15:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1236','1','2','3','Settlement Added','Settlement added: Date 2025-09-22, Source Cash, Amount 43000000, Memo ','2025-09-24 11:51:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1237','1','2','3','Settlement Added','Settlement added: Date 2025-09-22, Source Cash, Amount 400000, Memo ','2025-09-24 11:51:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1238','1','2','4','Settlement Added','Settlement added: Date 2025-09-01, Source Cash, Amount 62000000, Memo ','2025-09-24 11:53:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1239','1','2','4','Settlement Added','Settlement added: Date 2025-09-01, Source Cash, Amount 62000000, Memo ','2025-09-24 11:53:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1240','1','2','4','Settlement Added','Settlement added: Date 2025-09-01, Source Cash, Amount 6200000, Memo ','2025-09-24 11:54:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1241','1','2','4','Settlement Added','Settlement added: Date 2025-09-01, Source Cash, Amount 6200000, Memo ','2025-09-24 11:54:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1242','1','2','4','Settlement Added','Settlement added: Date 2025-09-01, Source Cash, Amount 5000, Memo ','2025-09-24 11:57:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1243','1','2','4','Settlement Added','Settlement added: Date 2025-09-01, Source Cash, Amount 5000, Memo ','2025-09-24 11:57:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1244','1','2','4','Settlement Added','Settlement added: Date 2025-09-01, Source Cash, Amount 6000, Memo ','2025-09-24 11:59:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1245','1','2','4','Settlement Added','Settlement added: Date 2025-09-01, Source Cash, Amount 10000000, Memo ','2025-09-24 12:17:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1246','1','0','0','Login','Login from 112.134.242.157','2025-09-24 15:17:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1247','1','2','4','Settlement Added','Settlement added: Date 2025-09-21, Source Cash, Amount 5000, Memo ','2025-09-24 15:35:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1248','1','2','4','Settlement Added','Settlement added: Date 2025-09-01, Source Cash, Amount 2120843, Memo ','2025-09-24 15:42:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1249','1','2','4','Settlement Added','Settlement added: Date 2025-09-02, Source Cash, Amount 4000000, Memo ','2025-09-24 15:43:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1250','96','0','0','Login','Login from 112.134.191.85','2025-09-24 17:08:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1251','1','0','0','Login','Login from 111.223.191.128','2025-09-24 18:00:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1252','95','0','0','Login','Login from 111.223.180.221','2025-09-24 18:46:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1253','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 588 with tested fuel 10','2025-09-24 18:47:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1254','95','0','0','Login','Login from 111.223.190.130','2025-09-25 07:18:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1255','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 590 with tested fuel 5','2025-09-25 07:22:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1256','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 591 with tested fuel 5','2025-09-25 07:26:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1257','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 592 with tested fuel 5','2025-09-25 07:28:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1258','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B044051/52,  Total: 2,393,160.00','2025-09-25 07:30:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1259','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 593 with tested fuel 5','2025-09-25 07:30:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1260','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 594 with tested fuel 10','2025-09-25 07:47:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1261','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B087652,  Total: 1,916,447.61','2025-09-25 07:48:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1262','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B087651,  Total: 1,820,478.00','2025-09-25 07:49:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1263','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 596 with tested fuel 5','2025-09-25 07:53:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1264','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 597 with tested fuel 5','2025-09-25 07:54:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1265','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 598 with tested fuel 10','2025-09-25 07:58:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1266','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B042227/226,  Total: 2,393,160.00','2025-09-25 08:01:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1267','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B044336,  Total: 1,916,447.61','2025-09-25 08:03:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1268','96','0','0','Login','Login from 112.134.191.8','2025-09-25 09:38:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1269','96','0','0','Login','Login from 112.134.186.214','2025-09-25 13:58:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1270','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO44334,  Total: 1,821,864.00','2025-09-25 13:59:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1271','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 599 with tested fuel 10','2025-09-25 14:00:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1272','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 600 with tested fuel 10','2025-09-25 14:04:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1273','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 602 with tested fuel 5','2025-09-25 14:08:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1274','96','2','3','Oil sales ','Oil sales recoded  id: 100 TR NO:59','2025-09-25 14:10:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1275','96','0','0','Login','Login from 124.43.240.209','2025-09-25 15:11:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1276','96','0','0','Login','Login from 112.134.186.214','2025-09-25 16:10:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1277','96','0','0','Login','Login from 112.134.186.157','2025-09-26 14:51:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1278','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 603 with tested fuel 10','2025-09-26 14:54:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1279','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 604 with tested fuel 10','2025-09-26 15:00:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1280','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 606 with tested fuel 5','2025-09-26 15:23:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1281','96','2','3','Oil sales ','Oil sales recoded  id: 101 TR NO:60','2025-09-26 15:25:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1282','94','0','0','Login','Login from 112.134.187.131','2025-09-26 16:20:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1283','94','1','4','Fuel Adjustment','Fuel Stock Adjusted - Location: 4, Product: Petrol, Short: 481.000 Ltr','2025-09-26 16:25:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1284','96','0','0','Login','Login from 112.134.190.232','2025-09-26 23:54:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1285','96','0','0','Login','Login from 124.43.240.40','2025-09-27 11:41:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1286','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: bo44681, b o44680,  Total: 3,643,728.00','2025-09-27 11:44:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1287','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: bo18204,  Total: 1,917,826.68','2025-09-27 11:45:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1288','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 607 with tested fuel 10','2025-09-27 11:47:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1289','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 609 with tested fuel 10','2025-09-27 11:52:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1290','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 611 with tested fuel 5','2025-09-27 12:04:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1291','96','0','0','Login','Login from 112.134.188.123','2025-09-27 13:09:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1292','96','0','0','Login','Login from 112.134.186.155','2025-09-29 08:42:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1293','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 612 with tested fuel 10','2025-09-29 08:44:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1294','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 613 with tested fuel 10','2025-09-29 08:47:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1295','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 615 with tested fuel 5','2025-09-29 08:51:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1296','96','2','3','Oil sales ','Oil sales recoded  id: 102 TR NO:61','2025-09-29 08:54:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1297','96','2','3','Oil sales ','Oil sales recoded  id: 103 TR NO:62','2025-09-29 08:55:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1298','95','0','0','Login','Login from 116.206.245.118','2025-09-29 12:18:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1299','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 616 with tested fuel 10','2025-09-29 12:21:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1300','96','0','0','Login','Login from 112.134.186.155','2025-09-29 12:30:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1301','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 618 with tested fuel 10','2025-09-29 12:32:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1302','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 619 with tested fuel 5','2025-09-29 12:41:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1303','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 621 with tested fuel 10','2025-09-29 12:43:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1304','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 622 with tested fuel 5','2025-09-29 12:44:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1305','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 623 with tested fuel 5','2025-09-29 12:45:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1306','96','2','3','Oil sales ','Oil sales recoded  id: 104 TR NO:63','2025-09-29 12:46:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1307','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 624 with tested fuel 10','2025-09-29 12:46:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1308','96','2','3','Oil sales ','Oil sales recoded  id: 105 TR NO:64','2025-09-29 12:46:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1309','96','2','3','Oil sales ','Oil sales recoded  id: 106 TR NO:65','2025-09-29 12:47:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1310','96','0','0','Login','Login from 112.134.186.155','2025-09-29 12:48:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1311','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 625 with tested fuel 10','2025-09-29 13:06:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1312','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B018021,  Total: 1,916,447.61','2025-09-29 13:08:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1313','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 627 with tested fuel 5','2025-09-29 13:08:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1314','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 628 with tested fuel 5','2025-09-29 13:09:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1315','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 629 with tested fuel 10','2025-09-29 13:11:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1316','96','0','0','Login','Login from 112.134.186.155','2025-09-29 13:23:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1317','95','0','0','Login','Login from 116.206.245.118','2025-09-29 14:25:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1318','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 630 with tested fuel 10','2025-09-29 14:25:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1319','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 632 with tested fuel 10','2025-09-29 14:34:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1320','95','2','4','Fuel Pump Test Cancelled','Fuel pump test 481 cancelled','2025-09-29 14:35:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1321','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 632 with tested fuel 5','2025-09-29 14:35:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1322','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 633 with tested fuel 5','2025-09-29 14:41:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1323','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B044658/657-B044659,  Total: 5,465,592.00','2025-09-29 14:43:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1324','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B018154,  Total: 1,917,826.68','2025-09-29 14:44:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1325','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B018153,  Total: 1,196,580.00','2025-09-29 14:44:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1326','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 634 with tested fuel 10','2025-09-29 14:45:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1327','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 635 with tested fuel 10','2025-09-29 15:14:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1328','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 637 with tested fuel 5','2025-09-29 15:19:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1329','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 638 with tested fuel 5','2025-09-29 15:22:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1330','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 640 with tested fuel 10','2025-09-29 15:29:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1331','95','2','4','Oil sales ','Oil sales recoded  id: 107 TR NO:42','2025-09-29 15:30:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1332','1','0','0','Login','Login from 111.223.191.128','2025-09-29 18:27:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1333','1','0','0','Login','Login from 111.223.191.128','2025-09-29 20:15:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1334','97','0','0','Login','Login from 112.134.190.3','2025-09-30 14:15:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1335','1','0','0','Login','Login from 111.223.191.128','2025-09-30 14:45:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1336','1','1','4','Fuel Adjustment','Fuel Stock Adjusted - Location: 4, Product: Petrol, Excess: 200.000 Ltr','2025-09-30 15:02:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1337','96','0','0','Login','Login from 112.134.186.155','2025-09-30 16:30:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1338','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 642 with tested fuel 10','2025-09-30 16:32:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1339','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 643 with tested fuel 10','2025-09-30 16:35:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1340','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 645 with tested fuel 05','2025-09-30 16:40:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1341','96','2','3','Oil sales ','Oil sales recoded  id: 108 TR NO:66','2025-09-30 16:42:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1342','96','2','3','Oil sales ','Oil sales recoded  id: 109 TR NO:67','2025-09-30 16:44:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1343','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO18264,  Total: 1,917,826.68','2025-09-30 16:46:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1344','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO14857,  Total: 1,821,864.00','2025-09-30 16:46:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1345','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO14858,  Total: 1,821,864.00','2025-09-30 16:46:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1346','96','0','0','Login','Login from 112.134.186.155','2025-09-30 16:47:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1347','95','0','0','Login','Login from 123.231.125.8','2025-10-01 06:20:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1348','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 641 with tested fuel 5','2025-10-01 06:21:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1349','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 646 with tested fuel 5','2025-10-01 06:23:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1350','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 647 with tested fuel 10','2025-10-01 06:24:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1351','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 649 with tested fuel 10','2025-10-01 06:25:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1352','95','2','4','Oil sales ','Oil sales recoded  id: 110 TR NO:43','2025-10-01 06:27:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1353','95','0','0','Login','Login from 123.231.125.8','2025-10-01 07:26:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1354','96','0','0','Login','Login from 112.134.188.18','2025-10-02 09:45:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1355','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO18306,  Total: 1,917,126.68','2025-10-02 09:47:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1356','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 650 with tested fuel 10','2025-10-02 09:48:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1357','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 652 with tested fuel 10','2025-10-02 09:51:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1358','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 654 with tested fuel 5','2025-10-02 09:57:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1359','96','2','3','Oil sales ','Oil sales recoded  id: 111 TR NO:68','2025-10-02 10:00:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1360','96','2','3','Oil sales ','Oil sales recoded  id: 112 TR NO:69','2025-10-02 10:00:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1361','96','3','3','Cancelled Transfer','Stock Transfer Cancelled : 111 ','2025-10-02 10:02:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1362','96','2','3','Oil sales ','Oil sales recoded  id: 113 TR NO:70','2025-10-02 10:04:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1363','95','0','0','Login','Login from 175.157.41.161','2025-10-02 11:32:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1364','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 655 with tested fuel 10','2025-10-02 11:33:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1365','1','0','0','Login','Login from 112.134.241.184','2025-10-02 11:35:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1366','95','0','0','Login','Login from 175.157.41.161','2025-10-02 13:57:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1367','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 657 with tested fuel 5','2025-10-02 13:58:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1368','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 658 with tested fuel 5','2025-10-02 14:04:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1369','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B044892,  Total: 2,393,160.00','2025-10-02 14:06:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1370','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 659 with tested fuel 10','2025-10-02 14:06:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1371','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 660 with tested fuel 10','2025-10-02 14:20:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1372','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B018305,  Total: 1,917,826.68','2025-10-02 14:27:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1373','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B045022,  Total: 3,643,728.00','2025-10-02 14:27:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1374','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 661 with tested fuel 5','2025-10-02 14:30:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1375','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 662 with tested fuel 5','2025-10-02 14:37:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1376','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 663 with tested fuel 10','2025-10-02 14:41:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1377','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 663 with tested fuel 10','2025-10-02 14:41:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1378','97','0','0','Login','Login from 112.134.184.47','2025-10-03 11:12:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1379','1','0','0','Login','Login from 112.134.243.114','2025-10-03 11:23:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1380','97','0','0','Login','Login from 112.134.184.47','2025-10-03 11:37:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1381','97','0','0','Login','Login from 112.134.184.47','2025-10-03 14:43:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1382','94','0','0','Login','Login from 112.134.191.189','2025-10-04 10:35:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1383','96','0','0','Login','Login from 112.134.185.82','2025-10-04 11:37:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1384','96','0','0','Login','Login from 112.134.185.82','2025-10-04 11:47:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1385','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: 45171,  Total: 1,164,240.00','2025-10-04 11:58:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1386','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 664 with tested fuel 10','2025-10-04 12:03:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1387','97','0','0','Login','Login from 112.134.191.189','2025-10-04 12:10:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1388','97','1','3','Price Changes','Fuel Price changes added p_id 3 , Price Rs. 277  time of effect  2025-10-01T00:00 00:01:00 ','2025-10-04 12:12:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1389','97','1','3','Price Changes','Fuel Price changes added p_id 5 , Price Rs. 180  time of effect  2025-10-01T00:00 00:01:00 ','2025-10-04 12:12:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1390','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 665 with tested fuel 10','2025-10-04 12:12:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1391','97','1','4','Price Changes','Fuel Price changes added p_id 3 , Price Rs. 277  time of effect  2025-10-01T00:00 00:01:00 ','2025-10-04 12:13:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1392','97','1','4','Price Changes','Fuel Price changes added p_id 5 , Price Rs. 180  time of effect  2025-10-01T00:00 00:01:00 ','2025-10-04 12:13:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1393','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 667 with tested fuel 5','2025-10-04 12:22:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1394','96','2','3','Oil sales ','Oil sales recoded  id: 114 TR NO:71','2025-10-04 12:27:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1395','1','0','0','Login','Login from 111.223.191.128','2025-10-04 12:45:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1396','1','0','0','Login','Login from 111.223.191.128','2025-10-04 15:19:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1397','1','0','0','Login','Login from 111.223.191.128','2025-10-04 18:50:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1398','96','0','0','Login','Login from 112.134.185.205','2025-10-06 10:18:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1399','96','0','0','Login','Login from 112.134.185.205','2025-10-06 10:29:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1400','1','0','0','Login','Login from 112.134.241.178','2025-10-07 09:51:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1401','97','0','0','Login','Login from 112.135.78.46','2025-10-07 10:03:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1402','96','0','0','Login','Login from 112.134.185.115','2025-10-07 10:10:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1403','96','0','0','Login','Login from 112.134.185.115','2025-10-07 10:11:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1404','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO18507,  Total: 1,911,916.38','2025-10-07 10:17:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1405','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO18505,  Total: 1,776,324.00','2025-10-07 10:17:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1406','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 668 with tested fuel 10','2025-10-07 10:20:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1407','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 670 with tested fuel 05','2025-10-07 10:25:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1408','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 671 with tested fuel 05','2025-10-07 10:32:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1409','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 672 with tested fuel 05','2025-10-07 10:34:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1410','1','0','0','Login','Login from 112.134.241.178','2025-10-07 10:53:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1411','96','0','0','Login','Login from 112.135.78.46','2025-10-07 14:24:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1412','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: 45460,  Total: 1,776,324.00','2025-10-07 14:25:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1413','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 673 with tested fuel 10','2025-10-07 14:26:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1414','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 674 with tested fuel 5','2025-10-07 14:32:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1415','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 675 with tested fuel 5','2025-10-07 14:36:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1416','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 676 with tested fuel 5','2025-10-07 14:37:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1417','96','2','3','Oil sales ','Oil sales recoded  id: 115 TR NO:72','2025-10-07 14:43:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1418','96','2','3','Oil sales ','Oil sales recoded  id: 116 TR NO:73','2025-10-07 14:44:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1419','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: 45566,  Total: 1,776,324.00','2025-10-07 15:11:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1420','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 677 with tested fuel 10','2025-10-07 15:11:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1421','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 679 with tested fuel 5','2025-10-07 15:13:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1422','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 680 with tested fuel 5','2025-10-07 15:15:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1423','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 681 with tested fuel 5','2025-10-07 15:16:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1424','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 682 with tested fuel 10','2025-10-07 15:17:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1425','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 684 with tested fuel 5','2025-10-07 15:20:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1426','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 685 with tested fuel 5','2025-10-07 15:22:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1427','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 686 with tested fuel 5','2025-10-07 15:23:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1428','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 687 with tested fuel 10','2025-10-07 15:25:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1429','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 688 with tested fuel 5','2025-10-07 15:26:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1430','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 689 with tested fuel 5','2025-10-07 15:27:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1431','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 690 with tested fuel 5','2025-10-07 15:30:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1432','97','0','0','Login','Login from 112.135.66.124','2025-10-08 09:11:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1433','95','0','0','Login','Login from 175.157.43.242','2025-10-08 09:46:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1434','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 691 with tested fuel 10','2025-10-08 09:47:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1435','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 693 with tested fuel 5','2025-10-08 09:51:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1436','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 694 with tested fuel 5','2025-10-08 09:52:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1437','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 695 with tested fuel 5','2025-10-08 09:54:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1438','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 696 with tested fuel 5','2025-10-08 09:55:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1439','95','2','4','Oil sales ','Oil sales recoded  id: 117 TR NO:44','2025-10-08 09:59:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1440','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B045172/175,  Total: 2,328,480.00','2025-10-08 10:00:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1441','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 697 with tested fuel 10','2025-10-08 10:14:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1442','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 698 with tested fuel 5','2025-10-08 10:17:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1443','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 699 with tested fuel 5','2025-10-08 10:19:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1444','95','2','4','Oil sales ','Oil sales recoded  id: 118 TR NO:45','2025-10-08 10:22:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1445','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B045332,  Total: 1,908,041.85','2025-10-08 10:23:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1446','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B045330/331,  Total: 3,544,860.00','2025-10-08 10:23:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1447','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 701 with tested fuel 10','2025-10-08 10:27:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1448','95','0','0','Login','Login from 175.157.43.242','2025-10-08 10:32:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1449','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 703 with tested fuel 5','2025-10-08 10:36:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1450','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 704 with tested fuel 5','2025-10-08 10:39:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1451','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 705 with tested fuel 10','2025-10-08 10:41:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1452','95','2','4','Oil sales ','Oil sales recoded  id: 119 TR NO:46','2025-10-08 10:42:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1453','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 705 with tested fuel 10','2025-10-08 10:42:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1454','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B018558,  Total: 1,908,041.85','2025-10-08 10:44:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1455','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B045467,68,  Total: 2,328,480.00','2025-10-08 10:44:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1456','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 706 with tested fuel 10','2025-10-08 10:45:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1457','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 708 with tested fuel 5','2025-10-08 10:50:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1458','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 708 with tested fuel 5','2025-10-08 10:50:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1459','95','2','4','Fuel Pump Test Cancelled','Fuel pump test 546 cancelled','2025-10-08 10:50:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1460','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 709 with tested fuel 5','2025-10-08 10:54:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1461','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 710 with tested fuel 10','2025-10-08 10:55:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1462','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B018605,  Total: 1,908,041.85','2025-10-08 10:57:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1463','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B018604,B025567,  Total: 3,544,860.00','2025-10-08 10:58:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1464','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B0218603,B025568,  Total: 2,328,480.00','2025-10-08 10:59:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1465','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 711 with tested fuel 10','2025-10-08 11:01:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1466','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 713 with tested fuel 5','2025-10-08 11:03:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1467','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 714 with tested fuel 5','2025-10-08 11:04:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1468','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 715 with tested fuel 10','2025-10-08 11:05:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1469','95','2','4','Oil sales ','Oil sales recoded  id: 120 TR NO:47','2025-10-08 11:06:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1470','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 716 with tested fuel 10','2025-10-08 11:07:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1471','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 718 with tested fuel 5','2025-10-08 11:13:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1472','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 719 with tested fuel 5','2025-10-08 11:16:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1473','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 720 with tested fuel 10','2025-10-08 11:17:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1474','96','0','0','Login','Login from 112.134.185.3','2025-10-08 14:09:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1475','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO18754,  Total: 1,911,916.38','2025-10-08 14:10:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1476','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO18755,  Total: 1,911,916.38','2025-10-08 14:11:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1477','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO45683,  Total: 1,776,324.00','2025-10-08 14:12:11');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1478','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 721 with tested fuel 10','2025-10-08 14:12:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1479','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 723 with tested fuel 05','2025-10-08 14:16:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1480','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 724 with tested fuel 05','2025-10-08 14:23:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1481','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 725 with tested fuel 05','2025-10-08 14:24:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1482','96','2','3','Oil sales ','Oil sales recoded  id: 121 TR NO:74','2025-10-08 14:27:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1483','1','0','0','Login','Login from 112.134.244.108','2025-10-08 14:50:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1484','94','0','0','Login','Login from 112.135.67.123','2025-10-10 11:50:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1485','94','0','0','Login','Login from 112.135.67.123','2025-10-10 12:01:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1486','94','1','4','Fuel Adjustment','Fuel Stock Adjusted - Location: 4, Product: Petrol, Short: 408.000 Ltr','2025-10-10 12:05:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1487','1','0','0','Login','Login from 112.134.240.110','2025-10-10 12:05:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1488','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Petrol, Short: 408.000 Ltr','2025-10-10 12:08:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1489','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Diesel, Short: 12.000 Ltr','2025-10-10 12:09:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1490','94','0','0','Login','Login from 112.135.67.123','2025-10-10 13:43:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1491','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Kerosene, Excess: 5.000 Ltr','2025-10-10 13:49:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1492','94','1','3','Fuel Adjustment','Fuel Stock Adjusted - Location: 3, Product: Kerosene, Excess: 5.000 Ltr','2025-10-10 13:55:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1493','94','3','3','stock Adjustment',' Adjusted Batch ID : 64 Adjusted Qty : -.06 reason:Losses','2025-10-10 14:03:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1494','1','0','0','Login','Login from 112.134.240.110','2025-10-10 14:11:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1495','94','0','0','Login','Login from 112.135.67.123','2025-10-10 14:23:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1496','96','0','0','Login','Login from 112.134.184.248','2025-10-10 14:35:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1497','94','0','0','Login','Login from 112.135.67.123','2025-10-10 15:48:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1498','1','0','0','Login','Login from 112.134.244.176','2025-10-10 15:57:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1499','96','0','0','Login','Login from 112.134.190.133','2025-10-10 16:11:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1500','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO45733,  Total: 1,776,324.00','2025-10-10 16:12:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1501','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 726 with tested fuel 10','2025-10-10 16:13:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1502','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 728 with tested fuel 05','2025-10-10 16:16:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1503','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 729 with tested fuel 05','2025-10-10 16:18:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1504','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 730 with tested fuel 05','2025-10-10 16:19:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1505','96','2','3','Oil sales ','Oil sales recoded  id: 122 TR NO:75','2025-10-10 16:21:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1506','96','2','3','Oil sales ','Oil sales recoded  id: 123 TR NO:76','2025-10-10 16:21:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1507','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO18925,  Total: 1,911,916.38','2025-10-10 16:22:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1508','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO45784,  Total: 1,776,324.00','2025-10-10 16:23:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1509','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO45785,  Total: 1,776,324.00','2025-10-10 16:23:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1510','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 731 with tested fuel 10','2025-10-10 16:24:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1511','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 733 with tested fuel 05','2025-10-10 16:26:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1512','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 734 with tested fuel 05','2025-10-10 16:26:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1513','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 735 with tested fuel 05','2025-10-10 16:27:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1514','94','0','0','Login','Login from 112.135.67.123','2025-10-10 16:30:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1515','94','3','3','stock Adjustment',' Adjusted Batch ID : 27 Adjusted Qty : -1 reason:Losses','2025-10-10 16:32:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1516','94','0','0','Login','Login from 112.135.67.123','2025-10-10 16:34:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1517','1','0','0','Login','Login from 123.231.123.148','2025-10-10 17:03:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1518','95','0','0','Login','Login from 175.157.25.172','2025-10-11 06:39:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1519','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 736 with tested fuel 10','2025-10-11 06:40:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1520','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 738 with tested fuel 5','2025-10-11 06:45:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1521','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 739 with tested fuel 5','2025-10-11 06:52:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1522','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 740 with tested fuel 10','2025-10-11 06:53:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1523','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 741 with tested fuel 10','2025-10-11 06:56:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1524','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 742 with tested fuel 5','2025-10-11 06:57:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1525','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 743 with tested fuel 5','2025-10-11 06:58:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1526','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 744 with tested fuel 10','2025-10-11 07:09:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1527','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 745 with tested fuel 10','2025-10-11 07:11:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1528','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B018923/924,  Total: 3,816,083.70','2025-10-11 07:12:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1529','95','2','4','New GRN','Add new GRN id: 15 GRN NO:4','2025-10-11 07:14:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1530','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 747 with tested fuel 5','2025-10-11 07:17:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1531','95','2','4','Fuel Pump Test Cancelled','Fuel pump test 578 cancelled','2025-10-11 07:17:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1532','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 748 with tested fuel 5','2025-10-11 07:19:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1533','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 749 with tested fuel 5','2025-10-11 07:20:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1534','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 750 with tested fuel 10','2025-10-11 07:21:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1535','95','2','4','Oil sales ','Oil sales recoded  id: 124 TR NO:48','2025-10-11 07:23:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1536','1','0','0','Login','Login from 123.231.123.148','2025-10-11 09:26:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1537','1','0','0','Login','Login from 123.231.123.148','2025-10-11 12:20:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1538','95','0','0','Login','Login from 175.157.25.172','2025-10-13 10:12:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1539','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B045685,  Total: 1,772,430.00','2025-10-13 10:19:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1540','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B045686/700,  Total: 2,328,480.00','2025-10-13 10:21:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1541','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 751 with tested fuel 10','2025-10-13 10:22:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1542','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 753 with tested fuel 5','2025-10-13 10:28:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1543','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 754 with tested fuel 5','2025-10-13 10:28:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1544','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 755 with tested fuel 10','2025-10-13 10:30:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1545','95','2','4','Oil sales ','Oil sales recoded  id: 125 TR NO:49','2025-10-13 10:32:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1546','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B064851,  Total: 1,908,041.85','2025-10-13 10:33:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1547','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B064852,  Total: 1,772,430.00','2025-10-13 10:34:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1548','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B045975,  Total: 1,164,240.00','2025-10-13 10:35:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1549','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 756 with tested fuel 10','2025-10-13 10:40:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1550','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 757 with tested fuel 5','2025-10-13 10:47:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1551','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 758 with tested fuel 5','2025-10-13 10:53:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1552','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 759 with tested fuel 5','2025-10-13 10:55:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1553','97','0','0','Login','Login from 112.135.67.127','2025-10-13 10:59:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1554','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 760 with tested fuel 5','2025-10-13 11:00:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1555','95','2','4','Oil sales ','Oil sales recoded  id: 126 TR NO:50','2025-10-13 11:04:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1556','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 761 with tested fuel 10','2025-10-13 11:33:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1557','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 763 with tested fuel 5','2025-10-13 11:47:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1558','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 764 with tested fuel 5','2025-10-13 11:49:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1559','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 765 with tested fuel 10','2025-10-13 11:50:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1560','95','2','4','Oil sales ','Oil sales recoded  id: 127 TR NO:51','2025-10-13 11:55:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1561','96','0','0','Login','Login from 112.134.184.221','2025-10-13 13:58:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1562','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 766 with tested fuel 5','2025-10-13 14:01:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1563','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 768 with tested fuel 5','2025-10-13 14:13:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1564','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 769 with tested fuel 5','2025-10-13 14:14:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1565','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 770 with tested fuel 5','2025-10-13 14:27:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1566','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 771 with tested fuel 5','2025-10-13 14:29:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1567','96','0','0','Login','Login from 112.135.67.127','2025-10-13 16:21:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1568','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: 19087,  Total: 1,911,916.38','2025-10-13 16:22:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1569','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: 45973,74,  Total: 3,552,648.00','2025-10-13 16:23:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1570','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 772 with tested fuel 10','2025-10-13 16:24:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1571','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 774 with tested fuel 5','2025-10-13 16:25:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1572','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 775 with tested fuel 5','2025-10-13 16:26:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1573','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 776 with tested fuel 5','2025-10-13 16:27:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1574','96','2','3','Oil sales ','Oil sales recoded  id: 128 TR NO:77','2025-10-13 16:28:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1575','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 777 with tested fuel 10','2025-10-13 16:29:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1576','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 779 with tested fuel 5','2025-10-13 16:31:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1577','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 780 with tested fuel 5','2025-10-13 16:32:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1578','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 781 with tested fuel 5','2025-10-13 16:33:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1579','94','0','0','Login','Login from 112.135.71.155','2025-10-14 09:48:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1580','97','0','0','Login','Login from 112.134.189.95','2025-10-15 15:07:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1581','96','0','0','Login','Login from 112.134.185.124','2025-10-15 16:25:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1582','94','0','0','Login','Login from 112.134.189.95','2025-10-15 16:34:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1583','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO46034,  Total: 1,776,324.00','2025-10-15 16:38:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1584','94','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO46036,  Total: 1,776,324.00','2025-10-15 16:39:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1585','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 782 with tested fuel 10','2025-10-15 16:40:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1586','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 784 with tested fuel 05','2025-10-15 16:44:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1587','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 785 with tested fuel 05','2025-10-15 16:56:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1588','94','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 786 with tested fuel 05','2025-10-15 16:57:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1589','94','2','3','Oil sales ','Oil sales recoded  id: 129 TR NO:78','2025-10-15 16:59:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1590','96','0','0','Login','Login from 112.134.188.227','2025-10-16 10:23:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1591','96','0','0','Login','Login from 112.134.188.227','2025-10-16 11:33:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1592','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: bo19257,  Total: 1,782,264.00','2025-10-16 11:40:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1593','94','0','0','Login','Login from 112.134.184.219','2025-10-16 11:43:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1594','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: bo19255,  Total: 1,782,264.00','2025-10-16 11:49:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1595','96','2','3','Cancelled Fuel Purchase','Fuel purchase cancelled. Invoice No: bo19257, Qty: 6600, Amount: 1,782,264.00','2025-10-16 11:51:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1596','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO46159,  Total: 1,782,264.00','2025-10-16 11:52:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1597','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: bo19257.,  Total: 1,917,826.68','2025-10-16 11:54:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1598','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 787 with tested fuel 10','2025-10-16 12:00:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1599','94','0','0','Login','Login from 112.134.184.219','2025-10-16 14:09:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1600','94','2','3','Settlement Added','Settlement added: Date 2025-10-01, Source Cash, Amount 650000, Memo F10-360','2025-10-16 14:12:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1601','94','2','3','Settlement Added','Settlement added: Date 2025-10-02, Source Cash, Amount 1103230, Memo F10-366','2025-10-16 14:14:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1602','94','2','3','Settlement Added','Settlement added: Date 2025-10-02, Source Cash, Amount 535000, Memo F10-367','2025-10-16 14:16:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1603','94','2','3','Settlement Added','Settlement added: Date 2025-10-02, Source Cheque, Amount 50000, Memo F10-367 (005311)','2025-10-16 14:17:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1604','94','2','3','Settlement Added','Settlement added: Date 2025-10-03, Source Cash, Amount 1100000, Memo F10-371','2025-10-16 14:20:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1605','94','2','3','Settlement Added','Settlement added: Date 2025-10-03, Source Cash, Amount 585000, Memo F10-373','2025-10-16 14:23:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1606','94','2','3','Settlement Added','Settlement added: Date 2025-10-03, Source Cheque, Amount 36113.5, Memo F10-373','2025-10-16 14:24:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1607','94','2','3','Settlement Added','Settlement added: Date 2025-10-04, Source Cash, Amount 1400000, Memo F-10 377','2025-10-16 14:25:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1608','94','2','3','Settlement Added','Settlement added: Date 2025-10-04, Source Cash, Amount 465000, Memo F10 379','2025-10-16 14:27:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1609','94','2','3','Settlement Added','Settlement added: Date 2025-10-04, Source Cheque, Amount 16248.8, Memo F10-379','2025-10-16 14:28:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1610','94','2','3','Settlement Added','Settlement added: Date 2025-10-07, Source Cash, Amount 5625000, Memo F10-380','2025-10-16 14:30:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1611','94','2','3','Settlement Added','Settlement added: Date 2025-10-07, Source Cheque, Amount 1500, Memo F10-380','2025-10-16 14:31:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1612','94','2','3','Settlement Added','Settlement added: Date 2025-10-07, Source Cash, Amount 870000, Memo F10-382','2025-10-16 14:32:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1613','94','2','3','Settlement Added','Settlement added: Date 2025-10-08, Source Cash, Amount 1405000, Memo F10-390','2025-10-16 14:34:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1614','94','2','3','Settlement Added','Settlement added: Date 2025-10-08, Source Cheque, Amount 135307, Memo F10-390','2025-10-16 14:35:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1615','94','2','3','Settlement Added','Settlement added: Date 2025-10-08, Source Cash, Amount 200000, Memo F10-392','2025-10-16 14:36:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1616','94','2','3','Settlement Added','Settlement added: Date 2025-10-08, Source Cheque, Amount 501500, Memo F10-392','2025-10-16 14:37:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1617','94','2','3','Settlement Added','Settlement added: Date 2025-10-09, Source Cash, Amount 1310000, Memo F10-399','2025-10-16 14:39:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1618','94','2','3','Settlement Added','Settlement added: Date 2025-10-09, Source Cash, Amount 1240000, Memo F10-400','2025-10-16 14:40:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1619','94','2','3','Settlement Added','Settlement added: Date 2025-10-09, Source Cheque, Amount 10384.68, Memo F10-400','2025-10-16 14:41:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1620','94','2','3','Settlement Added','Settlement added: Date 2025-10-10, Source Cash, Amount 2135000, Memo F10-404','2025-10-16 14:42:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1621','94','2','3','Settlement Added','Settlement added: Date 2025-10-10, Source Cash, Amount 1100000, Memo F10-405','2025-10-16 14:43:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1622','94','2','3','Settlement Added','Settlement added: Date 2025-10-11, Source Cash, Amount 1925000, Memo F10-408','2025-10-16 14:45:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1623','94','2','3','Settlement Added','Settlement added: Date 2025-10-11, Source Cheque, Amount 36747.02, Memo F10-408','2025-10-16 14:45:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1624','94','2','3','Settlement Added','Settlement added: Date 2025-10-11, Source Cash, Amount 570000, Memo F10-409','2025-10-16 14:47:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1625','94','2','3','Settlement Added','Settlement added: Date 2025-10-11, Source Cheque, Amount 14820, Memo F10-409','2025-10-16 14:48:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1626','94','2','3','New Pump Operator Added','New pump operator K.A.Lakshitha prasad added with NIC 199908800883.','2025-10-16 15:06:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1627','96','0','0','Login','Login from 112.134.188.227','2025-10-16 16:06:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1628','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 788 with tested fuel 5','2025-10-16 16:08:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1629','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 789 with tested fuel 5','2025-10-16 16:13:23');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1630','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 790 with tested fuel 05','2025-10-16 16:14:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1631','96','2','3','Oil sales ','Oil sales recoded  id: 130 TR NO:79','2025-10-16 16:15:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1632','96','0','0','Login','Login from 112.134.186.156','2025-10-17 11:57:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1633','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: bo46340,  Total: 1,782,264.00','2025-10-17 12:01:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1634','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 791 with tested fuel 10','2025-10-17 12:08:10');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1635','95','0','0','Login','Login from 175.157.19.104','2025-10-17 13:24:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1636','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B046059,  Total: 1,772,430.00','2025-10-17 13:26:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1637','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B046060,  Total: 1,164,240.00','2025-10-17 13:28:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1638','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 793 with tested fuel 10','2025-10-17 13:34:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1639','96','0','0','Login','Login from 112.134.186.156','2025-10-17 14:43:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1640','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 795 with tested fuel 05','2025-10-17 14:44:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1641','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 796 with tested fuel 05','2025-10-17 14:45:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1642','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 797 with tested fuel 05','2025-10-17 14:46:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1643','95','0','0','Login','Login from 175.157.19.104','2025-10-17 21:23:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1644','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 798 with tested fuel 10','2025-10-17 21:24:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1645','95','0','0','Login','Login from 175.157.14.61','2025-10-18 19:29:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1646','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 799 with tested fuel 10','2025-10-18 19:34:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1647','95','2','4','Oil sales ','Oil sales recoded  id: 131 TR NO:52','2025-10-18 19:35:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1648','95','0','0','Login','Login from 175.157.12.215','2025-10-19 20:56:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1649','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B019259/260,  Total: 3,816,083.70','2025-10-19 20:57:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1650','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B046111/113,  Total: 3,544,860.00','2025-10-19 20:58:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1651','95','2','4','Fuel Purchase Added','Fuel purchase added. Invoice No: B046114,  Total: 1,164,240.00','2025-10-19 20:58:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1652','95','2','4','Oil sales ','Oil sales recoded  id: 132 TR NO:53','2025-10-19 20:59:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1653','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 800 with tested fuel 10','2025-10-19 20:59:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1654','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 802 with tested fuel 05','2025-10-19 21:02:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1655','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 803 with tested fuel 05','2025-10-19 21:04:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1656','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 803 with tested fuel 05','2025-10-19 21:04:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1657','95','2','4','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 803 with tested fuel 5','2025-10-19 21:04:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1658','1','0','0','Login','Login from 212.104.231.9','2025-10-20 12:39:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1659','96','0','0','Login','Login from 112.134.191.76','2025-10-20 13:47:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1660','96','0','0','Login','Login from 112.134.191.76','2025-10-20 13:51:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1661','96','0','0','Login','Login from 112.134.191.76','2025-10-20 13:52:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1662','96','0','0','Login','Login from 112.134.191.76','2025-10-20 13:57:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1663','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 804 with tested fuel 10','2025-10-20 14:04:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1664','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 806 with tested fuel 5','2025-10-20 14:09:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1665','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 807 with tested fuel 5','2025-10-20 14:19:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1666','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 808 with tested fuel 5','2025-10-20 14:20:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1667','96','2','3','Oil sales ','Oil sales recoded  id: 133 TR NO:80','2025-10-20 14:22:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1668','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO19442,  Total: 1,917,826.68','2025-10-20 14:26:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1669','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO46496,  Total: 1,782,264.00','2025-10-20 14:26:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1670','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO46724,  Total: 1,782,264.00','2025-10-20 14:27:32');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1671','96','2','3','Fuel Purchase Added','Fuel purchase added. Invoice No: BO46725,  Total: 1,782,264.00','2025-10-20 14:27:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1672','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 809 with tested fuel 10','2025-10-20 14:28:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1673','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 811 with tested fuel 5','2025-10-20 14:31:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1674','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 812 with tested fuel 5','2025-10-20 14:36:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1675','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 813 with tested fuel 5','2025-10-20 14:36:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1676','96','2','3','Oil sales ','Oil sales recoded  id: 134 TR NO:81','2025-10-20 14:38:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1677','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 814 with tested fuel 5','2025-10-20 14:39:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1678','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 816 with tested fuel 5','2025-10-20 14:41:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1679','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 817 with tested fuel 5','2025-10-20 14:42:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1680','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 818 with tested fuel 5','2025-10-20 14:43:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1681','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 819 with tested fuel 5','2025-10-20 14:46:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1682','96','2','3','Fuel Pump Test Added','Fuel pump test recorded for pump_assign_id 820 with tested fuel 5','2025-10-20 14:50:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1683','96','2','3','Oil sales ','Oil sales recoded  id: 135 TR NO:82','2025-10-20 14:51:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1684','1','0','0','Login','Login from ::1','2025-10-21 14:01:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1685','1','0','0','Login','Login from ::1','2025-10-21 18:31:21');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1686','1','3','3','Day End Undo','Day end undone. Serial No: 95, Location ID: 3, Date: 2025-10-18','2025-10-21 19:06:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1687','1','3','3','Day End Undo','Day end undone. Serial No: 94, Location ID: 3, Date: 2025-10-17','2025-10-21 19:07:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1688','1','3','3','Day End Undo','Day end undone. Serial No: 93, Location ID: 3, Date: 2025-10-16','2025-10-21 19:08:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1689','1','2','4','Day End Undo','Day end undone. Serial No: 72, Location ID: 4, Date: 2025-10-11','2025-10-21 19:13:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1690','1','2','4','Settlement Added','Settlement added: Date 2025-10-01, Source Cash, Amount 50000, Memo ','2025-10-21 19:39:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1691','1','2','4','Settlement Added','Settlement added: Date 2025-10-01, Source Cash, Amount 50000, Memo ','2025-10-21 19:42:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1692','1','2','4','Settlement Added','Settlement added: Date 2025-10-01, Source Cash, Amount 300000, Memo ','2025-10-21 19:44:09');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1693','1','1','4','System Setup','Default OIL created with p_id = 0','2025-10-21 20:09:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1694','1','0','0','Login','Login from ::1','2025-10-22 08:39:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1695','1','0','0','Login','Login from ::1','2025-10-24 08:29:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1696','1','0','0','Login','Login from ::1','2025-10-24 11:24:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1697','1','0','0','Login','Login from ::1','2025-10-28 11:01:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1698','1','3','4','New cheque written','1 - Cheque #12','2025-10-28 11:18:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1699','1','0','0','Login','Login from ::1','2025-10-28 14:31:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1700','1','0','0','Login','Login from ::1','2025-10-28 19:17:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1701','1','0','0','Login','Login from ::1','2025-10-29 20:56:25');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1702','1','0','0','Login','Login from ::1','2025-10-29 20:59:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1703','1','1','4','System Setup','Default OIL created with p_id = 0','2025-10-29 21:18:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1704','1','1','4','System Setup','Default OIL created with p_id = 0','2025-10-29 21:19:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1705','1','1','4','System Setup','Default OIL created with p_id = 0','2025-10-29 21:24:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1706','1','1','4','System Setup','Default OIL created with p_id = 0','2025-10-29 21:59:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1707','1','0','0','Login','Login from ::1','2025-10-30 06:30:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1708','1','1','4','System Setup','Default OIL created with p_id = 0','2025-10-30 08:47:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1709','1','1','4','System Setup','Default OIL created with p_id = 0','2025-10-30 09:12:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1710','1','0','0','Login','Login from ::1','2025-10-30 15:02:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1711','1','0','0','Login','Login from ::1','2025-10-30 15:04:55');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1712','1','1','4','System Setup','Default OIL created with p_id = 0','2025-10-30 15:05:03');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1713','1','0','0','Login','Login from ::1','2025-10-30 17:14:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1714','1','1','3','System Setup','Default OIL created with p_id = 0','2025-10-30 18:01:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1715','1','1','82','System Setup','Default OIL created with p_id = 0','2025-10-30 19:07:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1716','1','0','0','Login','Login from ::1','2025-10-30 21:25:31');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1717','1','0','0','Login','Login from ::1','2025-10-31 06:49:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1718','1','0','0','Login','Login from ::1','2025-10-31 15:52:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1719','1','0','0','Login','Login from ::1','2025-10-31 17:49:41');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1720','1','0','0','Login','Login from ::1','2025-11-01 18:43:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1721','1','0','0','Login','Login from ::1','2025-11-01 21:16:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1722','1','3','82','Journal Entry','Memo: asaSA','2025-11-01 21:17:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1723','1','3','82','Journal Entry','Memo: test','2025-11-01 21:34:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1724','1','3','82','Journal Entry','Memo: wqe','2025-11-01 21:39:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1725','1','3','82','Journal Entry','Memo: sdfaf','2025-11-01 21:47:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1726','1','3','82','Journal Entry','Memo: tesyt','2025-11-01 21:52:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1727','1','3','82','Journal Entry','Memo: dsadsdsd','2025-11-01 22:14:22');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1728','1','3','82','Journal Entry','Memo: asdsad','2025-11-01 22:15:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1729','1','0','0','Login','Login from ::1','2025-11-02 11:23:53');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1730','1','0','0','Login','Login from ::1','2025-11-02 17:46:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1731','1','3','82','Journal Entry','Memo: sdfaf','2025-11-02 17:57:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1732','1','3','82','Journal Entry','Memo: sdfaf','2025-11-02 17:57:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1733','1','0','0','Login','Login from ::1','2025-11-25 20:08:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1734','1','0','0','Login','Login from ::1','2025-11-29 06:50:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1735','1','1','82','System Setup','Default OIL created with p_id = 0','2025-11-29 07:27:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1736','1','1','82','System Setup','Default OIL created with p_id = 0','2025-11-29 07:29:51');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1737','1','1','82','System Setup','Default OIL created with p_id = 0','2025-11-29 07:30:13');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1738','1','0','0','Login','Login from ::1','2025-11-29 08:31:56');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1739','1','0','0','Login','Login from ::1','2025-11-29 11:05:05');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1740','1','1','82','System Setup','Default OIL created with p_id = 0','2025-11-29 11:38:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1741','1','0','0','Login','Login from ::1','2025-11-29 13:16:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1742','1','1','82','System Setup','Default OIL created with p_id = 0','2025-11-29 13:17:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1743','1','0','0','Login','Login from ::1','2025-11-29 15:57:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1744','1','0','0','Login','Login from ::1','2025-11-29 20:04:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1745','1','0','0','Login','Login from ::1','2025-11-29 23:40:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1746','1','0','0','Login','Login from ::1','2025-11-30 07:21:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1747','1','3','4','Journal Entry','Memo: asdsad','2025-11-30 07:51:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1748','1','3','4','Journal Entry','Memo: test','2025-11-30 07:59:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1749','1','3','4','Journal Entry','Memo: test','2025-11-30 08:00:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1750','1','3','4','Journal Entry','Memo: test koutnal','2025-11-30 08:09:15');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1751','1','3','4','Journal Cancelled','Journal ID 13','2025-11-30 08:17:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1752','1','3','4','Journal Entry','Memo: sa','2025-11-30 08:18:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1753','1','3','4','Journal Cancelled','Journal ID 14','2025-11-30 08:22:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1754','1','3','4','Journal Cancelled','Journal ID 11','2025-11-30 09:34:28');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1755','1','3','4','Journal Cancelled','Journal ID 12','2025-11-30 09:50:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1756','1','3','4','Journal Cancelled','Journal ID 14','2025-11-30 09:50:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1757','1','3','4','Journal Restored','Journal ID 14','2025-11-30 09:56:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1758','1','3','4','Journal Restored','Journal ID 13','2025-11-30 09:56:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1759','1','3','4','Journal Restored','Journal ID 11','2025-11-30 09:56:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1760','1','3','4','Journal Cancelled','Journal ID 14','2025-11-30 09:56:59');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1761','1','3','4','Journal Cancelled','Journal ID 13','2025-11-30 09:57:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1762','1','3','4','Journal Cancelled','Journal ID 11','2025-11-30 09:57:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1763','1','3','82','Journal Cancelled','Journal ID 10','2025-11-30 10:18:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1764','1','3','4','Journal Cancelled','Journal ID 9','2025-11-30 10:18:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1765','1','3','3','Journal Cancelled','Journal ID 9','2025-11-30 10:19:08');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1766','1','3','4','Journal Restored','Journal ID 14','2025-11-30 10:49:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1767','1','3','4','Journal Restored','Journal ID 11','2025-11-30 10:49:36');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1768','1','1','4','Customer Detail edited','Customer Detail of hospital CKD Unit Edited','2025-11-30 10:53:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1769','1','1','4','New customer added','New customer Test name added with Max Limit ','2025-11-30 10:59:18');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1770','1','1','4','Customer Detail edited','Customer Detail of Test name Edited','2025-11-30 11:00:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1771','1','1','4','Customer Detail edited','Customer Detail of Test name Edited','2025-11-30 11:00:45');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1772','1','0','0','Login','Login from ::1','2025-11-30 14:38:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1773','1','1','4','New Supplier added',' New supplier  apple added   ','2025-11-30 15:02:40');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1774','1','1','4',' Supplier detail edited','   apple : Detial edited   ','2025-11-30 15:09:37');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1775','1','1','4','New Supplier added',' New supplier  asdsadsa added   ','2025-11-30 15:09:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1776','1','1','4',' Supplier detail edited','   asdsadsa : Detial edited   ','2025-11-30 15:09:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1777','1','1','4','New Supplier added',' New supplier  sadsad added   ','2025-11-30 15:10:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1778','1','0','0','Login','Login from ::1','2025-11-30 18:30:30');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1779','1','1','82','New customer added','New customer test customer  added with Max Limit ','2025-11-30 18:36:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1780','1','3','82','Journal Cancelled','Journal ID 9','2025-11-30 19:00:17');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1781','1','3','82','Journal Restored','Journal ID 9','2025-11-30 19:01:04');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1782','1','3','82','Journal Entry','Memo: test','2025-11-30 19:15:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1783','1','3','4','Journal Entry','Memo: ds','2025-11-30 20:49:01');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1784','1','3','4','Journal Entry','Memo: aa','2025-11-30 20:52:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1785','1','3','4','Journal Entry','Memo: 234234','2025-11-30 20:57:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1786','1','3','4','Journal Entry','Memo: w','2025-11-30 20:57:47');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1787','1','3','4','Journal Entry','Memo: ss','2025-11-30 20:58:02');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1788','1','3','4','Journal Entry','Memo: 12','2025-11-30 21:05:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1789','1','3','4','Journal Entry','Memo: as','2025-11-30 21:10:27');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1790','1','0','0','Login','Login from ::1','2025-12-02 05:41:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1791','1','3','4','Journal Entry','Memo: tesr','2025-12-02 05:55:46');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1792','1','3','4','Journal Entry','Memo: tesr','2025-12-02 05:56:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1793','1','3','4','Journal Entry','Memo: tesr','2025-12-02 05:57:07');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1794','1','0','0','Login','Login from ::1','2025-12-02 17:42:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1795','1','3','4','Journal Entry','Memo: tesr','2025-12-02 17:46:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1796','1','3','82','Journal Entry','Memo: sadsad','2025-12-02 18:54:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1797','1','1','82','New Supplier added',' New supplier  tesrr added   ','2025-12-02 18:55:52');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1798','1','0','0','Login','Login from ::1','2025-12-02 20:16:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1799','1','3','82','Journal Entry','Memo: dd','2025-12-02 20:17:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1800','1','3','82','Journal Entry','Memo: 1','2025-12-02 20:26:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1801','1','3','82','Journal Entry','Memo: 1','2025-12-02 20:27:49');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1802','1','3','82','Journal Entry','Memo: 12','2025-12-02 20:28:20');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1803','1','3','82','Journal Entry','Memo: 12','2025-12-02 20:30:58');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1804','1','3','82','Journal Entry','Memo: s','2025-12-02 20:39:48');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1805','1','3','82','Journal Entry','Memo: s','2025-12-02 20:39:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1806','1','3','82','Journal Entry','Memo: sdf','2025-12-02 20:40:38');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1807','1','3','82','Journal Entry','Memo: 2','2025-12-02 20:50:33');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1808','1','3','82','Journal Entry','Memo: 2','2025-12-02 20:50:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1809','1','0','0','Login','Login from ::1','2025-12-05 08:44:14');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1810','1','0','0','Login','Login from ::1','2025-12-05 08:56:43');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1811','1','3','82','Journal Cancelled','Journal ID 31','2025-12-05 09:02:19');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1812','1','3','82','Journal Cancelled','Journal ID 30','2025-12-05 09:02:39');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1813','1','3','82','Journal Entry','Memo: 222','2025-12-05 09:21:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1814','1','3','82','Journal Entry','Memo: adsaaS','2025-12-05 09:31:16');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1815','1','3','82','Journal Entry','Memo: d','2025-12-05 09:32:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1816','1','3','82','Journal Entry','Memo: d','2025-12-05 09:33:06');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1817','1','3','82','Journal Entry','Memo: 2','2025-12-05 10:42:44');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1818','1','3','82','Journal Entry','Memo: w','2025-12-05 11:07:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1819','1','3','82','Journal Entry','Memo: w','2025-12-05 11:07:57');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1820','1','3','82','Journal Entry','Memo: w','2025-12-05 11:48:34');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1821','1','0','0','Login','Login from ::1','2025-12-05 14:05:26');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1822','1','3','4','Journal Entry','Memo: sadasd','2025-12-05 14:20:24');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1823','1','3','82','Journal Entry','Memo: cash sales','2025-12-05 15:26:50');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1824','1','3','82','Journal Entry','Memo: cash sales','2025-12-05 15:27:12');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1825','1','3','82','Journal Entry','Memo: cash sales','2025-12-05 15:27:29');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1826','1','0','0','Login','Login from ::1','2025-12-07 08:56:42');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1827','1','0','0','Login','Login from ::1','2025-12-09 11:32:00');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1828','1','0','0','Login','Login from ::1','2025-12-16 11:34:54');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1829','1','0','0','Login','Login from ::1','2025-12-16 11:36:35');
INSERT INTO `user_log` (`id`,`usr_id`,`module`,`location`,`action`,`detail`,`log_date`) VALUES ('1830','1','1','82','System Setup','Default OIL created with p_id = 0','2025-12-16 11:52:43');

-- ----------------------------
-- Table structure for `vat_sales_detail`
-- ----------------------------
DROP TABLE IF EXISTS `vat_sales_detail`;
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

-- ----------------------------
-- Table structure for `vat_sales_master`
-- ----------------------------
DROP TABLE IF EXISTS `vat_sales_master`;
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

-- ----------------------------
-- Table structure for `vat_sales_temp`
-- ----------------------------
DROP TABLE IF EXISTS `vat_sales_temp`;
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

