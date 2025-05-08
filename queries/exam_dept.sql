CREATE DATABASE `exam_dept`;
USE `exam_dept`;

-- DROP TABLE `students`;
-- DROP TABLE `cources`;
-- DROP TABLE `results`;

CREATE TABLE `students` (
	`id` INT,
    `name` VARCHAR(64)
);

CREATE TABLE `courses` (
	`id` INT,
    `name` VARCHAR(64),
    `exam_date` DATE,
    `total_marks` INT
);

CREATE TABLE `results` (
	`id` INT,
    `student_id` INT,
    `course_id` INT,
    `marks_obtained` INT
);

INSERT INTO `students` 
VALUES
	(101, 'John Doe'),
	(102, 'Mike'),
	(103, 'Jade Rose'),
	(104, 'Alice'),
	(105, 'Zen Clark');

INSERT INTO `courses`
VALUES
	(1, 'Queueing Systems', '2024-12-02', 100),
	(2, 'Statistics', '2024-12-13', 100),
	(3, 'Database Management Systems', '2024-12-18', 100);

INSERT INTO `results`
VALUES
	(1, 101, 2, 80),
	(2, 102, 1, 52),
	(3, 102, 2, 76),
	(4, 103, 3, 27);

SELECT * FROM `students`;
SELECT * FROM `courses`;
SELECT * FROM `results`;

DROP DATABASE `exam_dept`;