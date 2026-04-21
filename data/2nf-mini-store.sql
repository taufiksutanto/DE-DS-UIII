-- 1. Create the Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

-- 2. Create the Orders Table (Contains redundant customer info for now; to be fixed in 3NF)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_country VARCHAR(50)
);

-- 3. Create the Order Items Table (The "Link" Table)
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 4. Sample Data Migration (Representative Data)
INSERT INTO products (product_id, product_name, product_category, unit_price) VALUES
(201, 'Wireless Mouse', 'Accessories', 25.00),
(205, 'Mechanical Keyboard', 'Accessories', 75.00),
(301, 'USB-C Hub', 'Hardware', 45.00),
(302, 'HDMI Cable', 'Hardware', 15.00);

INSERT INTO orders (order_id, order_date, customer_id, customer_name, customer_email, customer_country) VALUES
(101, '2023-10-01', 5001, 'Alice Smith', 'alice@example.com', 'USA'),
(102, '2023-10-01', 5002, 'Hiroshi Tanaka', 'hiro@example.jp', 'Japan'),
(103, '2023-10-02', 5003, 'Maria Garcia', 'maria@example.es', 'Spain');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 201, 2),
(101, 205, 1),
(102, 201, 1),
(103, 301, 3),
(103, 302, 2);