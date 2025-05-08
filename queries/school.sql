CREATE DATABASE `school`;
USE `school`;

CREATE TABLE `students` (
	`id` INT AUTO_INCREMENT,
	`name` VARCHAR(56) NOT NULL,
    `gender` ENUM('Male', 'Female') NOT NULL,
    `age` INT NOT NULL,
    `class` ENUM('10th Grade', '11th Grade', '12th Grade'),
    PRIMARY KEY(`id`)
);

CREATE TABLE `exams` (
	`student_id` INT,
    `math_score` DECIMAL(5, 2) NOT NULL,
    `science_score` DECIMAL(5, 2) NOT NULL,
    `english_score` DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY(`student_id`) REFERENCES `students`(`id`)
);

-- Q1.
INSERT INTO `students` (`name`, `gender`, `age`, `class`)
VALUES
('Alice', 'Female', 16, '10th Grade'),
('Bob', 'Male', 17, '11th Grade'),
('Charlie', 'Male', 18, '12th Grade'),
('Diana', 'Female', 16, '10th Grade'),
('Ethan', 'Male', 17, '11th Grade'),
('Fiona', 'Female', 18, '12th Grade'),
('George', 'Male', 15, '10th Grade'),
('Hannah', 'Female', 16, '10th Grade'),
('Isaac', 'Male', 17, '11th Grade'),
('Julia', 'Female', 18, '12th Grade');

SELECT * FROM `students`;

INSERT INTO `exams` (`student_id`, `math_score`, `science_score`, `english_score`)
VALUES
(1, 88.50, 92.00, 85.75),
(2, 78.25, 84.50, 79.00),
(3, 90.00, 87.25, 91.50),
(4, 85.00, 88.50, 87.00),
(5, 76.75, 80.25, 78.00),
(6, 92.50, 91.00, 93.00),
(7, 84.00, 88.00, 86.00),
(8, 91.25, 89.75, 90.50),
(9, 79.50, 82.75, 80.25),
(10, 87.00, 85.50, 89.00);

SELECT * FROM `exams`;

-- Q2.
SELECT * FROM `students`
WHERE `gender` = 'Male' AND `class` = '12th Grade';

-- Q3.
SELECT *, e.`math_score` + e.`science_score` + e.`english_score` AS `total_score`
FROM `students` s
JOIN `exams` e ON s.`id` = e.`student_id`
ORDER BY `total_score` DESC
LIMIT 1;

-- Q4.
ALTER TABLE `exams`
ADD COLUMN `history_score` DECIMAL(5, 2) NOT NULL;

UPDATE `exams`
SET `history_score` = 
CASE
WHEN `student_id` = 1 THEN 89.00
WHEN `student_id` = 2 THEN 77.50
WHEN `student_id` = 3 THEN 92.00
WHEN `student_id` = 4 THEN 84.25
WHEN `student_id` = 5 THEN 78.50
WHEN `student_id` = 6 THEN 90.75
WHEN `student_id` = 7 THEN 85.00
WHEN `student_id` = 8 THEN 88.00
WHEN `student_id` = 9 THEN 80.50
WHEN `student_id` = 10 THEN 86.25
END
WHERE `student_id` BETWEEN 1 AND 10;

SELECT * FROM `exams`;

-- Q5.
SELECT *, e.`math_score` + e.`science_score` + e.`english_score` + e.`history_score` 
AS `total_score`
FROM `students` s
JOIN `exams` e ON s.`id` = e.`student_id`
WHERE `class` = '11th Grade'
ORDER BY `total_score` DESC
LIMIT 3;

-- Q6.
SELECT ROUND(AVG(`age`), 2) AS `average_age_10th_grade`
FROM `students`
WHERE `class` = '10th Grade';

-- Q7.
SELECT s.`name`, e.`math_score`
FROM `students` s
JOIN `exams` e ON s.`id` = e.`student_id`
WHERE e.`math_score` > (
    SELECT AVG(`math_score`)
    FROM `exams`
);
