-- 1. Create the 1NF compliant table
-- Notice that data types for IDs and Prices are now numeric since cells are atomic.
CREATE TABLE online_retail_1nf (
    order_id INT,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_country VARCHAR(50),
    product_id INT,
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    unit_price DECIMAL(10, 2),
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

-- 2. Populate with atomic values (Flattened Data)
INSERT INTO online_retail_1nf VALUES 
-- Order 101 split into two rows
(101, '2023-10-01', 5001, 'Alice Smith', 'alice@example.com', 'USA', 201, 'Wireless Mouse', 'Accessories', 25.00, 2),
(101, '2023-10-01', 5001, 'Alice Smith', 'alice@example.com', 'USA', 205, 'Mechanical Keyboard', 'Accessories', 75.00, 1),
-- Order 102 (was already atomic)
(102, '2023-10-01', 5002, 'Hiroshi Tanaka', 'hiro@example.jp', 'Japan', 201, 'Wireless Mouse', 'Accessories', 25.00, 1),
-- Order 103 split into two rows
(103, '2023-10-02', 5003, 'Maria Garcia', 'maria@example.es', 'Spain', 301, 'USB-C Hub', 'Hardware', 45.00, 3),
(103, '2023-10-02', 5003, 'Maria Garcia', 'maria@example.es', 'Spain', 302, 'HDMI Cable', 'Hardware', 15.00, 2),
-- Order 104
(104, '2023-10-02', 5001, 'Alice Smith', 'alice@example.com', 'USA', 301, 'USB-C Hub', 'Hardware', 45.00, 1),
-- Order 106 split into two rows
(106, '2023-10-03', 5005, 'Chloe Dubois', 'chloe@example.fr', 'France', 401, 'Webcam HD', 'Electronics', 60.00, 1),
(106, '2023-10-03', 5005, 'Chloe Dubois', 'chloe@example.fr', 'France', 402, 'Ring Light', 'Electronics', 30.00, 1),
-- Order 108 split into two rows
(108, '2023-10-04', 5006, 'Lars Jensen', 'lars@example.dk', 'Denmark', 201, 'Wireless Mouse', 'Accessories', 25.00, 1),
(108, '2023-10-04', 5006, 'Lars Jensen', 'lars@example.dk', 'Denmark', 302, 'HDMI Cable', 'Hardware', 15.00, 5),
-- Order 112 split into two rows
(112, '2023-10-06', 5009, 'Zoe Chen', 'zoe@example.cn', 'China', 301, 'USB-C Hub', 'Hardware', 45.00, 2),
(112, '2023-10-06', 5009, 'Zoe Chen', 'zoe@example.cn', 'China', 201, 'Wireless Mouse', 'Accessories', 25.00, 2),
-- Order 114 split into two rows
(114, '2023-10-07', 5010, 'John Doe', 'john@example.uk', 'UK', 205, 'Mechanical Keyboard', 'Accessories', 75.00, 1),
(114, '2023-10-07', 5010, 'John Doe', 'john@example.uk', 'UK', 302, 'HDMI Cable', 'Hardware', 15.00, 1),
-- Order 118 split into two rows
(118, '2023-10-09', 5012, 'Liam Wilson', 'liam@example.au', 'Australia', 301, 'USB-C Hub', 'Hardware', 45.00, 1),
(118, '2023-10-09', 5012, 'Liam Wilson', 'liam@example.au', 'Australia', 501, 'Laptop Stand', 'Office', 35.00, 1),
-- Order 120 split into two rows
(120, '2023-10-10', 5013, 'Fatima Al-Sayed', 'fatima@example.sa', 'Saudi Arabia', 401, 'Webcam HD', 'Electronics', 60.00, 1),
(120, '2023-10-10', 5013, 'Fatima Al-Sayed', 'fatima@example.sa', 'Saudi Arabia', 302, 'HDMI Cable', 'Hardware', 15.00, 3),
-- Order 122 split into two rows
(122, '2023-10-11', 5014, 'Hans Muller', 'hans@example.de', 'Germany', 201, 'Wireless Mouse', 'Accessories', 25.00, 1),
(122, '2023-10-11', 5014, 'Hans Muller', 'hans@example.de', 'Germany', 205, 'Mechanical Keyboard', 'Accessories', 75.00, 1),
-- Order 126 split into two rows
(126, '2023-10-13', 5016, 'Omar Sharif', 'omar@example.eg', 'Egypt', 201, 'Wireless Mouse', 'Accessories', 25.00, 2),
(126, '2023-10-13', 5016, 'Omar Sharif', 'omar@example.eg', 'Egypt', 301, 'USB-C Hub', 'Hardware', 45.00, 1),
-- Order 130 split into two rows
(130, '2023-10-15', 5018, 'Priya Das', 'priya@example.in', 'India', 201, 'Wireless Mouse', 'Accessories', 25.00, 1),
(130, '2023-10-15', 5018, 'Priya Das', 'priya@example.in', 'India', 401, 'Webcam HD', 'Electronics', 60.00, 1);

-- Note: Remaining atomic rows (105, 107, 109, 110, 111, 113, 115, 116, 117, 119, 121, 123, 124, 125, 127, 128, 129) 
-- should also be inserted here to complete the full dataset.