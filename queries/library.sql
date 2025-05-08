CREATE DATABASE `library`;
USE `library`;

CREATE TABLE `books` (
	`id` INT AUTO_INCREMENT,
    `title` VARCHAR(56) NOT NULL,
    `author` VARCHAR(56) NOT NULL,
	`genre` ENUM('Fiction', 'Science', 'Fantasy', 'Mystery') NOT NULL,
    `publish_year` INT NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `borrows` (
	`id` INT AUTO_INCREMENT,
	`book_id` INT,
	`member_id` INT,
    `borrow_date` DATE NOT NULL,
    `return_date` DATE NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`book_id`) REFERENCES `books`(`id`)
);

-- Q1.
INSERT INTO `books` (`title`, `author`, `genre`, `publish_year`) VALUES
('The Time Machine', 'Herbert', 'Science', 1895),
('Murder on the Orient Express', 'Agatha', 'Mystery', 1934),
('Harry Potter and the Sorcerer''s Stone', 'Joanne', 'Fantasy', 1997),
('1984', 'George', 'Fiction', 1949),
('A Brief History of Time', 'Stephen', 'Science', 1988),
('The Hobbit', 'John', 'Fantasy', 1937),
('The Da Vinci Code', 'Dan', 'Mystery', 2003),
('To Kill a Mockingbird', 'Harper', 'Fiction', 1960),
('The Martian', 'Andy', 'Science', 2011),
('Gone Girl', 'Gillian', 'Mystery', 2012);

SELECT * FROM `books`;

INSERT INTO `borrows` (`book_id`, `member_id`, `borrow_date`, `return_date`) VALUES
(1, 101, '2025-04-01', '2025-04-15'),
(2, 102, '2025-04-03', '2025-04-17'),
(2, 103, '2025-04-05', '2025-04-19'),
(2, 104, '2025-04-07', '2025-04-21'),
(5, 103, '2025-04-09', '2025-04-23'),
(6, 103, '2025-04-11', '2025-04-25'),
(7, 104, '2025-04-13', '2025-04-27'),
(8, 108, '2025-04-15', '2025-04-29'),
(9, 109, '2025-04-17', '2025-05-01'),
(10, 110, '2025-04-19', '2025-05-03');

SELECT * FROM `borrows`;

-- Q2.
SELECT * FROM `books`
WHERE `author` = 'Andy';

-- Q3.

SELECT boo.*, COUNT(bor.`book_id`)  AS `borrow_count`
FROM `books` boo
JOIN `borrows` bor ON boo.`id` = bor.`book_id`
GROUP BY bor.`book_id`
ORDER BY `borrow_count` DESC
LIMIT 1;

-- Q4.
ALTER TABLE `books`
ADD COLUMN `ISBN` VARCHAR(20) NOT NULL;

UPDATE `books` 
SET `ISBN` = 
  CASE 
    WHEN `id` = 1 THEN '9780451528551'
    WHEN `id` = 2 THEN '9780062073488'
    WHEN `id` = 3 THEN '9780590353427'
    WHEN `id` = 4 THEN '9780451524935'
    WHEN `id` = 5 THEN '9780553380163'
    WHEN `id` = 6 THEN '9780345339683'
    WHEN `id` = 7 THEN '9780307474278'
    WHEN `id` = 8 THEN '9780061120084'
    WHEN `id` = 9 THEN '9780553418026'
    WHEN `id` = 10 THEN '9780307588371'
  END
WHERE `id` BETWEEN 1 AND 10;

SELECT * FROM `books`;

-- Q5.
SELECT bor.`member_id`, COUNT(bor.`book_id`)  AS `borrow_count`
FROM `books` boo
JOIN `borrows` bor ON boo.`id` = bor.`book_id`
GROUP BY bor.`member_id`
ORDER BY `borrow_count` DESC
LIMIT 3;

-- Q6.
SELECT AVG(DATEDIFF(`return_date`, `borrow_date`)) AS `avg_borrow_days`
FROM `borrows`;

-- Q7.
SELECT boo.`title`, bor.`member_id`
FROM `borrows` bor
JOIN `books` boo ON bor.`book_id` = boo.`id`
WHERE bor.`member_id` IN (
    SELECT `member_id`
    FROM `borrows`
    GROUP BY `member_id`
    HAVING COUNT(*) > 5
);

