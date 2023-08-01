USE `S&OP`;

ALTER TABLE `customer_names`
DROP COLUMN `id`;

INSERT INTO `customer_names` (`Customer (Unit Cost)`, `Customer Name (Annual Budget/BU)`, `Customer Name (Commit)`, `Row Labels (3 Teams)`)
VALUES ('Promius', 'Promius', 'Promius', 'Promius');

CREATE TABLE `customer_names_temp1` AS (
SELECT *
FROM `customer_names`
ORDER BY `Customer (Unit Cost)` ASC);

ALTER TABLE `customer_names_temp1`
ADD COLUMN `id` INT PRIMARY KEY AUTO_INCREMENT FIRST;

DROP TABLE `customer_names`;

RENAME TABLE `customer_names_temp1` TO `customer_names`;

SELECT *
FROM `customer_names`;