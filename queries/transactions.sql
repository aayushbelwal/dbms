CREATE DATABASE `transactions`;
USE `transactions`;

CREATE TABLE `customers` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(56) NOT NULL,
    `age` INT NOT NULL,
    `city` ENUM('New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix') NOT NULL,
    `phone_number` CHAR(10),
    PRIMARY KEY(`id`)
);

CREATE TABLE `transactions` (
	`id` INT AUTO_INCREMENT,
	`customer_id` INT,
    `amount` DECIMAL(10, 2) NOT NULL CHECK(`amount` > 0),
    `transaction_date` DATE NOT NULL,
    `transaction_type` ENUM('Deposit', 'Withdrawal') NOT NULL,
    PRIMARY KEY(`id`)
);

-- Q1. 
INSERT INTO `customers` (`name`, `age`, `city`, `phone_number`)
VALUES
('John Doe', 28, 'New York', '1234567890'),
('Jane Smith', 35, 'Los Angeles', '0987654321'),
('Sam Brown', 42, 'Chicago', '1122334455'),
('Alice White', 29, 'Houston', '2233445566'),
('Bob Green', 56, 'Phoenix', '3344556677'),
('Emily Black', 31, 'New York', '4455667788'),
('David Gray', 38, 'Los Angeles', '5566778899'),
('Sophia Blue', 25, 'Chicago', '6677889900'),
('Michael Red', 46, 'Houston', '7788990011'),
('Olivia Purple', 53, 'Phoenix', '8899001122');

SELECT * FROM `customers`;

INSERT INTO `transactions` (`customer_id`, `amount`, `transaction_date`, `transaction_type`)
VALUES
(1, 100.00, '2025-05-01', 'Deposit'),
(1, 50.00, '2025-05-03', 'Withdrawal'),
(2, 200.00, '2025-05-02', 'Deposit'),
(3, 300.00, '2025-05-01', 'Withdrawal'),
(4, 150.00, '2025-05-04', 'Deposit'),
(5, 250.00, '2025-05-02', 'Withdrawal'),
(6, 500.00, '2025-05-05', 'Deposit'),
(7, 600.00, '2025-05-03', 'Withdrawal'),
(9, 400.00, '2025-05-02', 'Withdrawal');

SELECT * FROM `transactions`;

-- Q2.
SELECT * FROM `customers`
WHERE `city` = 'New York';

-- Q3.
SELECT c.*, SUM(t.`amount`) AS `total_transaction`
FROM  `customers` c
JOIN `transactions` t ON c.`id` = t.`customer_id`
GROUP BY t.`customer_id`
ORDER BY `total_transaction` DESC
LIMIT 1;

-- Q4.
ALTER TABLE `customers`
ADD COLUMN `email` VARCHAR(100) NOT NULL;

UPDATE `customers` 
SET `email` = 
CASE
    WHEN 1 THEN 'johndoe@example.com'
    WHEN 2 THEN 'janesmith@example.com'
    WHEN 3 THEN 'sambrown@example.com'
    WHEN 4 THEN 'alicewhite@example.com'
    WHEN 5 THEN 'bobgreen@example.com'
    WHEN 6 THEN 'emilyblack@example.com'
    WHEN 7 THEN 'davidgray@example.com'	
    WHEN 8 THEN 'sophiablue@example.com'
    WHEN 9 THEN 'michaelred@example.com'
    WHEN 10 THEN 'oliviapurple@example.com'
END
WHERE `id` BETWEEN 1 AND 10;

SELECT * FROM `customers`;

-- Q5.
SELECT c.*, COUNT(t.`customer_id`) AS `transaction_count`
FROM  `customers` c
JOIN `transactions` t ON c.`id` = t.`customer_id`
GROUP BY t.`customer_id`
ORDER BY `transaction_count` DESC
LIMIT 3;

-- Q6.
SELECT ROUND(AVG(`amount`), 2) AS `avg_transaction_amount`
FROM `transactions`
WHERE `transaction_type` = 'Deposit';

-- Q7.
SELECT c.*, SUM(t.`amount`) AS `total_transaction`
FROM  `customers` c
JOIN `transactions` t ON c.`id` = t.`customer_id`
GROUP BY t.`customer_id`
HAVING `total_transaction` > 500;
