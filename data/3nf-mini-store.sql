-- 1. Create the Customers Table
-- This removes transitive dependencies from the Orders table.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_country VARCHAR(50)
);

-- 2. Redefine the Orders Table
-- This table now only contains attributes directly dependent on order_id.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 3. Migration of Data
INSERT INTO customers (customer_id, customer_name, customer_email, customer_country) VALUES
(5001, 'Alice Smith', 'alice@example.com', 'USA'),
(5002, 'Hiroshi Tanaka', 'hiro@example.jp', 'Japan'),
(5003, 'Maria Garcia', 'maria@example.es', 'Spain');

INSERT INTO orders (order_id, order_date, customer_id) VALUES
(101, '2023-10-01', 5001),
(102, '2023-10-01', 5002),
(103, '2023-10-02', 5003);