/*
Data Locations:
	Forecast Capacity Tool:
		N:\Project Management\Department Information\Capacity\Forecast & Capacity Tool\PHL FORECAST & CAPACITY 2023.xlsx
	Actuals:
		Nav>Phila>Customer Service>Inquiries>Customer Service Inquiry - All Order Lines
        "Additional Selections" tab
        "Invoice"
        Date Ranges: 7/1/*Current FY* TO 6/30/*Current FY*
	Billing Commit:
		Commit:
			Planned Bill Date: 7/1/*Current FY* TO 6/30/*Current FY*
		SST Work Order Revision:
			Planned Start: >=4/1/*Current FY*
            Planned Complete: <=9/30/*Current FY*
	Finance Adjustments Template:
		Make sure the template is alphabetized by customer name
*/

USE `s&op`;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `bu fy24 ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

/*Product Names*/

DROP TABLE IF EXISTS `Product Names`;
DROP TABLE IF EXISTS `Product Names Temp 2`;
DROP TABLE IF EXISTS `MPF`;

CREATE TEMPORARY TABLE `Product Names Temp` (
    `User ID` TEXT,
    `Short Item No` TEXT,
    `2nd Item Number` VARCHAR(50),
    `Date Updated` TEXT,
    `3rd Item Number` TEXT,
    `Description` TEXT,
    `Description Line 2` TEXT,
    `Srch: Search Text` TEXT,
    `Search Text Compressed` TEXT,
    `Sls Cd1` TEXT,
    `Sls Cd2` TEXT,
    `Sls Cd3` TEXT,
    `Sls Cd4` TEXT,
    `Sls Cd5` TEXT,
    `Cat Cd6` TEXT,
    `Cat Cd7` TEXT,
    `Cat Cd8` TEXT,
    `Cat Cd9` TEXT,
    `Cat Cd10` TEXT,
    `Comm Class` TEXT,
    `Sub Comm` TEXT,
    `Rebate Code` TEXT,
    `Plan Fmly` VARCHAR(5),
    `Cost Rule` TEXT,
    `Item Dim Grp` TEXT,
    `Process 1` TEXT,
    `Process 2` TEXT,
    `Process 3` TEXT,
    `Item Pool` TEXT,
    `Commodity Code` TEXT,
    `Prd Grp` TEXT,
    `Dsp Grp` TEXT,
    `Item Group` TEXT,
    `Basket Reprice Group` TEXT,
    `Order Reprice Group` TEXT,
    `Buyer Number` TEXT,
    `Drawing Number` TEXT,
    `Rev No` TEXT,
    `D Sz` TEXT,
    `Volume Cubic Dim` TEXT,
    `Carrier Number` TEXT,
    `Pref Car Purch` TEXT,
    `Shipping Conditions` TEXT,
    `Ship Comm Class` TEXT,
    `UM` TEXT,
    `Sec UM` TEXT,
    `PU UM` TEXT,
    `PR UM` TEXT,
    `Shipping UM` TEXT,
    `Prod UM` TEXT,
    `Comp UM` TEXT,
    `Wt Um` TEXT,
    `Vol UOM` TEXT,
    `Stk U/M` TEXT,
    `V W` TEXT,
    `Cyc Cnt` TEXT,
    `G/L Cat` TEXT,
    `S L` TEXT,
    `P L` TEXT,
    `C L` TEXT,
    `G P` TEXT,
    `C A` TEXT,
    `B P` TEXT,
    `LC Src` TEXT,
    `P C` TEXT,
    `G C` TEXT,
    `Standard Potency` TEXT,
    `From Potency` TEXT,
    `Thru Potency` TEXT,
    `Std Grd` TEXT,
    `Frm Grd` TEXT,
    `Thr Grd` TEXT,
    `Co Ty` TEXT,
    `Stocking Type` TEXT,
    `Ln Ty` TEXT,
    `Cont Item` TEXT,
    `Back Y/N` TEXT,
    `It Mg` TEXT,
    `St UM` TEXT,
    `Print Message` TEXT,
    `ABC 1 Sls` TEXT,
    `ABC 2 Mrg` TEXT,
    `ABC 3 Inv` TEXT,
    `ABC Ovrride` TEXT,
    `Warranty Type` TEXT,
    `Com. Cat.` TEXT,
    `Serial No. Required` TEXT,
    `M T` TEXT,
    `FIFO Processing` TEXT,
    `Lot Stat Code` TEXT,
    `Shelf Days` TEXT,
    `Planner Number` TEXT,
    `Pln Cod` TEXT,
    `Margin Percent` TEXT,
    `Margin Maint %` TEXT,
    `Pt St` TEXT,
    `R N` TEXT,
    `Leadtime Level` TEXT,
    `Leadtime MFG` TEXT,
    `Leadtime Cum` TEXT,
    `O P` TEXT,
    `Order Policy Value` TEXT,
    `Acct Cost Quantity` TEXT,
    `MFG Leadtime Quantity` TEXT,
    `Leadtime Per Unit` TEXT,
    `T F` TEXT,
    `FV Lt` TEXT,
    `Is Cd` TEXT,
    `O W` TEXT,
    `Plan Time Fence` TEXT,
    `Frz Time Fence` TEXT,
    `Msg Time Fence` TEXT,
    `Time Fence` TEXT,
    `Ship Offset` TEXT,
    `Expedite Damper` TEXT,
    `Defer Damper` TEXT,
    `Safety Leadtime` TEXT,
    `N A` TEXT,
    `Co By` TEXT,
    `LL Cd` TEXT,
    `C M` TEXT,
    `Spec Comm` TEXT,
    `User Code` TEXT,
    `User Date` TEXT,
    `User Amount` TEXT,
    `User Number` TEXT,
    `User Reference` TEXT,
    `Program ID` TEXT,
    `Work Stn ID` TEXT,
    `Time of Day` TEXT,
    `UPC` TEXT,
    `SCC (PI=0)` TEXT,
    `UPC UOM` TEXT,
    `UPC UOM 1` TEXT,
    `SCC0 UOM` TEXT,
    `SCC1 UOM` TEXT,
    `SCC2 UOM` TEXT,
    `SCC3 UOM` TEXT,
    `SCC4 UOM` TEXT,
    `SCC5 UOM` TEXT,
    `SCC6 UOM` TEXT,
    `SCC7 UOM` TEXT,
    `SCC8 UOM` TEXT,
    `R` TEXT,
    `Replenishment Hours` TEXT,
    `Container Code` TEXT,
    `Item Weight Required` TEXT,
    `Template` TEXT,
    `Segment 1` TEXT,
    `Segment 2` TEXT,
    `Segment 3` TEXT,
    `Segment 4` TEXT,
    `Segment 5` TEXT,
    `Segment 6` TEXT,
    `Segment 7` TEXT,
    `Segment 8` TEXT,
    `Segment 9` TEXT,
    `Segment 10` TEXT,
    `Matrix Controlled` TEXT,
    `Active Ingredient` TEXT,
    `Best Before Days` TEXT,
    `Commitment Date Method` TEXT,
    `Exp. Date Calc Method` TEXT,
    `Lot Effective Days` TEXT,
    `Purch. Eff. Days` TEXT,
    `Sell By Days` TEXT,
    `User Lot Date 1 Days` TEXT,
    `User Lot Date 2 Days` TEXT,
    `User Lot Date 3 Us` TEXT,
    `User Lot Date 4 Days` TEXT,
    `User Lot Date 5 Days` TEXT,
    `Dual Tolerance` TEXT,
    `Picking Process` TEXT,
    `Dual Item` TEXT,
    `Cross Docked` TEXT,
    `Lot Audit Flag` TEXT,
    `Special Lot Format` TEXT,
    `Restrict WO Lot Assignment` TEXT,
    `Lot Number Pre-Assignment` TEXT,
    `Lot Status Code` TEXT,
    `Constraints Flag` TEXT,
    `APS Planning UOM` TEXT,
    `Consumable` TEXT,
    `Composition` TEXT,
    `Priority One Alert Level` TEXT,
    `Priority Two Alert Level` TEXT,
    `Allow Shipping of Held Lots` TEXT,
    `Vendor Managed Inventory` TEXT,
    `Configurator Costing Method` TEXT,
    `E I` TEXT,
    `Operational Threshold` TEXT,
    `Cumulative Threshold` TEXT,
    `Threshold UOM` TEXT,
    `Lean Manufacturing Flag` TEXT,
    `Line/Cell Identifier` TEXT,
    `Total Product Cycle Time` TEXT,
    `Kanban Item` TEXT,
    `DFM End Item` TEXT,
    `Kanban Explode to Lower Level` TEXT,
    `Sellable Item` TEXT,
    `Max Operational Threshold` TEXT,
    `Max Cumulative Threshold` TEXT,
    `Cumulative Threshold UOM` TEXT,
    `ATP Rule Name` TEXT,
    `Check ATP` TEXT,
    `ATP Components` TEXT,
    `Origin Required` TEXT,
    `ATO Forecast Control` TEXT,
    `Production Number Controlled` TEXT
);

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/S&OP/Input Data/Product Names.csv'
INTO TABLE `Product Names Temp`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS;

CREATE TABLE `Product Names Temp 2` AS (
    SELECT `2nd Item Number`, `Plan Fmly`
    FROM `Product Names Temp`
);

DROP TABLE `Product Names Temp`;

ALTER TABLE `Product Names Temp 2`
ADD INDEX `2nd Item Number` (`2nd Item Number`);

ALTER TABLE `Product Names Temp 2`
ADD INDEX `Plan Fmly` (`Plan Fmly`);

CREATE TABLE `MPF` (
    `Codes` VARCHAR(5),
    `Description` VARCHAR(150),
    `Description 2` VARCHAR(5),
    `Special Handling` VARCHAR(20),
    `Hard Coded` CHAR(1)
);

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/S&OP/Input Data/MPF.csv'
INTO TABLE `MPF`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS;

CREATE TABLE `Product Names` AS (
    SELECT b.`Special Handling` AS `Customer`, a.`2nd Item Number`, a.`Plan Fmly`, b.`Description` AS `Product Family`
    FROM `Product Names Temp 2` AS a
    JOIN `MPF` AS b
    ON a.`Plan Fmly` = b.`Codes`
);

ALTER TABLE `Product Names`
ADD COLUMN `product_family_id` INT PRIMARY KEY AUTO_INCREMENT FIRST;

/*Forecast Capacity*/

DROP TABLE IF EXISTS `forecast_capacity`;

CREATE TABLE `forecast_capacity` (
    `ID` VARCHAR(50),
    `Active?` VARCHAR(50),
    `BU` VARCHAR(50),
    `Customer` VARCHAR(50),
    `Customer ID` VARCHAR(50),
    `ItemNo.` VARCHAR(50),
    `FG/ WIP` CHAR(5),
    `Product Description` VARCHAR(150),
    `Product Family` VARCHAR(150),
    `UOM` VARCHAR(5),
    `Unit Cost` DECIMAL(15,2),
    `WIPONLYFG#` VARCHAR(50),
    `WIP per FG` VARCHAR(50),
    `PPM` VARCHAR(50),
    `Raven Uptime` VARCHAR(50),
    `Rate` VARCHAR(50),
    `Crew Size` INT,
    `WIP Pallet` INT,
    `FG Pallet` INT,
    `WHS` VARCHAR(50),
    `Room` VARCHAR(10),
    `Value Stream` VARCHAR(50),
    `Forward Demand` VARCHAR(50),
    `Comments/Last Updated` VARCHAR(200),
    `Jun-23 FCST` INT,
    `Jul-23 FCST` INT,
    `Aug-23 FCST` INT,
    `Sep-23 FCST` INT,
    `Oct-23 FCST` INT,
    `Nov-23 FCST` INT,
    `Dec-23 FCST` INT,
    `Jan-24 FCST` INT,
    `Feb-24 FCST` INT,
    `Mar-24 FCST` INT,
    `Apr-24 FCST` INT,
    `May-24 FCST` INT,
    `Jun-24 FCST` INT,
    `Jul-24 FCST` INT,
    `Aug-24 FCST` INT,
    `Sep-24 FCST` INT,
    `Oct-24 FCST` INT,
    `Nov-24 FCST` INT,
    `Dec-24 FCST` INT,
    `Jan-25 FCST` INT,
    `Feb-25 FCST` INT,
    `Mar-25 FCST` INT,
    `Apr-25 FCST` INT,
    `May-25 FCST` INT,
    `Jun-25 FCST` INT
);

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/forecast_capacity.csv' 
INTO TABLE `forecast_capacity` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

UPDATE `forecast_capacity`
SET `Customer` = 'Astellas US Technologies, Inc.'
WHERE `Customer` = 'Astellas';

UPDATE `forecast_capacity`
SET `Customer` = 'GPSG (Janssen)'
WHERE `Customer` = 'Janssen';

UPDATE `forecast_capacity`
SET `Customer` = 'SIGA Technologies'
WHERE `Customer` = 'Siga Technologies Inc.';

UPDATE `forecast_capacity`
SET `Customer` = 'Mitsubishi Tanabe'
WHERE `Customer` = 'Mitsubishi';

UPDATE `forecast_capacity`
SET `Customer` = 'Gilead Sciences Limite'
WHERE `Customer` = 'Gilead Science';

UPDATE `forecast_capacity`
SET `Customer` = 'Gilead Sciences Limited'
WHERE `Customer` = 'Gilead Science Limited';

UPDATE `forecast_capacity`
SET `Customer` = 'Kiniksa Pharmaceuticals Corp.'
WHERE `Customer` = 'Kiniksa Pharmaceuticals Corp';

UPDATE `forecast_capacity`
SET `Customer` = 'Noden Pharma USA Inc.'
WHERE `Customer` = 'Noden Pharma USA  Inc.';
/*
UPDATE `forecast_capacity`
SET `Customer` = 'Novartis Pharmaceuticals Corporation'
WHERE `Customer` = 'Novartis Vaccines and Diagnost';
*/
UPDATE `forecast_capacity`
SET `Customer` = 'OPKO Ireland, Ltd. / EirGen'
WHERE `Customer` = 'OPKO Ireland, Ltd. /EirGen';

UPDATE `forecast_capacity`
SET `Customer` = 'J&J'
WHERE `Customer` = 'Johnson & Johnson';

UPDATE `forecast_capacity`
SET `Customer` = 'Malinkrodt'
WHERE `Customer` = 'Malinckrodt';

UPDATE `forecast_capacity`
SET `Customer` = 'Malinkrodt'
WHERE `Customer` = 'Mallinckrodt';

UPDATE `forecast_capacity`
SET `Customer` = 'Pacira Pharmaceuticals, Inc.'
WHERE `Customer` = 'Pacira Pharmaceuticals';

UPDATE `forecast_capacity`
SET `Customer` = 'TG'
WHERE `Customer` = 'TG Therapeutics';

UPDATE `forecast_capacity`
SET `Customer` = 'Sanofi'
WHERE `Customer` = 'Sanofi Genzyme';

UPDATE `forecast_capacity`
SET `Customer` = 'Sanofi- Genzyme Europe B.V'
WHERE `Customer` = 'Sanofi Genzyme Europe B.V';

UPDATE `forecast_capacity`
SET `Customer` = 'Sanofi'
WHERE `Customer` = 'Sanofi Pasteur';

UPDATE `forecast_capacity`
SET `Customer` = 'Viatris'
WHERE `Customer` = 'Mylan/Viatris';

UPDATE `forecast_capacity`
SET `Customer` = 'Vivus Inc'
WHERE `Customer` = 'VIVUS, Inc';

UPDATE `forecast_capacity`
SET `Customer` = 'Oyster Point Pharma, Inc.'
WHERE `Customer` = 'Oyster Point';

UPDATE `forecast_capacity`
SET `Customer` = 'Tarsus Pharmaceuticals, Inc'
WHERE `Customer` = 'Tarsus';

UPDATE `forecast_capacity`
SET `Customer` = 'Xeris Pharmaceuticals, Inc.'
WHERE `Customer` = 'Xeris Pharmaceuticals';

ALTER TABLE `forecast_capacity`
DROP COLUMN `Jun-23 FCST`,
DROP COLUMN `Jul-24 FCST`,
DROP COLUMN `Aug-24 FCST`,
DROP COLUMN `Sep-24 FCST`,
DROP COLUMN `Oct-24 FCST`,
DROP COLUMN `Nov-24 FCST`,
DROP COLUMN `Dec-24 FCST`,
DROP COLUMN `Jan-25 FCST`,
DROP COLUMN `Feb-25 FCST`,
DROP COLUMN `Mar-25 FCST`,
DROP COLUMN `Apr-25 FCST`,
DROP COLUMN `May-25 FCST`,
DROP COLUMN `Jun-25 FCST`;

ALTER TABLE `forecast_capacity`
CHANGE COLUMN `Jul-23 FCST` `Jul-24 FCST` VARCHAR(50),
CHANGE COLUMN `Aug-23 FCST` `Aug-24 FCST` VARCHAR(50),
CHANGE COLUMN `Sep-23 FCST` `Sep-24 FCST` VARCHAR(50),
CHANGE COLUMN `Oct-23 FCST` `Oct-24 FCST` VARCHAR(50),
CHANGE COLUMN `Nov-23 FCST` `Nov-24 FCST` VARCHAR(50),
CHANGE COLUMN `Dec-23 FCST` `Dec-24 FCST` VARCHAR(50);

UPDATE `forecast_capacity`
SET `Jan-24 FCST` = REPLACE(`Jan-24 FCST`, ',', ''), 
`Feb-24 FCST` = REPLACE(`Feb-24 FCST`, ',', ''),
`Mar-24 FCST` = REPLACE(`Mar-24 FCST`, ',', ''),
`Apr-24 FCST` = REPLACE(`Apr-24 FCST`, ',', ''),
`May-24 FCST` = REPLACE(`May-24 FCST`, ',', ''),
`Jun-24 FCST` = REPLACE(`Jun-24 FCST`, ',', ''),
`Jul-24 FCST` = REPLACE(`Jul-24 FCST`, ',', ''),
`Aug-24 FCST` = REPLACE(`Aug-24 FCST`, ',', ''),
`Sep-24 FCST` = REPLACE(`Sep-24 FCST`, ',', ''),
`Oct-24 FCST` = REPLACE(`Oct-24 FCST`, ',', ''),
`Nov-24 FCST` = REPLACE(`Nov-24 FCST`, ',', ''),
`Dec-24 FCST` = REPLACE(`Dec-24 FCST`, ',', '');

ALTER TABLE `forecast_capacity`
CHANGE COLUMN `Jul-24 FCST` `Jul-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Aug-24 FCST` `Aug-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Sep-24 FCST` `Sep-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Oct-24 FCST` `Oct-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Nov-24 FCST` `Nov-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Dec-24 FCST` `Dec-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Jan-24 FCST` `Jan-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Feb-24 FCST` `Feb-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Mar-24 FCST` `Mar-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Apr-24 FCST` `Apr-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `May-24 FCST` `May-24 FCST` DECIMAL(15,2),
CHANGE COLUMN `Jun-24 FCST` `Jun-24 FCST` DECIMAL(15,2);

UPDATE `forecast_capacity`
SET `Unit Cost` = '0.33'
WHERE `Customer ID` = 42904229;

/*Annual Budget 2024 (Budget)*/

DROP TABLE IF EXISTS `Annual Budget 2024`;

CREATE TABLE `Annual Budget 2024` (
    `Customer Parent` VARCHAR(150),
    `Product Family` VARCHAR(150),
    `Jul FY24 Bud` VARCHAR(50),
    `Aug FY24 Bud` VARCHAR(50),
    `Sep FY24 Bud` VARCHAR(50),
    `Oct FY24 Bud` VARCHAR(50),
    `Nov FY24 Bud` VARCHAR(50),
    `Dec FY24 Bud` VARCHAR(50),
    `Jan FY24 Bud` VARCHAR(50),
    `Feb FY24 Bud` VARCHAR(50),
    `Mar FY24 Bud` VARCHAR(50),
    `Apr FY24 Bud` VARCHAR(50),
    `May FY24 Bud` VARCHAR(50),
    `Jun FY24 Bud` VARCHAR(50),
    `FY24 Budget` VARCHAR(50)
);
/*
CREATE TABLE `Annual Budget 2024` (
    `Site` VARCHAR(35),
    `Parent Customer` VARCHAR(35),
    `Customer Parent` VARCHAR(50),
    `Customer` VARCHAR(35),
    `Parent Customer Name` VARCHAR(35),
    `Opportunity Name` VARCHAR(35),
    `Product Family` VARCHAR(100),
    `Updated` VARCHAR(35),
    `Parent Product Name` VARCHAR(35),
    `Currency` VARCHAR(35),
    `BD` VARCHAR(35),
    `Molecule Size` VARCHAR(35),
    `Patent Exp Year` VARCHAR(35),
    `Patent Exp` VARCHAR(35),
    `FG v Non-FG` VARCHAR(35),
    `Non FG Type` VARCHAR(35),
    `Exiting Business` VARCHAR(35),
    `Non-Recurring` VARCHAR(35),
    `Launch Type` VARCHAR(35),
    `Year of Launch` VARCHAR(35),
    `Top Products` VARCHAR(35),
    `Go Get` VARCHAR(35),
    `Revenue Type` VARCHAR(35),
    `Normal Price Increase?` VARCHAR(35),
    `One-Time Price Increase?` VARCHAR(35),
    `Effective Date of Increase` VARCHAR(35),
    `Active Business or Recent Award?` VARCHAR(35),
    `Award Amount (000s)` VARCHAR(35),
    `Comment` VARCHAR(35),
    `Jul FY24 Bud` VARCHAR(20),
    `Aug FY24 Bud` VARCHAR(20),
    `Sep FY24 Bud` VARCHAR(20),
    `Oct FY24 Bud` VARCHAR(20),
    `Nov FY24 Bud` VARCHAR(20),
    `Dec FY24 Bud` VARCHAR(20),
    `Jan FY24 Bud` VARCHAR(20),
    `Feb FY24 Bud` VARCHAR(20),
    `Mar FY24 Bud` VARCHAR(20),
    `Apr FY24 Bud` VARCHAR(20),
    `May FY24 Bud` VARCHAR(20),
    `Jun FY24 Bud` VARCHAR(20)
);*/

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/S&OP/Input Data/Annual Budget FY24.csv'
INTO TABLE `Annual Budget 2024` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS;
/*
UPDATE `annual budget 2024`
SET `Customer Parent` = 'Go-Get'
WHERE `Customer Parent` = 'GO GET';

UPDATE `annual budget 2024`
SET `Customer Parent` = 'Other Misc'
WHERE `Customer Parent` = 'Other Misc';

UPDATE `annual budget 2024`
SET `Customer Parent` = 'Billable to Customer'
WHERE `Customer Parent` = 'Billable to Customer';

UPDATE `annual budget 2024`
SET `Customer Parent` = 'Tooling 1'
WHERE `Customer Parent` = 'Tooling 1';

UPDATE `annual budget 2024`
SET `Customer Parent` = 'Tooling 2'
WHERE `Customer Parent` = 'Tooling 2';

UPDATE `annual budget 2024`
SET `Customer Parent` = 'Inventory Sales'
WHERE `Customer Parent` = 'Inventory Sales';

UPDATE `annual budget 2024`
SET `Customer Parent` = 'Utility'
WHERE `Customer Parent` = 'Utility';
*/

/*
UPDATE `annual budget 2024`
SET `Jul FY24 Bud` = REPLACE(`Jul FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Jul FY24 Bud` = REPLACE(`Jul FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Aug FY24 Bud` = REPLACE(`Aug FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Aug FY24 Bud` = REPLACE(`Aug FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Sep FY24 Bud` = REPLACE(`Sep FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Sep FY24 Bud` = REPLACE(`Sep FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Oct FY24 Bud` = REPLACE(`Oct FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Oct FY24 Bud` = REPLACE(`Oct FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Nov FY24 Bud` = REPLACE(`Nov FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Nov FY24 Bud` = REPLACE(`Nov FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Dec FY24 Bud` = REPLACE(`Dec FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Dec FY24 Bud` = REPLACE(`Dec FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Jan FY24 Bud` = REPLACE(`Jan FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Jan FY24 Bud` = REPLACE(`Jan FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Feb FY24 Bud` = REPLACE(`Feb FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Feb FY24 Bud` = REPLACE(`Feb FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Mar FY24 Bud` = REPLACE(`Mar FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Mar FY24 Bud` = REPLACE(`Mar FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Apr FY24 Bud` = REPLACE(`Apr FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Apr FY24 Bud` = REPLACE(`Apr FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `May FY24 Bud` = REPLACE(`May FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `May FY24 Bud` = REPLACE(`May FY24 Bud`, ' -   ', '');

UPDATE `annual budget 2024`
SET `Jun FY24 Bud` = REPLACE(`Jun FY24 Bud`, ',', '');
UPDATE `annual budget 2024`
SET `Jun FY24 Bud` = REPLACE(`Jun FY24 Bud`, ' -   ', '');
*/
ALTER TABLE `Annual Budget 2024`
MODIFY `Jul FY24 Bud` DECIMAL(15,2),
MODIFY `Aug FY24 Bud` DECIMAL(15,2),
MODIFY `Sep FY24 Bud` DECIMAL(15,2),
MODIFY `Oct FY24 Bud` DECIMAL(15,2),
MODIFY `Nov FY24 Bud` DECIMAL(15,2),
MODIFY `Dec FY24 Bud` DECIMAL(15,2),
MODIFY `Jan FY24 Bud` DECIMAL(15,2),
MODIFY `Feb FY24 Bud` DECIMAL(15,2),
MODIFY `Mar FY24 Bud` DECIMAL(15,2),
MODIFY `Apr FY24 Bud` DECIMAL(15,2),
MODIFY `May FY24 Bud` DECIMAL(15,2),
MODIFY `Jun FY24 Bud` DECIMAL(15,2);

ALTER TABLE `Annual Budget 2024`
ADD COLUMN `Item Number` INT PRIMARY KEY AUTO_INCREMENT;

/*Finance Adjustments*/

DROP TABLE IF EXISTS `Finance Adjustments`;

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

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/S&OP/Input Data/Finance Adjustments Template FY24.csv'
INTO TABLE `Finance Adjustments` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

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

/*Billing Commit Report (Commitments)*/

DROP TABLE IF EXISTS `Billing Commit Report Group`;
DROP TABLE IF EXISTS `SST Work Order Revision`;
DROP TABLE IF EXISTS `Janssen Commit`;

CREATE TABLE `Billing Commit Report Group` (
`SO` VARCHAR(20),
`SO Line` VARCHAR(20),
`SO Type` CHAR(5),
`Planned Bill Date` VARCHAR(30),
`Current Bill Amount` VARCHAR(30),
`Frozen Bill Amount` DECIMAL(15,2),
`Item Number` VARCHAR(30),
`Item Description` VARCHAR(150),
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

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/S&OP/Input Data/commit_report.csv'
INTO TABLE `Billing Commit Report Group` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/S&OP/Input Data/sst_report.csv' 
INTO TABLE `SST Work Order Revision` 
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

ALTER TABLE `Billing Commit Report Group`
MODIFY `WO` INT(20) FIRST,
ADD INDEX `WO` (`WO`);

ALTER TABLE `Janssen Commit`
MODIFY `WO` INT(20) FIRST,
ADD INDEX `WO` (`WO`),
ADD INDEX `Item Number` (`Item Number`);

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

UPDATE `Janssen Commit`
SET `Customer Name` = 'GPSG (Janssen)'
WHERE `Customer Name` = 'Janssen';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Malinkrodt'
WHERE `Customer Name` = 'Mallinckrodt Pharmaceuticals Ireland';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Novo Nordisk A/S'
WHERE `Customer Name` = 'Novo Nordisk Pharmaceutical Industries,';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Cosette Pharmaceuticals'
WHERE `Customer Name` = 'Cosette Pharmaceuticals, Inc.';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Gilead Sciences Limited'
WHERE `Customer Name` = 'Gilead Sciences, Inc.';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Gilead Sciences Limited'
WHERE `Customer Name` = 'Gilead Sciences Inc.';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Gilead Sciences Limited'
WHERE `Customer Name` = 'Gilead Science Limited';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'La Jolla Pharmaceuticals'
WHERE `Customer Name` = 'La Jolla Pharmaceutical Company';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Endo'
WHERE `Customer Name` = 'Endo Ventures- Par Sterile';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Endo'
WHERE `Customer Name` = 'Endo Pharmaceuticals';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'SIGA Technologies'
WHERE `Customer Name` = 'SIGA Technologies, Inc';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Xeris Pharmaceuticals, Inc.'
WHERE `Customer Name` = 'Xeris Pharmaceuticals Inc.';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Kiniksa Pharmaceuticals Corp.'
WHERE `Customer Name` = 'Kiniksa';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Ocular Therapeutix, Inc'
WHERE `Customer Name` = 'Ocular Therapectix, Inc.';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Sanofi- Genzyme Europe B.V'
WHERE `Customer Name` = 'Sanofi-Pasteur';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Sanofi- Genzyme Europe B.V'
WHERE `Customer Name` = 'Sanofi- Genzyme Europe B.V – Service';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Pfizer Overseas LLC'
WHERE `Customer Name` = 'Pfizer Essential Health R&D';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Ocular Therapeutix, Inc'
WHERE `Customer Name` = 'Ocular Therapectix';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Ocular Therapeutix, Inc'
WHERE `Customer Name` = 'Ocular Therapeutix';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Pacira Pharmaceuticals, Inc.'
WHERE `Customer Name` = 'Pacira Pharmaceuticals';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Par Endo'
WHERE `Customer Name` = 'Endo';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'scPharmaceuticals Inc.'
WHERE `Customer Name` = 'scPharmaceuticals';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'GPSG (Janssen)'
WHERE `Customer Name` = 'Janssen Pharmaceutical';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Par Endo'
WHERE `Customer Name` = 'Endo (Auxilium) Pharmaceuticals';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Coherus Biosciences'
WHERE `Customer Name` = 'coherus';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Amarin Pharmaceutical Ireland Limited'
WHERE `Customer Name` = 'Amarin Pharmaceuticals Ireland';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'AstraZeneca Pharmaceuticals LP'
WHERE `Customer Name` = 'AstraZeneca';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Insys'
WHERE `Customer Name` = 'Insys Therapeutics, Inc.';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Protagonist'
WHERE `Customer Name` = 'Protagonist Therapeutics';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Sanofi- Genzyme Europe B.V'
WHERE `Customer Name` = 'Sanofi BioVerativ';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Viatris'
WHERE `Customer Name` = 'Viatris/Mylan';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'Millennium'
WHERE `Customer Name` = 'Millennium Pharmaceuticals, Inc.';

UPDATE `Billing Commit Report Group`
SET `Customer Name` = 'SK Life Science'
WHERE `Customer Name` = 'SK Life Sciences, Inc';

CREATE TABLE `billing commit report temp` AS (
	SELECT *
    FROM `billing commit report group`
    UNION ALL
    SELECT *
    FROM `Janssen Commit`
);

DROP TABLE IF EXISTS `billing commit report group`;

RENAME TABLE `billing commit report temp` TO `billing commit report group`;

ALTER TABLE `Billing Commit Report Group`
ADD `Start Date` DATE AFTER `SO`,
ADD `Prod Com` DATE AFTER `Start Date`,
ADD `Room` VARCHAR(10) AFTER `Prod Com`,
ADD `Status` VARCHAR(10) AFTER `Room`;

ALTER TABLE `SST Work Order Revision`
MODIFY `Order Number` INT(20) FIRST,
ADD INDEX `Order Number` (`Order Number`);

UPDATE `SST Work Order Revision` AS s
SET s.`Request Date` = STR_TO_DATE(`Request Date`, '%m/%d/%Y');

UPDATE `SST Work Order Revision` AS s
SET s.`Planned Start` = STR_TO_DATE(`Planned Start`, '%m/%d/%Y');

UPDATE `SST Work Order Revision` AS s
SET s.`Planned Complete` = STR_TO_DATE(`Planned Complete`, '%m/%d/%Y');

UPDATE `Billing Commit Report Group` AS b
JOIN `SST Work Order Revision` AS s
ON (b.`WO` = s.`Order Number`)
SET b.`Start Date` = s.`Planned Start`
WHERE b.`WO` = s.`Order Number`;

UPDATE `Billing Commit Report Group` AS b
JOIN `SST Work Order Revision` AS s
ON (b.`WO` = s.`Order Number`)
SET b.`Room` = s.`Room`
WHERE b.`WO` = s.`Order Number`;

UPDATE `Billing Commit Report Group` AS b
JOIN `SST Work Order Revision` AS s
ON (b.`WO` = s.`Order Number`)
SET b.`Prod Com` = s.`Planned Complete`
WHERE b.`WO` = s.`Order Number`;

UPDATE `Billing Commit Report Group` AS b
JOIN `SST Work Order Revision` AS s
ON (b.`WO` = s.`Order Number`)
SET b.`Status` = s.`WO St`
WHERE b.`WO` = s.`Order Number`;

UPDATE `Billing Commit Report Group` AS b
SET b.`Planned Bill Date` = STR_TO_DATE(`Planned Bill Date`, '%m/%d/%Y');

UPDATE `Billing Commit Report Group` AS b
SET b.`Actual Bill Date` = STR_TO_DATE(`Actual Bill Date`, '%m/%d/%Y');

UPDATE `Billing Commit Report Group` AS b
SET b.`Request Date` = STR_TO_DATE(`Request Date`, '%m/%d/%Y');

UPDATE `Billing Commit Report Group` AS b
SET b.`Orig Promise Date` = STR_TO_DATE(`Orig Promise Date`, '%m/%d/%Y');

UPDATE `Billing Commit Report Group`
SET `Current Bill Amount` = REPLACE(`Current Bill Amount`, ',', '');

ALTER TABLE `Billing Commit Report Group`
MODIFY COLUMN `Current Bill Amount` DECIMAL (25,2);
/*
SET @sql_text1 = 
CONCAT(
'RENAME TABLE `Billing Commit Report Group` TO `Billing Commit Report Group ', CURDATE(), '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;
*/
DROP TABLE IF EXISTS `SST Work Order Revision`;

/*Forecasts*/
/*
DROP TABLE IF EXISTS `forecast`;

CREATE TABLE `forecast` (
`Type` VARCHAR(10),
`Blank 1` VARCHAR(1),
`Branch/Plant` VARCHAR(20),
`Blank 2` VARCHAR(1),
`Planning Family` VARCHAR(10),
`Blank 3` VARCHAR(1),
`2nd Item Number` VARCHAR(30),
`Blank 4` VARCHAR(1),
`Blank 5` VARCHAR(1),
`Blank 6` VARCHAR(1),
`Description` VARCHAR(100),
`Blank 7` VARCHAR(1),
`Blank 8` VARCHAR(1),
`Blank 9` VARCHAR(1),
`Blank 10` VARCHAR(1),
`Request Date` VARCHAR(15),
`Blank 11` VARCHAR(1),
`Forecast Qty` INT,
`Blank 12` VARCHAR(1));

LOAD DATA INFILE 'C:/Users/jacob.seamon/Documents/forecast.csv' 
INTO TABLE `forecast` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 4 ROWS;

ALTER TABLE `forecast`
DROP COLUMN `Blank 1`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 2`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 3`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 4`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 5`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 6`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 7`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 8`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 9`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 10`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 11`;

ALTER TABLE `forecast`
DROP COLUMN `Blank 12`;

UPDATE `forecast` AS b
SET b.`Request Date` = STR_TO_DATE(`Request Date`, '%m/%d/%Y');

UPDATE `forecast`
SET `Type` = (CASE WHEN `Type` = ''
THEN @prevValue
ELSE @prevValue := `Type` END);

UPDATE `forecast`
SET `Branch/Plant` = (CASE WHEN `Branch/Plant` = ''
THEN @prevValue
ELSE @prevValue := `Branch/Plant` END);

UPDATE `forecast`
SET `Planning Family` = (CASE WHEN `Planning Family` = ''
THEN @prevValue
ELSE @prevValue := `Planning Family` END);

UPDATE `forecast`
SET `2nd Item Number` = (CASE WHEN `2nd Item Number` = ''
THEN @prevValue
ELSE @prevValue := `2nd Item Number` END);

UPDATE `forecast`
SET `Description` = (CASE WHEN `Description` = ''
THEN @prevValue
ELSE @prevValue := `Description` END);

ALTER TABLE `forecast`
ADD COLUMN `Customer` VARCHAR(30) FIRST;

ALTER TABLE `forecast`
ADD COLUMN `Unit Cost` DECIMAL(15,2);

ALTER TABLE `forecast`
ADD COLUMN `Amount` DECIMAL(15,2);

UPDATE `forecast` AS a
JOIN `unit cost` AS b
ON a.`2nd Item Number` = b.`Item No`
SET a.`Customer` = b.`Customer`;

UPDATE `forecast` AS a
JOIN `unit cost` AS b
ON a.`2nd Item Number` = b.`Item No`
SET a.`Unit Cost` = b.`Unit Cost`;

UPDATE `forecast`
SET `Amount` = (`Forecast Qty`*`Unit Cost`);

ALTER TABLE `forecast`
ADD COLUMN `customer_id` INT FIRST;

UPDATE `forecast` AS a
JOIN `customer_names` AS b
ON a.`Customer` = b.`Customer (Unit Cost)`
SET a.`customer_id` = b.`id`;
*/

/*Actuals*/

DROP TABLE IF EXISTS `Actuals`;

CREATE TABLE `Actuals` (
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

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/S&OP/Input Data/Actuals FY24.csv'
INTO TABLE `Actuals` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

UPDATE `Actuals` AS b
SET b.`Invoice Date` = STR_TO_DATE(`Invoice Date`, '%m/%d/%Y');
/*
UPDATE `Actuals`
SET `Sold To Name` = 'Takeda Pharmaceuticals U.S.A., Inc.'
WHERE `Sold To Name` = 'Takeda Pharm. Int. AG';
*/
UPDATE `Actuals`
SET `Sold To Name` = 'Gilead Sciences Limited'
WHERE `Sold To Name` = 'Gilead Sciences Inc.';

UPDATE `Actuals`
SET `Sold To Name` = 'Malinkrodt'
WHERE `Sold To Name` = 'Mallinckrodt Pharmaceuticals Ireland';

UPDATE `Actuals`
SET `Sold To Name` = 'Gilead Sciences Limited'
WHERE `Sold To Name` = 'Gilead Sciences, Inc.';

UPDATE `Actuals`
SET `Sold To Name` = 'Gilead Sciences Limited'
WHERE `Sold To Name` = 'Gilead Science Limited';

UPDATE `Actuals`
SET `Sold To Name` = 'Xeris Pharmaceuticals, Inc.'
WHERE `Sold To Name` = 'Xeris Pharmaceuticals Inc.';

UPDATE `Actuals`
SET `Sold To Name` = 'Sanofi- Genzyme Europe B.V'
WHERE `Sold To Name` = 'Sanofi- Genzyme Europe B.V – Service';

UPDATE `Actuals`
SET `Sold To Name` = 'Pfizer Overseas LLC'
WHERE `Sold To Name` = 'Pfizer Essential Health R&D';

UPDATE `Actuals`
SET `Sold To Name` = 'Kiniksa Pharmaceuticals Corp.'
WHERE `Sold To Name` = 'Kiniksa';

UPDATE `Actuals`
SET `Sold To Name` = 'Viatris'
WHERE `Sold To Name` = 'Mylan Global Device Development';

UPDATE `Actuals`
SET `Sold To Name` = 'Par Endo'
WHERE `Sold To Name` = 'Endo Ventures- Par Sterile';

UPDATE `Actuals`
SET `Sold To Name` = 'Par Endo'
WHERE `Sold To Name` = 'Endo Pharmaceuticals';

UPDATE `Actuals`
SET `Sold To Name` = 'La Jolla Pharmaceuticals'
WHERE `Sold To Name` = 'La Jolla Pharmaceutical Company';

UPDATE `Actuals`
SET `Sold To Name` = 'SIGA Technologies'
WHERE `Sold To Name` = 'SIGA Technologies, Inc';
/*
UPDATE `Actuals`
SET `Sold To Name` = 'BMS'
WHERE `Sold To Name` = 'Bristol Myers Squibb (BMS)';
*/
UPDATE `Actuals`
SET `Sold To Name` = 'Ocular Therapeutix, Inc'
WHERE `Sold To Name` = 'Ocular Therapectix, Inc.';

UPDATE `Actuals`
SET `Sold To Name` = 'Ocular Therapeutix, Inc'
WHERE `Sold To Name` = 'Ocular Therapectix';

UPDATE `Actuals`
SET `Sold To Name` = 'Ocular Therapeutix, Inc'
WHERE `Sold To Name` = 'Ocular Therapeutix';

UPDATE `Actuals`
SET `Sold To Name` = 'Cosette Pharmaceuticals'
WHERE `Sold To Name` = 'Cosette Pharmaceuticals, Inc.';

UPDATE `Actuals`
SET `Sold To Name` = 'Pacira Pharmaceuticals, Inc.'
WHERE `Sold To Name` = 'Pacira Pharmaceuticals';

UPDATE `Actuals`
SET `Sold To Name` = 'GPSG (Janssen)'
WHERE `Sold To Name` = 'Janssen Pharmaceutical';

UPDATE `Actuals`
SET `Sold To Name` = 'Amarin Pharmaceutical Ireland Limited'
WHERE `Sold To Name` = 'Amarin Pharmaceuticals Ireland';

UPDATE `Actuals`
SET `Sold To Name` = 'Par Endo'
WHERE `Sold To Name` = 'Endo';

UPDATE `Actuals`
SET `Sold To Name` = 'scPharmaceuticals Inc.'
WHERE `Sold To Name` = 'scPharmaceuticals';

UPDATE `Actuals`
SET `Sold To Name` = 'Coherus Biosciences'
WHERE `Sold To Name` = 'coherus';

UPDATE `Actuals`
SET `Sold To Name` = 'Par Endo'
WHERE `Sold To Name` = 'Endo (Auxilium) Pharmaceuticals';

/*Customer Name ID*/

DROP TABLE IF EXISTS `customer_names_temp`;

CREATE TABLE `customer_names_temp` AS (
    SELECT c.*
    FROM (
        SELECT z.`id`, z.`Customer (Unit Cost)`, z.`Customer Name (Commit)`, y.`Customer`
        FROM (
            SELECT a.`id`, a.`Customer (Unit Cost)`, a.`Customer Name (Commit)`, b.`Customer ID`
            FROM `customer_names` AS a
            LEFT JOIN `forecast_capacity` AS b
            ON a.`Customer Name (Commit)` = b.`Customer`
            WHERE b.`Customer ID` IS NULL
            GROUP BY a.`id`
        ) AS z
        LEFT JOIN `billing commit report group` AS y
        ON z.`Customer Name (Commit)` = y.`Customer Name`
        GROUP BY z.`id`
        UNION ALL
        SELECT a.`id`, a.`Customer (Unit Cost)`, a.`Customer Name (Commit)`, b.`Customer ID`
        FROM `customer_names` AS a
        LEFT JOIN `forecast_capacity` AS b
        ON a.`Customer Name (Commit)` = b.`Customer`
        WHERE b.`Customer ID` IS NOT NULL
        GROUP BY a.`id`
        ) AS c
    GROUP BY c.`id`
    ORDER BY c.`id`
);



/*USE IF CUSTOMER NEEDS TO BE ADDED*/

ALTER TABLE `customer_names_temp`
DROP COLUMN `id`;

INSERT INTO `customer_names_temp` (`Customer (Unit Cost)`, `Customer Name (Commit)`, `Customer`)
VALUES ('Eli Lilly and Company', 'Eli Lilly and Company', '43026290');

CREATE TABLE `customer_names_temp0` AS (
	SELECT *
	FROM `customer_names_temp`
	ORDER BY `Customer (Unit Cost)` ASC
);

ALTER TABLE `customer_names_temp0`
ADD COLUMN `id` INT PRIMARY KEY AUTO_INCREMENT FIRST;

DROP TABLE `customer_names_temp`;

RENAME TABLE `customer_names_temp0` TO `customer_names_temp`;


/*---------------------------*/

ALTER TABLE `forecast_capacity`
ADD COLUMN `customer_id` INT FIRST;

ALTER TABLE `Billing Commit Report Group`
ADD COLUMN `customer_id` INT FIRST;

ALTER TABLE `annual budget 2024`
ADD COLUMN `customer_id` INT FIRST;

ALTER TABLE `Actuals`
ADD COLUMN `customer_id` INT FIRST;

ALTER TABLE `Finance Adjustments`
ADD COLUMN `customer_id` INT FIRST;

UPDATE `forecast_capacity` AS a
JOIN `customer_names_temp` AS b
ON a.`Customer ID` = b.`Customer`
SET a.`customer_id` = b.`id`;

UPDATE `forecast_capacity` AS a
JOIN `customer_names_temp` AS b
ON a.`Customer` = b.`Customer Name (Commit)`
SET a.`customer_id` = b.`id`
WHERE a.`customer_id` IS NULL;

UPDATE `Billing Commit Report Group` AS a
JOIN `customer_names_temp` AS b
ON a.`Customer` = b.`Customer`
SET a.`customer_id` = b.`id`;

UPDATE `Billing Commit Report Group` AS a
JOIN `customer_names_temp` AS b
ON a.`Customer Name` = b.`Customer Name (Commit)`
SET a.`customer_id` = b.`id`
WHERE a.`customer_id` IS NULL;

UPDATE `annual budget 2024` AS a
JOIN `customer_names_temp` AS b
ON a.`Customer Parent` = b.`Customer Name (Commit)`
SET a.`customer_id` = b.`id`;

UPDATE `Actuals` AS a
JOIN `customer_names_temp` AS b
ON a.`Sold To` = b.`Customer`
SET a.`customer_id` = b.`id`;

UPDATE `Actuals` AS a
JOIN `customer_names_temp` AS b
ON a.`Sold To Name` = b.`Customer Name (Commit)`
SET a.`customer_id` = b.`id`
WHERE a.`customer_id` IS NULL;

UPDATE `Finance Adjustments` AS a
JOIN `customer_names_temp` AS b
ON a.`Customer` = b.`Customer (Unit Cost)`
SET a.`customer_id` = b.`id`;

/*Product Family ID*/

DROP TABLE IF EXISTS `product_names_with_item_num_temp`;
DROP TABLE IF EXISTS `product_names_temp`;

ALTER TABLE `forecast_capacity`
ADD COLUMN `product_family_id` INT AFTER `customer_id`;

ALTER TABLE `annual budget 2024`
ADD COLUMN `product_family_id` INT AFTER `customer_id`;

ALTER TABLE `Billing Commit Report Group`
ADD COLUMN `product_family_id` INT AFTER `customer_id`;

ALTER TABLE `Billing Commit Report Group`
ADD COLUMN `Product Family` VARCHAR(100) AFTER `product_family_id`;

ALTER TABLE `Actuals`
ADD COLUMN `product_family_id` INT AFTER `customer_id`;

ALTER TABLE `Actuals`
ADD COLUMN `Product Family` VARCHAR(100) AFTER `product_family_id`;
/*
CREATE TABLE `product_names_with_item_num_temp` AS (
    SELECT `Customer`, `Product Family`, `ItemNo.` AS `Item Number`
    FROM `forecast_capacity`
    GROUP BY `Customer`, `Product Family`, `Item Number`
    ORDER BY `Customer`, `Product Family`, `Item Number`
);
*/

/*
CREATE TABLE `product_names_with_item_num_temp` AS (
    SELECT a.*
        FROM (
        SELECT `Customer`, `Product Family`, `ItemNo.` AS `Item Number`
        FROM `forecast_capacity`
        UNION ALL
        SELECT `Customer`, `Product Family`, '' AS `Item Number`
        FROM `annual budget 2024`
        ) AS a
    GROUP BY `Customer`, `Product Family`, `Item Number`
    ORDER BY `Customer`, `Product Family`, `Item Number`
);*/

UPDATE `Billing Commit Report Group` AS a
JOIN `Product Names` AS b
ON a.`Item Number` = b.`2nd Item Number`
SET a.`Product Family` = b.`Product Family`;

UPDATE `Billing Commit Report Group`
SET `Product Family` = `Item Number`
WHERE `Product Family` = '' OR `Product Family` IS NULL;
/*
UPDATE `Billing Commit Report Group`
SET `Product Family` = CONCAT(`Product Family`, ' - ',`Customer Name`)
WHERE `WO` = 0 OR `WO` = '' OR `WO` IS NULL;
*/
UPDATE `Actuals` AS a
JOIN `Product Names` AS b
ON a.`2nd Item Number` = b.`2nd Item Number`
SET a.`Product Family` = b.`Product Family`;

UPDATE `Actuals`
SET `Product Family` = `2nd Item Number`
WHERE `Product Family` = '' OR `Product Family` IS NULL;
/*
UPDATE `Actuals`
SET `Product Family` = CONCAT(`Product Family`, ' - ',`Sold To Name`)
WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE';

UPDATE `Actuals`
SET `Product Family` = CONCAT(`Product Family`, ' - ',`Sold To Name`);
*/
UPDATE `forecast_capacity` AS a
JOIN `Product Names` AS b
ON a.`ItemNo.` = b.`2nd Item Number`
SET a.`Product Family` = b.`Product Family`;
/*
CREATE TABLE `product_names_temp` AS (
    SELECT a.*
        FROM (
        SELECT `Customer`, `Product Family`
        FROM `forecast_capacity`
        UNION ALL
        SELECT `Customer Parent` AS `Customer`, `Product Family`
        FROM `annual budget 2024`
		UNION ALL
		SELECT `Customer Name` AS `Customer`, `Product Family`
		FROM `billing commit report group`
		UNION ALL
		SELECT `Sold To Name` AS `Customer`, `Product Family`
		FROM `Actuals`
        ) AS a
    GROUP BY `Customer`, `Product Family`
    ORDER BY `Customer`, `Product Family`
);

ALTER TABLE `product_names_temp`
ADD COLUMN `product_family_id` INT AUTO_INCREMENT PRIMARY KEY FIRST;
*/
UPDATE `forecast_capacity` AS a
JOIN `Product Names` AS b
ON a.`Product Family` = b.`Product Family`
SET a.`product_family_id` = b.`product_family_id`;

UPDATE `annual budget 2024` AS a
JOIN `Product Names` AS b
ON a.`Product Family` = b.`Product Family`
SET a.`product_family_id` = b.`product_family_id`;

UPDATE `Annual Budget 2024`
SET `Product Family` = CONCAT('GO GET - ', `Customer Parent`)
WHERE `Product Family` = 'GO GET';

UPDATE `Annual Budget 2024`
SET `Product Family` = CONCAT('No Product Reference - ', `Customer Parent`)
WHERE `Product Family` = 'No Product Reference';

UPDATE `Billing Commit Report Group` AS a
JOIN `Product Names` AS b
ON a.`Product Family` = b.`Product Family`
SET a.`product_family_id` = b.`product_family_id`;

UPDATE `Actuals` AS a
JOIN `Product Names` AS b
ON a.`Product Family` = b.`Product Family`
SET a.`product_family_id` = b.`product_family_id`;

/*Null Values*/

DROP TABLE IF EXISTS `Budget Customer Names`;
DROP TABLE IF EXISTS `Annual Budget Temp`;

CREATE TABLE `Budget Customer Names` AS (
    SELECT a.`Customer`, b.`Customer Parent`, a.`z`
    FROM (
        SELECT a.`Customer`, a.`y`, COUNT(*) AS `z`
        FROM (
            SELECT `Customer`, LEFT(`Customer`, 5) AS `y`
            FROM `Product Names`
            GROUP BY `Customer`
        ) AS a
        GROUP BY `y`
    ) AS a
    JOIN `Annual Budget 2024` AS b
    ON LEFT(a.`Customer`, 5) = LEFT(b.`Customer Parent`, 5)/*
    WHERE `z` < 2*/
    GROUP BY a.`Customer`
);

CREATE TABLE `Annual Budget Temp` AS (
    SELECT a.*, b.`Customer`
    FROM `Annual Budget 2024` AS a
    LEFT JOIN `Budget Customer Names` AS b
    ON a.`Customer Parent` = b.`Customer Parent`
);

UPDATE `Annual Budget Temp`
SET `Customer` = `Customer Parent`
WHERE `Customer` IS NULL;

UPDATE `Annual Budget Temp`
SET `Product Family` = CONCAT(`Product Family`, ' - ', `Customer Parent`)
WHERE `Product Family` = 'Lubiprostone';

DROP TABLE IF EXISTS `Annual Budget 2024`;

RENAME TABLE `Annual Budget Temp` TO `Annual Budget 2024`;
/*
ALTER TABLE `Annual Budget Temp`
ADD COLUMN `Item Number` INT PRIMARY KEY AUTO_INCREMENT;
*/
DROP TABLE IF EXISTS `Product Names Null`;

CREATE TABLE `Product Names Null` AS (
    SELECT a.*
    FROM (
        SELECT *
        FROM `Product Names`
        UNION ALL
        SELECT `product_family_id`, `Customer Name`, `Item Number`, 'UNL', CONCAT(`Customer Name`, ' - Unlisted')
        FROM `billing commit report group`
        WHERE `product_family_id` IS NULL
        UNION ALL
        SELECT `product_family_id`, `Sold To Name`, `2nd Item Number`, 'UNL', CONCAT(`Sold To Name`, ' - Unlisted')
        FROM `Actuals`
        WHERE `product_family_id` IS NULL
        UNION ALL
        SELECT `product_family_id`, `Customer`, `ItemNo.`, 'UNL', CONCAT(`Customer`, ' - Unlisted')
        FROM `forecast_capacity`
        WHERE `product_family_id` IS NULL
        UNION ALL
        SELECT `product_family_id`, `Customer`, CONCAT('Budget - ', `Item Number`), 'UNL', /*CONCAT(`Customer`, ' - Unlisted')*/ `Product Family`
        FROM `Annual Budget 2024`
        WHERE `product_family_id` IS NULL
    ) AS a
    WHERE a.`Customer` IS NOT NULL
    GROUP BY a.`2nd Item Number`
    ORDER BY a.`Customer`, a.`Product Family`, a.`2nd Item Number`
);

ALTER TABLE `Product Names Null`
DROP COLUMN `product_family_id`;

ALTER TABLE `Product Names Null`
ADD COLUMN `product_family_id` INT AUTO_INCREMENT PRIMARY KEY FIRST;
/*
UPDATE `Product Names Null`
SET `2nd Item Number` = ''
WHERE LEFT(`2nd Item Number`, 6) = 'Budget';
*/
DROP TABLE `Product Names`;

RENAME TABLE `Product Names Null` TO `Product Names`;
/*
UPDATE `Product Names`
SET `Product Family` = CONCAT(`Product Family`, '-', `Customer`)
WHERE `Plan Fmly` <> 'UNL';
*/
/*Product Names Part 2*/

UPDATE `Billing Commit Report Group` AS a
JOIN `Product Names` AS b
ON a.`Item Number` = b.`2nd Item Number`
SET a.`Product Family` = b.`Product Family`;

UPDATE `Billing Commit Report Group`
SET `Product Family` = `Item Number`
WHERE `Product Family` = '' OR `Product Family` IS NULL;

UPDATE `Actuals` AS a
JOIN `Product Names` AS b
ON a.`2nd Item Number` = b.`2nd Item Number`
SET a.`Product Family` = b.`Product Family`;

UPDATE `Actuals`
SET `Product Family` = `2nd Item Number`
WHERE `Product Family` = '' OR `Product Family` IS NULL;

UPDATE `forecast_capacity` AS a
JOIN `Product Names` AS b
ON a.`ItemNo.` = b.`2nd Item Number`
SET a.`Product Family` = b.`Product Family`;
/*
CREATE TABLE `product_names_temp` AS (
    SELECT a.*
        FROM (
        SELECT `Customer`, `Product Family`
        FROM `forecast_capacity`
        UNION ALL
        SELECT `Customer Parent` AS `Customer`, `Product Family`
        FROM `annual budget 2024`
		UNION ALL
		SELECT `Customer Name` AS `Customer`, `Product Family`
		FROM `billing commit report group`
		UNION ALL
		SELECT `Sold To Name` AS `Customer`, `Product Family`
		FROM `Actuals`
        ) AS a
    GROUP BY `Customer`, `Product Family`
    ORDER BY `Customer`, `Product Family`
);

ALTER TABLE `product_names_temp`
ADD COLUMN `product_family_id` INT AUTO_INCREMENT PRIMARY KEY FIRST;
*/
UPDATE `forecast_capacity` AS a
JOIN `Product Names` AS b
ON a.`Product Family` = b.`Product Family`
SET a.`product_family_id` = b.`product_family_id`;

UPDATE `annual budget 2024` AS a
JOIN `Product Names` AS b
ON a.`Product Family` = b.`Product Family`
SET a.`product_family_id` = b.`product_family_id`;

UPDATE `Annual Budget 2024`
SET `Product Family` = CONCAT('GO GET - ', `Customer Parent`)
WHERE `Product Family` = 'GO GET';

UPDATE `Annual Budget 2024`
SET `Product Family` = CONCAT('No Product Reference - ', `Customer Parent`)
WHERE `Product Family` = 'No Product Reference';

UPDATE `Billing Commit Report Group` AS a
JOIN `Product Names` AS b
ON a.`Product Family` = b.`Product Family`
SET a.`product_family_id` = b.`product_family_id`;

UPDATE `Actuals` AS a
JOIN `Product Names` AS b
ON a.`Product Family` = b.`Product Family`
SET a.`product_family_id` = b.`product_family_id`;

/*BU (S&OP Part 1)*/

DROP TABLE IF EXISTS `BU`;
DROP TABLE IF EXISTS `BU temp`;

CREATE TABLE `BU temp` (
`Customer Name` VARCHAR(50),
`Product Family` VARCHAR(150),
`Jul-Budget` VARCHAR(20),
`Jul-Act-FG` VARCHAR(20),
`Jul-Act-Misc` VARCHAR(20),
`Jul-Com` VARCHAR(20),
`Jul-24 FCST` VARCHAR(20),
`Aug-Budget` VARCHAR(20),
`Aug-Act-FG` VARCHAR(20),
`Aug-Act-Misc` VARCHAR(20),
`Aug-Com` VARCHAR(20),
`Aug-24 FCST` VARCHAR(20),
`Sep-Budget` VARCHAR(20),
`Sep-Act-FG` VARCHAR(20),
`Sep-Act-Misc` VARCHAR(20),
`Sep-Com` VARCHAR(20),
`Sep-24 FCST` VARCHAR(20),
`Oct-Budget` VARCHAR(20),
`Oct-Act-FG` VARCHAR(20),
`Oct-Act-Misc` VARCHAR(20),
`Oct-Com` VARCHAR(20),
`Oct-24 FCST` VARCHAR(20),
`Nov-Budget` VARCHAR(20),
`Nov-Act-FG` VARCHAR(20),
`Nov-Act-Misc` VARCHAR(20),
`Nov-Com` VARCHAR(20),
`Nov-24 FCST` VARCHAR(20),
`Dec-Budget` VARCHAR(20),
`Dec-Act-FG` VARCHAR(20),
`Dec-Act-Misc` VARCHAR(20),
`Dec-Com` VARCHAR(20),
`Dec-24 FCST` VARCHAR(20),
`Jan-Budget` VARCHAR(20),
`Jan-Act-FG` VARCHAR(20),
`Jan-Act-Misc` VARCHAR(20),
`Jan-Com` VARCHAR(20),
`Jan-24 FCST` VARCHAR(20),
`Feb-Budget` VARCHAR(20),
`Feb-Act-FG` VARCHAR(20),
`Feb-Act-Misc` VARCHAR(20),
`Feb-Com` VARCHAR(20),
`Feb-24 FCST` VARCHAR(20),
`Mar-Budget` VARCHAR(20),
`Mar-Act-FG` VARCHAR(20),
`Mar-Act-Misc` VARCHAR(20),
`Mar-Com` VARCHAR(20),
`Mar-24 FCST` VARCHAR(20),
`Apr-Budget` VARCHAR(20),
`Apr-Act-FG` VARCHAR(20),
`Apr-Act-Misc` VARCHAR(20),
`Apr-Com` VARCHAR(20),
`Apr-24 FCST` VARCHAR(20),
`May-Budget` VARCHAR(20),
`May-Act-FG` VARCHAR(20),
`May-Act-Misc` VARCHAR(20),
`May-Com` VARCHAR(20),
`May-24 FCST` VARCHAR(20),
`Jun-Budget` VARCHAR(20),
`Jun-Act-FG` VARCHAR(20),
`Jun-Act-Misc` VARCHAR(20),
`Jun-Com` VARCHAR(20),
`Jun-24 FCST` VARCHAR(20));
/*
CREATE TABLE `BU` (
`Customer Name` VARCHAR(40),
`Jul-Budget` VARCHAR(20),
`Jul-Act` VARCHAR(20),
`Jul-Com` VARCHAR(20),
`Jul-24 FCST` VARCHAR(20),
`Jul-VAR` VARCHAR(20),
`Aug-Budget` VARCHAR(20),
`Aug-Act` VARCHAR(20),
`Aug-Com` VARCHAR(20),
`Aug-24 FCST` VARCHAR(20),
`Aug-VAR` VARCHAR(20),
`Sep-Budget` VARCHAR(20),
`Sep-Act` VARCHAR(20),
`Sep-Com` VARCHAR(20),
`Sep-24 FCST` VARCHAR(20),
`Sep-VAR` VARCHAR(20),
`Oct-Budget` VARCHAR(20),
`Oct-Act` VARCHAR(20),
`Oct-Com` VARCHAR(20),
`Oct-24 FCST` VARCHAR(20),
`Oct-VAR` VARCHAR(20),
`Nov-Budget` VARCHAR(20),
`Nov-Act` VARCHAR(20),
`Nov-Com` VARCHAR(20),
`Nov-24 FCST` VARCHAR(20),
`Nov-VAR` VARCHAR(20),
`Dec-Budget` VARCHAR(20),
`Dec-Act` VARCHAR(20),
`Dec-Com` VARCHAR(20),
`Dec-24 FCST` VARCHAR(20),
`Dec-VAR` VARCHAR(20),
`Jan-Budget` VARCHAR(20),
`Jan-Act` VARCHAR(20),
`Jan-Com` VARCHAR(20),
`Jan-24 FCST` VARCHAR(20),
`Jan-VAR` VARCHAR(20),
`Feb-Budget` VARCHAR(20),
`Feb-Act` VARCHAR(20),
`Feb-Com` VARCHAR(20),
`Feb-24 FCST` VARCHAR(20),
`Feb-VAR` VARCHAR(20),
`Mar-Budget` VARCHAR(20),
`Mar-Act` VARCHAR(20),
`Mar-Com` VARCHAR(20),
`Mar-24 FCST` VARCHAR(20),
`Mar-VAR` VARCHAR(20),
`Apr-Budget` VARCHAR(20),
`Apr-Act` VARCHAR(20),
`Apr-Com` VARCHAR(20),
`Apr-24 FCST` VARCHAR(20),
`Apr-VAR` VARCHAR(20),
`May-Budget` VARCHAR(20),
`May-Act` VARCHAR(20),
`May-Com` VARCHAR(20),
`May-24 FCST` VARCHAR(20),
`May-VAR` VARCHAR(20),
`Jun-Budget` VARCHAR(20),
`Jun-Act` VARCHAR(20),
`Jun-Com` VARCHAR(20),
`Jun-24 FCST` VARCHAR(20),
`Jun-VAR` VARCHAR(20));
*/
/*Customer Name*/
/*
INSERT INTO `BU` (`Customer Name`)
(	SELECT `Customer (Unit Cost)`
	FROM `customer_names`
	GROUP BY `Customer (Unit Cost)`
	ORDER BY `Customer (Unit Cost)` ASC);

INSERT INTO `BU temp` (`Customer Name`, `Product Family`)
    (	SELECT `Customer`, `Product Family`
        FROM `forecast_capacity`
        GROUP BY `Customer`, `Product Family`
        UNION ALL
        SELECT `Customer`, 'ADJUSTMENT' AS `Product Family`
        FROM `forecast_capacity`
        GROUP BY `Customer`
    );
*/
INSERT INTO `BU temp` (`Customer Name`, `Product Family`)
    (	SELECT `Customer`, `Product Family`
        FROM `Product Names`
        GROUP BY `Customer`, `Product Family`
        UNION ALL
        SELECT `Customer`, 'ADJUSTMENT' AS `Product Family`
        FROM `Product Names`
        GROUP BY `Customer`
    );

CREATE TABLE `BU` AS (
    SELECT *
    FROM `BU temp`
    ORDER BY `Customer Name`, `Product Family` ASC
);

DROP TABLE IF EXISTS `BU temp`;

ALTER TABLE `BU`
ADD COLUMN `customer_id` INT FIRST;

UPDATE `BU` AS a
JOIN `customer_names_temp` AS b
ON a.`Customer Name` = b.`Customer Name (Commit)`
SET a.`customer_id` = b.`id`;

/*Budget (Upload)*/

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Jul FY24 Bud`) * 1000 AS `Jul-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jul-Budget` = b.`Jul-Bud`;
UPDATE `BU`
SET `Jul-Budget` = COALESCE(`Jul-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Aug FY24 Bud`) * 1000 AS `Aug-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Aug-Budget` = b.`Aug-Bud`;
UPDATE `BU`
SET `Aug-Budget` = COALESCE(`Aug-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Sep FY24 Bud`) * 1000 AS `Sep-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Sep-Budget` = b.`Sep-Bud`;
UPDATE `BU`
SET `Sep-Budget` = COALESCE(`Sep-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Oct FY24 Bud`) * 1000 AS `Oct-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Oct-Budget` = b.`Oct-Bud`;
UPDATE `BU`
SET `Oct-Budget` = COALESCE(`Oct-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Nov FY24 Bud`) * 1000 AS `Nov-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Nov-Budget` = b.`Nov-Bud`;
UPDATE `BU`
SET `Nov-Budget` = COALESCE(`Nov-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Dec FY24 Bud`) * 1000 AS `Dec-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Dec-Budget` = b.`Dec-Bud`;
UPDATE `BU`
SET `Dec-Budget` = COALESCE(`Dec-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Jan FY24 Bud`) * 1000 AS `Jan-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jan-Budget` = b.`Jan-Bud`;
UPDATE `BU`
SET `Jan-Budget` = COALESCE(`Jan-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Feb FY24 Bud`) * 1000 AS `Feb-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Feb-Budget` = b.`Feb-Bud`;
UPDATE `BU`
SET `Feb-Budget` = COALESCE(`Feb-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Mar FY24 Bud`) * 1000 AS `Mar-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Mar-Budget` = b.`Mar-Bud`;
UPDATE `BU`
SET `Mar-Budget` = COALESCE(`Mar-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Apr FY24 Bud`) * 1000 AS `Apr-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Apr-Budget` = b.`Apr-Bud`;
UPDATE `BU`
SET `Apr-Budget` = COALESCE(`Apr-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`May FY24 Bud`) * 1000 AS `May-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`May-Budget` = b.`May-Bud`;
UPDATE `BU`
SET `May-Budget` = COALESCE(`May-Budget`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Product Family`, SUM(`Jun FY24 Bud`) * 1000 AS `Jun-Bud`
    FROM `Annual Budget 2024`
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jun-Budget` = b.`Jun-Bud`;
UPDATE `BU`
SET `Jun-Budget` = COALESCE(`Jun-Budget`, 0.00);

/*Actuals Upload*/

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 7 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jul-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Jul-Act-FG` = COALESCE(`Jul-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 8 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Aug-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Aug-Act-FG` = COALESCE(`Aug-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 9 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Sep-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Sep-Act-FG` = COALESCE(`Sep-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 10 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Oct-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Oct-Act-FG` = COALESCE(`Oct-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 11 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Nov-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Nov-Act-FG` = COALESCE(`Nov-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 12 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Dec-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Dec-Act-FG` = COALESCE(`Dec-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 1 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jan-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Jan-Act-FG` = COALESCE(`Jan-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 2 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Feb-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Feb-Act-FG` = COALESCE(`Feb-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 3 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Mar-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Mar-Act-FG` = COALESCE(`Mar-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 4 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Apr-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Apr-Act-FG` = COALESCE(`Apr-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 5 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`May-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `May-Act-FG` = COALESCE(`May-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 6 AND (`Or Ty` = 'SO' OR `Or Ty` = 'CO')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jun-Act-FG` = b.`Extended SUM`;
UPDATE `BU`
SET `Jun-Act-FG` = COALESCE(`Jun-Act-FG`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 7 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jul-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Jul-Act-Misc` = COALESCE(`Jul-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
    WHERE MONTH(`Invoice Date`) = 8 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Aug-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Aug-Act-Misc` = COALESCE(`Aug-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
    WHERE MONTH(`Invoice Date`) = 9 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Sep-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Sep-Act-Misc` = COALESCE(`Sep-Act-Misc`, 0.00);
UPDATE `BU`
SET `Sep-Act-Misc` = COALESCE(`Sep-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 10 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Oct-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Oct-Act-Misc` = COALESCE(`Oct-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 11 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Nov-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Nov-Act-Misc` = COALESCE(`Nov-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 12 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Dec-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Dec-Act-Misc` = COALESCE(`Dec-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 1 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jan-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Jan-Act-Misc` = COALESCE(`Jan-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 2 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Feb-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Feb-Act-Misc` = COALESCE(`Feb-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 3 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Mar-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Mar-Act-Misc` = COALESCE(`Mar-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 4 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Apr-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Apr-Act-Misc` = COALESCE(`Apr-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 5 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`May-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `May-Act-Misc` = COALESCE(`May-Act-Misc`, 0.00);

UPDATE `Actuals`
SET `Extended Amount` = REPLACE(`Extended Amount`, ',', '');
UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Extended Amount`) AS `Extended SUM`, `Invoice Date`, `Or Ty`
    FROM `Actuals`
	WHERE MONTH(`Invoice Date`) = 6 AND (`Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE')
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jun-Act-Misc` = b.`Extended SUM`;
UPDATE `BU`
SET `Jun-Act-Misc` = COALESCE(`Jun-Act-Misc`, 0.00);

/*Adjustments Upload*/

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, `Or Ty`, SUM(`Jul-Adj`) AS `Jul-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Jul-Act-FG` = CASE 
	WHEN (a.`Jul-Act-FG` + b.`Jul-Adj-FG`) IS NULL
    THEN a.`Jul-Act-FG`
    ELSE (a.`Jul-Act-FG` + b.`Jul-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Jul-Adj`) AS `Jul-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Jul-Act-Misc` = CASE 
	WHEN (a.`Jul-Act-Misc` + b.`Jul-Adj-Misc`) IS NULL
    THEN a.`Jul-Act-Misc`
    ELSE (a.`Jul-Act-Misc` + b.`Jul-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Aug-Adj`) AS `Aug-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Aug-Act-FG` = CASE 
	WHEN (a.`Aug-Act-FG` + b.`Aug-Adj-FG`) IS NULL
    THEN a.`Aug-Act-FG`
    ELSE (a.`Aug-Act-FG` + b.`Aug-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Aug-Adj`) AS `Aug-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Aug-Act-Misc` = CASE 
	WHEN (a.`Aug-Act-Misc` + b.`Aug-Adj-Misc`) IS NULL
    THEN a.`Aug-Act-Misc`
    ELSE (a.`Aug-Act-Misc` + b.`Aug-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Sep-Adj`) AS `Sep-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Sep-Act-FG` = CASE 
	WHEN (a.`Sep-Act-FG` + b.`Sep-Adj-FG`) IS NULL
    THEN a.`Sep-Act-FG`
    ELSE (a.`Sep-Act-FG` + b.`Sep-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Sep-Adj`) AS `Sep-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Sep-Act-Misc` = CASE 
	WHEN (a.`Sep-Act-Misc` + b.`Sep-Adj-Misc`) IS NULL
    THEN a.`Sep-Act-Misc`
    ELSE (a.`Sep-Act-Misc` + b.`Sep-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Oct-Adj`) AS `Oct-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Oct-Act-FG` = CASE 
	WHEN (a.`Oct-Act-FG` + b.`Oct-Adj-FG`) IS NULL
    THEN a.`Oct-Act-FG`
    ELSE (a.`Oct-Act-FG` + b.`Oct-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Oct-Adj`) AS `Oct-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Oct-Act-Misc` = CASE 
	WHEN (a.`Oct-Act-Misc` + b.`Oct-Adj-Misc`) IS NULL
    THEN a.`Oct-Act-Misc`
    ELSE (a.`Oct-Act-Misc` + b.`Oct-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Nov-Adj`) AS `Nov-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Nov-Act-FG` = CASE 
	WHEN (a.`Nov-Act-FG` + b.`Nov-Adj-FG`) IS NULL
    THEN a.`Nov-Act-FG`
    ELSE (a.`Nov-Act-FG` + b.`Nov-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Nov-Adj`) AS `Nov-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Nov-Act-Misc` = CASE 
	WHEN (a.`Nov-Act-Misc` + b.`Nov-Adj-Misc`) IS NULL
    THEN a.`Nov-Act-Misc`
    ELSE (a.`Nov-Act-Misc` + b.`Nov-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Dec-Adj`) AS `Dec-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Dec-Act-FG` = CASE 
	WHEN (a.`Dec-Act-FG` + b.`Dec-Adj-FG`) IS NULL
    THEN a.`Dec-Act-FG`
    ELSE (a.`Dec-Act-FG` + b.`Dec-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Dec-Adj`) AS `Dec-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Dec-Act-Misc` = CASE 
	WHEN (a.`Dec-Act-Misc` + b.`Dec-Adj-Misc`) IS NULL
    THEN a.`Dec-Act-Misc`
    ELSE (a.`Dec-Act-Misc` + b.`Dec-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Jan-Adj`) AS `Jan-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Jan-Act-FG` = CASE 
	WHEN (a.`Jan-Act-FG` + b.`Jan-Adj-FG`) IS NULL
    THEN a.`Jan-Act-FG`
    ELSE (a.`Jan-Act-FG` + b.`Jan-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Jan-Adj`) AS `Jan-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Jan-Act-Misc` = CASE 
	WHEN (a.`Jan-Act-Misc` + b.`Jan-Adj-Misc`) IS NULL
    THEN a.`Jan-Act-Misc`
    ELSE (a.`Jan-Act-Misc` + b.`Jan-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Feb-Adj`) AS `Feb-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Feb-Act-FG` = CASE 
	WHEN (a.`Feb-Act-FG` + b.`Feb-Adj-FG`) IS NULL
    THEN a.`Feb-Act-FG`
    ELSE (a.`Feb-Act-FG` + b.`Feb-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Feb-Adj`) AS `Feb-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Feb-Act-Misc` = CASE 
	WHEN (a.`Feb-Act-Misc` + b.`Feb-Adj-Misc`) IS NULL
    THEN a.`Feb-Act-Misc`
    ELSE (a.`Feb-Act-Misc` + b.`Feb-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Mar-Adj`) AS `Mar-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Mar-Act-FG` = CASE 
	WHEN (a.`Mar-Act-FG` + b.`Mar-Adj-FG`) IS NULL
    THEN a.`Mar-Act-FG`
    ELSE (a.`Mar-Act-FG` + b.`Mar-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Mar-Adj`) AS `Mar-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Mar-Act-Misc` = CASE 
	WHEN (a.`Mar-Act-Misc` + b.`Mar-Adj-Misc`) IS NULL
    THEN a.`Mar-Act-Misc`
    ELSE (a.`Mar-Act-Misc` + b.`Mar-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Apr-Adj`) AS `Apr-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Apr-Act-FG` = CASE 
	WHEN (a.`Apr-Act-FG` + b.`Apr-Adj-FG`) IS NULL
    THEN a.`Apr-Act-FG`
    ELSE (a.`Apr-Act-FG` + b.`Apr-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Apr-Adj`) AS `Apr-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Apr-Act-Misc` = CASE 
	WHEN (a.`Apr-Act-Misc` + b.`Apr-Adj-Misc`) IS NULL
    THEN a.`Apr-Act-Misc`
    ELSE (a.`Apr-Act-Misc` + b.`Apr-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`May-Adj`) AS `May-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`May-Act-FG` = CASE 
	WHEN (a.`May-Act-FG` + b.`May-Adj-FG`) IS NULL
    THEN a.`May-Act-FG`
    ELSE (a.`May-Act-FG` + b.`May-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`May-Adj`) AS `May-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`May-Act-Misc` = CASE 
	WHEN (a.`May-Act-Misc` + b.`May-Adj-Misc`) IS NULL
    THEN a.`May-Act-Misc`
    ELSE (a.`May-Act-Misc` + b.`May-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Jun-Adj`) AS `Jun-Adj-FG`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SO' OR `Or Ty` = 'CO'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Jun-Act-FG` = CASE 
	WHEN (a.`Jun-Act-FG` + b.`Jun-Adj-FG`) IS NULL
    THEN a.`Jun-Act-FG`
    ELSE (a.`Jun-Act-FG` + b.`Jun-Adj-FG`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, `Customer`, SUM(`Jun-Adj`) AS `Jun-Adj-Misc`
	FROM `Finance Adjustments`
	WHERE `Or Ty` = 'SF' OR `Or Ty` = 'IC' OR `Or Ty` = 'JE'
	GROUP BY `customer_id`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Jun-Act-Misc` = CASE 
	WHEN (a.`Jun-Act-Misc` + b.`Jun-Adj-Misc`) IS NULL
    THEN a.`Jun-Act-Misc`
    ELSE (a.`Jun-Act-Misc` + b.`Jun-Adj-Misc`)
    END
WHERE a.`Product Family` = 'ADJUSTMENT';

/*Commit Upload*/

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Jul-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 7 AND YEAR(`Planned Bill Date`) = 2023
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jul-Com` = b.`Jul-Com`;
UPDATE `BU`
SET `Jul-Com` = COALESCE(`Jul-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Aug-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 8 AND YEAR(`Planned Bill Date`) = 2023
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Aug-Com` = b.`Aug-Com`;
UPDATE `BU`
SET `Aug-Com` = COALESCE(`Aug-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Sep-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 9 AND YEAR(`Planned Bill Date`) = 2023
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Sep-Com` = b.`Sep-Com`;
UPDATE `BU`
SET `Sep-Com` = COALESCE(`Sep-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Oct-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 10 AND YEAR(`Planned Bill Date`) = 2023
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Oct-Com` = b.`Oct-Com`;
UPDATE `BU`
SET `Oct-Com` = COALESCE(`Oct-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Nov-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 11 AND YEAR(`Planned Bill Date`) = 2023
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Nov-Com` = b.`Nov-Com`;
UPDATE `BU`
SET `Nov-Com` = COALESCE(`Nov-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Dec-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 12 AND YEAR(`Planned Bill Date`) = 2023
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Dec-Com` = b.`Dec-Com`;
UPDATE `BU`
SET `Dec-Com` = COALESCE(`Dec-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Jan-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 1 AND YEAR(`Planned Bill Date`) = 2024
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jan-Com` = b.`Jan-Com`;
UPDATE `BU`
SET `Jan-Com` = COALESCE(`Jan-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Feb-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 2 AND YEAR(`Planned Bill Date`) = 2024
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Feb-Com` = b.`Feb-Com`;
UPDATE `BU`
SET `Feb-Com` = COALESCE(`Feb-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Mar-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 3 AND YEAR(`Planned Bill Date`) = 2024
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Mar-Com` = b.`Mar-Com`;
UPDATE `BU`
SET `Mar-Com` = COALESCE(`Mar-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Apr-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 4 AND YEAR(`Planned Bill Date`) = 2024
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Apr-Com` = b.`Apr-Com`;
UPDATE `BU`
SET `Apr-Com` = COALESCE(`Apr-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `May-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 5 AND YEAR(`Planned Bill Date`) = 2024
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`May-Com` = b.`May-Com`;
UPDATE `BU`
SET `May-Com` = COALESCE(`May-Com`, 0.00);

UPDATE `BU` AS a
JOIN (
	SELECT `Product Family`, SUM(`Current Bill Amount`) AS `Jun-Com`
    FROM `Billing Commit Report Group`
    WHERE MONTH(`Planned Bill Date`) = 6 AND YEAR(`Planned Bill Date`) = 2024
    GROUP BY `Product Family`
    ORDER BY `Product Family` ASC) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jun-Com` = b.`Jun-Com`;
UPDATE `BU`
SET `Jun-Com` = COALESCE(`Jun-Com`, 0.00);

/*Forecast Upload*/
/*
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Sep-23 FCST`*`Unit Cost`) AS `Sep-23 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Sep-24 FCST` = b.`Sep-24 FCST`;

UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Oct-23 FCST`*`Unit Cost`) AS `Oct-23 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Oct-24 FCST` = b.`Oct-24 FCST`;

UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Nov-23 FCST`*`Unit Cost`) AS `Nov-23 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Nov-24 FCST` = b.`Nov-24 FCST`;

UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Dec-23 FCST`*`Unit Cost`) AS `Dec-23 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Dec-24 FCST` = b.`Dec-24 FCST`;
*/
UPDATE `forecast_capacity`
SET `Jan-24 FCST` = REPLACE(`Jan-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Jan-24 FCST`*`Unit Cost`) AS `Jan-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jan-24 FCST` = b.`Jan-24 FCST`;
UPDATE `BU`
SET `Jan-24 FCST` = COALESCE(`Jan-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Feb-24 FCST` = REPLACE(`Feb-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Feb-24 FCST`*`Unit Cost`) AS `Feb-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Feb-24 FCST` = b.`Feb-24 FCST`;
UPDATE `BU`
SET `Feb-24 FCST` = COALESCE(`Feb-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Mar-24 FCST` = REPLACE(`Mar-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Mar-24 FCST`*`Unit Cost`) AS `Mar-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Mar-24 FCST` = b.`Mar-24 FCST`;
UPDATE `BU`
SET `Mar-24 FCST` = COALESCE(`Mar-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Apr-24 FCST` = REPLACE(`Apr-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Apr-24 FCST`*`Unit Cost`) AS `Apr-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Apr-24 FCST` = b.`Apr-24 FCST`;
UPDATE `BU`
SET `Apr-24 FCST` = COALESCE(`Apr-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `May-24 FCST` = REPLACE(`May-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`May-24 FCST`*`Unit Cost`) AS `May-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`May-24 FCST` = b.`May-24 FCST`;
UPDATE `BU`
SET `May-24 FCST` = COALESCE(`May-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Jun-24 FCST` = REPLACE(`Jun-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Jun-24 FCST`*`Unit Cost`) AS `Jun-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jun-24 FCST` = b.`Jun-24 FCST`;
UPDATE `BU`
SET `Jun-24 FCST` = COALESCE(`Jun-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Jul-24 FCST` = REPLACE(`Jul-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Jul-24 FCST`*`Unit Cost`) AS `Jul-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Jul-24 FCST` = b.`Jul-24 FCST`;
UPDATE `BU`
SET `Jul-24 FCST` = COALESCE(`Jul-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Aug-24 FCST` = REPLACE(`Aug-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Aug-24 FCST`*`Unit Cost`) AS `Aug-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Aug-24 FCST` = b.`Aug-24 FCST`;
UPDATE `BU`
SET `Aug-24 FCST` = COALESCE(`Aug-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Sep-24 FCST` = REPLACE(`Sep-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Sep-24 FCST`*`Unit Cost`) AS `Sep-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Sep-24 FCST` = b.`Sep-24 FCST`;
UPDATE `BU`
SET `Sep-24 FCST` = COALESCE(`Sep-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Oct-24 FCST` = REPLACE(`Oct-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Oct-24 FCST`*`Unit Cost`) AS `Oct-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Oct-24 FCST` = b.`Oct-24 FCST`;
UPDATE `BU`
SET `Oct-24 FCST` = COALESCE(`Oct-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Nov-24 FCST` = REPLACE(`Nov-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Nov-24 FCST`*`Unit Cost`) AS `Nov-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Nov-24 FCST` = b.`Nov-24 FCST`;
UPDATE `BU`
SET `Nov-24 FCST` = COALESCE(`Nov-24 FCST`, 0.00);

UPDATE `forecast_capacity`
SET `Dec-24 FCST` = REPLACE(`Dec-24 FCST`, ',', '');
UPDATE BU AS a
JOIN (
	SELECT `Product Family`, SUM(`Dec-24 FCST`*`Unit Cost`) AS `Dec-24 FCST`
    FROM `forecast_capacity`
    GROUP BY `Product Family`) AS b
ON a.`Product Family` = b.`Product Family`
SET a.`Dec-24 FCST` = b.`Dec-24 FCST`;
UPDATE `BU`
SET `Dec-24 FCST` = COALESCE(`Dec-24 FCST`, 0.00);

/*
UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Jul-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 7 AND YEAR(`Request Date`) = 2023
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Jul-24 FCST` = b.`Jul-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Aug-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 8 AND YEAR(`Request Date`) = 2023
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Aug-24 FCST` = b.`Aug-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Sep-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 9 AND YEAR(`Request Date`) = 2023
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Sep-24 FCST` = b.`Sep-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Oct-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 10 AND YEAR(`Request Date`) = 2023
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Oct-24 FCST` = b.`Oct-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Nov-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 11 AND YEAR(`Request Date`) = 2023
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Nov-24 FCST` = b.`Nov-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Dec-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 12 AND YEAR(`Request Date`) = 2023
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Dec-24 FCST` = b.`Dec-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Jan-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 1 AND YEAR(`Request Date`) = 2024
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Jan-24 FCST` = b.`Jan-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Feb-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 2 AND YEAR(`Request Date`) = 2024
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Feb-24 FCST` = b.`Feb-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Mar-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 3 AND YEAR(`Request Date`) = 2024
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Mar-24 FCST` = b.`Mar-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Apr-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 4 AND YEAR(`Request Date`) = 2024
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Apr-24 FCST` = b.`Apr-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `May-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 5 AND YEAR(`Request Date`) = 2024
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`May-24 FCST` = b.`May-24 FCST`;

UPDATE `BU` AS a
JOIN (
	SELECT `customer_id`, SUM(`Amount`) AS `Jun-24 FCST`
	FROM `forecast`
	WHERE MONTH(`Request Date`) = 6 AND YEAR(`Request Date`) = 2024
	GROUP BY `Customer`) AS b
ON a.`customer_id` = b.`customer_id`
SET a.`Jun-24 FCST` = b.`Jun-24 FCST`;
*/
/*Variances*/
/*
UPDATE `BU`
SET `Jul-VAR` = (`Jul-Act` - `Jul-Budget`);
UPDATE `BU`
SET `Jul-VAR` = (`Jul-Com` - `Jul-Budget`)
WHERE `Jul-Act` IS NULL;
UPDATE `BU`
SET `Jul-VAR` = (`Jul-24 FCST` - `Jul-Budget`)
WHERE `Jul-Act` IS NULL AND `Jul-Com` IS NULL;

UPDATE `BU`
SET `Aug-VAR` = (`Aug-Act` - `Aug-Budget`);
UPDATE `BU`
SET `Aug-VAR` = (`Aug-Com` - `Aug-Budget`)
WHERE `Jul-Act` IS NULL;
UPDATE `BU`
SET `Aug-VAR` = (`Aug-24 FCST` - `Aug-Budget`)
WHERE `Aug-Act` IS NULL AND `Aug-Com` IS NULL;

UPDATE `BU`
SET `Sep-VAR` = (`Sep-Act` - `Sep-Budget`);
UPDATE `BU`
SET `Sep-VAR` = (`Sep-Com` - `Sep-Budget`)
WHERE `Jul-Act` IS NULL;
UPDATE `BU`
SET `Sep-VAR` = (`Sep-24 FCST` - `Sep-Budget`)
WHERE `Sep-Act` IS NULL AND `Sep-Com` IS NULL;

UPDATE `BU`
SET `Oct-VAR` = (`Oct-Act` - `Oct-Budget`);
UPDATE `BU`
SET `Oct-VAR` = (`Oct-Com` - `Oct-Budget`)
WHERE `Jul-Act` IS NULL;
UPDATE `BU`
SET `Oct-VAR` = (`Oct-24 FCST` - `Oct-Budget`)
WHERE `Oct-Act` IS NULL AND `Oct-Com` IS NULL;

UPDATE `BU`
SET `Nov-VAR` = (`Nov-Act` - `Nov-Budget`);
UPDATE `BU`
SET `Nov-VAR` = (`Nov-Com` - `Nov-Budget`)
WHERE `Nov-Act` IS NULL;
UPDATE `BU`
SET `Nov-VAR` = (`Nov-24 FCST` - `Nov-Budget`)
WHERE `Nov-Act` IS NULL AND `Nov-Com` IS NULL;

UPDATE `BU`
SET `Dec-VAR` = (`Dec-Act` - `Dec-Budget`);
UPDATE `BU`
SET `Dec-VAR` = (`Dec-Com` - `Dec-Budget`)
WHERE `Dec-Act` IS NULL;
UPDATE `BU`
SET `Dec-VAR` = (`Dec-24 FCST` - `Dec-Budget`)
WHERE `Dec-Act` IS NULL AND `Dec-Com` IS NULL;

UPDATE `BU`
SET `Jan-VAR` = (`Jan-Act` - `Jan-Budget`);
UPDATE `BU`
SET `Jan-VAR` = (`Jan-Com` - `Jan-Budget`)
WHERE `Jul-Act` IS NULL;
UPDATE `BU`
SET `Jan-VAR` = (`Jul-24 FCST` - `Jul-Budget`)
WHERE `Jan-Act` IS NULL AND `Jan-Com` IS NULL;

UPDATE `BU`
SET `Feb-VAR` = (`Feb-Act` - `Feb-Budget`);
UPDATE `BU`
SET `Feb-VAR` = (`Feb-Com` - `Feb-Budget`)
WHERE `Feb-Act` IS NULL;
UPDATE `BU`
SET `Feb-VAR` = (`Feb-24 FCST` - `Feb-Budget`)
WHERE `Feb-Act` IS NULL AND `Feb-Com` IS NULL;

UPDATE `BU`
SET `Mar-VAR` = (`Mar-Act` - `Mar-Budget`);
UPDATE `BU`
SET `Mar-VAR` = (`Mar-Com` - `Mar-Budget`)
WHERE `Mar-Act` IS NULL;
UPDATE `BU`
SET `Mar-VAR` = (`Mar-24 FCST` - `Mar-Budget`)
WHERE `Mar-Act` IS NULL AND `Mar-Com` IS NULL;

UPDATE `BU`
SET `Apr-VAR` = (`Apr-Act` - `Apr-Budget`);
UPDATE `BU`
SET `Apr-VAR` = (`Apr-Com` - `Apr-Budget`)
WHERE `Apr-Act` IS NULL;
UPDATE `BU`
SET `Apr-VAR` = (`Apr-24 FCST` - `Apr-Budget`)
WHERE `Apr-Act` IS NULL AND `Apr-Com` IS NULL;

UPDATE `BU`
SET `May-VAR` = (`May-Act` - `May-Budget`);
UPDATE `BU`
SET `May-VAR` = (`May-Com` - `May-Budget`)
WHERE `May-Act` IS NULL;
UPDATE `BU`
SET `May-VAR` = (`May-24 FCST` - `Jul-Budget`)
WHERE `May-Act` IS NULL AND `May-Com` IS NULL;

UPDATE `BU`
SET `Jun-VAR` = (`Jun-Act` - `Jun-Budget`);
UPDATE `BU`
SET `Jun-VAR` = (`Jun-Com` - `Jun-Budget`)
WHERE `Jul-Act` IS NULL;
UPDATE `BU`
SET `Jun-VAR` = (`Jun-24 FCST` - `Jun-Budget`)
WHERE `Jun-Act` IS NULL AND `Jun-Com` IS NULL;
*/
/*Totals
Budget*/
ALTER TABLE `BU`
ADD COLUMN `QT1-Budget` DECIMAL(15,2) AFTER `Sep-24 FCST`,
ADD COLUMN `QT2-Budget` DECIMAL(15,2) AFTER `Dec-24 FCST`,
ADD COLUMN `QT3-Budget` DECIMAL(15,2) AFTER `Mar-24 FCST`,
ADD COLUMN `QT4-Budget` DECIMAL(15,2) AFTER `Jun-24 FCST`;

UPDATE `BU`
SET `QT1-Budget` = (`Jul-Budget` + `Aug-Budget` + `Sep-Budget`);

UPDATE `BU`
SET `QT2-Budget` = (`Oct-Budget` + `Nov-Budget` + `Dec-Budget`);

UPDATE `BU`
SET `QT3-Budget` = (`Jan-Budget` + `Feb-Budget` + `Mar-Budget`);

UPDATE `BU`
SET `QT4-Budget` = (`Apr-Budget` + `May-Budget` + `Jun-Budget`);

/*Actuals*/
ALTER TABLE `BU`
ADD COLUMN `QT1-Act-FG` DECIMAL(15,2) AFTER `QT1-Budget`,
ADD COLUMN `QT2-Act-FG` DECIMAL(15,2) AFTER `QT2-Budget`,
ADD COLUMN `QT3-Act-FG` DECIMAL(15,2) AFTER `QT3-Budget`,
ADD COLUMN `QT4-Act-FG` DECIMAL(15,2) AFTER `QT4-Budget`;

UPDATE `BU`
SET `QT1-Act-FG` = (`Jul-Act-FG` + `Aug-Act-FG` + `Sep-Act-FG`);

UPDATE `BU`
SET `QT2-Act-FG` = (`Oct-Act-FG` + `Nov-Act-FG` + `Dec-Act-FG`);

UPDATE `BU`
SET `QT3-Act-FG` = (`Jan-Act-FG` + `Feb-Act-FG` + `Mar-Act-FG`);

UPDATE `BU`
SET `QT4-Act-FG` = (`Apr-Act-FG` + `May-Act-FG` + `Jun-Act-FG`);

ALTER TABLE `BU`
ADD COLUMN `QT1-Act-Misc` DECIMAL(15,2) AFTER `QT1-Act-FG`,
ADD COLUMN `QT2-Act-Misc` DECIMAL(15,2) AFTER `QT2-Act-FG`,
ADD COLUMN `QT3-Act-Misc` DECIMAL(15,2) AFTER `QT3-Act-FG`,
ADD COLUMN `QT4-Act-Misc` DECIMAL(15,2) AFTER `QT4-Act-FG`;

UPDATE `BU`
SET `QT1-Act-Misc` = (`Jul-Act-Misc` + `Aug-Act-Misc` + `Sep-Act-Misc`);

UPDATE `BU`
SET `QT2-Act-Misc` = (`Oct-Act-Misc` + `Nov-Act-Misc` + `Dec-Act-Misc`);

UPDATE `BU`
SET `QT3-Act-Misc` = (`Jan-Act-Misc` + `Feb-Act-Misc` + `Mar-Act-Misc`);

UPDATE `BU`
SET `QT4-Act-Misc` = (`Apr-Act-Misc` + `May-Act-Misc` + `Jun-Act-Misc`);

/*Commitments*/
ALTER TABLE `BU`
ADD COLUMN `QT1-Com` DECIMAL(15,2) AFTER `QT1-Act-Misc`,
ADD COLUMN `QT2-Com` DECIMAL(15,2) AFTER `QT2-Act-Misc`,
ADD COLUMN `QT3-Com` DECIMAL(15,2) AFTER `QT3-Act-Misc`,
ADD COLUMN `QT4-Com` DECIMAL(15,2) AFTER `QT4-Act-Misc`;

UPDATE `BU`
SET `QT1-Com` = (`Jul-Com` + `Aug-Com` + `Sep-Com`);

UPDATE `BU`
SET `QT2-Com` = (`Oct-Com` + `Nov-Com` + `Dec-Com`);

UPDATE `BU`
SET `QT3-Com` = (`Jan-Com` + `Feb-Com` + `Mar-Com`);

UPDATE `BU`
SET `QT4-Com` = (`Apr-Com` + `May-Com` + `Jun-Com`);

/*Forecasts*/
ALTER TABLE `BU`
ADD COLUMN `QT1-24 FCST` DECIMAL(15,2) AFTER `QT1-Com`,
ADD COLUMN `QT2-24 FCST` DECIMAL(15,2) AFTER `QT2-Com`,
ADD COLUMN `QT3-24 FCST` DECIMAL(15,2) AFTER `QT3-Com`,
ADD COLUMN `QT4-24 FCST` DECIMAL(15,2) AFTER `QT4-Com`;

UPDATE `BU`
SET `QT1-24 FCST` = (`Jul-24 FCST` + `Aug-24 FCST` + `Sep-24 FCST`);

UPDATE `BU`
SET `QT2-24 FCST` = (`Oct-24 FCST` + `Nov-24 FCST` + `Dec-24 FCST`);

UPDATE `BU`
SET `QT3-24 FCST` = (`Jan-24 FCST` + `Feb-24 FCST` + `Mar-24 FCST`);

UPDATE `BU`
SET `QT4-24 FCST` = (`Apr-24 FCST` + `May-24 FCST` + `Jun-24 FCST`);

/*Variances*/
ALTER TABLE `BU`
ADD COLUMN `QT1-VAR-Act-FCST` DECIMAL(15,2) AFTER `QT1-24 FCST`,
ADD COLUMN `QT1-VAR-Act-Budget` DECIMAL(15,2) AFTER `QT1-VAR-Act-FCST`,
ADD COLUMN `QT1-VAR-Act-Com` DECIMAL(15,2) AFTER `QT1-VAR-Act-Budget`,
ADD COLUMN `QT1-VAR-Com-FCST` DECIMAL(15,2) AFTER `QT1-VAR-Act-Com`,
ADD COLUMN `QT1-VAR-Act-FG-Prior QT` DECIMAL(15,2) AFTER `QT1-VAR-Com-FCST`,
ADD COLUMN `QT1-Act-Bud Comments` VARCHAR(100) AFTER `QT1-VAR-Act-FG-Prior QT`,
ADD COLUMN `QT1-Act-FCST Comments` VARCHAR(100) AFTER `QT1-Act-Bud Comments`,
ADD COLUMN `QT1-Act-FG-Prior QT Comments` VARCHAR(100) AFTER `QT1-Act-FCST Comments`,
ADD COLUMN `QT1-Act-Misc-Prior QT Comments` VARCHAR(100) AFTER `QT1-Act-FG-Prior QT Comments`;

ALTER TABLE `BU`
ADD COLUMN `QT2-VAR-Act-FCST` DECIMAL(15,2) AFTER `QT2-24 FCST`,
ADD COLUMN `QT2-VAR-Act-Budget` DECIMAL(15,2) AFTER `QT2-VAR-Act-FCST`,
ADD COLUMN `QT2-VAR-Act-Com` DECIMAL(15,2) AFTER `QT2-VAR-Act-Budget`,
ADD COLUMN `QT2-VAR-Com-FCST` DECIMAL(15,2) AFTER `QT2-VAR-Act-Com`,
ADD COLUMN `QT2-VAR-Act-FG-Prior QT` DECIMAL(15,2) AFTER `QT2-VAR-Com-FCST`,
ADD COLUMN `QT2-Act-Bud Comments` VARCHAR(100) AFTER `QT2-VAR-Act-FG-Prior QT`,
ADD COLUMN `QT2-Act-FCST Comments` VARCHAR(100) AFTER `QT2-Act-Bud Comments`,
ADD COLUMN `QT2-Act-FG-Prior QT Comments` VARCHAR(100) AFTER `QT2-Act-FCST Comments`,
ADD COLUMN `QT2-Act-Misc-Prior QT Comments` VARCHAR(100) AFTER `QT2-Act-FG-Prior QT Comments`;

ALTER TABLE `BU`
ADD COLUMN `QT3-VAR-Act-FCST` DECIMAL(15,2) AFTER `QT3-24 FCST`,
ADD COLUMN `QT3-VAR-Act-Budget` DECIMAL(15,2) AFTER `QT3-VAR-Act-FCST`,
ADD COLUMN `QT3-VAR-Act-Com` DECIMAL(15,2) AFTER `QT3-VAR-Act-Budget`,
ADD COLUMN `QT3-VAR-Com-FCST` DECIMAL(15,2) AFTER `QT3-VAR-Act-Com`,
ADD COLUMN `QT3-VAR-Act-FG-Prior QT` DECIMAL(15,2) AFTER `QT3-VAR-Com-FCST`,
ADD COLUMN `QT3-Act-Bud Comments` VARCHAR(100) AFTER `QT3-VAR-Act-FG-Prior QT`,
ADD COLUMN `QT3-Act-FCST Comments` VARCHAR(100) AFTER `QT3-Act-Bud Comments`,
ADD COLUMN `QT3-Act-FG-Prior QT Comments` VARCHAR(100) AFTER `QT3-Act-FCST Comments`,
ADD COLUMN `QT3-Act-Misc-Prior QT Comments` VARCHAR(100) AFTER `QT3-Act-FG-Prior QT Comments`;

ALTER TABLE `BU`
ADD COLUMN `QT4-VAR-Act-FCST` DECIMAL(15,2) AFTER `QT4-24 FCST`,
ADD COLUMN `QT4-VAR-Act-Budget` DECIMAL(15,2) AFTER `QT4-VAR-Act-FCST`,
ADD COLUMN `QT4-VAR-Act-Com` DECIMAL(15,2) AFTER `QT4-VAR-Act-Budget`,
ADD COLUMN `QT4-VAR-Com-FCST` DECIMAL(15,2) AFTER `QT4-VAR-Act-Com`,
ADD COLUMN `QT4-VAR-Act-FG-Prior QT` DECIMAL(15,2) AFTER `QT4-VAR-Com-FCST`,
ADD COLUMN `QT4-Act-Bud Comments` VARCHAR(100) AFTER `QT4-VAR-Act-FG-Prior QT`,
ADD COLUMN `QT4-Act-FCST Comments` VARCHAR(100) AFTER `QT4-Act-Bud Comments`,
ADD COLUMN `QT4-Act-FG-Prior QT Comments` VARCHAR(100) AFTER `QT4-Act-FCST Comments`,
ADD COLUMN `QT4-Act-Misc-Prior QT Comments` VARCHAR(100) AFTER `QT4-Act-FG-Prior QT Comments`;

ALTER TABLE `BU`
ADD COLUMN `QT1-VAR-Act-Misc-Prior QT` DECIMAL(15,2) AFTER `QT1-VAR-Act-FG-Prior QT`,
ADD COLUMN `QT2-VAR-Act-Misc-Prior QT` DECIMAL(15,2) AFTER `QT2-VAR-Act-FG-Prior QT`,
ADD COLUMN `QT3-VAR-Act-Misc-Prior QT` DECIMAL(15,2) AFTER `QT3-VAR-Act-FG-Prior QT`,
ADD COLUMN `QT4-VAR-Act-Misc-Prior QT` DECIMAL(15,2) AFTER `QT4-VAR-Act-FG-Prior QT`;

UPDATE `BU`
SET `QT1-VAR-Act-FCST` = ((`QT1-Act-FG` + `QT1-Act-Misc`) - `QT1-24 FCST`);
UPDATE `BU`
SET `QT1-VAR-Act-Budget` = ((`QT1-Act-FG` + `QT1-Act-Misc`) - `QT1-Budget`);
UPDATE `BU`
SET `QT1-VAR-Act-Com` = ((`QT1-Act-FG` + `QT1-Act-Misc`) - `QT1-Com`);
UPDATE `BU`
SET `QT1-VAR-Com-FCST` = (`QT1-Com` - `QT1-24 FCST`);
UPDATE `BU`
SET `QT1-VAR-Act-FG-Prior QT` = 0;
UPDATE `BU`
SET `QT1-VAR-Act-Misc-Prior QT` = 0;

UPDATE `BU`
SET `QT2-VAR-Act-FCST` = ((`QT2-Act-FG` + `QT2-Act-Misc`) - `QT2-24 FCST`);
UPDATE `BU`
SET `QT2-VAR-Act-Budget` = ((`QT2-Act-FG` + `QT2-Act-Misc`) - `QT2-Budget`);
UPDATE `BU`
SET `QT2-VAR-Act-Com` = ((`QT2-Act-FG` + `QT2-Act-Misc`) - `QT2-Com`);
UPDATE `BU`
SET `QT2-VAR-Com-FCST` = (`QT2-Com` - `QT2-24 FCST`);
UPDATE `BU`
SET `QT2-VAR-Act-FG-Prior QT` = (`QT2-Act-FG` - `QT1-Act-FG`);
UPDATE `BU`
SET `QT2-VAR-Act-Misc-Prior QT` = (`QT2-Act-FG` - `QT1-Act-FG`);

UPDATE `BU`
SET `QT3-VAR-Act-FCST` = ((`QT3-Act-FG` + `QT3-Act-Misc`) - `QT3-24 FCST`);
UPDATE `BU`
SET `QT3-VAR-Act-Budget` = ((`QT3-Act-FG` + `QT3-Act-Misc`) - `QT3-Budget`);
UPDATE `BU`
SET `QT3-VAR-Act-Com` = ((`QT3-Act-FG` + `QT3-Act-Misc`) - `QT3-Com`);
UPDATE `BU`
SET `QT3-VAR-Com-FCST` = (`QT3-Com` - `QT3-24 FCST`);
UPDATE `BU`
SET `QT3-VAR-Act-FG-Prior QT` = (`QT3-Act-FG` - `QT2-Act-FG`);
UPDATE `BU`
SET `QT3-VAR-Act-Misc-Prior QT` = (`QT3-Act-FG` - `QT2-Act-FG`);

UPDATE `BU`
SET `QT4-VAR-Act-FCST` = ((`QT4-Act-FG` + `QT4-Act-Misc`) - `QT4-24 FCST`);
UPDATE `BU`
SET `QT4-VAR-Act-Budget` = ((`QT4-Act-FG` + `QT4-Act-Misc`) - `QT4-Budget`);
UPDATE `BU`
SET `QT4-VAR-Act-Com` = ((`QT4-Act-FG` + `QT4-Act-Misc`) - `QT4-Com`);
UPDATE `BU`
SET `QT4-VAR-Com-FCST` = (`QT4-Com` - `QT4-24 FCST`);
UPDATE `BU`
SET `QT4-VAR-Act-FG-Prior QT` = (`QT4-Act-FG` - `QT3-Act-FG`);
UPDATE `BU`
SET `QT4-VAR-Act-Misc-Prior QT` = (`QT4-Act-FG` - `QT3-Act-FG`);
/*
UPDATE `BU`
SET `QT2-VAR` = (`Oct-VAR` + `Nov-VAR` + `Dec-VAR`);

UPDATE `BU`
SET `QT3-VAR` = (`Jan-VAR` + `Feb-VAR` + `Mar-VAR`);

UPDATE `BU`
SET `QT4-VAR` = (`Apr-VAR` + `May-VAR` + `Jun-VAR`);*/

ALTER TABLE `BU`
ADD COLUMN `Jul-VAR-Act-FCST` DECIMAL(15,2) AFTER `Jul-24 FCST`,
ADD COLUMN `Jul-VAR-Act-Budget` DECIMAL(15,2) AFTER `Jul-VAR-Act-FCST`,
ADD COLUMN `Jul-VAR-Act-Com` DECIMAL(15,2) AFTER `Jul-VAR-Act-Budget`,
ADD COLUMN `Jul-VAR-Com-FCST` DECIMAL(15,2) AFTER `Jul-VAR-Act-Com`,
ADD COLUMN `Jul-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Jul-VAR-Com-FCST`,
ADD COLUMN `Jul-Act-Bud Comments` VARCHAR(100) AFTER `Jul-VAR-Act-FG-Prior Month`,
ADD COLUMN `Jul-Act-FCST Comments` VARCHAR(100) AFTER `Jul-Act-Bud Comments`,
ADD COLUMN `Jul-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Jul-Act-FCST Comments`,
ADD COLUMN `Jul-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Jul-Act-FG-Prior Month Comments`,
ADD COLUMN `Jul-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Jul-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Jul-VAR-Act-FCST` = ((`Jul-Act-FG` + `Jul-Act-Misc`) - `Jul-24 FCST`);
UPDATE `BU`
SET `Jul-VAR-Act-Budget` = ((`Jul-Act-FG` + `Jul-Act-Misc`) - `Jul-Budget`);
UPDATE `BU`
SET `Jul-VAR-Act-Com` = ((`Jul-Act-FG` + `Jul-Act-Misc`) - `Jul-Com`);
UPDATE `BU`
SET `Jul-VAR-Com-FCST` = (`Jul-Com` - `Jul-24 FCST`);
UPDATE `BU`
SET `Jul-VAR-Act-FG-Prior Month` = '';
UPDATE `BU`
SET `Jul-VAR-Act-Misc-Prior Month` = '';

ALTER TABLE `BU`
ADD COLUMN `Aug-VAR-Act-FCST` DECIMAL(15,2) AFTER `Aug-24 FCST`,
ADD COLUMN `Aug-VAR-Act-Budget` DECIMAL(15,2) AFTER `Aug-VAR-Act-FCST`,
ADD COLUMN `Aug-VAR-Act-Com` DECIMAL(15,2) AFTER `Aug-VAR-Act-Budget`,
ADD COLUMN `Aug-VAR-Com-FCST` DECIMAL(15,2) AFTER `Aug-VAR-Act-Com`,
ADD COLUMN `Aug-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Aug-VAR-Com-FCST`,
ADD COLUMN `Aug-Act-Bud Comments` VARCHAR(100) AFTER `Aug-VAR-Act-FG-Prior Month`,
ADD COLUMN `Aug-Act-FCST Comments` VARCHAR(100) AFTER `Aug-Act-Bud Comments`,
ADD COLUMN `Aug-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Aug-Act-FCST Comments`,
ADD COLUMN `Aug-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Aug-Act-FG-Prior Month Comments`,
ADD COLUMN `Aug-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Aug-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Aug-VAR-Act-FCST` = ((`Aug-Act-FG` + `Aug-Act-Misc`) - `Aug-24 FCST`);
UPDATE `BU`
SET `Aug-VAR-Act-Budget` = ((`Aug-Act-FG` + `Aug-Act-Misc`) - `Aug-Budget`);
UPDATE `BU`
SET `Aug-VAR-Act-Com` = ((`Aug-Act-FG` + `Aug-Act-Misc`) - `Aug-Com`);
UPDATE `BU`
SET `Aug-VAR-Com-FCST` = (`Aug-Com` - `Aug-24 FCST`);
UPDATE `BU`
SET `Aug-VAR-Act-FG-Prior Month` = (`Aug-Act-FG` - `Jul-Act-FG`);
UPDATE `BU`
SET `Aug-VAR-Act-Misc-Prior Month` = (`Aug-Act-Misc` - `Jul-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `Sep-VAR-Act-FCST` DECIMAL(15,2) AFTER `Sep-24 FCST`,
ADD COLUMN `Sep-VAR-Act-Budget` DECIMAL(15,2) AFTER `Sep-VAR-Act-FCST`,
ADD COLUMN `Sep-VAR-Act-Com` DECIMAL(15,2) AFTER `Sep-VAR-Act-Budget`,
ADD COLUMN `Sep-VAR-Com-FCST` DECIMAL(15,2) AFTER `Sep-VAR-Act-Com`,
ADD COLUMN `Sep-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Sep-VAR-Com-FCST`,
ADD COLUMN `Sep-Act-Bud Comments` VARCHAR(100) AFTER `Sep-VAR-Act-FG-Prior Month`,
ADD COLUMN `Sep-Act-FCST Comments` VARCHAR(100) AFTER `Sep-Act-Bud Comments`,
ADD COLUMN `Sep-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Sep-Act-FCST Comments`,
ADD COLUMN `Sep-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Sep-Act-FG-Prior Month Comments`,
ADD COLUMN `Sep-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Sep-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Sep-VAR-Act-FCST` = ((`Sep-Act-FG` + `Sep-Act-Misc`) - `Sep-24 FCST`);
UPDATE `BU`
SET `Sep-VAR-Act-Budget` = ((`Sep-Act-FG` + `Sep-Act-Misc`) - `Sep-Budget`);
UPDATE `BU`
SET `Sep-VAR-Act-Com` = ((`Sep-Act-FG` + `Sep-Act-Misc`) - `Sep-Com`);
UPDATE `BU`
SET `Sep-VAR-Com-FCST` = (`Sep-Com` - `Sep-24 FCST`);
UPDATE `BU`
SET `Sep-VAR-Act-FG-Prior Month` = (`Sep-Act-FG` - `Aug-Act-FG`);
UPDATE `BU`
SET `Sep-VAR-Act-Misc-Prior Month` = (`Sep-Act-Misc` - `Aug-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `Oct-VAR-Act-FCST` DECIMAL(15,2) AFTER `Oct-24 FCST`,
ADD COLUMN `Oct-VAR-Act-Budget` DECIMAL(15,2) AFTER `Oct-VAR-Act-FCST`,
ADD COLUMN `Oct-VAR-Act-Com` DECIMAL(15,2) AFTER `Oct-VAR-Act-Budget`,
ADD COLUMN `Oct-VAR-Com-FCST` DECIMAL(15,2) AFTER `Oct-VAR-Act-Com`,
ADD COLUMN `Oct-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Oct-VAR-Com-FCST`,
ADD COLUMN `Oct-Act-Bud Comments` VARCHAR(100) AFTER `Oct-VAR-Act-FG-Prior Month`,
ADD COLUMN `Oct-Act-FCST Comments` VARCHAR(100) AFTER `Oct-Act-Bud Comments`,
ADD COLUMN `Oct-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Oct-Act-FCST Comments`,
ADD COLUMN `Oct-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Oct-Act-FG-Prior Month Comments`,
ADD COLUMN `Oct-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Oct-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Oct-VAR-Act-FCST` = ((`Oct-Act-FG` + `Oct-Act-Misc`) - `Oct-24 FCST`);
UPDATE `BU`
SET `Oct-VAR-Act-Budget` = ((`Oct-Act-FG` + `Oct-Act-Misc`) - `Oct-Budget`);
UPDATE `BU`
SET `Oct-VAR-Act-Com` = ((`Oct-Act-FG` + `Oct-Act-Misc`) - `Oct-Com`);
UPDATE `BU`
SET `Oct-VAR-Com-FCST` = (`Oct-Com` - `Oct-24 FCST`);
UPDATE `BU`
SET `Oct-VAR-Act-FG-Prior Month` = (`Oct-Act-FG` - `Sep-Act-FG`);
UPDATE `BU`
SET `Oct-VAR-Act-Misc-Prior Month` = (`Oct-Act-Misc` - `Sep-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `Nov-VAR-Act-FCST` DECIMAL(15,2) AFTER `Nov-24 FCST`,
ADD COLUMN `Nov-VAR-Act-Budget` DECIMAL(15,2) AFTER `Nov-VAR-Act-FCST`,
ADD COLUMN `Nov-VAR-Act-Com` DECIMAL(15,2) AFTER `Nov-VAR-Act-Budget`,
ADD COLUMN `Nov-VAR-Com-FCST` DECIMAL(15,2) AFTER `Nov-VAR-Act-Com`,
ADD COLUMN `Nov-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Nov-VAR-Com-FCST`,
ADD COLUMN `Nov-Act-Bud Comments` VARCHAR(100) AFTER `Nov-VAR-Act-FG-Prior Month`,
ADD COLUMN `Nov-Act-FCST Comments` VARCHAR(100) AFTER `Nov-Act-Bud Comments`,
ADD COLUMN `Nov-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Nov-Act-FCST Comments`,
ADD COLUMN `Nov-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Nov-Act-FG-Prior Month Comments`,
ADD COLUMN `Nov-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Nov-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Nov-VAR-Act-FCST` = ((`Nov-Act-FG` + `Nov-Act-Misc`) - `Nov-24 FCST`);
UPDATE `BU`
SET `Nov-VAR-Act-Budget` = ((`Nov-Act-FG` + `Nov-Act-Misc`) - `Nov-Budget`);
UPDATE `BU`
SET `Nov-VAR-Act-Com` = ((`Nov-Act-FG` + `Nov-Act-Misc`) - `Nov-Com`);
UPDATE `BU`
SET `Nov-VAR-Com-FCST` = (`Nov-Com` - `Nov-24 FCST`);
UPDATE `BU`
SET `Nov-VAR-Act-FG-Prior Month` = (`Nov-Act-FG` - `Oct-Act-FG`);
UPDATE `BU`
SET `Nov-VAR-Act-Misc-Prior Month` = (`Nov-Act-Misc` - `Oct-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `Dec-VAR-Act-FCST` DECIMAL(15,2) AFTER `Dec-24 FCST`,
ADD COLUMN `Dec-VAR-Act-Budget` DECIMAL(15,2) AFTER `Dec-VAR-Act-FCST`,
ADD COLUMN `Dec-VAR-Act-Com` DECIMAL(15,2) AFTER `Dec-VAR-Act-Budget`,
ADD COLUMN `Dec-VAR-Com-FCST` DECIMAL(15,2) AFTER `Dec-VAR-Act-Com`,
ADD COLUMN `Dec-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Dec-VAR-Com-FCST`,
ADD COLUMN `Dec-Act-Bud Comments` VARCHAR(100) AFTER `Dec-VAR-Act-FG-Prior Month`,
ADD COLUMN `Dec-Act-FCST Comments` VARCHAR(100) AFTER `Dec-Act-Bud Comments`,
ADD COLUMN `Dec-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Dec-Act-FCST Comments`,
ADD COLUMN `Dec-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Dec-Act-FG-Prior Month Comments`,
ADD COLUMN `Dec-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Dec-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Dec-VAR-Act-FCST` = ((`Dec-Act-FG` + `Dec-Act-Misc`) - `Dec-24 FCST`);
UPDATE `BU`
SET `Dec-VAR-Act-Budget` = ((`Dec-Act-FG` + `Dec-Act-Misc`) - `Dec-Budget`);
UPDATE `BU`
SET `Dec-VAR-Act-Com` = ((`Dec-Act-FG` + `Dec-Act-Misc`) - `Dec-Com`);
UPDATE `BU`
SET `Dec-VAR-Com-FCST` = (`Dec-Com` - `Dec-24 FCST`);
UPDATE `BU`
SET `Dec-VAR-Act-FG-Prior Month` = (`Dec-Act-FG` - `Nov-Act-FG`);
UPDATE `BU`
SET `Dec-VAR-Act-Misc-Prior Month` = (`Dec-Act-Misc` - `Nov-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `Jan-VAR-Act-FCST` DECIMAL(15,2) AFTER `Jan-24 FCST`,
ADD COLUMN `Jan-VAR-Act-Budget` DECIMAL(15,2) AFTER `Jan-VAR-Act-FCST`,
ADD COLUMN `Jan-VAR-Act-Com` DECIMAL(15,2) AFTER `Jan-VAR-Act-Budget`,
ADD COLUMN `Jan-VAR-Com-FCST` DECIMAL(15,2) AFTER `Jan-VAR-Act-Com`,
ADD COLUMN `Jan-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Jan-VAR-Com-FCST`,
ADD COLUMN `Jan-Act-Bud Comments` VARCHAR(100) AFTER `Jan-VAR-Act-FG-Prior Month`,
ADD COLUMN `Jan-Act-FCST Comments` VARCHAR(100) AFTER `Jan-Act-Bud Comments`,
ADD COLUMN `Jan-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Jan-Act-FCST Comments`,
ADD COLUMN `Jan-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Jan-Act-FG-Prior Month Comments`,
ADD COLUMN `Jan-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Jan-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Jan-VAR-Act-FCST` = ((`Jan-Act-FG` + `Jan-Act-Misc`) - `Jan-24 FCST`);
UPDATE `BU`
SET `Jan-VAR-Act-Budget` = ((`Jan-Act-FG` + `Jan-Act-Misc`) - `Jan-Budget`);
UPDATE `BU`
SET `Jan-VAR-Act-Com` = ((`Jan-Act-FG` + `Jan-Act-Misc`) - `Jan-Com`);
UPDATE `BU`
SET `Jan-VAR-Com-FCST` = (`Jan-Com` - `Jan-24 FCST`);
UPDATE `BU`
SET `Jan-VAR-Act-FG-Prior Month` = (`Jan-Act-FG` - `Dec-Act-FG`);
UPDATE `BU`
SET `Jan-VAR-Act-Misc-Prior Month` = (`Jan-Act-Misc` - `Dec-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `Feb-VAR-Act-FCST` DECIMAL(15,2) AFTER `Feb-24 FCST`,
ADD COLUMN `Feb-VAR-Act-Budget` DECIMAL(15,2) AFTER `Feb-VAR-Act-FCST`,
ADD COLUMN `Feb-VAR-Act-Com` DECIMAL(15,2) AFTER `Feb-VAR-Act-Budget`,
ADD COLUMN `Feb-VAR-Com-FCST` DECIMAL(15,2) AFTER `Feb-VAR-Act-Com`,
ADD COLUMN `Feb-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Feb-VAR-Com-FCST`,
ADD COLUMN `Feb-Act-Bud Comments` VARCHAR(100) AFTER `Feb-VAR-Act-FG-Prior Month`,
ADD COLUMN `Feb-Act-FCST Comments` VARCHAR(100) AFTER `Feb-Act-Bud Comments`,
ADD COLUMN `Feb-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Feb-Act-FCST Comments`,
ADD COLUMN `Feb-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Feb-Act-FG-Prior Month Comments`,
ADD COLUMN `Feb-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Feb-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Feb-VAR-Act-FCST` = ((`Feb-Act-FG` + `Feb-Act-Misc`) - `Feb-24 FCST`);
UPDATE `BU`
SET `Feb-VAR-Act-Budget` = ((`Feb-Act-FG` + `Feb-Act-Misc`) - `Feb-Budget`);
UPDATE `BU`
SET `Feb-VAR-Act-Com` = ((`Feb-Act-FG` + `Feb-Act-Misc`) - `Feb-Com`);
UPDATE `BU`
SET `Feb-VAR-Com-FCST` = (`Feb-Com` - `Feb-24 FCST`);
UPDATE `BU`
SET `Feb-VAR-Act-FG-Prior Month` = (`Feb-Act-FG` - `Jan-Act-FG`);
UPDATE `BU`
SET `Feb-VAR-Act-Misc-Prior Month` = (`Feb-Act-Misc` - `Jan-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `Mar-VAR-Act-FCST` DECIMAL(15,2) AFTER `Mar-24 FCST`,
ADD COLUMN `Mar-VAR-Act-Budget` DECIMAL(15,2) AFTER `Mar-VAR-Act-FCST`,
ADD COLUMN `Mar-VAR-Act-Com` DECIMAL(15,2) AFTER `Mar-VAR-Act-Budget`,
ADD COLUMN `Mar-VAR-Com-FCST` DECIMAL(15,2) AFTER `Mar-VAR-Act-Com`,
ADD COLUMN `Mar-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Mar-VAR-Com-FCST`,
ADD COLUMN `Mar-Act-Bud Comments` VARCHAR(100) AFTER `Mar-VAR-Act-FG-Prior Month`,
ADD COLUMN `Mar-Act-FCST Comments` VARCHAR(100) AFTER `Mar-Act-Bud Comments`,
ADD COLUMN `Mar-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Mar-Act-FCST Comments`,
ADD COLUMN `Mar-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Mar-Act-FG-Prior Month Comments`,
ADD COLUMN `Mar-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Mar-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Mar-VAR-Act-FCST` = ((`Mar-Act-FG` + `Mar-Act-Misc`) - `Mar-24 FCST`);
UPDATE `BU`
SET `Mar-VAR-Act-Budget` = ((`Mar-Act-FG` + `Mar-Act-Misc`) - `Mar-Budget`);
UPDATE `BU`
SET `Mar-VAR-Act-Com` = ((`Mar-Act-FG` + `Mar-Act-Misc`) - `Mar-Com`);
UPDATE `BU`
SET `Mar-VAR-Com-FCST` = (`Mar-Com` - `Mar-24 FCST`);
UPDATE `BU`
SET `Mar-VAR-Act-FG-Prior Month` = (`Mar-Act-FG` - `Feb-Act-FG`);
UPDATE `BU`
SET `Mar-VAR-Act-Misc-Prior Month` = (`Mar-Act-Misc` - `Feb-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `Apr-VAR-Act-FCST` DECIMAL(15,2) AFTER `Apr-24 FCST`,
ADD COLUMN `Apr-VAR-Act-Budget` DECIMAL(15,2) AFTER `Apr-VAR-Act-FCST`,
ADD COLUMN `Apr-VAR-Act-Com` DECIMAL(15,2) AFTER `Apr-VAR-Act-Budget`,
ADD COLUMN `Apr-VAR-Com-FCST` DECIMAL(15,2) AFTER `Apr-VAR-Act-Com`,
ADD COLUMN `Apr-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Apr-VAR-Com-FCST`,
ADD COLUMN `Apr-Act-Bud Comments` VARCHAR(100) AFTER `Apr-VAR-Act-FG-Prior Month`,
ADD COLUMN `Apr-Act-FCST Comments` VARCHAR(100) AFTER `Apr-Act-Bud Comments`,
ADD COLUMN `Apr-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Apr-Act-FCST Comments`,
ADD COLUMN `Apr-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Apr-Act-FG-Prior Month Comments`,
ADD COLUMN `Apr-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Apr-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Apr-VAR-Act-FCST` = ((`Apr-Act-FG` + `Apr-Act-Misc`) - `Apr-24 FCST`);
UPDATE `BU`
SET `Apr-VAR-Act-Budget` = ((`Apr-Act-FG` + `Apr-Act-Misc`) - `Apr-Budget`);
UPDATE `BU`
SET `Apr-VAR-Act-Com` = ((`Apr-Act-FG` + `Apr-Act-Misc`) - `Apr-Com`);
UPDATE `BU`
SET `Apr-VAR-Com-FCST` = (`Apr-Com` - `Apr-24 FCST`);
UPDATE `BU`
SET `Apr-VAR-Act-FG-Prior Month` = (`Apr-Act-FG` - `Mar-Act-FG`);
UPDATE `BU`
SET `Apr-VAR-Act-Misc-Prior Month` = (`Apr-Act-Misc` - `Mar-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `May-VAR-Act-FCST` DECIMAL(15,2) AFTER `May-24 FCST`,
ADD COLUMN `May-VAR-Act-Budget` DECIMAL(15,2) AFTER `May-VAR-Act-FCST`,
ADD COLUMN `May-VAR-Act-Com` DECIMAL(15,2) AFTER `May-VAR-Act-Budget`,
ADD COLUMN `May-VAR-Com-FCST` DECIMAL(15,2) AFTER `May-VAR-Act-Com`,
ADD COLUMN `May-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `May-VAR-Com-FCST`,
ADD COLUMN `May-Act-Bud Comments` VARCHAR(100) AFTER `May-VAR-Act-FG-Prior Month`,
ADD COLUMN `May-Act-FCST Comments` VARCHAR(100) AFTER `May-Act-Bud Comments`,
ADD COLUMN `May-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `May-Act-FCST Comments`,
ADD COLUMN `May-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `May-Act-FG-Prior Month Comments`,
ADD COLUMN `May-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `May-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `May-VAR-Act-FCST` = ((`May-Act-FG` + `May-Act-Misc`) - `May-24 FCST`);
UPDATE `BU`
SET `May-VAR-Act-Budget` = ((`May-Act-FG` + `May-Act-Misc`) - `May-Budget`);
UPDATE `BU`
SET `May-VAR-Act-Com` = ((`May-Act-FG` + `May-Act-Misc`) - `May-Com`);
UPDATE `BU`
SET `May-VAR-Com-FCST` = (`May-Com` - `May-24 FCST`);
UPDATE `BU`
SET `May-VAR-Act-FG-Prior Month` = (`May-Act-FG` - `Apr-Act-FG`);
UPDATE `BU`
SET `May-VAR-Act-Misc-Prior Month` = (`May-Act-Misc` - `Apr-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `Jun-VAR-Act-FCST` DECIMAL(15,2) AFTER `Jun-24 FCST`,
ADD COLUMN `Jun-VAR-Act-Budget` DECIMAL(15,2) AFTER `Jun-VAR-Act-FCST`,
ADD COLUMN `Jun-VAR-Act-Com` DECIMAL(15,2) AFTER `Jun-VAR-Act-Budget`,
ADD COLUMN `Jun-VAR-Com-FCST` DECIMAL(15,2) AFTER `Jun-VAR-Act-Com`,
ADD COLUMN `Jun-VAR-Act-FG-Prior Month` DECIMAL(15,2) AFTER `Jun-VAR-Com-FCST`,
ADD COLUMN `Jun-Act-Bud Comments` VARCHAR(100) AFTER `Jun-VAR-Act-FG-Prior Month`,
ADD COLUMN `Jun-Act-FCST Comments` VARCHAR(100) AFTER `Jun-Act-Bud Comments`,
ADD COLUMN `Jun-Act-FG-Prior Month Comments` VARCHAR(100) AFTER `Jun-Act-FCST Comments`,
ADD COLUMN `Jun-Act-Misc-Prior Month Comments` VARCHAR(100) AFTER `Jun-Act-FG-Prior Month Comments`,
ADD COLUMN `Jun-VAR-Act-Misc-Prior Month` DECIMAL(15,2) AFTER `Jun-VAR-Act-FG-Prior Month`;

UPDATE `BU`
SET `Jun-VAR-Act-FCST` = ((`Jun-Act-FG` + `Jun-Act-Misc`) - `Jun-24 FCST`);
UPDATE `BU`
SET `Jun-VAR-Act-Budget` = ((`Jun-Act-FG` + `Jun-Act-Misc`) - `Jun-Budget`);
UPDATE `BU`
SET `Jun-VAR-Act-Com` = ((`Jun-Act-FG` + `Jun-Act-Misc`) - `Jun-Com`);
UPDATE `BU`
SET `Jun-VAR-Com-FCST` = (`Jun-Com` - `Jun-24 FCST`);
UPDATE `BU`
SET `Jun-VAR-Act-FG-Prior Month` = (`Jun-Act-FG` - `May-Act-FG`);
UPDATE `BU`
SET `Jun-VAR-Act-Misc-Prior Month` = (`Jun-Act-Misc` - `May-Act-Misc`);

ALTER TABLE `BU`
ADD COLUMN `YTD-Budget` DECIMAL(15,2) AFTER `QT4-Act-Misc-Prior QT Comments`,
ADD COLUMN `YTD-Act-FG` DECIMAL(15,2) AFTER `YTD-Budget`,
ADD COLUMN `YTD-Act-Misc` DECIMAL(15,2) AFTER `YTD-Act-FG`,
ADD COLUMN `YTD-Com` DECIMAL(15,2) AFTER `YTD-Act-Misc`,
ADD COLUMN `YTD-24 FCST` DECIMAL(15,2) AFTER `YTD-Com`,
ADD COLUMN `YTD-VAR-Act-FCST` DECIMAL(15,2) AFTER `YTD-24 FCST`,
ADD COLUMN `YTD-VAR-Act-Budget` DECIMAL(15,2) AFTER `YTD-VAR-Act-FCST`,
ADD COLUMN `YTD-VAR-Act-Com` DECIMAL(15,2) AFTER `YTD-VAR-Act-Budget`,
ADD COLUMN `YTD-VAR-Com-FCST` DECIMAL(15,2) AFTER `YTD-VAR-Act-Com`,
ADD COLUMN `YTD-Act-Bud Comments` VARCHAR(100) AFTER `YTD-VAR-Com-FCST`,
ADD COLUMN `YTD-Act-FCST Comments` VARCHAR(100) AFTER `YTD-Act-Bud Comments`;

UPDATE `BU`
SET `YTD-Budget` = (`QT1-Budget` + `QT2-Budget` + `QT3-Budget` + `QT4-Budget`);
UPDATE `BU`
SET `YTD-Act-FG` = (`QT1-Act-FG` + `QT2-Act-FG` + `QT3-Act-FG` + `QT4-Act-FG`);
UPDATE `BU`
SET `YTD-Act-Misc` = (`QT1-Act-Misc` + `QT2-Act-Misc` + `QT3-Act-Misc` + `QT4-Act-Misc`);
UPDATE `BU`
SET `YTD-Com` = (`QT1-Com` + `QT2-Com` + `QT3-Com` + `QT4-Com`);
UPDATE `BU`
SET `YTD-24 FCST` = (`QT1-24 FCST` + `QT2-24 FCST` + `QT3-24 FCST` + `QT4-24 FCST`);
UPDATE `BU`
SET `YTD-VAR-Act-FCST` = (((`QT1-Act-FG` + `QT2-Act-FG` + `QT3-Act-FG` + `QT4-Act-FG`) + (`QT1-Act-Misc` + `QT2-Act-Misc` + `QT3-Act-Misc` + `QT4-Act-Misc`)) - (`QT1-24 FCST` + `QT2-24 FCST` + `QT3-24 FCST` + `QT4-24 FCST`));
UPDATE `BU`
SET `YTD-VAR-Act-Budget` = (((`QT1-Act-FG` + `QT2-Act-FG` + `QT3-Act-FG` + `QT4-Act-FG`) + (`QT1-Act-Misc` + `QT2-Act-Misc` + `QT3-Act-Misc` + `QT4-Act-Misc`)) - (`QT1-Budget` + `QT2-Budget` + `QT3-Budget` + `QT4-Budget`));
UPDATE `BU`
SET `YTD-VAR-Act-Com` = (((`QT1-Act-FG` + `QT2-Act-FG` + `QT3-Act-FG` + `QT4-Act-FG`) + (`QT1-Act-Misc` + `QT2-Act-Misc` + `QT3-Act-Misc` + `QT4-Act-Misc`)) - (`QT1-Com` + `QT2-Com` + `QT3-Com` + `QT4-Com`));
UPDATE `BU`
SET `YTD-VAR-Com-FCST` = ((`QT1-Com` + `QT2-Com` + `QT3-Com` + `QT4-Com`) - (`QT1-24 FCST` + `QT2-24 FCST` + `QT3-24 FCST` + `QT4-24 FCST`));

/*Rename End of Budget fields
UPDATE `BU`
SET `Customer Name` = 'Go-Get'
WHERE `customer_id` = 109;

UPDATE `BU`
SET `Customer Name` = 'Other-Misc'
WHERE `customer_id` = 105;

UPDATE `BU`
SET `Customer Name` = 'Billable to Customer'
WHERE `customer_id` = 106;

UPDATE `BU`
SET `Customer Name` = 'Tooling'
WHERE `customer_id` = 107;

UPDATE `BU`
SET `Customer Name` = 'Tooling'
WHERE `customer_id` = 108;

UPDATE `BU`
SET `Customer Name` = 'Inventory Sales'
WHERE `customer_id` = 109;

UPDATE `BU`
SET `Customer Name` = 'Utility'
WHERE `customer_id` = 110;
*/
/*
UPDATE `BU`
SET `Customer Name` = 'Go-Get'
WHERE `Customer Name` LIKE '%Go-Get';

UPDATE `BU`
SET `Customer Name` = 'Other Misc'
WHERE `Customer Name` LIKE '%Other Misc';

UPDATE `BU`
SET `Customer Name` = 'Billable to Customer'
WHERE `Customer Name` LIKE '%Billable to Customer';

UPDATE `BU`
SET `Customer Name` = 'Tooling 1'
WHERE `Customer Name` LIKE '%Tooling 1';

UPDATE `BU`
SET `Customer Name` = 'Tooling 2'
WHERE `Customer Name` LIKE '%Tooling 2';

UPDATE `BU`
SET `Customer Name` = 'Inventory Sales'
WHERE `Customer Name` LIKE '%Inventory Sales';

UPDATE `BU`
SET `Customer Name` = 'Utility'
WHERE `Customer Name` LIKE '%Utility';
*/
/*Formatting*/
/*
UPDATE `BU`
SET `Jul-Budget` = FORMAT(`Jul-Budget`, 0),
`Jul-Budget` = FORMAT(`Jul-Budget`, 0),
`Jul-Act` = FORMAT(`Jul-Act`, 0),
`Jul-Com` = FORMAT(`Jul-Com`, 0),
`Jul-24 FCST` = FORMAT(`Jul-24 FCST`, 0),
`Jul-VAR-Act-FCST` = FORMAT(`Jul-VAR-Act-FCST`, 0),
`Jul-VAR-Act-Budget` = FORMAT(`Jul-VAR-Act-Budget`, 0),
`Jul-VAR-Act-Com` = FORMAT(`Jul-VAR-Act-Com`, 0),
`Jul-VAR-Com-FCST` = FORMAT(`Jul-VAR-Com-FCST`, 0),
`Aug-Budget` = FORMAT(`Aug-Budget`, 0),
`Aug-Act` = FORMAT(`Aug-Act`, 0),
`Aug-Com` = FORMAT(`Aug-Com`, 0),
`Aug-24 FCST` = FORMAT(`Aug-24 FCST`, 0),
`Aug-VAR-Act-FCST` = FORMAT(`Aug-VAR-Act-FCST`, 0),
`Aug-VAR-Act-Budget` = FORMAT(`Aug-VAR-Act-Budget`, 0),
`Aug-VAR-Act-Com` = FORMAT(`Aug-VAR-Act-Com`, 0),
`Aug-VAR-Com-FCST` = FORMAT(`Aug-VAR-Com-FCST`, 0),
`Sep-Budget` = FORMAT(`Sep-Budget`, 0),
`Sep-Act` = FORMAT(`Sep-Act`, 0),
`Sep-Com` = FORMAT(`Sep-Com`, 0),
`Sep-24 FCST` = FORMAT(`Sep-24 FCST`, 0),
`Sep-VAR-Act-FCST` = FORMAT(`Sep-VAR-Act-FCST`, 0),
`Sep-VAR-Act-Budget` = FORMAT(`Sep-VAR-Act-Budget`, 0),
`Sep-VAR-Act-Com` = FORMAT(`Sep-VAR-Act-Com`, 0),
`Sep-VAR-Com-FCST` = FORMAT(`Sep-VAR-Com-FCST`, 0),
`QT1-Budget` = FORMAT(`QT1-Budget`, 0),
`QT1-Act` = FORMAT(`QT1-Act`, 0),
`QT1-Com` = FORMAT(`QT1-Com`, 0),
`QT1-24 FCST` = FORMAT(`QT1-24 FCST`, 0),
`QT1-VAR-Act-FCST` = FORMAT(`QT1-VAR-Act-FCST`, 0),
`QT1-VAR-Act-Budget` = FORMAT(`QT1-VAR-Act-Budget`, 0),
`QT1-VAR-Act-Com` = FORMAT(`QT1-VAR-Act-Com`, 0),
`QT1-VAR-Com-FCST` = FORMAT(`QT1-VAR-Com-FCST`, 0),
`Oct-Budget` = FORMAT(`Oct-Budget`, 0),
`Oct-Act` = FORMAT(`Oct-Act`, 0),
`Oct-Com` = FORMAT(`Oct-Com`, 0),
`Oct-24 FCST` = FORMAT(`Oct-24 FCST`, 0),
`Oct-VAR-Act-FCST` = FORMAT(`Oct-VAR-Act-FCST`, 0),
`Oct-VAR-Act-Budget` = FORMAT(`Oct-VAR-Act-Budget`, 0),
`Oct-VAR-Act-Com` = FORMAT(`Oct-VAR-Act-Com`, 0),
`Oct-VAR-Com-FCST` = FORMAT(`Oct-VAR-Com-FCST`, 0),
`Nov-Budget` = FORMAT(`Nov-Budget`, 0),
`Nov-Act` = FORMAT(`Nov-Act`, 0),
`Nov-Com` = FORMAT(`Nov-Com`, 0),
`Nov-24 FCST` = FORMAT(`Nov-24 FCST`, 0),
`Nov-VAR-Act-FCST` = FORMAT(`Nov-VAR-Act-FCST`, 0),
`Nov-VAR-Act-Budget` = FORMAT(`Nov-VAR-Act-Budget`, 0),
`Nov-VAR-Act-Com` = FORMAT(`Nov-VAR-Act-Com`, 0),
`Nov-VAR-Com-FCST` = FORMAT(`Nov-VAR-Com-FCST`, 0),
`Dec-Budget` = FORMAT(`Dec-Budget`, 0),
`Dec-Act` = FORMAT(`Dec-Act`, 0),
`Dec-Com` = FORMAT(`Dec-Com`, 0),
`Dec-24 FCST` = FORMAT(`Dec-24 FCST`, 0),
`Dec-VAR-Act-FCST` = FORMAT(`Dec-VAR-Act-FCST`, 0),
`Dec-VAR-Act-Budget` = FORMAT(`Dec-VAR-Act-Budget`, 0),
`Dec-VAR-Act-Com` = FORMAT(`Dec-VAR-Act-Com`, 0),
`Dec-VAR-Com-FCST` = FORMAT(`Dec-VAR-Com-FCST`, 0),
`QT2-Budget` = FORMAT(`QT2-Budget`, 0),
`QT2-Act` = FORMAT(`QT2-Act`, 0),
`QT2-Com` = FORMAT(`QT2-Com`, 0),
`QT2-24 FCST` = FORMAT(`QT2-24 FCST`, 0),
`QT2-VAR-Act-FCST` = FORMAT(`QT2-VAR-Act-FCST`, 0),
`QT2-VAR-Act-Budget` = FORMAT(`QT2-VAR-Act-Budget`, 0),
`QT2-VAR-Act-Com` = FORMAT(`QT2-VAR-Act-Com`, 0),
`QT2-VAR-Com-FCST` = FORMAT(`QT2-VAR-Com-FCST`, 0),
`Jan-Budget` = FORMAT(`Jan-Budget`, 0),
`Jan-Act` = FORMAT(`Jan-Act`, 0),
`Jan-Com` = FORMAT(`Jan-Com`, 0),
`Jan-24 FCST` = FORMAT(`Jan-24 FCST`, 0),
`Jan-VAR-Act-FCST` = FORMAT(`Jan-VAR-Act-FCST`, 0),
`Jan-VAR-Act-Budget` = FORMAT(`Jan-VAR-Act-Budget`, 0),
`Jan-VAR-Act-Com` = FORMAT(`Jan-VAR-Act-Com`, 0),
`Jan-VAR-Com-FCST` = FORMAT(`Jan-VAR-Com-FCST`, 0),
`Feb-Budget` = FORMAT(`Feb-Budget`, 0),
`Feb-Act` = FORMAT(`Feb-Act`, 0),
`Feb-Com` = FORMAT(`Feb-Com`, 0),
`Feb-24 FCST` = FORMAT(`Feb-24 FCST`, 0),
`Feb-VAR-Act-FCST` = FORMAT(`Feb-VAR-Act-FCST`, 0),
`Feb-VAR-Act-Budget` = FORMAT(`Feb-VAR-Act-Budget`, 0),
`Feb-VAR-Act-Com` = FORMAT(`Feb-VAR-Act-Com`, 0),
`Feb-VAR-Com-FCST` = FORMAT(`Feb-VAR-Com-FCST`, 0),
`Mar-Budget` = FORMAT(`Mar-Budget`, 0),
`Mar-Act` = FORMAT(`Mar-Act`, 0),
`Mar-Com` = FORMAT(`Mar-Com`, 0),
`Mar-24 FCST` = FORMAT(`Mar-24 FCST`, 0),
`Mar-VAR-Act-FCST` = FORMAT(`Mar-VAR-Act-FCST`, 0),
`Mar-VAR-Act-Budget` = FORMAT(`Mar-VAR-Act-Budget`, 0),
`Mar-VAR-Act-Com` = FORMAT(`Mar-VAR-Act-Com`, 0),
`Mar-VAR-Com-FCST` = FORMAT(`Mar-VAR-Com-FCST`, 0),
`QT3-Budget` = FORMAT(`QT3-Budget`, 0),
`QT3-Act` = FORMAT(`QT3-Act`, 0),
`QT3-Com` = FORMAT(`QT3-Com`, 0),
`QT3-24 FCST` = FORMAT(`QT3-24 FCST`, 0),
`QT3-VAR-Act-FCST` = FORMAT(`QT3-VAR-Act-FCST`, 0),
`QT3-VAR-Act-Budget` = FORMAT(`QT3-VAR-Act-Budget`, 0),
`QT3-VAR-Act-Com` = FORMAT(`QT3-VAR-Act-Com`, 0),
`QT3-VAR-Com-FCST` = FORMAT(`QT3-VAR-Com-FCST`, 0),
`Apr-Budget` = FORMAT(`Apr-Budget`, 0),
`Apr-Act` = FORMAT(`Apr-Act`, 0),
`Apr-Com` = FORMAT(`Apr-Com`, 0),
`Apr-24 FCST` = FORMAT(`Apr-24 FCST`, 0),
`Apr-VAR-Act-FCST` = FORMAT(`Apr-VAR-Act-FCST`, 0),
`Apr-VAR-Act-Budget` = FORMAT(`Apr-VAR-Act-Budget`, 0),
`Apr-VAR-Act-Com` = FORMAT(`Apr-VAR-Act-Com`, 0),
`Apr-VAR-Com-FCST` = FORMAT(`Apr-VAR-Com-FCST`, 0),
`May-Budget` = FORMAT(`May-Budget`, 0),
`May-Act` = FORMAT(`May-Act`, 0),
`May-Com` = FORMAT(`May-Com`, 0),
`May-24 FCST` = FORMAT(`May-24 FCST`, 0),
`May-VAR-Act-FCST` = FORMAT(`May-VAR-Act-FCST`, 0),
`May-VAR-Act-Budget` = FORMAT(`May-VAR-Act-Budget`, 0),
`May-VAR-Act-Com` = FORMAT(`May-VAR-Act-Com`, 0),
`May-VAR-Com-FCST` = FORMAT(`May-VAR-Com-FCST`, 0),
`Jun-Budget` = FORMAT(`Jun-Budget`, 0),
`Jun-Act` = FORMAT(`Jun-Act`, 0),
`Jun-Com` = FORMAT(`Jun-Com`, 0),
`Jun-24 FCST` = FORMAT(`Jun-24 FCST`, 0),
`Jun-VAR-Act-FCST` = FORMAT(`Jun-VAR-Act-FCST`, 0),
`Jun-VAR-Act-Budget` = FORMAT(`Jun-VAR-Act-Budget`, 0),
`Jun-VAR-Act-Com` = FORMAT(`Jun-VAR-Act-Com`, 0),
`Jun-VAR-Com-FCST` = FORMAT(`Jun-VAR-Com-FCST`, 0),
`QT4-Budget` = FORMAT(`QT4-Budget`, 0),
`QT4-Act` = FORMAT(`QT4-Act`, 0),
`QT4-Com` = FORMAT(`QT4-Com`, 0),
`QT4-24 FCST` = FORMAT(`QT4-24 FCST`, 0),
`QT4-VAR-Act-FCST` = FORMAT(`QT4-VAR-Act-FCST`, 0),
`QT4-VAR-Act-Budget` = FORMAT(`QT4-VAR-Act-Budget`, 0),
`QT4-VAR-Act-Com` = FORMAT(`QT4-VAR-Act-Com`, 0),
`QT4-VAR-Com-FCST` = FORMAT(`QT4-VAR-Com-FCST`, 0),
`YTD-VAR-Act-FCST` = FORMAT(`YTD-VAR-Act-FCST`, 0),
`YTD-VAR-Act-Budget` = FORMAT(`YTD-VAR-Act-Budget`, 0),
`YTD-VAR-Act-Com` = FORMAT(`YTD-VAR-Act-Com`, 0),
`YTD-VAR-Com-FCST` = FORMAT(`YTD-VAR-Com-FCST`, 0);
*/

UPDATE `BU`
SET `Jul-Act-Bud Comments` = COALESCE(`Jul-Act-Bud Comments`, '');

UPDATE `BU`
SET `Jul-Act-FCST Comments` = COALESCE(`Jul-Act-FCST Comments`, '');

UPDATE `BU`
SET `Jul-Act-FG-Prior Month Comments` = COALESCE(`Jul-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Jul-Act-Misc-Prior Month Comments` = COALESCE(`Jul-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `Aug-Act-Bud Comments` = COALESCE(`Aug-Act-Bud Comments`, '');

UPDATE `BU`
SET `Aug-Act-FCST Comments` = COALESCE(`Aug-Act-FCST Comments`, '');

UPDATE `BU`
SET `Aug-Act-FG-Prior Month Comments` = COALESCE(`Aug-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Aug-Act-Misc-Prior Month Comments` = COALESCE(`Aug-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `Sep-Act-Bud Comments` = COALESCE(`Sep-Act-Bud Comments`, '');

UPDATE `BU`
SET `Sep-Act-FCST Comments` = COALESCE(`Sep-Act-FCST Comments`, '');

UPDATE `BU`
SET `Sep-Act-FG-Prior Month Comments` = COALESCE(`Sep-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Sep-Act-Misc-Prior Month Comments` = COALESCE(`Sep-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `QT1-Act-Bud Comments` = COALESCE(`QT1-Act-Bud Comments`, '');

UPDATE `BU`
SET `QT1-Act-FCST Comments` = COALESCE(`QT1-Act-FCST Comments`, '');

UPDATE `BU`
SET `QT1-Act-FG-Prior QT Comments` = COALESCE(`QT1-Act-FG-Prior QT Comments`, '');

UPDATE `BU`
SET `QT1-Act-Misc-Prior QT Comments` = COALESCE(`QT1-Act-Misc-Prior QT Comments`, '');

UPDATE `BU`
SET `Oct-Act-Bud Comments` = COALESCE(`Oct-Act-Bud Comments`, '');

UPDATE `BU`
SET `Oct-Act-FCST Comments` = COALESCE(`Oct-Act-FCST Comments`, '');

UPDATE `BU`
SET `Oct-Act-FG-Prior Month Comments` = COALESCE(`Oct-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Oct-Act-Misc-Prior Month Comments` = COALESCE(`Oct-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `Nov-Act-Bud Comments` = COALESCE(`Nov-Act-Bud Comments`, '');

UPDATE `BU`
SET `Nov-Act-FCST Comments` = COALESCE(`Nov-Act-FCST Comments`, '');

UPDATE `BU`
SET `Nov-Act-FG-Prior Month Comments` = COALESCE(`Nov-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Nov-Act-Misc-Prior Month Comments` = COALESCE(`Nov-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `Dec-Act-Bud Comments` = COALESCE(`Dec-Act-Bud Comments`, '');

UPDATE `BU`
SET `Dec-Act-FCST Comments` = COALESCE(`Dec-Act-FCST Comments`, '');

UPDATE `BU`
SET `Dec-Act-FG-Prior Month Comments` = COALESCE(`Dec-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Dec-Act-Misc-Prior Month Comments` = COALESCE(`Dec-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `QT2-Act-Bud Comments` = COALESCE(`QT2-Act-Bud Comments`, '');

UPDATE `BU`
SET `QT2-Act-FCST Comments` = COALESCE(`QT2-Act-FCST Comments`, '');

UPDATE `BU`
SET `QT2-Act-FG-Prior QT Comments` = COALESCE(`QT2-Act-FG-Prior QT Comments`, '');

UPDATE `BU`
SET `QT2-Act-Misc-Prior QT Comments` = COALESCE(`QT2-Act-Misc-Prior QT Comments`, '');

UPDATE `BU`
SET `Jan-Act-Bud Comments` = COALESCE(`Jan-Act-Bud Comments`, '');

UPDATE `BU`
SET `Jan-Act-FCST Comments` = COALESCE(`Jan-Act-FCST Comments`, '');

UPDATE `BU`
SET `Jan-Act-FG-Prior Month Comments` = COALESCE(`Jan-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Jan-Act-Misc-Prior Month Comments` = COALESCE(`Jan-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `Feb-Act-Bud Comments` = COALESCE(`Feb-Act-Bud Comments`, '');

UPDATE `BU`
SET `Feb-Act-FCST Comments` = COALESCE(`Feb-Act-FCST Comments`, '');

UPDATE `BU`
SET `Feb-Act-FG-Prior Month Comments` = COALESCE(`Feb-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Feb-Act-Misc-Prior Month Comments` = COALESCE(`Feb-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `Mar-Act-Bud Comments` = COALESCE(`Mar-Act-Bud Comments`, '');

UPDATE `BU`
SET `Mar-Act-FCST Comments` = COALESCE(`Mar-Act-FCST Comments`, '');

UPDATE `BU`
SET `Mar-Act-FG-Prior Month Comments` = COALESCE(`Mar-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Mar-Act-Misc-Prior Month Comments` = COALESCE(`Mar-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `QT3-Act-Bud Comments` = COALESCE(`QT3-Act-Bud Comments`, '');

UPDATE `BU`
SET `QT3-Act-FCST Comments` = COALESCE(`QT3-Act-FCST Comments`, '');

UPDATE `BU`
SET `QT3-Act-FG-Prior QT Comments` = COALESCE(`QT3-Act-FG-Prior QT Comments`, '');

UPDATE `BU`
SET `QT3-Act-Misc-Prior QT Comments` = COALESCE(`QT3-Act-Misc-Prior QT Comments`, '');

UPDATE `BU`
SET `Apr-Act-Bud Comments` = COALESCE(`Apr-Act-Bud Comments`, '');

UPDATE `BU`
SET `Apr-Act-FCST Comments` = COALESCE(`Apr-Act-FCST Comments`, '');

UPDATE `BU`
SET `Apr-Act-FG-Prior Month Comments` = COALESCE(`Apr-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Apr-Act-Misc-Prior Month Comments` = COALESCE(`Apr-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `May-Act-Bud Comments` = COALESCE(`May-Act-Bud Comments`, '');

UPDATE `BU`
SET `May-Act-FCST Comments` = COALESCE(`May-Act-FCST Comments`, '');

UPDATE `BU`
SET `May-Act-FG-Prior Month Comments` = COALESCE(`May-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `May-Act-Misc-Prior Month Comments` = COALESCE(`May-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `Jun-Act-Bud Comments` = COALESCE(`Jun-Act-Bud Comments`, '');

UPDATE `BU`
SET `Jun-Act-FCST Comments` = COALESCE(`Jun-Act-FCST Comments`, '');

UPDATE `BU`
SET `Jun-Act-FG-Prior Month Comments` = COALESCE(`Jun-Act-FG-Prior Month Comments`, '');

UPDATE `BU`
SET `Jun-Act-Misc-Prior Month Comments` = COALESCE(`Jun-Act-Misc-Prior Month Comments`, '');

UPDATE `BU`
SET `QT4-Act-Bud Comments` = COALESCE(`QT4-Act-Bud Comments`, '');

UPDATE `BU`
SET `QT4-Act-FCST Comments` = COALESCE(`QT4-Act-FCST Comments`, '');

UPDATE `BU`
SET `QT4-Act-FG-Prior QT Comments` = COALESCE(`QT4-Act-FG-Prior QT Comments`, '');

UPDATE `BU`
SET `QT4-Act-Misc-Prior QT Comments` = COALESCE(`QT4-Act-Misc-Prior QT Comments`, '');

UPDATE `BU`
SET `YTD-Act-Bud Comments` = COALESCE(`YTD-Act-Bud Comments`, '');

UPDATE `BU`
SET `YTD-Act-FCST Comments` = COALESCE(`YTD-Act-FCST Comments`, '');

SELECT *
FROM `BU`;

SELECT `customer_id`, `Sold To Name` AS `Actuals Customers`, `product_family_id`, `Product Family` AS `Actuals Products`, `2nd Item Number`
FROM `actuals`
WHERE `customer_id` IS NULL
    OR `product_family_id` IS NULL
GROUP BY `Sold To Name`, `Product Family`;

SELECT `customer_id`, `Customer Parent` AS `Budget Customers`, `product_family_id`, `Product Family` AS `Budget Products`
FROM `annual budget 2024`
WHERE `customer_id` IS NULL
    OR `product_family_id` IS NULL
GROUP BY `Customer Parent`, `Product Family`;

SELECT `customer_id`, `Customer` AS `Forecast Customers`, `product_family_id`, `Product Family` AS `Forecast Products`, `ItemNo.`
FROM `forecast_capacity`
WHERE `customer_id` IS NULL
    OR `product_family_id` IS NULL
GROUP BY `Customer`, `Product Family`;

SELECT `customer_id`, `Customer Name` AS `Commit Customers`, `product_family_id`, `Product Family` AS `Commit Products`, `Item Number`
FROM `billing commit report group`
WHERE `customer_id` IS NULL
    OR `product_family_id` IS NULL
GROUP BY `Customer Name`, `Product Family`;

SELECT `customer_id`, `Customer` AS `Finance Adjustment Customers`
FROM `finance adjustments`
WHERE `customer_id` IS NULL
GROUP BY `Customer`;
/*
SET @sql_text =
CONCAT(
'SELECT \'customer_id\', \'Customer Name\', \'Jul-Budget\', \'Jul-Act\', \'Jul-Com\', \'Jul-24 FCST\', \'Jul-VAR-Act-FCST\', \'Jul-VAR-Act-Budget\', \'Jul-VAR-Act-Com\', \'Jul-VAR-Com-FCST\', \'Aug-Budget\', \'Aug-Act\', \'Aug-Com\', \'Aug-24 FCST\', \'Aug-VAR-Act-FCST\', \'Aug-VAR-Act-Budget\', \'Aug-VAR-Act-Com\', \'Aug-VAR-Com-FCST\', \'Sep-Budget\', \'Sep-Act\', \'Sep-Com\', \'Sep-24 FCST\', \'Sep-VAR-Act-FCST\', \'Sep-VAR-Act-Budget\', \'Sep-VAR-Act-Com\', \'Sep-VAR-Com-FCST\', \'QT1-Budget\', \'QT1-Act\', \'QT1-Com\', \'QT1-24 FCST\', \'QT1-VAR-Act-FCST\', \'QT1-VAR-Act-Budget\', \'QT1-VAR-Act-Com\', \'QT1-VAR-Com-FCST\', \'Oct-Budget\', \'Oct-Act\', \'Oct-Com\', \'Oct-24 FCST\', \'Oct-VAR-Act-FCST\', \'Oct-VAR-Act-Budget\', \'Oct-VAR-Act-Com\', \'Oct-VAR-Com-FCST\', \'Nov-Budget\', \'Nov-Act\', \'Nov-Com\', \'Nov-24 FCST\', \'Nov-VAR-Act-FCST\', \'Nov-VAR-Act-Budget\', \'Nov-VAR-Act-Com\', \'Nov-VAR-Com-FCST\', \'Dec-Budget\', \'Dec-Act\', \'Dec-Com\', \'Dec-24 FCST\', \'Dec-VAR-Act-FCST\', \'Dec-VAR-Act-Budget\', \'Dec-VAR-Act-Com\', \'Dec-VAR-Com-FCST\', \'QT2-Budget\', \'QT2-Act\', \'QT2-Com\', \'QT2-24 FCST\', \'QT2-VAR-Act-FCST\', \'QT2-VAR-Act-Budget\', \'QT2-VAR-Act-Com\', \'QT2-VAR-Com-FCST\', \'Jan-Budget\', \'Jan-Act\', \'Jan-Com\', \'Jan-24 FCST\', \'Jan-VAR-Act-FCST\', \'Jan-VAR-Act-Budget\', \'Jan-VAR-Act-Com\', \'Jan-VAR-Com-FCST\', \'Feb-Budget\', \'Feb-Act\', \'Feb-Com\', \'Feb-24 FCST\', \'Feb-VAR-Act-FCST\', \'Feb-VAR-Act-Budget\', \'Feb-VAR-Act-Com\', \'Feb-VAR-Com-FCST\', \'Mar-Budget\', \'Mar-Act\', \'Mar-Com\', \'Mar-24 FCST\', \'Mar-VAR-Act-FCST\', \'Mar-VAR-Act-Budget\', \'Mar-VAR-Act-Com\', \'Mar-VAR-Com-FCST\', \'QT3-Budget\', \'QT3-Act\', \'QT3-Com\', \'QT3-24 FCST\', \'QT3-VAR-Act-FCST\', \'QT3-VAR-Act-Budget\', \'QT3-VAR-Act-Com\', \'QT3-VAR-Com-FCST\', \'Apr-Budget\', \'Apr-Act\', \'Apr-Com\', \'Apr-24 FCST\', \'Apr-VAR-Act-FCST\', \'Apr-VAR-Act-Budget\', \'Apr-VAR-Act-Com\', \'Apr-VAR-Com-FCST\', \'May-Budget\', \'May-Act\', \'May-Com\', \'May-24 FCST\', \'May-VAR-Act-FCST\', \'May-VAR-Act-Budget\', \'May-VAR-Act-Com\', \'May-VAR-Com-FCST\', \'Jun-Budget\', \'Jun-Act\', \'Jun-Com\', \'Jun-24 FCST\', \'Jun-VAR-Act-FCST\', \'Jun-VAR-Act-Budget\', \'Jun-VAR-Act-Com\', \'Jun-VAR-Com-FCST\', \'QT4-Budget\', \'QT4-Act\', \'QT4-Com\', \'QT4-24 FCST\', \'QT4-VAR-Act-FCST\', \'QT4-VAR-Act-Budget\', \'QT4-VAR-Act-Com\', \'QT4-VAR-Com-FCST\', \'YTD-VAR-Act-FCST\', \'YTD-VAR-Act-Budget\', \'YTD-VAR-Act-Com\', \'YTD-VAR-Com-FCST\'
UNION ALL
SELECT *
FROM `BU`
INTO OUTFILE \'N:/All Business Units/Common Data/Business Analyst Team/S&OP/S&OP FY24 ', CURDATE(), '.csv'
'\'FIELDS TERMINATED BY \',\'
ENCLOSED BY \'"\'
LINES TERMINATED BY \'\r\n\''
);
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;
*/
SET @sql_text1 = 
CONCAT(
'RENAME TABLE `BU` TO `BU FY24 ', CURDATE(), '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;






