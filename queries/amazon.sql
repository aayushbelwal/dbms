CREATE DATABASE `amazon`;
USE `amazon`;

-- DROP TABLE `customers`;
-- DROP TABLE `products`;
-- DROP TABLE `orders`; 

CREATE TABLE `customers` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    PRIMARY KEY(`id`)    
);

CREATE TABLE `products` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) UNIQUE NOT NULL,
    `price` DECIMAL(5, 2) NOT NULL DEFAULT 0.00 CHECK(`price` >= 0),
    PRIMARY KEY(`id`)
);

CREATE TABLE `orders` (
	`id` INT AUTO_INCREMENT,
    `customer_id` INT,
    `product_id` INT,
    `quantity` TINYINT NOT NULL DEFAULT 1 CHECK(`quantity` > 0),
    `amount_payable` DECIMAL(10, 2) NOT NULL CHECK(`amount_payable` > 0),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`customer_id`) REFERENCES `customers`(`id`) ON DELETE SET NULL,
    FOREIGN KEY(`product_id`) REFERENCES `products`(`id`) ON DELETE SET NULL
);

INSERT INTO `customers`
(`name`) VALUES
	('John Doe'),
	('Mike'),
	('Jade Rose'),
	('Alice'),
	('Zen Clark');

INSERT INTO `products`
(`name`, `price`) VALUES
	('Milk 1L', 56),
	('Bread', 55),
	('Egg', 8);

INSERT INTO `orders` 
(`customer_id`, `product_id`, `quantity`, `amount_payable`) VALUES
	(1, 1, 2, 112),
    (1, 2, 1, 55),
    (2, 3, 12, 96),
    (3, 1, 1, 56);

SELECT * FROM `customers`;
SELECT * FROM `products`;
SELECT * FROM `orders`;

-- RENAME 
RENAME TABLE `customers` TO `clients`;

SELECT * FROM `clients`;

-- UPDATE
UPDATE `products` 
SET `price` = 68 WHERE `id` = 1;

SELECT * FROM `products`;

-- ALTER
ALTER TABLE `clients`
ADD `email` VARCHAR(128) UNIQUE;

SELECT * FROM `clients`;

-- DROP
ALTER TABLE `clients`
DROP COLUMN `email`;

SELECT * FROM `clients`;