USE `billing commit report test`;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `billing commit report xl ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `Late Commit xl ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `Mark at Risk in JDE xl ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `Up Side At Risk xl ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

DROP TABLE IF EXISTS `billing commit report`;
DROP TABLE IF EXISTS `billing commit report temp`;
DROP TABLE IF EXISTS `billing commit report temp 1`;
DROP TABLE IF EXISTS `Mark at Risk in JDE`;
DROP TABLE IF EXISTS `Up Side At Risk`;
DROP TABLE IF EXISTS `SST Work Order Revision`;
DROP TABLE IF EXISTS `Enter Change Order`;
DROP TABLE IF EXISTS `open_orders`;
DROP TABLE IF EXISTS `Late Commit`;
DROP TABLE IF EXISTS `lot_master`;
DROP TABLE IF EXISTS `Finance Adjustments`;
DROP TABLE IF EXISTS `Janssen Commit`;
DROP TABLE IF EXISTS `PO Report`;
DROP TABLE IF EXISTS `PO Report Temp`;
DROP TABLE IF EXISTS `LCD Report`;
DROP TABLE IF EXISTS `Actual Complete`;
DROP TABLE IF EXISTS `Customer Names Sr PMs`;

/*
JDE Reports & Parameters
	Billing Commit:
		Request Date: 1/1/2020 to *
    SST Work Order Revision:
		Planned Start: >= 10/1/2019
        Planned Complete: *
	Lot Master:
		Status Code: Q
	S&OP Actuals:
		Request Date: >=12/1/2019
	LCD Report:
		Form > Assign Dates
			Production Begin: 12/1/2019
		**Remember to close out of this when finished export**
*/

CREATE TABLE `billing commit report temp 1` (
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

CREATE TABLE `SST Work Order Revision` (
`Order Ty` CHAR(2),
`Order Number` INT(20),
`Room` VARCHAR(10),
`Branch Plant` VARCHAR(20),
`WO St` VARCHAR(3),
`2nd Item Number` VARCHAR(30),
`Customer Number` VARCHAR(30),
`Customer Name` VARCHAR(50),
`Quantity Ordered` INT(20),
`UM` CHAR(3),
`Request Date` VARCHAR(30),
`Planned Start` VARCHAR(30),
`Planned Complete` VARCHAR(30),
`Project Coordinator` VARCHAR(30),
`Project Coordinator 2` VARCHAR(30),
`Planner Number` VARCHAR(30),
`Planner Number 2` VARCHAR(30),
`Rel Order Type` CHAR(5),
`Related PO/SO No` VARCHAR(20),
`Description` VARCHAR(500)
);

CREATE TABLE `Enter Change Order` (
    `Order No` VARCHAR(35),
    `Type` VARCHAR(35),
    `2nd Item Number` VARCHAR(35),
    `Item Description` VARCHAR(35),
    `Item UOM` VARCHAR(35),
    `Order Date` VARCHAR(35),
    `Branch/ Plant` VARCHAR(35),
    `Request Date` VARCHAR(35),
    `Planned Effective Date` VARCHAR(35),
    `Complete Date` VARCHAR(35),
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

CREATE TABLE `open_orders` (
`Company` VARCHAR(25),
`Business Unit(AC03)` VARCHAR(40),
`Alpha Name` VARCHAR(50),
`Customer Code` VARCHAR(30),
`Order Date` VARCHAR(20),
`SO` VARCHAR(20),
`Product` VARCHAR(100),
`FG Number` VARCHAR(100),
`PO Info` VARCHAR(100),
`Quantity` INT,
`WO` VARCHAR(15),
`Request` VARCHAR(15),
`OPD` VARCHAR(15),
`Late` VARCHAR(10),
`Matrix Last Comp` VARCHAR(15),
`Start` VARCHAR(15),
`End` VARCHAR(15),
`Prom Ship` VARCHAR(15),
`WO2` VARCHAR(15),
`RM` VARCHAR(5),
`Stat` VARCHAR(5),
`Scheduled` VARCHAR(15),
`Comment` VARCHAR(100),
`FG Line Sales Amount` DECIMAL(15,2));

CREATE TABLE `lot_master` (
	`Second Item Number` VARCHAR(50),
	`Description` VARCHAR(50),
	`Status Code` VARCHAR(50),
	`Status Description` VARCHAR(50),
	`Expiration Date` VARCHAR(50),
	`% of Life Remaining` VARCHAR(50),
	`No. of Days Remaining` VARCHAR(50),
	`Quantity On Hand/Held` VARCHAR(50),
	`Quantity Available` VARCHAR(50),
	`Branch/Plant` VARCHAR(50),
	`Lot/Serial` VARCHAR(50),
	`Lot Description` VARCHAR(50),
	`Country of Origin` VARCHAR(50),
	`Memo Lot 1` VARCHAR(50),
	`Memo Lot 2` VARCHAR(50),
	`Memo Lot 3` VARCHAR(50),
	`Supplier Lot Number` VARCHAR(50),
	`Lot Grade` VARCHAR(50),
	`Lot Potency` VARCHAR(50),
	`Third Item Number` VARCHAR(50),
	`Short Item Number` VARCHAR(50),
	`Work Order Number` VARCHAR(50),
	`On Hand Date` VARCHAR(50),
	`Based On Date` VARCHAR(50),
	`Sell By Date` VARCHAR(50),
	`Best Before Date` VARCHAR(50),
	`Lot Effectivity Date` VARCHAR(50),
	`User Lot Date 1` VARCHAR(50),
	`User Lot Date 2` VARCHAR(50),
	`User Lot Date 3` VARCHAR(50),
	`User Lot Date 4` VARCHAR(50),
	`User Lot Date 5` VARCHAR(50)
);

CREATE TABLE `Finance Adjustments` (
	`Customer` VARCHAR(50),
	`Or Ty` VARCHAR(2),
	`Jul-Adj` VARCHAR(50),
	`Aug-Adj` VARCHAR(50),
	`Sep-Adj` VARCHAR(50),
	`Oct-Adj` VARCHAR(50),
	`Nov-Adj` VARCHAR(50),
	`Dec-Adj` VARCHAR(50),
	`Jan-Adj` VARCHAR(50),
	`Feb-Adj` VARCHAR(50),
	`Mar-Adj` VARCHAR(50),
	`Apr-Adj` VARCHAR(50),
	`May-Adj` VARCHAR(50),
	`Jun-Adj` VARCHAR(50)
);

CREATE TABLE `Janssen Commit` (
	`Customer Name` VARCHAR(30),
	`SO` VARCHAR(30),
	`WO` VARCHAR(30),
	`Item Number` VARCHAR(30),
	`Item Description` VARCHAR(30),
	`Current Bill Amount` VARCHAR(30),
	`SO Line` VARCHAR(30),
	`Billing Commitment Comments` VARCHAR(30),
	`FG Lot Number` VARCHAR(30),
	`SO Type` VARCHAR(30),
	`Planned Bill Date` VARCHAR(30),
	`Frozen Bill Amount` VARCHAR(30),
	`Add ition` VARCHAR(30),
	`Fall Out` VARCHAR(30),
	`At Risk` VARCHAR(30),
	`Up side` VARCHAR(30),
	`WO Type` VARCHAR(30),
	`Customer` VARCHAR(30),
	`CSR` VARCHAR(30),
	`CSR Name` VARCHAR(30),
	`Actual Bill Date` VARCHAR(30),
	`Actual Bill Amount` VARCHAR(30),
	`Request Date` VARCHAR(30),
	`Orig Promise Date` VARCHAR(30),
	`Commitment Number` VARCHAR(30),
	`Active Flag` VARCHAR(30)
);

CREATE TABLE `PO Report` (
	`Order Number` TEXT(50),
	`Or Ty` TEXT(50),
	`Order Co` TEXT(50),
	`Line Number` TEXT(50),
	`Hd Cd` TEXT(50),
	`Sold To` TEXT(50),
	`Sold To Name` VARCHAR(50),
	`Description 1` TEXT(50),
	`Quantity` TEXT(50),
	`UOM` TEXT(50),
	`Secondary Quantity` TEXT(50),
	`Secondary UoM` TEXT(50),
	`Extended Amount` VARCHAR(50),
	`Request Date` TEXT(50),
	`Requested Time` TEXT(50),
	`Ship To` TEXT(50),
	`Original Or Num` TEXT(50),
	`Original Or Type` TEXT(50),
	`Orig Or Co` TEXT(50),
	`2nd Item Number` TEXT(50),
	`3rd Item Number` TEXT(50),
	`Last Status` TEXT(50),
	`Next Status` TEXT(50),
	`Customer PO` TEXT(50),
	`Parent Number` TEXT(50),
	`Agreement Number` TEXT(50),
	`Shipment Number` TEXT(50),
	`Pick Number` TEXT(50),
	`Delivery Number` TEXT(50),
	`Unit Price` TEXT(50),
	`Price UOM` TEXT(50),
	`Foreign Unit Price` TEXT(50),
	`Foreign Extended Amount` TEXT(50),
	`Order Date` TEXT(50),
	`Short Item No` TEXT(50),
	`Document Number` TEXT(50),
	`Doc Ty` TEXT(50),
	`Doc Co` TEXT(50),
	`Scheduled Pick` TEXT(50),
	`Scheduled Pick Time` TEXT(50),
	`Original Promised` TEXT(50),
	`Original Promised Time` TEXT(50),
	`Actual Ship` TEXT(50),
	`Actual Ship Time` TEXT(50),
	`Invoice Date` VARCHAR(50),
	`Cancel Date` VARCHAR(50),
	`G/L Date` VARCHAR(50),
	`Promised Delivery` VARCHAR(50),
	`Promised Delivery Time` VARCHAR(50),
	`Branch/Plant` VARCHAR(50),
	`Ln Ty` VARCHAR(50),
	`Description Line 2` VARCHAR(50),
	`Sls Cd1` VARCHAR(50),
	`Sls Cd2` VARCHAR(50),
	`Sls Cd3` VARCHAR(50),
	`Sls Cd4` VARCHAR(50),
	`Sls Cd5` VARCHAR(50),
	`Cur Cod` VARCHAR(50),
	`Exchange Rate` TEXT(50),
	`Base Curr` TEXT(50),
	`Quantity Ordered` TEXT(50),
	`Quantity Shipped` TEXT(50),
	`Quantity Backordered` TEXT(50),
	`Quantity Canceled` TEXT(50),
	`Price Effective Date` TEXT(50),
	`Rel Ord` TEXT(50),
	`Rel Ord Type` TEXT(50),
	`Related PO/WO No` TEXT(50),
	`Related PO/WO Line No` TEXT(50),
	`Transaction Originator` TEXT(50),
	`Carrier Number` TEXT(50),
	`F H` TEXT(50),
	`Mod Trn` TEXT(50),
	`Zone No.` TEXT(50),
	`Lot Serial Number` TEXT(50),
	`Location` TEXT(50),
	`Deliver To` TEXT(50),
	`Pull Signal` TEXT(50),
	`Subsite Extended Price` TEXT(50),
	`Subsite Unit Price` TEXT(50),
	`Subsite Exchange Rate` TEXT(50),
	`Subsite Currency` TEXT(50)
);

CREATE TABLE `LCD Report` (
	`Sequence Number` VARCHAR(35),
	`Primary Room` VARCHAR(35),
	`Customer Number` VARCHAR(35),
	`Customer Name` VARCHAR(35),
	`Or Ty` VARCHAR(35),
	`Order Number` VARCHAR(35),
	`Description` VARCHAR(35),
	`Day Order` VARCHAR(35),
	`Quantity Ordered` VARCHAR(35),
	`UM` VARCHAR(35),
	`Number Shifts` VARCHAR(35),
	`Time for Changeover and Setup` VARCHAR(35),
	`Must Pack By Date` VARCHAR(35),
	`Do not Schedule Before Date` VARCHAR(35),
	`Production Begin` VARCHAR(35),
	`Production Complete` VARCHAR(35),
	`Primary Production Actual Start Date` VARCHAR(35),
	`Last Component Due Date` VARCHAR(35),
	`Batch Record` VARCHAR(35),
	`Send Batch Rec to Cust Date` VARCHAR(35),
	`Promised Ship Date` VARCHAR(35),
	`Original Promised Date` VARCHAR(35),
	`Cust Req Ship Date` VARCHAR(35),
	`People Needed` VARCHAR(35),
	`Number Days Needed` VARCHAR(35),
	`Number Shifts Needed` VARCHAR(35),
	`First Agreed Ship Date` VARCHAR(35),
	`Labels Complete` VARCHAR(35),
	`First Agreed BR to Cust` VARCHAR(35),
	`First Agreed Prd Comp` VARCHAR(35),
	`Business Unit` VARCHAR(35),
	`Comment` VARCHAR(35),
	`Item Number` VARCHAR(35),
	`Status Code` VARCHAR(35),
	`Related PO/SO No` VARCHAR(35),
	`Complete Date` VARCHAR(35),
	`MOBI` VARCHAR(35)
);

CREATE TABLE `Actual Complete` (
`Order No` VARCHAR(50),
`Type` VARCHAR(50),
`2nd Item Number` VARCHAR(50),
`Item Description` VARCHAR(50),
`Item UOM` VARCHAR(50),
`Order Date` VARCHAR(50),
`Branch/ Plant` VARCHAR(50),
`Request Date` VARCHAR(50),
`Planned Effective Date` VARCHAR(50),
`Start Date` VARCHAR(50),
`WO Description` VARCHAR(50),
`Quantity Ordered` VARCHAR(50),
`Secondary Qty Ordered` VARCHAR(50),
`Secondary UOM` VARCHAR(50),
`Status` VARCHAR(50),
`Description` VARCHAR(50),
`Line/Cell` VARCHAR(50),
`Priority` VARCHAR(50),
`Related SO No` VARCHAR(50),
`Related Type` VARCHAR(50),
`Co Key` VARCHAR(50),
`Line No` VARCHAR(50),
`Parent Order` VARCHAR(50),
`Customer` VARCHAR(50),
`Planner` VARCHAR(50),
`Supervisor` VARCHAR(50),
`Ctg 01` VARCHAR(50),
`Ctg 02` VARCHAR(50),
`Ctg 03` VARCHAR(50),
`Location` VARCHAR(50),
`Reference` VARCHAR(50),
`Lot/ Serial` VARCHAR(50),
`Short Item No` VARCHAR(50),
`3rd Item Number` VARCHAR(50),
`Quantity Shipped` VARCHAR(50),
`Quantity Canceled` VARCHAR(50),
`Order Suffix` VARCHAR(50)
);

CREATE TABLE `Customer Names Sr PMs` (
	`Customer Name` VARCHAR(50),
	`Sr PM` VARCHAR(50),
	`CSR Name` VARCHAR(50)
);

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/open_orders.csv' 
INTO TABLE `open_orders` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 6 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/billing_report_xl.csv'
INTO TABLE `billing commit report temp 1` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/sst_report_xl.csv' 
INTO TABLE `SST Work Order Revision` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/enter change order.csv' 
INTO TABLE `Enter Change Order`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/lot_master.csv' 
INTO TABLE `lot_master` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/S&OP/Input Data/Finance Adjustments Template.csv'
INTO TABLE `Finance Adjustments` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/Janssen Commit Template.csv'
INTO TABLE `Janssen Commit` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/po_report.csv'
INTO TABLE `PO Report` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/lcd_report.csv'
INTO TABLE `LCD Report` 
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
/*
CREATE TABLE `billing commit report` AS (
	SELECT `SO`, `SO Line`, `SO Type`, MAX(STR_TO_DATE(`Planned Bill Date`, '%m/%d/%Y')) AS `Planned Bill Date`, `Current Bill Amount`, `Frozen Bill Amount`, `Item Number`, `Item Description`, `Addition`, `Fall Out`, `At Risk`, `Up Side`, `FG Lot Number`, `WO`, `WO Type`, `Customer`, `Customer Name`, `CSR`, `CSR Name`, `Actual Bill Date`, `Actual Bill Amount`, `Request Date`, `Orig Promise Date`, `Commitment Number`, `Active Flag`, `Billing Commitment Comments`
	FROM `billing commit report temp 1`
	GROUP BY `WO`
);
*/
CREATE TABLE `billing commit report` AS (
	SELECT *
	FROM `billing commit report temp 1`
);

UPDATE `Janssen Commit`
SET `Customer Name` = 'GPSG (Janssen)'
WHERE `Customer Name` = 'Janssen';

ALTER TABLE `Janssen Commit`
MODIFY `WO` INT(20) FIRST,
MODIFY `SO` INT(20),
ADD INDEX `WO` (`WO`),
ADD INDEX `SO` (`SO`),
ADD INDEX `Item Number` (`Item Number`);

ALTER TABLE `billing commit report`
MODIFY `WO` INT(20) FIRST,
MODIFY `SO` INT(20),
ADD INDEX `WO` (`WO`),
ADD INDEX `SO` (`SO`),
ADD INDEX `Item Number` (`Item Number`);

ALTER TABLE `LCD Report`
MODIFY `Order Number` INT(20) FIRST,
ADD INDEX `Order Number` (`Order Number`);

ALTER TABLE `Actual Complete`
MODIFY `Order No` INT(20) FIRST,
ADD INDEX `Order No` (`Order No`);

ALTER TABLE `Janssen Commit`
MODIFY `SO Line` VARCHAR(30) AFTER `SO`,
MODIFY `SO Type` VARCHAR(30) AFTER `SO Line`,
MODIFY `Planned Bill Date` VARCHAR(30) AFTER `SO Type`,
MODIFY `Current Bill Amount` VARCHAR(30) AFTER `Planned Bill Date`,
MODIFY `Frozen Bill Amount` VARCHAR(30) AFTER `Current Bill Amount`,
MODIFY `Add ition` VARCHAR(30) AFTER `Item Description`,
MODIFY `Fall Out` VARCHAR(30) AFTER `Add ition`,
MODIFY `At Risk` VARCHAR(30) AFTER `Fall Out`,
MODIFY `Up side` VARCHAR(30) AFTER `At Risk`,
MODIFY `Customer Name` VARCHAR(30) AFTER `Customer`,
MODIFY `Billing Commitment Comments` VARCHAR(30) AFTER `Active Flag`;

CREATE TABLE `billing commit report temp` AS (
	SELECT *
    FROM `billing commit report`
    UNION ALL
    SELECT *
    FROM `Janssen Commit`
);

DROP TABLE IF EXISTS `billing commit report`;

RENAME TABLE `billing commit report temp` TO `billing commit report`;

ALTER TABLE `billing commit report`
ADD INDEX `WO` (`WO`),
ADD INDEX `SO` (`SO`),
ADD INDEX `Item Number` (`Item Number`);

ALTER TABLE `billing commit report`
ADD `Start Date` VARCHAR(10) AFTER `SO`,
ADD `Prod Com` VARCHAR(10) AFTER `Start Date`,/*
ADD `Actual Complete Date` VARCHAR(10) AFTER `Prod Com`,*/
ADD `Room` VARCHAR(10) AFTER `Prod Com`,
ADD `Status` VARCHAR(10) AFTER `Room`,
ADD `Prom Ship` VARCHAR(30) AFTER `Status`,
ADD `PO` VARCHAR(50) AFTER `SO`,
ADD `Last Component Due Date` VARCHAR(10) AFTER `PO`;

ALTER TABLE `SST Work Order Revision`
MODIFY `Order Number` INT(20) FIRST,
ADD INDEX `Order Number` (`Order Number`);

ALTER TABLE `Enter Change Order`
ADD INDEX `Order No` (`Order No`);

ALTER TABLE `PO Report`
MODIFY `Order Number` INT(20) FIRST,
ADD INDEX `Order Number` (`Order Number`);

ALTER TABLE `open_orders`
MODIFY COLUMN `WO` INT(20) FIRST,
ADD INDEX `WO` (`WO`);

ALTER TABLE `lot_master`
ADD INDEX `Second Item Number` (`Second Item Number`);

ALTER TABLE `Finance Adjustments`
ADD COLUMN `customer_id` INT FIRST;

UPDATE `Finance Adjustments` AS a
JOIN `customer_names` AS b
ON a.`Customer` = b.`Customer (Unit Cost)`
SET a.`customer_id` = b.`id`;

ALTER TABLE `Finance Adjustments`
MODIFY COLUMN `Jul-Adj` DECIMAL (25,2),
MODIFY COLUMN `Aug-Adj` DECIMAL (25,2),
MODIFY COLUMN `Sep-Adj` DECIMAL (25,2),
MODIFY COLUMN `Oct-Adj` DECIMAL (25,2),
MODIFY COLUMN `Nov-Adj` DECIMAL (25,2),
MODIFY COLUMN `Dec-Adj` DECIMAL (25,2),
MODIFY COLUMN `Jan-Adj` DECIMAL (25,2),
MODIFY COLUMN `Feb-Adj` DECIMAL (25,2),
MODIFY COLUMN `Mar-Adj` DECIMAL (25,2),
MODIFY COLUMN `Apr-Adj` DECIMAL (25,2),
MODIFY COLUMN `May-Adj` DECIMAL (25,2),
MODIFY COLUMN `Jun-Adj` DECIMAL (25,2);

UPDATE `Finance Adjustments`
SET `Jul-Adj` = COALESCE(`Jul-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Aug-Adj` = COALESCE(`Aug-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Sep-Adj` = COALESCE(`Sep-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Oct-Adj` = COALESCE(`Oct-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Nov-Adj` = COALESCE(`Nov-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Dec-Adj` = COALESCE(`Dec-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Jan-Adj` = COALESCE(`Jan-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Feb-Adj` = COALESCE(`Feb-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Mar-Adj` = COALESCE(`Mar-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Apr-Adj` = COALESCE(`Apr-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `May-Adj` = COALESCE(`May-Adj`, 0.00);

UPDATE `Finance Adjustments`
SET `Jun-Adj` = COALESCE(`Jun-Adj`, 0.00);

UPDATE `SST Work Order Revision` AS s
SET s.`Request Date` = STR_TO_DATE(`Request Date`, '%m/%d/%Y');

UPDATE `SST Work Order Revision` AS s
SET s.`Planned Start` = STR_TO_DATE(`Planned Start`, '%m/%d/%Y');

UPDATE `SST Work Order Revision` AS s
SET s.`Planned Complete` = STR_TO_DATE(`Planned Complete`, '%m/%d/%Y');
/*
UPDATE `open_orders` AS s
SET s.`Prom Ship` = STR_TO_DATE(`Prom Ship`, '%m/%d/%Y');
*/
UPDATE `billing commit report` AS a
JOIN `open_orders` AS b
ON a.`WO` = b.`WO`
SET a.`Prom Ship` = b.`Prom Ship`;
/*
UPDATE `billing commit report` AS a
JOIN `Actual Complete` AS b
ON a.`WO` = b.`Order No`
SET a.`Actual Complete Date` = b.`Complete Date`;
*/
/*
CREATE TABLE `PO Report Temp` AS (
	SELECT `Order Number`, `Customer PO`
	FROM `billing commit report test`.`po report`
	GROUP BY `Order Number`
);
*/
UPDATE `billing commit report` AS a
JOIN `PO Report` AS b
ON a.`SO` = b.`Order Number`
SET a.`PO` = b.`Customer PO`;

UPDATE `billing commit report` AS a
JOIN `LCD Report` AS b
ON a.`WO` = b.`Order Number`
SET a.`Last Component Due Date` = b.`Last Component Due Date`;
/*
UPDATE `billing commit report` AS b
JOIN `SST Work Order Revision` AS s
ON (b.`WO` = s.`Order Number`)
SET b.`Start Date` = s.`Planned Start`
WHERE b.`WO` = s.`Order Number`;
*/ 
UPDATE `billing commit report` AS b
JOIN `Actual Complete` AS s
ON (b.`WO` = s.`Order No`)
SET b.`Start Date` = s.`Start Date`
WHERE b.`WO` = s.`Order No`;
/*
UPDATE `billing commit report` AS b
JOIN `Enter Change Order` AS s
ON (b.`WO` = s.`Order No`)
SET b.`Start Date` = s.`Start Date`
WHERE b.`WO` = s.`Order No`;

UPDATE `billing commit report` AS b
JOIN `SST Work Order Revision` AS s
ON (b.`WO` = s.`Order Number`)
SET b.`Room` = s.`Room`
WHERE b.`WO` = s.`Order Number`;
*/
UPDATE `billing commit report` AS b
JOIN `Actual Complete` AS s
ON (b.`WO` = s.`Order No`)
SET b.`Room` = s.`Ctg 01`
WHERE b.`WO` = s.`Order No`;

UPDATE `billing commit report` AS b
JOIN `SST Work Order Revision` AS s
ON (b.`WO` = s.`Order Number`)
SET b.`Prod Com` = s.`Planned Complete`
WHERE b.`WO` = s.`Order Number`;
/*
UPDATE `billing commit report` AS b
JOIN `Enter Change Order` AS s
ON (b.`WO` = s.`Order No`)
SET b.`Prod Com` = s.`Complete Date`
WHERE b.`WO` = s.`Order No`;
*/
UPDATE `billing commit report` AS b
JOIN `Actual Complete` AS s
ON (b.`WO` = s.`Order No`)
SET b.`Status` = s.`Status`
WHERE b.`WO` = s.`Order No`;
/*
ALTER TABLE `billing commit report`
MODIFY `Planned Bill Date` DATE,
MODIFY `Request Date` DATE;
*/
UPDATE `billing commit report`
SET `Planned Bill Date` = COALESCE(`Planned Bill Date`, '');

UPDATE `billing commit report`
SET `Request Date` = COALESCE(`Request Date`, '');

UPDATE `Actual Complete`
SET `Request Date` = COALESCE(`Request Date`, '');

UPDATE `billing commit report`
SET `Prom Ship` = COALESCE(`Prom Ship`, '');

UPDATE `billing commit report` AS b
SET b.`Prom Ship` = DATE_FORMAT(STR_TO_DATE(`Prom Ship`, '%m/%d/%Y'), '%m/%d/%Y');

UPDATE `billing commit report`
SET `Start Date` = COALESCE(`Start Date`, '');

UPDATE `billing commit report`
SET `Prod Com` = COALESCE(`Prod Com`, '');

UPDATE `billing commit report`
SET `Room` = COALESCE(`Room`, '');

UPDATE `billing commit report`
SET `Status` = COALESCE(`Status`, '');

UPDATE `billing commit report`
SET `Prom Ship` = COALESCE(`Prom Ship`, '');

UPDATE `billing commit report`
SET `Last Component Due Date` = COALESCE(`Last Component Due Date`, '');

ALTER TABLE `billing commit report`
ADD COLUMN `Sr PM` VARCHAR(50) AFTER `Customer Name`;

UPDATE `billing commit report` AS a
JOIN `Customer Names Sr PMs` AS b
ON a.`Customer Name` = b.`Customer Name`
SET a.`Sr PM` = b.`Sr PM`;

UPDATE `billing commit report` AS a
JOIN `Customer Names Sr PMs` AS b
ON a.`Customer Name` = b.`Customer Name`
SET a.`CSR Name` = b.`CSR Name`;
/*
UPDATE `billing commit report` AS b
SET b.`Planned Bill Date` = STR_TO_DATE(`Planned Bill Date`, '%m/%d/%Y');

UPDATE `billing commit report` AS b
SET b.`Actual Bill Date` = STR_TO_DATE(`Actual Bill Date`, '%m/%d/%Y');

UPDATE `billing commit report` AS b
SET b.`Request Date` = STR_TO_DATE(`Request Date`, '%m/%d/%Y');

UPDATE `billing commit report` AS b
SET b.`Orig Promise Date` = STR_TO_DATE(`Orig Promise Date`, '%m/%d/%Y');
*/
ALTER TABLE `billing commit report`
ADD COLUMN `Released` VARCHAR(50) AFTER `Active Flag`;

ALTER TABLE `billing commit report`
ADD COLUMN `With Customer` CHAR(3) AFTER `Released`;

UPDATE `billing commit report` AS a
JOIN `lot_master` AS b
ON a.`Item Number` = b.`Second Item Number`
	AND a.`FG Lot Number` = b.`Lot/Serial`
SET a.`With Customer` = 'Yes'
WHERE `Status` = 95 AND b.`Status Code` = 'Q';

UPDATE `billing commit report`
SET `With Customer` = COALESCE(`With Customer`, '');
/*
ALTER TABLE `billing commit report`
ADD COLUMN `customer_id` INT;

UPDATE `billing commit report` AS a
JOIN `customer_names` AS b
ON a.`Customer Name` = b.`Customer Name (Commit)`
SET a.`customer_id` = b.`id`;
*/
ALTER TABLE `finance adjustments`
ADD COLUMN `Jul Planned Bill Date` DATE AFTER `Jul-Adj`,
ADD COLUMN `Aug Planned Bill Date` DATE AFTER `Aug-Adj`,
ADD COLUMN `Sep Planned Bill Date` DATE AFTER `Sep-Adj`,
ADD COLUMN `Oct Planned Bill Date` DATE AFTER `Oct-Adj`,
ADD COLUMN `Nov Planned Bill Date` DATE AFTER `Nov-Adj`,
ADD COLUMN `Dec Planned Bill Date` DATE AFTER `Dec-Adj`,
ADD COLUMN `Jan Planned Bill Date` DATE AFTER `Jan-Adj`,
ADD COLUMN `Feb Planned Bill Date` DATE AFTER `Feb-Adj`,
ADD COLUMN `Mar Planned Bill Date` DATE AFTER `Mar-Adj`,
ADD COLUMN `Apr Planned Bill Date` DATE AFTER `Apr-Adj`,
ADD COLUMN `May Planned Bill Date` DATE AFTER `May-Adj`,
ADD COLUMN `Jun Planned Bill Date` DATE AFTER `Jun-Adj`;

UPDATE `finance adjustments`
SET `Jul Planned Bill Date` = '2021-07-1';

UPDATE `finance adjustments`
SET `Aug Planned Bill Date` = '2021-08-1';

UPDATE `finance adjustments`
SET `Sep Planned Bill Date` = '2021-09-1';

UPDATE `finance adjustments`
SET `Oct Planned Bill Date` = '2021-10-1';

UPDATE `finance adjustments`
SET `Nov Planned Bill Date` = '2021-11-1';

UPDATE `finance adjustments`
SET `Dec Planned Bill Date` = '2021-12-1';

UPDATE `finance adjustments`
SET `Jan Planned Bill Date` = '2022-01-1';

UPDATE `finance adjustments`
SET `Feb Planned Bill Date` = '2022-02-1';

UPDATE `finance adjustments`
SET `Mar Planned Bill Date` = '2022-03-1';

UPDATE `finance adjustments`
SET `Apr Planned Bill Date` = '2022-04-1';

UPDATE `finance adjustments`
SET `May Planned Bill Date` = '2022-05-1';

UPDATE `finance adjustments`
SET `Jun Planned Bill Date` = '2022-06-1';

UPDATE `finance adjustments` AS a
JOIN `customer_names` AS b
ON a.`customer_id` = b.`id`
SET a.`Customer` = b.`Customer Name (Commit)`;
/*
UPDATE `billing commit report`
SET `95 Not Shipped` = `Current Bill Amount`
WHERE `Status` = 95
	AND `Actual Bill Date` = '';

UPDATE `billing commit report`
SET `95 Not Shipped` = COALESCE(`95 Not Shipped`, '');
*/
UPDATE `billing commit report` AS a
JOIN `lot_master` AS b
ON a.`Item Number` = b.`Second Item Number`
	AND a.`FG Lot Number` = b.`Lot/Serial`
SET a.`Released` = 'Yes'
WHERE a.`Status` = 95
	AND (b.`Status Code` = '' OR b.`Status Code` IS NULL);

UPDATE `billing commit report`
SET `Released` = 'No'
WHERE `Released` = '' OR `Released` IS NULL;

UPDATE `billing commit report` AS a
JOIN `lot_master` AS b
SET `Released` = 'Not Produced'
WHERE a.`Status` <> 95
	AND (b.`Status Code` <> '' OR b.`Status Code` IS NOT NULL)
	AND (b.`Quantity On Hand/Held` = ''
	OR b.`Quantity on Hand/Held` IS NULL);

UPDATE `billing commit report`
SET `Released` = COALESCE(`Released`, '');
/*
DELETE
FROM `billing commit report`
WHERE `Status` = 95
	AND `Actual Bill Date` IS NOT NULL;
*/
CREATE TABLE `billing commit report temp` AS (
	SELECT *
	FROM `billing commit report`
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Jul Planned Bill Date` AS `Planned Bill Date`, `Jul-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Jul Planned Bill Date` AS `Actual Bill Date`, `Jul-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Jul-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Aug Planned Bill Date` AS `Planned Bill Date`, `Aug-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Aug Planned Bill Date` AS `Actual Bill Date`, `Aug-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Aug-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Sep Planned Bill Date` AS `Planned Bill Date`, `Sep-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Sep Planned Bill Date` AS `Actual Bill Date`, `Sep-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Sep-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Oct Planned Bill Date` AS `Planned Bill Date`, `Oct-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Oct Planned Bill Date` AS `Actual Bill Date`, `Oct-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Oct-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Nov Planned Bill Date` AS `Planned Bill Date`, `Nov-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Nov Planned Bill Date` AS `Actual Bill Date`, `Nov-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Nov-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Dec Planned Bill Date` AS `Planned Bill Date`, `Dec-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Dec Planned Bill Date` AS `Actual Bill Date`, `Dec-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Dec-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Jan Planned Bill Date` AS `Planned Bill Date`, `Jan-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Jan Planned Bill Date` AS `Actual Bill Date`, `Jan-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Jan-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Feb Planned Bill Date` AS `Planned Bill Date`, `Feb-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Feb Planned Bill Date` AS `Actual Bill Date`, `Feb-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Feb-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Mar Planned Bill Date` AS `Planned Bill Date`, `Mar-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Mar Planned Bill Date` AS `Actual Bill Date`, `Mar-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Mar-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Apr Planned Bill Date` AS `Planned Bill Date`, `Apr-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Apr Planned Bill Date` AS `Actual Bill Date`, `Apr-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Apr-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `May Planned Bill Date` AS `Planned Bill Date`, `May-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `May Planned Bill Date` AS `Actual Bill Date`, `May-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `May-Adj` <> '0.00'
	UNION ALL
	SELECT '' AS `WO`, '' AS `SO`, '' AS `PO`, '' AS `Last Component Due Date`, '' AS `Start Date`, '' AS `Prod Com`,/* '' AS `Actual Complete Date`,*/ '' AS `Room`, '' AS `Status`, '' AS `Prom Ship`, '' AS `SO Line`, 'ADJ' AS `SO Type`, `Jun Planned Bill Date` AS `Planned Bill Date`, `Jun-Adj` AS `Current Bill Amount`, '' AS `Frozen Bill Amount`, '' AS `Item Number`, '' AS `Item Description`, '' AS `Addition`, '' AS `Fall Out`, '' AS `At Risk`, '' AS `Up Side`, '' AS `FG Lot Number`, '' AS `WO Type`, '' AS `Customer`, `Customer` AS `Customer Name`, '' AS `Sr PM`, '' AS `CSR`, '' AS `CSR Name`, `Jun Planned Bill Date` AS `Actual Bill Date`, `Jun-Adj` AS `Actual Bill Amount`, '' AS `Request Date`, '' AS `Orig Promise Date`, '' AS `Commitment Number`, '' AS `Active Flag`, '' AS `Released`, '' AS `With Customer`, '' AS `Billing Commitment Comments`
	FROM `finance adjustments`
	WHERE `Jun-Adj` <> '0.00'
);
    
UPDATE `billing commit report temp`
SET `SO Type` = 'SO'
WHERE `Customer Name` = 'GPSG (Janssen)'
	AND `SO Type` = '';

UPDATE `billing commit report temp`
SET `Last Component Due Date` = DATE_FORMAT(DATE_ADD(STR_TO_DATE(`Last Component Due Date`, '%m/%d/%Y'), INTERVAL -21 DAY), '%m/%d/%Y');
/*
SELECT *
FROM `billing commit report temp`;
*/
/*Late Commit*/

CREATE TABLE `Late Commit` AS (
	SELECT *
    FROM `billing commit report temp`
    WHERE STR_TO_DATE(`Prom Ship`, '%m/%d/%Y') > CURDATE()
);

DELETE
FROM `Late Commit`
WHERE MONTH(STR_TO_DATE(`Prom Ship`, '%m/%d/%Y')) = MONTH(CURDATE());
/*
SELECT *
FROM `late commit`;
*/
/*Mark At Risk in JDE*/

CREATE TABLE `Mark At Risk in JDE` AS (
	SELECT *
	FROM `billing commit report temp`
	WHERE ((`Status` BETWEEN 20 AND 35
		AND `Start Date` < CURDATE()
		AND `Start Date` <> '')
		OR (`Status` BETWEEN 36 AND 38
		AND `Prod Com` < CURDATE()
        AND `Prod Com` <> '')
		OR ((`Status` = 70 OR `Status` = 95)
		AND STR_TO_DATE(`Prom Ship`, '%m/%d/%Y') < CURDATE()
		AND STR_TO_DATE(`Prom Ship`, '%m/%d/%Y') <> ''))
		AND `At Risk` = ''
		AND `Fall Out` = ''
		AND `Addition` = ''
		AND `Up Side` = ''
);
/*
UPDATE `billing commit report temp`
SET `At Risk` = 'Y'
WHERE ((`Status` BETWEEN 35 AND 40
	AND `Start Date` < CURDATE()
	AND `Start Date` <> '')
	OR (`Status` BETWEEN 44 AND 45
	AND `Prod Com` < CURDATE()
	AND `Prod Com` <> '')
	OR ((`Status` = 85 OR `Status` = 95)
	AND STR_TO_DATE(`Prom Ship`, '%m/%d/%Y') < CURDATE()
	AND STR_TO_DATE(`Prom Ship`, '%m/%d/%Y') <> ''))
	AND `At Risk` = ''
	AND `Fall Out` = ''
	AND `Addition` = ''
	AND `Up Side` = '';
*/
/*
SELECT *
FROM `Mark At Risk in JDE`;
*/
/*Up Side At Risk*/

CREATE TABLE `Up Side At Risk` AS (
	SELECT *
	FROM `billing commit report temp`
	WHERE ((`Status` BETWEEN 20 AND 35
		AND `Start Date` < CURDATE()
		AND `Start Date` <> '')
		OR (`Status` BETWEEN 36 AND 38
		AND `Prod Com` < CURDATE()
        AND `Prod Com` <> '')
		OR ((`Status` = 70 OR `Status` = 95)
		AND STR_TO_DATE(`Prom Ship`, '%m/%d/%Y') < CURDATE()
		AND STR_TO_DATE(`Prom Ship`, '%m/%d/%Y') <> ''))
		AND `At Risk` = ''
		AND `Fall Out` = ''
		AND `Addition` = ''
		AND `Up Side` = 'Y'
);
/*
SELECT *
FROM `Up Side At Risk`;
*/
SET @sql_text =
CONCAT(
'SELECT \'WO\', \'SO\', \'PO\', \'Last Component Due Date\', \'Start Date\', \'Prod Com\', \'Room\', \'Status\', \'Prom Ship\', \'SO Line\', \'SO Type\', \'Planned Bill Date\', \'Current Bill Amount\', \'Frozen Bill Amount\', \'Item Number\', \'Item Description\', \'Addition\', \'Fall Out\', \'At Risk\', \'Up Side\', \'FG Lot Number\', \'WO Type\', \'Customer\', \'Customer Name\', \'Sr PM\', \'CSR\', \'CSR Name\', \'Actual Bill Date\', \'Actual Bill Amount\', \'Request Date\', \'Orig Promise Date\', \'Commitment Number\', \'Active Flag\', \'Released\', \'With Customer\', \'Billing Commitment Comments\'
UNION ALL
SELECT *
FROM `Up Side At Risk`
INTO OUTFILE \'N:/All Business Units/Common Data/Business Analyst Team/Billing Commit Report/Group/Input Data/up_side_at_risk_xl_', CURDATE(), '.csv'
'\'FIELDS TERMINATED BY \',\'
ENCLOSED BY \'"\'
LINES TERMINATED BY \'\r\n\''
);
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text1 = 
CONCAT(
'RENAME TABLE `Up Side At Risk` TO `Up Side At Risk xl ', CURDATE(), '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT(
'SELECT \'WO\', \'SO\', \'PO\', \'Last Component Due Date\', \'Start Date\', \'Prod Com\', \'Room\', \'Status\', \'Prom Ship\', \'SO Line\', \'SO Type\', \'Planned Bill Date\', \'Current Bill Amount\', \'Frozen Bill Amount\', \'Item Number\', \'Item Description\', \'Addition\', \'Fall Out\', \'At Risk\', \'Up Side\', \'FG Lot Number\', \'WO Type\', \'Customer\', \'Customer Name\', \'Sr PM\', \'CSR\', \'CSR Name\', \'Actual Bill Date\', \'Actual Bill Amount\', \'Request Date\', \'Orig Promise Date\', \'Commitment Number\', \'Active Flag\', \'Released\', \'With Customer\', \'Billing Commitment Comments\'
UNION ALL
SELECT *
FROM `Mark At Risk in JDE`
INTO OUTFILE \'N:/All Business Units/Common Data/Business Analyst Team/Billing Commit Report/Group/Input Data/mark_at_risk_in_jde_xl_', CURDATE(), '.csv'
'\'FIELDS TERMINATED BY \',\'
ENCLOSED BY \'"\'
LINES TERMINATED BY \'\r\n\''
);
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text1 = 
CONCAT(
'RENAME TABLE `Mark At Risk in JDE` TO `Mark At Risk in JDE xl ', CURDATE(), '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT(
'SELECT \'WO\', \'SO\', \'PO\', \'Last Component Due Date\', \'Start Date\', \'Prod Com\', \'Room\', \'Status\', \'Prom Ship\', \'SO Line\', \'SO Type\', \'Planned Bill Date\', \'Current Bill Amount\', \'Frozen Bill Amount\', \'Item Number\', \'Item Description\', \'Addition\', \'Fall Out\', \'At Risk\', \'Up Side\', \'FG Lot Number\', \'WO Type\', \'Customer\', \'Customer Name\', \'Sr PM\', \'CSR\', \'CSR Name\', \'Actual Bill Date\', \'Actual Bill Amount\', \'Request Date\', \'Orig Promise Date\', \'Commitment Number\', \'Active Flag\', \'Released\', \'With Customer\', \'Billing Commitment Comments\'
UNION ALL
SELECT *
FROM `late commit`
INTO OUTFILE \'N:/All Business Units/Common Data/Business Analyst Team/Billing Commit Report/Group/Input Data/late_commit_xl_', CURDATE(), '.csv'
'\'FIELDS TERMINATED BY \',\'
ENCLOSED BY \'"\'
LINES TERMINATED BY \'\r\n\''
);
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text1 = 
CONCAT(
'RENAME TABLE `late commit` TO `late commit xl ', CURDATE(), '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT(
'SELECT \'WO\', \'SO\', \'PO\', \'Last Component Due Date\', \'Start Date\', \'Prod Com\', \'Room\', \'Status\', \'Prom Ship\', \'SO Line\', \'SO Type\', \'Planned Bill Date\', \'Current Bill Amount\', \'Frozen Bill Amount\', \'Item Number\', \'Item Description\', \'Addition\', \'Fall Out\', \'At Risk\', \'Up Side\', \'FG Lot Number\', \'WO Type\', \'Customer\', \'Customer Name\', \'Sr PM\', \'CSR\', \'CSR Name\', \'Actual Bill Date\', \'Actual Bill Amount\', \'Request Date\', \'Orig Promise Date\', \'Commitment Number\', \'Active Flag\', \'Released\', \'With Customer\', \'Billing Commitment Comments\'
UNION ALL
SELECT *
FROM `billing commit report temp`
INTO OUTFILE \'N:/All Business Units/Common Data/Business Analyst Team/Billing Commit Report/Group/Input Data/billing_commit_report_group_xl_', CURDATE(), '.csv'
'\'FIELDS TERMINATED BY \',\'
ENCLOSED BY \'"\'
LINES TERMINATED BY \'\r\n\''
);
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text1 = 
CONCAT(
'RENAME TABLE `billing commit report temp` TO `billing commit report xl ', CURDATE(), '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;

DROP TABLE IF EXISTS `SST Work Order Revision`;