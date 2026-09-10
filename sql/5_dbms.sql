USE fast_food_db;

-- 1. Data storage, retrieval, and update

INSERT INTO Category (category_name)
VALUES ('Test Category');

SET @category_id = LAST_INSERT_ID();

SELECT *
FROM Category
WHERE category_id = @category_id;

UPDATE Category
SET category_name = 'Updated Category'
WHERE category_id = @category_id;

SELECT *
FROM Category
WHERE category_id = @category_id;


-- 2. A user-accessible catalog

SHOW TABLES;

DESCRIBE Product;


-- 3. Transaction support

START TRANSACTION;

UPDATE Product
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

SELECT product_id, product_name, stock_quantity
FROM Product
WHERE product_id = 1;

ROLLBACK;

SELECT product_id, product_name, stock_quantity
FROM Product
WHERE product_id = 1;


-- 4. Concurrency control services
-- Энийг 2 тусдаа session дээр туршина.

-- Session 1:
START TRANSACTION;

SELECT product_id, product_name, stock_quantity
FROM Product
WHERE product_id = 1
FOR UPDATE;

-- Session 2 дээр ажиллуулах:
-- UPDATE Product
-- SET stock_quantity = stock_quantity - 1
-- WHERE product_id = 1;

-- Session 1 дээр lock суллах:
ROLLBACK;


-- 5. Recovery services

START TRANSACTION;

SAVEPOINT before_price_change;

UPDATE Product
SET price = 99999
WHERE product_id = 1;

SELECT product_id, product_name, price
FROM Product
WHERE product_id = 1;

ROLLBACK TO SAVEPOINT before_price_change;

SELECT product_id, product_name, price
FROM Product
WHERE product_id = 1;

COMMIT;


-- 6. Authorization services

CREATE USER IF NOT EXISTS 'report_user'@'localhost'
IDENTIFIED BY 'Test1234!';

GRANT SELECT
ON fast_food_db.*
TO 'report_user'@'localhost';

SHOW GRANTS
FOR 'report_user'@'localhost';


-- 7. Support for data communication

SELECT CONNECTION_ID();

SELECT USER();

SELECT DATABASE();

SHOW PROCESSLIST;


-- 8. Integrity services

SHOW CREATE TABLE Product;

-- CHECK constraint турших жишээ
-- Доорх query зориуд error өгөх ёстой.

UPDATE Product
SET price = -5000
WHERE product_id = 1;


-- 9. Services to promote data independence

CREATE OR REPLACE VIEW order_summary AS
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.status
FROM Orders o
JOIN Customer c
    ON o.customer_id = c.customer_id;

SELECT *
FROM order_summary;


-- 10. Utility services

SHOW TABLE STATUS;

CHECK TABLE Product;

ANALYZE TABLE Product;
