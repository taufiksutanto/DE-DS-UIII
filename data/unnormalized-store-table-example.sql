-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS global_retail_db;
USE global_retail_db;

-- 2. Create the Unnormalized Table
-- Note: This table lacks 1NF because several rows contain multi-valued attributes (grouping).
CREATE TABLE online_retail_raw (
    order_id INT,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_country VARCHAR(50),
    product_id VARCHAR(100),      -- Multi-valued to demonstrate 1NF violation
    product_name VARCHAR(255),    -- Multi-valued to demonstrate 1NF violation
    product_category VARCHAR(50),
    unit_price VARCHAR(100),      -- Multi-valued to demonstrate 1NF violation
    quantity VARCHAR(50)          -- Multi-valued to demonstrate 1NF violation
);

-- 3. Insert 30 Rows of Sample Data
-- Includes redundancies, partial dependencies, and non-atomic values (grouping).
INSERT INTO online_retail_raw VALUES 
(101, '2023-10-01', 5001, 'Alice Smith', 'alice@example.com', 'USA', '201, 205', 'Wireless Mouse, Mechanical Keyboard', 'Accessories', '25.00, 75.00', '2, 1'),
(102, '2023-10-01', 5002, 'Hiroshi Tanaka', 'hiro@example.jp', 'Japan', '201', 'Wireless Mouse', 'Accessories', '25.00', '1'),
(103, '2023-10-02', 5003, 'Maria Garcia', 'maria@example.es', 'Spain', '301, 302', 'USB-C Hub, HDMI Cable', 'Hardware', '45.00, 15.00', '3, 2'),
(104, '2023-10-02', 5001, 'Alice Smith', 'alice@example.com', 'USA', '301', 'USB-C Hub', 'Hardware', '45.00', '1'),
(105, '2023-10-03', 5004, 'Ahmed Khan', 'ahmed@example.pk', 'Pakistan', '205', 'Mechanical Keyboard', 'Accessories', '75.00', '1'),
(106, '2023-10-03', 5005, 'Chloe Dubois', 'chloe@example.fr', 'France', '401, 402', 'Webcam HD, Ring Light', 'Electronics', '60.00, 30.00', '1, 1'),
(107, '2023-10-04', 5002, 'Hiroshi Tanaka', 'hiro@example.jp', 'Japan', '301', 'USB-C Hub', 'Hardware', '45.00', '2'),
(108, '2023-10-04', 5006, 'Lars Jensen', 'lars@example.dk', 'Denmark', '201, 302', 'Wireless Mouse, HDMI Cable', 'Accessories', '25.00, 15.00', '1, 5'),
(109, '2023-10-05', 5007, 'Siti Aminah', 'siti@example.id', 'Indonesia', '501', 'Laptop Stand', 'Office', '35.00', '1'),
(110, '2023-10-05', 5003, 'Maria Garcia', 'maria@example.es', 'Spain', '205', 'Mechanical Keyboard', 'Accessories', '75.00', '1'),
(111, '2023-10-06', 5008, 'Luca Rossi', 'luca@example.it', 'Italy', '401', 'Webcam HD', 'Electronics', '60.00', '1'),
(112, '2023-10-06', 5009, 'Zoe Chen', 'zoe@example.cn', 'China', '301, 201', 'USB-C Hub, Wireless Mouse', 'Hardware', '45.00, 25.00', '2, 2'),
(113, '2023-10-07', 5001, 'Alice Smith', 'alice@example.com', 'USA', '501', 'Laptop Stand', 'Office', '35.00', '1'),
(114, '2023-10-07', 5010, 'John Doe', 'john@example.uk', 'UK', '205, 302', 'Mechanical Keyboard, HDMI Cable', 'Accessories', '75.00, 15.00', '1, 1'),
(115, '2023-10-08', 5004, 'Ahmed Khan', 'ahmed@example.pk', 'Pakistan', '301', 'USB-C Hub', 'Hardware', '45.00', '4'),
(116, '2023-10-08', 5011, 'Elena Petrova', 'elena@example.ru', 'Russia', '402', 'Ring Light', 'Electronics', '30.00', '2'),
(117, '2023-10-09', 5005, 'Chloe Dubois', 'chloe@example.fr', 'France', '201', 'Wireless Mouse', 'Accessories', '25.00', '3'),
(118, '2023-10-09', 5012, 'Liam Wilson', 'liam@example.au', 'Australia', '301, 501', 'USB-C Hub, Laptop Stand', 'Hardware', '45.00, 35.00', '1, 1'),
(119, '2023-10-10', 5007, 'Siti Aminah', 'siti@example.id', 'Indonesia', '205', 'Mechanical Keyboard', 'Accessories', '75.00', '1'),
(120, '2023-10-10', 5013, 'Fatima Al-Sayed', 'fatima@example.sa', 'Saudi Arabia', '401, 302', 'Webcam HD, HDMI Cable', 'Electronics', '60.00, 15.00', '1, 3'),
(121, '2023-10-11', 5002, 'Hiroshi Tanaka', 'hiro@example.jp', 'Japan', '501', 'Laptop Stand', 'Office', '35.00', '2'),
(122, '2023-10-11', 5014, 'Hans Muller', 'hans@example.de', 'Germany', '201, 205', 'Wireless Mouse, Mechanical Keyboard', 'Accessories', '25.00, 75.00', '1, 1'),
(123, '2023-10-12', 5008, 'Luca Rossi', 'luca@example.it', 'Italy', '301', 'USB-C Hub', 'Hardware', '45.00', '1'),
(124, '2023-10-12', 5015, 'Yuki Sato', 'yuki@example.jp', 'Japan', '402', 'Ring Light', 'Electronics', '30.00', '1'),
(125, '2023-10-13', 5009, 'Zoe Chen', 'zoe@example.cn', 'China', '501', 'Laptop Stand', 'Office', '35.00', '3'),
(126, '2023-10-13', 5016, 'Omar Sharif', 'omar@example.eg', 'Egypt', '201, 301', 'Wireless Mouse, USB-C Hub', 'Accessories', '25.00, 45.00', '2, 1'),
(127, '2023-10-14', 5003, 'Maria Garcia', 'maria@example.es', 'Spain', '401', 'Webcam HD', 'Electronics', '60.00', '1'),
(128, '2023-10-14', 5017, 'Jane Kim', 'jane@example.kr', 'South Korea', '205', 'Mechanical Keyboard', 'Accessories', '75.00', '1'),
(129, '2023-10-15', 5006, 'Lars Jensen', 'lars@example.dk', 'Denmark', '302', 'HDMI Cable', 'Hardware', '15.00', '10'),
(130, '2023-10-15', 5018, 'Priya Das', 'priya@example.in', 'India', '201, 401', 'Wireless Mouse, Webcam HD', 'Accessories', '25.00, 60.00', '1, 1');