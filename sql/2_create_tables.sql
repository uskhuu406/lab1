USE fast_food_db;

CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Branch (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,

    FOREIGN KEY (category_id)
        REFERENCES Category(category_id),

    CHECK (price > 0),
    CHECK (stock_quantity >= 0)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    branch_id INT NOT NULL,

    FOREIGN KEY (branch_id)
        REFERENCES Branch(branch_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    branch_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id),

    FOREIGN KEY (employee_id)
        REFERENCES Employee(employee_id),

    FOREIGN KEY (branch_id)
        REFERENCES Branch(branch_id)
);

CREATE TABLE OrderDetail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES Product(product_id),

    CHECK (quantity > 0),
    CHECK (unit_price > 0)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    CHECK (payment_amount > 0)
);
USE fast_food_db;

SHOW TABLES;
