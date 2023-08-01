USE `otd`;

/*
JDE Reports:
	On Time Delivery Inquiry:
		Start Date: <First day of current month>
        End Date: <Last day of current month>
        Save As "Business Analyst Team/Input Data/otd.csv"
*/

SET @sql_text =
CONCAT('DROP TABLE IF EXISTS `OTD Missing Reason Codes ', CURDATE(), '`;');
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

DROP TABLE IF EXISTS `OTD Missing Reason Codes Temp`;
DROP TABLE IF EXISTS `OTD Missing Reason Codes`;

CREATE TABLE `OTD Missing Reason Codes Temp` (
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

LOAD DATA INFILE 'N:/All Business Units/Common Data/Business Analyst Team/Input Data/otd.csv'
INTO TABLE `OTD Missing Reason Codes Temp` 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

ALTER TABLE `OTD Missing Reason Codes Temp`
ADD id INT AUTO_INCREMENT PRIMARY KEY FIRST;

DELETE a
FROM `OTD Missing Reason Codes Temp` as a
JOIN `OTD Missing Reason Codes Temp` as b
WHERE a.id < b.id AND a.`Lot Serial Number` = b.`Lot Serial Number`;

ALTER TABLE `OTD Missing Reason Codes Temp`
DROP COLUMN `id`;

/*
CREATE VIEW `OTD Amount` AS 
	SELECT a.`On Time`, COUNT(*), b.`Extended Amount`
	FROM `OTD` AS a
	JOIN `SO-PO` AS b
	ON a.`Order Number` = b.`Order Number`
	GROUP BY a.`On Time`;
    
SELECT *
FROM `OTD Amount`;
*/
CREATE TABLE `OTD Missing Reason Codes` AS (
	SELECT *
	FROM `OTD Missing Reason Codes Temp`
	WHERE `On Time` = 'N' AND `Reason Code` = ''
);

SELECT *
FROM `OTD Missing Reason Codes`;

SET @sql_text =
CONCAT(
'SELECT \'Address Number\', \'Alpha Name\', \'Order Name\', \'Line Number\', \'Cat Cde\', \'Original Promised Date\', \'Request Date\', \'Actual Ship Date\', \'Lot Serial Number\', \'Reason Code\', \'Related PO/SO No\', \'On Time\', \'Comments\'
UNION ALL
SELECT *
FROM `OTD Missing Reason Codes`
WHERE `On Time` = \'N\' AND `Reason Code` = \'\'
INTO OUTFILE \'N:/All Business Units/Common Data/Business Analyst Team/OTD Reports/Missing Reason Codes/otd_missing_reason_codes_', CURDATE(), '.csv'
'\'FIELDS TERMINATED BY \',\'
ENCLOSED BY \'"\'
LINES TERMINATED BY \'\r\n\''
);
PREPARE s1 FROM @sql_text;
EXECUTE s1;
DROP PREPARE s1;

SET @sql_text1 = 
CONCAT(
'RENAME TABLE `OTD Missing Reason Codes` TO `OTD Missing Reason Codes ', CURDATE(), '`');
PREPARE s1 FROM @sql_text1;
EXECUTE s1;
DROP PREPARE s1;