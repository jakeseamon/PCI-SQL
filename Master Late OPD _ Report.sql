/*Connect to SO DB database*/
SELECT CONCAT('USE `so db`;')
UNION ALL
/*Drop table if exists*/
SELECT CONCAT('DROP TABLE IF EXISTS `',
`table_schema`,
'`.`',
`table_name`, '`;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'so db' 
	AND `table_name` LIKE '%master late opd percentage report 202%'
UNION ALL
/*Delete Existing Columns*/
SELECT CONCAT('ALTER TABLE `',
`table_schema`,
'`.`',
`table_name`, '`',
' DROP `created_at`;') AS ddl
FROM `information_schema`.`columns`
WHERE `table_schema` = 'so db' 
	AND `table_name` LIKE '%so report 202%'
    AND `column_name` = 'created_at'
    AND `table_name` NOT LIKE '%master%'
UNION ALL
/*Create Columns*/
SELECT CONCAT('ALTER TABLE `',
`table_schema`,
'`.`',
`table_name`, '`',
' ADD `created_at` DATE;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'so db' 
	AND `table_name` LIKE '%so report 202%'
    AND `table_name` NOT LIKE '%master%'
UNION ALL
/*Populate Columns*/
SELECT CONCAT('UPDATE `',
`table_schema`,
'`.`',
`table_name`, '`',
' SET `created_at` = ', "'", RIGHT(`table_name`, 10), "';") AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'so db' 
	AND `table_name` LIKE '%so report 202%'
    AND `table_name` NOT LIKE '%master%'
UNION ALL
/*Create table*/
SELECT CONCAT('CREATE TABLE `Master Late OPD Percentage Report ',
CURDATE(), '` AS (')
UNION ALL
/*Merge all tables*/
SELECT CONCAT('SELECT a.* FROM (', GROUP_CONCAT('SELECT a.`created_at`, CONCAT(b.`Late Count`/a.`Total Count` * 100, \'%\') AS `Late %`
FROM (SELECT COUNT(`WO`) AS `Total Count`, `Orig Promise Date`, `created_at` FROM `', `table_schema`, '`.`', `table_name`, '` WHERE `Status` <> 99) AS a
JOIN (SELECT COUNT(`WO`) AS `Late Count`, `Orig Promise Date`, `created_at` FROM `', `table_schema`, '`.`', `table_name`, '` WHERE `Status` <> 99 AND `Orig Promise Date` < `created_at`) AS b' SEPARATOR ' UNION ALL '), ') AS a ORDER BY a.`created_at`);') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'so db' 
	AND `table_name` LIKE '%so report 202%'
    AND `table_name` NOT LIKE '%master%'
    AND LEFT(`table_name`, 9) <> 'so report'
UNION ALL
/*Populate table*/
SELECT CONCAT('SELECT * FROM `Master Late OPD Percentage Report ',
CURDATE(), '`')
INTO OUTFILE 'N:/All Business Units/Common Data/Business Analyst Team/SQL Queries/Temp Queries/Master Late OPD Percentage Data Dump.sql'
LINES TERMINATED BY '\r\n';