USE `forecast db`;

/*
JDE Reports and Parameters
    Billing Commit:
        Request Date: 7/1/2022 to *
        Save As ".../Business Analyst Team/Input Data/billing_report_xl.csv"
    Forecast Capacity
*/
/*
DROP TABLE IF EXISTS `Forecast Upload Old`;

RENAME TABLE `Forecast Upload` TO `Forecast Upload Old`;
*/
DROP TABLE IF EXISTS `forecast_capacity`;
DROP TABLE IF EXISTS `Forecast Upload Temp`;
DROP TABLE IF EXISTS `Forecast Upload Temp 2`;
DROP TABLE IF EXISTS `Forecast Upload`;
DROP TABLE IF EXISTS `Billing Commit Report`;
DROP TABLE IF EXISTS `Forecast Data Dump`;

DROP TABLE IF EXISTS `Forecast Upload New`;
DROP TABLE IF EXISTS `Forecast Upload Temp ID`;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `forecast_capacity ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `Forecast Upload ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `Billing Commit Report ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `', CURDATE(), ' Forecast Data Dump`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `', CURDATE(), ' Forecast Data Dump v2`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

CREATE TABLE `forecast_capacity` (
    `ID` VARCHAR(50),
    `Active?` VARCHAR(50),
    `BU` VARCHAR(50),
    `Customer` VARCHAR(50),
    `Customer ID` VARCHAR(50),
    `ItemNo.` VARCHAR(50),
    `FG/ WIP` CHAR(5),
    `Product Description` VARCHAR(50),
    `Product Family` VARCHAR(50),
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
    `6/1/2023` INT,
    `7/1/2023` INT,
    `8/1/2023` INT,
    `9/1/2023` INT,
    `10/1/2023` INT,
    `11/1/2023` INT,
    `12/1/2023` INT,
    `1/1/2024` INT,
    `2/1/2024` INT,
    `3/1/2024` INT,
    `4/1/2024` INT,
    `5/1/2024` INT,
    `6/1/2024` INT,
    `7/1/2024` INT,
    `8/1/2024` INT,
    `9/1/2024` INT,
    `10/1/2024` INT,
    `11/1/2024` INT,
    `12/1/2024` INT,
    `1/1/2025` INT,
    `2/1/2025` INT,
    `3/1/2025` INT,
    `4/1/2025` INT,
    `5/1/2025` INT,
    `6/1/2025` INT
);
/*
CREATE TABLE `forecast_capacity` (
    `Customer` VARCHAR(50),
    `Customer ID` VARCHAR(50),
    `ItemNo.` VARCHAR(50),
    `FG/ WIP` CHAR(5),
    `FG Code` VARCHAR(3),
    `Product Description` VARCHAR(50),
    `Product Family` VARCHAR(50),
    `UOM` VARCHAR(5),
    `Unit Cost` DECIMAL(15,2),
    `WIPONLYFG` VARCHAR(50),
    `Qty Per` INT,
    `Rate` DECIMAL(15,2),
    `Crew Size` INT,
    `WIP Pallet` INT,
    `FG Pallet` INT,
    `Value Stream` VARCHAR(50),
    `WHS` VARCHAR(50),
    `Room` VARCHAR(10),
    `Comments/Last Updated` VARCHAR(150),
    `6/1/2023` VARCHAR(50),
    `7/1/2023` VARCHAR(50),
    `8/1/2023` VARCHAR(50),
    `9/1/2023` VARCHAR(50),
    `10/1/2023` VARCHAR(50),
    `11/1/2023` VARCHAR(50),
    `12/1/2023` VARCHAR(50),
    `1/1/2024` VARCHAR(50),
    `2/1/2024` VARCHAR(50),
    `3/1/2024` VARCHAR(50),
    `4/1/2024` VARCHAR(50),
    `5/1/2024` VARCHAR(50),
    `6/1/2024` VARCHAR(50),
    `7/1/2024` VARCHAR(50),
    `8/1/2024` VARCHAR(50),
    `9/1/2024` VARCHAR(50),
    `10/1/2024` VARCHAR(50),
    `11/1/2024` VARCHAR(50),
    `12/1/2024` VARCHAR(50),
    `1/1/2025` VARCHAR(50),
    `2/1/2025` VARCHAR(50),
    `3/1/2025` VARCHAR(50),
    `4/1/2025` VARCHAR(50),
    `5/1/2025` VARCHAR(50),
    `6/1/2025` VARCHAR(50)
);*/

CREATE TABLE `Billing Commit Report` (
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

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/forecast_capacity.csv' 
INTO TABLE `forecast_capacity` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/billing_report_xl.csv' 
INTO TABLE `Billing Commit Report` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

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

UPDATE `forecast_capacity`
SET `Customer` = 'Novartis Pharmaceuticals Corporation'
WHERE `Customer` = 'Novartis Vaccines and Diagnost';

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
SET `Customer` = 'Xeris Pharmaceuticals, Inc.'
WHERE `Customer` = 'Xeris Pharmaceuticals';

UPDATE `forecast_capacity`
SET `Customer` = 'GPSG (Janssen)'
WHERE `Customer` = 'Janssen';

UPDATE `forecast_capacity`
SET `Customer` = 'SIGA Technologies'
WHERE `Customer` = 'Siga Technologies Inc.';

UPDATE `forecast_capacity`
SET `Customer` = 'Astellas US Technologies, Inc.'
WHERE `Customer` = 'Astellas';

DELETE
FROM `forecast_capacity`
WHERE `Customer` = 71780
    AND `FG/ WIP` = 'WIP';
/*
ALTER TABLE `forecast_capacity`
ADD COLUMN `customer_id` INT FIRST;

UPDATE `forecast_capacity` AS a
JOIN `customer_names` AS b
ON a.`Customer` = b.`Customer Name (Commit)`
SET a.`customer_id` = b.`Customer ID JDE`;
*/
CREATE TABLE `Forecast Upload Temp` AS (
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '6/1/2023' AS `Request Date`, `6/1/2023` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `6/1/2023` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '7/1/2023' AS `Request Date`, `7/1/2023` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `7/1/2023` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '8/1/2023' AS `Request Date`, `8/1/2023` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `8/1/2023` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '9/1/2023' AS `Request Date`, `9/1/2023` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `9/1/2023` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '10/1/2023' AS `Request Date`, `10/1/2023` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `10/1/2023` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '11/1/2023' AS `Request Date`, `11/1/2023` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `11/1/2023` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '12/1/2023' AS `Request Date`, `12/1/2023` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `12/1/2023` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '1/1/2024' AS `Request Date`, `1/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `1/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '2/1/2024' AS `Request Date`, `2/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `2/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '3/1/2024' AS `Request Date`, `3/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `3/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '4/1/2024' AS `Request Date`, `4/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `4/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '5/1/2024' AS `Request Date`, `5/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `5/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '6/1/2024' AS `Request Date`, `6/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `6/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '7/1/2024' AS `Request Date`, `7/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `7/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '8/1/2024' AS `Request Date`, `8/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `8/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '9/1/2024' AS `Request Date`, `9/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `9/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '10/1/2024' AS `Request Date`, `10/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `10/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '11/1/2024' AS `Request Date`, `11/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `11/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '12/1/2024' AS `Request Date`, `12/1/2024` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `12/1/2024` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '1/1/2025' AS `Request Date`, `1/1/2025` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `1/1/2025` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '2/1/2025' AS `Request Date`, `2/1/2025` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `2/1/2025` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '3/1/2025' AS `Request Date`, `3/1/2025` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `3/1/2025` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '4/1/2025' AS `Request Date`, `4/1/2025` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `4/1/2025` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '5/1/2025' AS `Request Date`, `5/1/2025` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `5/1/2025` <> 0
    UNION ALL
    SELECT `Customer ID`, `Customer`, `ItemNo.`, '6/1/2025' AS `Request Date`, `6/1/2025` AS `Forecast Quantity`
    FROM `forecast_capacity`
    WHERE `6/1/2025` <> 0
);
/*
CREATE TABLE `Forecast Upload temp 2` AS (
    SELECT a.`Customer ID` AS `Customer`, a.`ItemNo.` AS `Item Number`, a.`Request Date`, a.`Forecast Quantity`
    FROM `forecast upload temp` AS a
    WHERE STR_TO_DATE(`Request Date`, '%m/%d/%Y') BETWEEN STR_TO_DATE('10/31/2023', '%m/%d/%Y') AND STR_TO_DATE(CONCAT(MONTH(DATE_ADD(CURDATE(), INTERVAL 15 MONTH)), '/1/', YEAR(DATE_ADD(CURDATE(), INTERVAL 15 MONTH))), '%m/%d/%Y')
);*/

CREATE TABLE `Forecast Upload temp 2` AS (
    SELECT a.`Customer ID` AS `Customer`, a.`ItemNo.` AS `Item Number`, a.`Request Date`, a.`Forecast Quantity`
    FROM `forecast upload temp` AS a
    WHERE STR_TO_DATE(`Request Date`, '%m/%d/%Y') BETWEEN STR_TO_DATE(CONCAT(MONTH(DATE_ADD(CURDATE(), INTERVAL 3 MONTH)), '/1/', YEAR(DATE_ADD(CURDATE(), INTERVAL 3 MONTH))), '%m/%d/%Y') AND STR_TO_DATE(CONCAT(MONTH(DATE_ADD(CURDATE(), INTERVAL 15 MONTH)), '/1/', YEAR(DATE_ADD(CURDATE(), INTERVAL 15 MONTH))), '%m/%d/%Y')
);

CREATE TABLE `Forecast Upload` AS (
    SELECT `Customer`, `Item Number`, `Request Date`, SUM(`Forecast Quantity`) AS `Forecast Quantity`
    FROM `Forecast Upload temp 2`
    GROUP BY `Customer`, `Item Number`, `Request Date`
);

/*Temp Edits*/

DELETE
FROM `Forecast Upload`
WHERE `Item Number` = 'PCR-W-82310-LBL'
    OR `Item Number` = 'PCR-W-82311-LBL'
    OR `Item Number` = 'PCR-WIP-82310'
    OR `Item Number` = 'PCR-WIP-82311'
    OR `Item Number` = 'PCR-WIP-82312'
    OR `Item Number` = 'PCR-WIP-82313'
    OR `Item Number` = 'PCR-W-82310-LBL'
    OR `Item Number` = 'PCR-W-82311-LBL';

ALTER TABLE `Forecast Upload`
ADD COLUMN `id` INT AUTO_INCREMENT PRIMARY KEY;

CREATE TABLE `Forecast Upload Temp ID` AS (
    SELECT a.`Customer`, a.`Item Number`, a.`Request Date`, a.`Forecast Quantity`, b.`id`
    FROM `Forecast Upload Old` AS a
    LEFT JOIN `Forecast Upload` AS b
    ON a.`Customer` = b.`Customer`
        AND a.`Item Number` = b.`Item Number`
        AND a.`Request Date` = b.`Request Date`
    WHERE b.`id` IS NULL
);

UPDATE `Forecast Upload Temp ID`
SET `Forecast Quantity` = 0;

ALTER TABLE `Forecast Upload`
DROP COLUMN `id`;

ALTER TABLE `Forecast Upload Temp ID`
DROP COLUMN `id`;

SELECT a.*
FROM (
    SELECT *
    FROM `Forecast Upload`
    UNION ALL
    SELECT *
    FROM `Forecast Upload Temp ID`) AS a
ORDER BY `Customer`;
/*
    AND `Customer` = 42977386

/*
*/