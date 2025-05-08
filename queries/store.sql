USE `store`;

CREATE TABLE `customers` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(56) NOT NULL UNIQUE,
    PRIMARY KEY(`id`)
);

CREATE TABLE `products` (
	`id` INT AUTO_INCREMENT,
    `name` VARCHAR(56) NOT NULL UNIQUE,
    `price` DECIMAL(6, 2) NOT NULL CHECK(`price` > 0.00),
    PRIMARY KEY(`id`)
);

CREATE TABLE `orders` (
	`id` INT AUTO_INCREMENT,
    `customer_id` INT,
    `product_id` INT,
    `quantity` INT CHECK(`quantity` > 0) NOT NULL,
    `order_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`customer_id`) REFERENCES `customers`(`id`),
    FOREIGN KEY(`product_id`) REFERENCES `products`(`id`)
);

INSERT INTO `customers` (`name`) VALUES
('Mike'), ('Jade'), ('Ron'), ('John'), ('Alice');

INSERT INTO `products` (`name`, `price`) VALUES
('Milk 1L', 57.00),
('Egg', 7.00),
('Banana (dozen)', 80.00),
('Bread', 55.00),
('Butter 100g', 75.00),
('Tomato 1Kg', 20.00),
('Ice-cream', 20.00),
('Peanut Butter 350g', 145.00),
('Butter Milk', 20.00),
('Chips', 20.00);

INSERT INTO `orders` (`customer_id`, `product_id`, `quantity`, `order_date`) VALUES
(1, 1, 2, '2025-05-01 08:15:00'),
(1, 2, 1, '2025-05-01 09:00:00'),
(2, 5, 3, '2025-05-02 10:30:00'),
(3, 6, 1, '2025-05-02 11:45:00'),
(3, 7, 4, '2025-05-03 14:20:00'),
(4, 3, 2, '2025-05-03 15:05:00'),
(5, 8, 1, '2025-05-04 16:10:00'),
(1, 4, 1, '2025-05-04 17:25:00'),
(2, 9, 5, '2025-05-05 18:00:00'),
(5, 10, 3, '2025-05-06 19:30:00');

-- Q1.
SELECT * FROM `products`;
SELECT * FROM `orders`;

-- Q2.
SELECT `customer_id`, COUNT(*) AS `oerder_count`
FROM `orders`
GROUP BY `customer_id`;

-- Q3.
SELECT p.`name`, SUM(o.`quantity`) AS `quantity_sold`
FROM `products` p
JOIN `orders` o ON p.`id` = o.`product_id`
GROUP BY `product_id`;

-- Q4.
SELECT p.`name`, SUM(p.`price` * o.`quantity`) AS `revenue_generated`
FROM `products` P
JOIN `orders` o ON p.`id` = o.`product_id`
GROUP BY p.`id`
ORDER BY `revenue_generated` DESC
LIMIT 3;

-- Q5.
SELECT * FROM `orders`
WHERE `order_date` > '2025-05-05'
ORDER BY `order_date` DESC;

-- Q6.
-- Q7.
SELECT o.`customer_id`, SUM(p.`price` * o.`quantity`) AS `revenue_generated`
FROM `products` p
JOIN `orders` o ON p.`id` = o.`product_id`
GROUP BY o.`customer_id`;


