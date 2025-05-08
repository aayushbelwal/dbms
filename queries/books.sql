CREATE DATABASE `books`;
USE `books`;

CREATE TABLE `professors` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(56) NOT NULL,
    `department` ENUM('Operations Research', 'Mathematics', 'Computer Science', 'Physics', 'Economics') NOT NULL,
    `age` INT NOT NULL,
    `salary` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY(`id`)
);

CREATE TABLE `publications` (
	`id` INT AUTO_INCREMENT,
	`professor_id` INT,
    `title` VARCHAR(56) NOT NULL,
    `journal` VARCHAR(56) NOT NULL,
    `year` INT NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`professor_id`) REFERENCES `professors`(`id`)
);

DROP TABLE `professors`;

-- Q1.
INSERT INTO `professors` (`name`, `age`, `department`, `salary`) 
VALUES 
('Dr. Alice', 45, 'Operations Research', 85000.00),
('Dr. Rahul', 50, 'Mathematics', 90000.00),
('Dr. Sneha', 38, 'Operations Research', 75000.00),
('Dr. Vikram', 42, 'Mathematics', 82000.00),
('Dr. Priya', 47, 'Computer Science', 88000.00),
('Dr. Sanjay', 55, 'Physics', 91000.00),
('Dr. Neha', 36, 'Economics', 76000.00),
('Dr. Arjun', 48, 'Operations Research', 89000.00),
('Dr. Megha', 40, 'Mathematics', 84000.00),
('Dr. Kunal', 44, 'Computer Science', 87000.00);

SELECT * FROM `professors`;

INSERT INTO `publications` (`professor_id`, `title`, `journal`, `year`) 
VALUES 
(1, 'Optimization Techniques in Operations Research', 'Journal of OR Studies', 2021),
(2, 'Advanced Algebraic Structures', 'Mathematics Today', 2019),
(3, 'Decision Making in Operations Research', 'OR Review', 2022),
(4, 'Number Theory and Its Applications', 'Pure Mathematics Journal', 2020),
(5, 'Machine Learning and Its Impact', 'Computer Science Review', 2023),
(6, 'Quantum Mechanics Simplified', 'Physics Journal', 2018),
(7, 'Economic Modelling Strategies', 'Economic Review', 2021),
(8, 'Supply Chain Optimization', 'OR Journal', 2020),
(9, 'Mathematical Foundations of AI', 'Mathematics and AI Journal', 2022),
(10, 'Data Structures and Algorithms', 'CS Monthly', 2021);

SELECT * FROM `publications`;

-- Q2. 
SELECT * FROM `professors`
WHERE `department` = 'Operations Research';

-- Q3.
ALTER TABLE `professors`
ADD COLUMN `email` VARCHAR(100) NOT NULL;

UPDATE `professors`
SET `email` = 
CASE `id`
    WHEN 1 THEN 'alice.sharma@example.com'
    WHEN 2 THEN 'rahul.mehta@example.com'
    WHEN 3 THEN 'sneha.patel@example.com'
    WHEN 4 THEN 'vikram.das@example.com'
    WHEN 5 THEN 'priya.kapoor@example.com'
    WHEN 6 THEN 'sanjay.kumar@example.com'
    WHEN 7 THEN 'neha.verma@example.com'
    WHEN 8 THEN 'arjun.rao@example.com'
    WHEN 9 THEN 'megha.singh@example.com'
    WHEN 10 THEN 'kunal.thakur@example.com'
END 
WHERE `id` BETWEEN 1 AND 10;

SELECT * FROM `professors`;

-- Q4.
SELECT ROUND(AVG(`salary`), 2) AS `avg_salary_of_mathematics_professor`
FROM `professors`
WHERE `department` = 'Mathematics';
