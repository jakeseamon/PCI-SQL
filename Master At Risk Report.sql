/*Connect to Billing Commit Report Test database*/
SELECT CONCAT('USE `billing commit report test`;')
UNION ALL
/*Drop table if exists*/
SELECT CONCAT('DROP TABLE IF EXISTS `',
`table_schema`,
'`.`',
`table_name`, '`;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test'
	AND `table_name` LIKE '%master marked at risk report 202%'
UNION ALL
SELECT CONCAT('DROP TABLE IF EXISTS `',
`table_schema`,
'`.`',
`table_name`, '`;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test'
	AND `table_name` LIKE '%master mar temp 202%'
UNION ALL
SELECT CONCAT('DROP TABLE IF EXISTS `',
`table_schema`,
'`.`',
`table_name`, '`;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test'
	AND `table_name` LIKE '%master billing commit temp 202%'
UNION ALL
/*Delete Existing Columns*/
SELECT CONCAT('ALTER TABLE `',
`table_schema`,
'`.`',
`table_name`, '`',
' DROP `created_at`;') AS ddl
FROM `information_schema`.`columns`
WHERE `table_schema` = 'billing commit report test'
	AND `table_name` LIKE '%billing commit report 202%'
    AND `column_name` = 'created_at'
    AND `table_name` NOT LIKE '%master%'
UNION ALL
SELECT CONCAT('ALTER TABLE `',
`table_schema`,
'`.`',
`table_name`, '`',
' DROP `created_at`;') AS ddl
FROM `information_schema`.`columns`
WHERE `table_schema` = 'billing commit report test'
	AND `table_name` LIKE '%mark at risk in jde 202%'
    AND `column_name` = 'created_at'
    AND `table_name` NOT LIKE '%master%'
    AND `table_name` NOT LIKE '%morning%'
UNION ALL
/*Create Columns*/
SELECT CONCAT('ALTER TABLE `',
`table_schema`,
'`.`',
`table_name`, '`',
' ADD `created_at` DATE;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test' 
	AND `table_name` LIKE '%billing commit report 202%'
    AND `table_name` NOT LIKE '%master%'
    AND `table_name` NOT LIKE '%morning%'
UNION ALL
SELECT CONCAT('ALTER TABLE `',
`table_schema`,
'`.`',
`table_name`, '`',
' ADD `created_at` DATE;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test' 
	AND `table_name` LIKE '%mark at risk in jde 202%'
    AND `table_name` NOT LIKE '%master%'
    AND `table_name` NOT LIKE '%morning%'
UNION ALL
/*Populate Columns*/
SELECT CONCAT('UPDATE `',
`table_schema`,
'`.`',
`table_name`, '`',
' SET `created_at` = ', "'", RIGHT(`table_name`, 10), "';") AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test' 
	AND `table_name` LIKE '%billing commit report 202%'
    AND `table_name` NOT LIKE '%master%'
    AND `table_name` NOT LIKE '%morning%'
UNION ALL
SELECT CONCAT('UPDATE `',
`table_schema`,
'`.`',
`table_name`, '`',
' SET `created_at` = ', "'", RIGHT(`table_name`, 10), "';") AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test' 
	AND `table_name` LIKE '%mark at risk in jde 202%'
    AND `table_name` NOT LIKE '%master%'
    AND `table_name` NOT LIKE '%morning%'
UNION ALL
/*Create marked at risk table*/
SELECT CONCAT('CREATE TABLE `Master MAR Temp ',
CURDATE(), '` AS (')
UNION ALL
/*Merge all tables*/
SELECT CONCAT(GROUP_CONCAT('SELECT COUNT(*) AS `MAR Count`, `created_at` FROM `',
`table_schema`,
'`.`',
`table_name`, '` GROUP BY `created_at`' SEPARATOR ' UNION ALL '), ') ORDER BY `created_at`;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test' 
	AND `table_name` LIKE '%mark at risk in jde 202%'
    AND `table_name` NOT LIKE '%master%'
    AND `table_name` NOT LIKE '%morning%'
UNION ALL
/*Create billing commit table*/
SELECT CONCAT('CREATE TABLE `Master Billing Commit Temp ',
CURDATE(), '` AS (')
UNION ALL
/*Merge all tables*/
SELECT CONCAT(GROUP_CONCAT('SELECT COUNT(*) AS `Total Count`, `created_at` FROM `',
`table_schema`,
'`.`',
`table_name`, '` GROUP BY `created_at`' SEPARATOR ' UNION ALL '), ') ORDER BY `created_at`;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test' 
	AND `table_name` LIKE '%billing commit report 202%'
    AND `table_name` NOT LIKE '%master%'
    AND `table_name` NOT LIKE '%morning%'
UNION ALL
/*Create table*/
SELECT CONCAT('CREATE TABLE `Master Marked At Risk Report ',
CURDATE(), '` AS (')
UNION ALL
/*Create Master Table*/
SELECT CONCAT('SELECT a.* FROM (', GROUP_CONCAT('SELECT a.`created_at`, CONCAT(100 - ((b.`MAR Count`/a.`Total Count`)* 100), \'%\') AS `Marked At Risk Accurately` 
FROM `Master Billing Commit Temp ', CURDATE(), '` AS a
JOIN `Master MAR Temp ', CURDATE(), '` AS b
ON a.`created_at` = b.`created_at`
GROUP BY a.`created_at`'), ') AS a GROUP BY a.`created_at` ORDER BY a.`created_at`);')
UNION ALL
/*Populate table*/
SELECT CONCAT('SELECT * FROM `Master Marked At Risk Report ',
CURDATE(), '`')
INTO OUTFILE 'N:/All Business Units/Common Data/Business Analyst Team/SQL Queries/Temp Queries/Master Marked At Risk Data Dump.sql'
LINES TERMINATED BY '\r\n';