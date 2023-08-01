USE `otd`;

/*
JDE Reports:
	SO-PO:
		Request Date: >=7/1/2021
        SO's only
        Save As ".../Business Analyst Team/OTD Reports/Input Data/so-po.csv" 
	On Time Delivery Inquiry:
		Start Date: <First day of current month>
        End Date: <Last day of current month>
        Save As ".../Business Analyst Team/OTD Reports/Input Data/otd.csv"
*/
DROP TABLE IF EXISTS `OTD`;
DROP VIEW IF EXISTS `OTD Amount`;
DROP VIEW IF EXISTS `OTD Amount Percent`;
DROP TABLE IF EXISTS `SO-PO Export`;
DROP TABLE IF EXISTS `Customer Names Sr PMs`;
DROP TABLE IF EXISTS `OTD Amount Total 1`;

SET @sql_text =
CONCAT('DROP VIEW IF EXISTS `OTD Amount ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT('DROP VIEW IF EXISTS `OTD Amount Percent ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

CREATE TABLE `OTD` (
`Address Number` VARCHAR(20),
`Alpha Name` VARCHAR(50),
`Order Number` VARCHAR(20),
`Line Number` VARCHAR(50),
`Cat Cde` VARCHAR(50),
`Original Promised Date` VARCHAR(50),
`Request Date` VARCHAR(50),
`Actual Ship Date` VARCHAR(50),
`Lot Serial Number` VARCHAR(50),
`Reason Code` VARCHAR(50),
`Related PO/SO No` VARCHAR(50),
`On Time` VARCHAR(50),
`Comments` VARCHAR(50)
);

CREATE TABLE `SO-PO Export` (
`Order Number` VARCHAR(20),
`Or Ty` CHAR(3),
`Order Co` VARCHAR(10),
`Line Number` VARCHAR(25),
`Hd Cd` VARCHAR(10),
`Sold To` VARCHAR(10),
`Sold To Name` VARCHAR(50),
`Description 1` VARCHAR(50),
`Quantity` VARCHAR(25),
`UoM` CHAR(3),
`Secondary Quantity` VARCHAR(25),
`Secondary UoM` CHAR(3),
`Extended Amount` VARCHAR(25),
`Request Date` VARCHAR(15),
`Requested Time` VARCHAR(25),
`Ship To` VARCHAR(25),
`Original Or Num` VARCHAR(25),
`Original Or Type` CHAR(5),
`Original Or Co` VARCHAR(10),
`2nd Item Number` VARCHAR(50),
`3rd Item Number` VARCHAR(50),
`Last Status` VARCHAR(15),
`Next Status` VARCHAR(15),
`Customer PO` VARCHAR(50),
`Parent Number` VARCHAR(30),
`Agreement Number` VARCHAR(30),
`Shipment Number` VARCHAR(30),
`Pick Number` VARCHAR(30),
`Delivery Number` VARCHAR(30),
`Unit Price` VARCHAR(25),
`Price UoM` CHAR(3),
`Foreign Unit Price` VARCHAR(25),
`Foreign Extended Amount` VARCHAR(25),
`Order Date` VARCHAR(15),
`Short Item No` VARCHAR(20),
`Document Number` VARCHAR(20),
`Doc Ty` VARCHAR(20),
`Doc Co` VARCHAR(20),
`Scheduled Pick` VARCHAR(15),
`Scheduled Pick Time` VARCHAR(15),
`Original Promised` VARCHAR(15),
`Original Promised Time` VARCHAR(15),
`Actual Ship` VARCHAR(15),
`Actual Ship Time` VARCHAR(15),
`Invoice Date` VARCHAR(15),
`Cancel Date` VARCHAR(15),
`G/L Date` VARCHAR(15),
`Promised Delivery` VARCHAR(15),
`Promised Delivery Time` VARCHAR(15),
`Branch/Plant` VARCHAR(25),
`Ln Ty` CHAR(3),
`Description Line 2` VARCHAR(50),
`Sls Cd1` VARCHAR(10),
`Sls Cd2` VARCHAR(10),
`Sls Cd3` VARCHAR(10),
`Sls Cd4` VARCHAR(10),
`Sls Cd5` VARCHAR(10),
`Cur Cod` CHAR(5),
`Exchange Rate` VARCHAR(25),
`Base Curr` CHAR(5),
`Quantity Ordered` VARCHAR(25),
`Quantity Shipped` VARCHAR(25),
`Quantity Backordered` VARCHAR(25),
`Quantity Canceled` VARCHAR(25),
`Price Effective Date` VARCHAR(15),
`Rel Ord` VARCHAR(15),
`Rel Ord Type` VARCHAR(15),
`Related PO/WO No` VARCHAR(25),
`Related PO/WO Line No` VARCHAR(25),
`Transaction Originator` VARCHAR(25),
`Carrier Number` VARCHAR(25),
`FH` CHAR(5),
`Mod Trn` VARCHAR(20),
`Zone No.` CHAR(3),
`Lot Serial Number` VARCHAR(20),
`Location` VARCHAR(20),
`Deliver To` VARCHAR(20),
`Pull Signal` VARCHAR(20),
`Subsite Extended Price` VARCHAR(25),
`Subsite Unit Price` VARCHAR(25),
`Subsite Exchange Rate` VARCHAR(25),
`Subsite Currency` CHAR(5)
);

CREATE TABLE `Customer Names Sr PMs` (
	`Customer Name` VARCHAR(50),
	`Sr PM` VARCHAR(50),
	`CSR Name` VARCHAR(50)
);

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/otd.csv'
INTO TABLE `OTD` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/so-po.csv' 
INTO TABLE `SO-PO Export` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/Customer Names Sr PMs.csv'
INTO TABLE `Customer Names Sr PMs` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

UPDATE `SO-PO Export`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'OKY';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'CNB';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'CNS';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'CS';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'CSC';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'CBH';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'K03';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'K10';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'K14';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'K15';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'K16';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'K17';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'RC';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'MPD';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'OOS';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'LCH';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'ART';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'CSE';

UPDATE `OTD`
SET `On Time` = 'Y'
WHERE `Reason Code` = 'CVL';

UPDATE `SO-PO Export` AS b
SET b.`Request Date` = STR_TO_DATE(`Request Date`, '%m/%d/%Y');

UPDATE `SO-PO Export` AS b
SET b.`Request Date` = ''
WHERE b.`Request Date` IS NULL;

CREATE VIEW `OTD Amount Percent` AS 
	SELECT a.`On Time`, COUNT(*) AS `Count`, SUM(`Extended Amount`) AS `Extended Amount`
	FROM (
		SELECT *
		FROM `OTD`
		GROUP BY `Order Number`) AS a
	JOIN (
		SELECT `Order Number`, SUM(`Extended Amount`) AS `Extended Amount`
		FROM `SO-PO Export`
		GROUP BY `Order Number`) AS b
	ON a.`Order Number` = b.`Order Number`
	GROUP BY a.`On Time`;
    
CREATE VIEW `OTD Amount` AS (
	SELECT a.*, SUM(b.`Extended Amount`) AS 'Extended Amount'
	FROM `OTD` AS a
	LEFT JOIN `SO-PO Export` AS b
	ON a.`Order Number` = b.`Order Number`
	WHERE `On Time` = 'N'
	GROUP BY `Order Number`
);

SELECT *
FROM `OTD Amount`;

SELECT *
FROM `OTD Amount Percent`;

DROP TABLE IF EXISTS `OTD Amount Total`;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `OTD Amount Total ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

CREATE TABLE `OTD Amount Total 1` AS (
	SELECT a.*, SUM(b.`Extended Amount`) AS 'Extended Amount'
	FROM `OTD` AS a
	LEFT JOIN `SO-PO Export` AS b
	ON a.`Order Number` = b.`Order Number`
	GROUP BY `Order Number`
);

CREATE TABLE `OTD Amount Total` AS (
	SELECT a.*, b.`Sr PM`, b.`CSR Name`
	FROM `OTD Amount Total 1` AS a
	JOIN `Customer Names Sr PMs` AS b
	ON a.`Alpha Name` = b.`Customer Name`
);

ALTER TABLE `OTD Amount Total`
DROP COLUMN `Comments`,
ADD COLUMN `Month` VARCHAR(15) FIRST;

/*USE THIS FOR THE END OF THE MONTH*/
/*
UPDATE `OTD Amount Total`
SET `Month` = CONCAT(DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL -1 MONTH), '%M'), '-22');
/*-----------------------*/



/*USE THIS FOR THE FOR THE WEEKLY REPORT*/

UPDATE `OTD Amount Total`
SET `Month` = CONCAT(DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 0 MONTH), '%M'), '-22');
/*-----------------------*/


UPDATE `OTD Amount Total`
SET `Reason Code` = 'On time'
WHERE `Reason Code` = '';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'ART - Customer artwork change'
WHERE `Reason Code` = 'ART';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'CBH - Customer Bill and Hold'
WHERE `Reason Code` = 'CBH';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'CMP - Pending components - PCI vendor'
WHERE `Reason Code` = 'CMP';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'CNB - Customer - No Bulk'
WHERE `Reason Code` = 'CNB';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'CNS'
WHERE `Reason Code` = 'CNS - Carrier No Show';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'CSC - Customer Supplied Components'
WHERE `Reason Code` = 'CSC';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'DBR - Delayed Batch Record Release'
WHERE `Reason Code` = 'DBR';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'DOC - Pending PCI documents'
WHERE `Reason Code` = 'DOC';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'K10 - CUST-Late change'
WHERE `Reason Code` = 'K10';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'K14 - CUST-Delayed QA Release'
WHERE `Reason Code` = 'time';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'K15 - CUST - Info missing / changed'
WHERE `Reason Code` = 'K15';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'K17 - CUST-Reqt dte within lead time'
WHERE `Reason Code` = 'K17';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'K20 - LOGI-Inventory Error'
WHERE `Reason Code` = 'K20';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'K36 - PROD-Capacity'
WHERE `Reason Code` = 'K36';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'K38 - PROD-Delays'
WHERE `Reason Code` = 'K38';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'K50 - VEND-RM or Component Quality'
WHERE `Reason Code` = 'K50';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'K51 - VEND-Late Delivery/Services'
WHERE `Reason Code` = 'K51';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'LCH - Customer launch'
WHERE `Reason Code` = 'LCH';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'OKY - not late'
WHERE `Reason Code` = 'OKY';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'PBU - Business unit miss'
WHERE `Reason Code` = 'PBU';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'QDN - QA-Deviation Notice/Quarantine'
WHERE `Reason Code` = 'QDN';

UPDATE `OTD Amount Total`
SET `Reason Code` = 'REO - PCI Reordering Components due to Excess Scrap'
WHERE `Reason Code` = 'REO';

SELECT *
FROM `OTD Amount Total`;

SET @sql_text =
CONCAT(
'SELECT \'Address Number\', \'Alpha Name\', \'Order Number\', \'Line Number\', \'Cat Cde\', \'Original Promise Date\', \'Request Date\', \'Actual Ship Date\', \'Lot Serial Number\', \'Reason Code\', \'Related PO/SO No\', \'On Time\', \'Comments\', \'Extended Amount\', \'Sr PM\', \'CSR Name\'
UNION ALL
SELECT *
FROM `OTD Amount`
INTO OUTFILE \'N:/All Business Units/Common Data/Business Analyst Team/OTD Reports/monthly_otd_', CURDATE(), '.csv'
'\'FIELDS TERMINATED BY \',\'
ENCLOSED BY \'"\'
LINES TERMINATED BY \'\r\n\''
);
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text1 = 
CONCAT(
'RENAME TABLE `OTD Amount` TO `OTD Amount ', CURDATE(), '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT(
'SELECT \'On Time\', \'Count\', \'Extended Amount\'
UNION ALL
SELECT *
FROM `OTD Amount Percent`
INTO OUTFILE \'N:/All Business Units/Common Data/Business Analyst Team/OTD Reports/monthly_otd_percentage_', CURDATE(), '.csv'
'\'FIELDS TERMINATED BY \',\'
ENCLOSED BY \'"\'
LINES TERMINATED BY \'\r\n\''
);
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text1 = 
CONCAT(
'RENAME TABLE `OTD Amount Percent` TO `OTD Amount Percent ', CURDATE(), '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;

/*
SELECT COUNT(*)
FROM `OTD`
WHERE `Reason Code` = 'OKY';

SELECT `Order Number`, SUM(`Extended Amount`), `Extended Amount`
FROM `SO-PO Export`
GROUP BY `Order Number`
HAVING SUM(`Extended Amount`) <> `Extended Amount`;

SELECT *
FROM `SO-PO Export`
WHERE `Order Number` = 21355;

SELECT *
FROM `OTD`
GROUP BY `Order Number`;

SELECT `Order Number`
FROM `SO-PO Export`
GROUP BY `Order Number`;*/

