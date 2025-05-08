CREATE DATABASE `wages`;
USE `wages`;

CREATE TABLE `employees` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(56) NOT NULL,
    `department` ENUM('HR', 'Finance', 'IT', 'Accounts', 'Electronics') NOT NULL,
    `gender` ENUM('Male', 'Female') NOT NULL,
    `age` INT NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `salaries` (
	`employee_id` INT,
    `base_salary` DECIMAL(10, 2) NOT NULL,
    `bonus` DECIMAL(10, 2) NOT NULL,
    `deduction` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY(`employee_id`) REFERENCES `employees`(`id`)
);

-- Q1.
INSERT INTO `employees` (`name`, `department`, `gender`, `age`) VALUES
('Alice', 'HR', 'Female', 29),
('Bob', 'Finance', 'Male', 35),
('Charlie', 'IT', 'Male', 28),
('David', 'Accounts', 'Male', 40),
('Eve', 'Electronics', 'Female', 26),
('Frank', 'HR', 'Male', 32),
('Grace', 'Finance', 'Female', 30),
('Hank', 'IT', 'Male', 27),
('Ivy', 'Accounts', 'Female', 38),
('Jack', 'Electronics', 'Male', 25);

SELECT * FROM `employees`;

INSERT INTO `salaries` (`employee_id`, `base_salary`, `bonus`, `deduction`) VALUES
(1, 50000.00, 5000.00, 2000.00),
(2, 60000.00, 6000.00, 2500.00),
(3, 55000.00, 5500.00, 2200.00),
(4, 70000.00, 7000.00, 3000.00),
(5, 45000.00, 4500.00, 1800.00),
(6, 52000.00, 5200.00, 2100.00),
(7, 62000.00, 6200.00, 2700.00),
(8, 57000.00, 5700.00, 2300.00),
(9, 71000.00, 7100.00, 3200.00),
(10, 46000.00, 4600.00, 1900.00);

SELECT * FROM `salaries`;

-- Q2.
SELECT * FROM `employees`
WHERE `department` = 'Finance';

-- Q3. 
SELECT *, s.`base_salary` + s.`bonus` - s.`deduction` AS `net_salary`
FROM `employees` e
JOIN `salaries` s ON e.`id` = s.`employee_id`
ORDER BY `net_salary` DESC
LIMIT 1;

-- Q4.
ALTER TABLE `salaries`
ADD COLUMN `allowance` DECIMAL(10,2) NOT NULL DEFAULT 0.00;

UPDATE `salaries` 
SET `allowance` = 
CASE
    WHEN 1 THEN 3000.00
    WHEN 2 THEN 3500.00
    WHEN 3 THEN 3200.00
    WHEN 4 THEN 4000.00
    WHEN 5 THEN 2800.00
    WHEN 6 THEN 3100.00
    WHEN 7 THEN 3600.00
    WHEN 8 THEN 3300.00
    WHEN 9 THEN 4200.00
    WHEN 10 THEN 2900.00
END
WHERE `employee_id` BETWEEN 1 AND 10;

SELECT * FROM `salaries`;

-- Q5. 
SELECT *, s.`base_salary` + s.`bonus` + s.`allowance` - s.`deduction` 
AS `total_compensation`
FROM `employees` e
JOIN `salaries` s ON e.`id` = s.`employee_id`
ORDER BY `total_compensation` DESC
LIMIT 3;

-- Q6.
SELECT ROUND(AVG(`age`), 2) AS `avg_height_of_HR`
FROM `employees`
WHERE `department` = 'HR';

-- Q7.
SELECT *, s.`base_salary` + s.`bonus` - s.`deduction`  AS `net_salary`
FROM `employees` e
JOIN `salaries` s ON e.`id` = s.`employee_id`
WHERE (s.`base_salary` + s.`bonus` - s.`deduction`) > (
	SELECT AVG(`base_salary` + `bonus` - `deduction`)
	FROM `salaries`
);