CREATE DATABASE `company`;
USE `company`;

CREATE TABLE `departments` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(56) NOT NULL,
    `manager_id` INT NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `employees` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(56) NOT NULL,
    `department_id` INT,
    `salary` DECIMAL (10, 2) NOT NULL CHECK(`salary` > 0),
    `join_date` DATE NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`department_id`) REFERENCES `departments`(`id`)
);

INSERT INTO `departments` (`name`, `manager_id`)
VALUES 
('Sales', 1),
('Marketing', 2),
('Engineering', 3),
('HR', 4),
('Finance', 5);

SELECT * FROM `departments`;

INSERT INTO `employees` (`name`, `department_id`, `salary`, `join_date`)
VALUES 
('John', 1, 20000.00, '2020-01-15'),
('Mark', 2, 70000.00, '2019-05-11'),
('Emily', 3, 95000.00, '2020-08-19'),
('Robert', 4, 50000.00, '2021-03-01'),
('Sophia', 5, 85000.00, '2017-10-30'),
('David', 2, 65000.00, '2024-02-17'),
('Olivia', 3, 105000.00, '2022-09-06');

SELECT * FROM `employees`;

-- Q2.
SELECT `name` FROM `employees`;

-- Q3.
SELECT `name`, `manager_id` FROM `departments`;

-- Q4.
SELECT * FROM `employees`
ORDER BY `salary` DESC
LIMIT 1;

-- Q5.
SELECT * FROM `employees`
WHERE `join_date` LIKE '2024%';

-- Q7.
SELECT COUNT(*) AS `employees_count`
FROM `employees`;

-- Q8.
SELECT 	e.`name`, d.`name`
FROM `employees` e
JOIN `departments` d ON d.`id` = e.`department_id`;

-- Q9.
SELECT * FROM `employees`
WHERE `department_id` NOT IN (
	SELECT DISTINCT(`id`)
    FROM `departments`
);

-- Q10.
UPDATE `employees`
SET `salary` = 60000.00
WHERE `id` = 1;

SELECT * FROM `employees`
WHERE `id` = 1;