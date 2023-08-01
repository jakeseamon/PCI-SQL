/*Connect to billing commit report test database*/
SELECT CONCAT('USE `billing commit report test`;')
UNION ALL
/*Drop table if exists*/
SELECT CONCAT('DROP TABLE IF EXISTS `',
`table_schema`,
'`.`',
`table_name`, '`;') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test' 
	AND `table_name` LIKE '%master prom ship commit alignment report 202%'
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
/*Create table*/
SELECT CONCAT('CREATE TABLE `Master Prom Ship Commit Alignment Report ',
CURDATE(), '` AS (')
UNION ALL
/*Merge all tables*/
SELECT CONCAT('SELECT a.* FROM (', GROUP_CONCAT('SELECT a.`created_at`, CONCAT(b.`Allign Count`/a.`Total Count` * 100, \'%\') AS `Alignment %`
FROM (SELECT COUNT(`WO`) AS `Total Count`, `Prom Ship`, `Planned Bill Date`, `created_at` FROM `', `table_schema`, '`.`', `table_name`, '` WHERE `Prom Ship` <> \'\') AS a
JOIN (SELECT COUNT(`WO`) AS `Allign Count`, `Prom Ship`, `Planned Bill Date`, `created_at` FROM `', `table_schema`, '`.`', `table_name`, '` WHERE MONTH(STR_TO_DATE(`Prom Ship`, \'%m/%d/%Y\')) = MONTH(STR_TO_DATE(`Planned Bill Date`, \'%m/%d/%Y\'))) AS b' SEPARATOR ' UNION ALL '), ') AS a ORDER BY a.`created_at`);') AS ddl
FROM `information_schema`.`tables`
WHERE `table_schema` = 'billing commit report test' 
	AND `table_name` LIKE '%billing commit report 202%'
    AND `table_name` NOT LIKE '%master%'
    AND RIGHT(`table_name`, 10) > '2021-11-04'
    AND `table_name` NOT LIKE '%morning%'
UNION ALL
/*Populate table*/
SELECT CONCAT('SELECT * FROM `Master Prom Ship Commit Alignment Report ',
CURDATE(), '`')
INTO OUTFILE 'N:/All Business Units/Common Data/Business Analyst Team/SQL Queries/Temp Queries/Master Prom Ship Commit Alignment Data Dump.sql'
LINES TERMINATED BY '\r\n';