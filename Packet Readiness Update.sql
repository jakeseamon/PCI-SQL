USE `packet readiness` ;

DROP TABLE IF EXISTS `Billing Commit`;
DROP TABLE IF EXISTS `Actual Complete`;
DROP TABLE IF EXISTS `Customer Names Sr PMs`;
DROP TABLE IF EXISTS `packet readiness`;
DROP TABLE IF EXISTS `packet readiness temp`;
DROP TABLE IF EXISTS `packet readiness temp 1`;
DROP TABLE IF EXISTS `packet readiness temp 2`;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `Packet Readiness ', CURDATE() + INTERVAL 1 DAY, '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

/*
JDE Reports & Parameters
	Billing Commit:
		Request Date: 7/1/2021 to *
        Save As:
            N:\All Business Units\Common Data\Business Analyst Team\Input Data\billing_report_xl.csv
    Actual Complete:
        Request Date: 7/1/2021 to *
        Save As:
            N:\All Business Units\Common Data\Business Analyst Team\Input Data\Actual Complete.csv
*/

CREATE TABLE `Billing Commit` (
    `SO` VARCHAR(20),
    `SO Line` VARCHAR(20),
    `SO Type` CHAR(5),
    `Planned Bill Date` VARCHAR(30),
    `Current Bill Amount` VARCHAR(30),
    `Frozen Bill Amount` VARCHAR(30),
    `Item Number` VARCHAR(30),
    `Item Description` VARCHAR(50),
    `Addition` CHAR(1),
    `Fall Out` CHAR(1),
    `At Risk` CHAR(1),
    `Up Side` CHAR(1),
    `FG Lot Number` VARCHAR(30),
    `WO` VARCHAR(20),
    `WO Type` CHAR(5),
    `Customer` VARCHAR(30),
    `Customer Name` VARCHAR(50),
    `CSR` VARCHAR(10),
    `CSR Name` VARCHAR(30),
    `Actual Bill Date` VARCHAR(30),
    `Actual Bill Amount` VARCHAR(30),
    `Request Date` VARCHAR(30),
    `Orig Promise Date` VARCHAR(30),
    `Commitment Number` VARCHAR(1),
    `Active Flag` CHAR(1),
    `Billing Commitment Comments` VARCHAR(500)
);

CREATE TABLE `Actual Complete` (
    `Order No` VARCHAR(35),
    `Type` VARCHAR(35),
    `2nd Item Number` VARCHAR(35),
    `Item Description` VARCHAR(35),
    `Item UOM` VARCHAR(35),
    `Order Date` VARCHAR(35),
    `Branch/ Plant` VARCHAR(35),
    `Request Date` VARCHAR(35),
    `Planned Effective Date` VARCHAR(35),
    `Start Date` VARCHAR(35),
    `WO Description` VARCHAR(35),
    `Quantity Ordered` VARCHAR(35),
    `Secondary Qty Ordered` VARCHAR(35),
    `Secondary UOM` VARCHAR(35),
    `Status` VARCHAR(35),
    `Description` VARCHAR(35),
    `Line/Cell` VARCHAR(35),
    `Priority` VARCHAR(35),
    `Related SO No` VARCHAR(35),
    `Related Type` VARCHAR(35),
    `Co Key` VARCHAR(35),
    `Line No` VARCHAR(35),
    `Parent Order` VARCHAR(35),
    `Customer` VARCHAR(35),
    `Planner` VARCHAR(35),
    `Supervisor` VARCHAR(35),
    `Ctg 01` VARCHAR(35),
    `Ctg 02` VARCHAR(35),
    `Ctg 03` VARCHAR(35),
    `Location` VARCHAR(35),
    `Reference` VARCHAR(35),
    `Lot/ Serial` VARCHAR(35),
    `Short Item No` VARCHAR(35),
    `3rd Item Number` VARCHAR(35),
    `Quantity Shipped` VARCHAR(35),
    `Quantity Canceled` VARCHAR(35),
    `Order Suffix` VARCHAR(35)
);

CREATE TABLE `Customer Names Sr PMs` (
	`Customer Name` VARCHAR(50),
	`Sr PM` VARCHAR(50)
);

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/billing_report_xl.csv' 
INTO TABLE `Billing Commit` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/actual_complete.csv' 
INTO TABLE `Actual Complete`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/Customer Names Sr PMs.csv'
INTO TABLE `Customer Names Sr PMs` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

ALTER TABLE `Billing Commit`
ADD INDEX `WO` (`WO`);

ALTER TABLE `Actual Complete`
ADD INDEX `Order No` (`Order No`);

UPDATE `Billing Commit` AS s
SET s.`Planned Bill Date` = STR_TO_DATE(`Planned Bill Date`, '%m/%d/%Y');

UPDATE `Billing Commit` AS s
SET s.`Orig Promise Date` = STR_TO_DATE(`Orig Promise Date`, '%m/%d/%Y');

UPDATE `Actual Complete` AS s
SET s.`Request Date` = STR_TO_DATE(`Request Date`, '%m/%d/%Y');

UPDATE `Actual Complete` AS s
SET s.`Start Date` = STR_TO_DATE(`Start Date`, '%m/%d/%Y');

CREATE TABLE `packet readiness temp 1` AS (
    SELECT b.`Customer Name`, a.`Order No`, a.`Related SO No`, a.`2nd Item Number`, a.`Item Description`, a.`Item UOM`, a.`Request Date`, a.`Start Date`, b.`Orig Promise Date`, (a.`Start Date` - INTERVAL 15 DAY) AS `Packet Readiness Date`, (a.`Start Date` - INTERVAL 7 DAY) AS `BR Due Date`, a.`Quantity Ordered`, b.`Planned Bill Date`, a.`Status`, a.`Ctg 01` AS `Room`, '' AS `Comments`
    FROM `Actual Complete` AS a
    JOIN `Billing Commit` AS b
    ON a.`Order No` = b.`WO`
);

CREATE TABLE `packet readiness temp` AS (
    SELECT *
    FROM `packet readiness temp 1`
    WHERE `Packet Readiness Date` > DATE(NOW()) - INTERVAL 30 DAY
    AND `Packet Readiness Date` < DATE(NOW()) + INTERVAL 40 DAY
    AND `2nd Item Number` <> 'PCR-SST PLACE HOLDER'
    ORDER BY `Packet Readiness Date` ASC
);

CREATE TABLE `packet readiness` AS (
    SELECT `Customer Name`, `Order No`, `Related SO No`, `2nd Item Number`, `Item Description`, `Item UOM`, `Request Date`, `Start Date`, `Orig Promise Date`, `Packet Readiness Date`, `BR Due Date`, `Quantity Ordered`, MAX(`Planned Bill Date`) AS `Planned Bill Date`, `Status`, `Room`, `Comments`
    FROM `packet readiness temp`
    GROUP BY `Order No`
    ORDER BY `Packet Readiness Date` ASC
);

DELETE
FROM `packet readiness`
WHERE `Status` > 35;

UPDATE `packet readiness`
SET `Planned Bill Date` = COALESCE(`Planned Bill Date`, '');

UPDATE `packet readiness`
SET `Room` = COALESCE(`Room`, '');

ALTER TABLE `packet readiness`
ADD COLUMN `Sr PM` VARCHAR(50) AFTER `Item Description`;

UPDATE `packet readiness` AS a
JOIN `Customer Names Sr PMs` AS b
ON a.`Customer Name` = b.`Customer Name`
SET a.`Sr PM` = b.`Sr PM`;

SET @sql_text =
CONCAT(
'SELECT \'Customer\', \'WO\', \'SO\',\'Item Number\', \'Description\', \'Sr PM\', \'Item UOM\', \'Request Date\', \'Start Date\', \'Orig Promise Date\', \'Packet Readiness Date\', \'BR Due Date\', \'Quantity Ordered\', \'Planned Bill Date\', \'Status\', \'Room\', \'Comments\'
UNION ALL
SELECT \`Customer Name\`, \`Order No\`, \`Related SO No\`, \`2nd Item Number\`, \`Item Description\`, \`Sr PM\`, \`Item UOM\`, \`Request Date\`, \`Start Date\`, \`Orig Promise Date\`, \`Packet Readiness Date\`, \`BR Due Date\`, \`Quantity Ordered\`, \`Planned Bill Date\`, \`Status\`, \`Room\`, \`Comments\`
FROM `packet readiness`
INTO OUTFILE\'N:/All Business Units/Common Data/Business Analyst Team/Packet Readiness/Packet Readiness Team Huddle/Packet_Readiness_',
CURDATE() + INTERVAL 1 DAY, '.csv'
'\'FIELDS TERMINATED BY \',\'
ENCLOSED BY \'"\'
LINES TERMINATED BY \'\r\n\''
);

PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text1 =
CONCAT(
'RENAME TABLE `Packet Readiness` TO `Packet Readiness ', CURDATE() + INTERVAL 1 DAY, '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;