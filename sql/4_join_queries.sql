USE fast_food_db;

-- 1. Захиалга + хэрэглэгч
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.status
FROM Orders o
JOIN Customer c
    ON o.customer_id = c.customer_id;


-- 2. Бүтээгдэхүүн + ангилал
SELECT
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity
FROM Product p
JOIN Category c
    ON p.category_id = c.category_id;


-- 3. Захиалга + бүтээгдэхүүн
SELECT
    o.order_id,
    p.product_name,
    od.quantity,
    od.unit_price
FROM OrderDetail od
JOIN Orders o
    ON od.order_id = o.order_id
JOIN Product p
    ON od.product_id = p.product_id;


-- 4. Захиалга + ажилтан + салбар
SELECT
    o.order_id,
    e.employee_name,
    b.branch_name
FROM Orders o
JOIN Employee e
    ON o.employee_id = e.employee_id
JOIN Branch b
    ON e.branch_id = b.branch_id;


-- 5. Захиалга + төлбөр
SELECT
    o.order_id,
    p.payment_method,
    p.payment_amount
FROM Orders o
JOIN Payment p
    ON o.order_id = p.order_id;
