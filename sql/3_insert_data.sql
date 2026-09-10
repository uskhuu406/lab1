USE fast_food_db;

-- 1. Category
INSERT INTO Category (category_name) VALUES
('Burger'),
('Drink'),
('Side'),
('Dessert');

-- 2. Branch
INSERT INTO Branch (branch_name, address) VALUES
('Sukhbaatar Branch', 'Sukhbaatar District'),
('Bayangol Branch', 'Bayangol District'),
('Khan-Uul Branch', 'Khan-Uul District');

-- 3. Customer
INSERT INTO Customer (customer_name, phone) VALUES
('Bat', '99112233'),
('Saraa', '88112233'),
('Temuulen', '99118822'),
('Anu', '88119922');

-- 4. Product
INSERT INTO Product (product_name, category_id, price, stock_quantity) VALUES
('Classic Burger', 1, 12000, 50),
('Cheese Burger', 1, 14000, 40),
('Cola', 2, 3500, 100),
('Fries', 3, 5000, 60),
('Ice Cream', 4, 4500, 30);

-- 5. Employee
INSERT INTO Employee (employee_name, branch_id) VALUES
('Bold', 1),
('Naraa', 2),
('Munkh', 3);

-- 6. Orders
INSERT INTO Orders (customer_id, employee_id, branch_id, status) VALUES
(1, 1, 1, 'Completed'),
(2, 2, 2, 'Completed'),
(3, 1, 1, 'Pending'),
(4, 3, 3, 'Completed');

-- 7. OrderDetail
INSERT INTO OrderDetail (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 12000),
(1, 3, 1, 3500),
(2, 4, 1, 5000),
(2, 3, 2, 3500),
(3, 2, 1, 14000),
(4, 5, 2, 4500);

-- 8. Payment
INSERT INTO Payment (order_id, payment_method, payment_amount) VALUES
(1, 'Card', 27500),
(2, 'Cash', 12000),
(4, 'Card', 9000);
SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM OrderDetail;
SELECT * FROM Payment;
USE fast_food_db;

-- Category
INSERT INTO Category (category_name) VALUES
('Burger'),
('Drink'),
('Side');

-- Branch
INSERT INTO Branch (branch_name, address) VALUES
('Sukhbaatar Branch', 'Sukhbaatar District'),
('Bayangol Branch', 'Bayangol District');

-- Customer
INSERT INTO Customer (customer_name, phone) VALUES
('Bat', '99112233'),
('Saraa', '88112233');

-- Employee
INSERT INTO Employee (employee_name, branch_id) VALUES
('Bold', 1),
('Naraa', 2);

-- Product
INSERT INTO Product
(product_name, category_id, price, stock_quantity) VALUES
('Classic Burger', 1, 12000, 50),
('Chicken Burger', 1, 14000, 40),
('Cola', 2, 3500, 100),
('Fries', 3, 5000, 60);

-- Orders
INSERT INTO Orders
(order_date, customer_id, employee_id, status) VALUES
('2026-09-10 12:00:00', 1, 1, 'Completed'),
('2026-09-10 13:00:00', 2, 2, 'Completed');

-- OrderDetail
INSERT INTO OrderDetail
(order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 12000),
(1, 3, 1, 3500),
(2, 4, 1, 5000),
(2, 3, 2, 3500);

-- Payment
INSERT INTO Payment
(order_id, payment_method, payment_amount) VALUES
(1, 'Card', 27500),
(2, 'Cash', 12000);

-- Check data
SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM OrderDetail;
SELECT * FROM Payment;
