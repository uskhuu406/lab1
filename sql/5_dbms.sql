USE fast_food_db;
INSERT INTO Category (category_name)
VALUES ('Test Category');

SELECT *
FROM Category;

UPDATE Category
SET category_name = 'Updated Category'
WHERE category_id = 9;

SELECT *
FROM Category
WHERE category_id = 9;

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

-- 5. Recovery services

START TRANSACTION;

SELECT product_id, product_name, price
FROM Product
WHERE product_id = 1;

SAVEPOINT before_price_change;

UPDATE Product
SET price = 9
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

UPDATE Product
SET price = -5000
WHERE product_id = 1;

-- 9. Services to promote data independence

CREATE OR REPLACE VIEW order_summary AS SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.status
FROM Orders o JOIN Customer c
    ON o.customer_id = c.customer_id;
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
SELECT *
FROM order_summary;
-- 10. Utility services

SHOW TABLE STATUS;

CHECK TABLE Product;

ANALYZE TABLE Product;
