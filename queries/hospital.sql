CREATE DATABASE `hospital`;
USE `hospital`;

CREATE TABLE `patients` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(56) NOT NULL,
    `age` INT NOT NULL,
    `gender` ENUM('Male', 'Female'),
    PRIMARY KEY(`id`)
);

CREATE TABLE `appointments` (
	`id` INT AUTO_INCREMENT,
	`patient_id` INT,
    `doctor` VARCHAR(56) NOT NULL,
    `appointment_date` DATE NOT NULL,
    `fee` DECIMAL (10, 2) NOT NULL CHECK(`fee` > 0),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`patient_id`) REFERENCES `patients`(`id`)
);

-- Q1. 
INSERT INTO `patients` (`name`, `age`, `gender`)
VALUES 
('John', 45, 'Male'),
('Jane', 34, 'Female'),
('Alice', 60, 'Female'),
('Bob', 29, 'Male'),
('Emily', 22, 'Female'),
('David', 50, 'Male'),
('Sophia', 38, 'Female'),
('Michael', 72, 'Male');

SELECT * FROM `patients`;

INSERT INTO `appointments` (`patient_id`, `doctor`, `appointment_date`, `fee`)
VALUES 
(1, 'Dr. Sarah', '2023-10-15', 1500.00),
(1, 'Dr. Emily', '2023-11-03', 1800.00),
(1, 'Dr. Robert', '2023-10-20', 2000.00),
(4, 'Dr. David', '2023-10-18', 1200.00),
(4, 'Dr. Helen', '2023-09-25', 1000.00),
(6, 'Dr. Robert', '2023-11-01', 1600.00),
(7, 'Dr. Lisa', '2023-10-30', 1400.00),
(8, 'Dr. John', '2023-10-10', 2200.00);

SELECT * FROM `appointments`;

-- Q2.
SELECT `name` FROM `patients`;

-- Q3.
SELECT * FROM `appointments`
WHERE `doctor` = 'Dr. Robert';

-- Q4.
SELECT p.`name`, COUNT(*) AS `appointment_count` 
FROM `patients` p
JOIN `appointments` a ON p.`id` = a.`patient_id`
GROUP BY `patient_id`
ORDER BY `appointment_count` DESC
LIMIT 1;

-- Q5. 
SELECT * 
FROM `appointments`
WHERE `appointment_date` LIKE '2025-04-%';

-- Q6.
-- Q7. 
SELECT COUNT(*) AS `appointment_count`
FROM `appointments`;

-- Q8.
SELECT p.`id`, p.`name`, a.`doctor`, a.`appointment_date`, a.`fee`
FROM `patients` p
JOIN `appointments` a ON p.`id` = a.`patient_id`;

-- Q9.
SELECT * FROM `patients`
WHERE `id` NOT IN (
	SElECT `patient_id`
    FROM `appointments`
);

-- Q10.
UPDATE `appointments`
SET `appointment_date` = '2025-05-10'
WHERE `id` = 1;

SELECT * FROM `appointments`
WHERE `id` = 1;