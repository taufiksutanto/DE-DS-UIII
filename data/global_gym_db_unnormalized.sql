-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS global_gym_db;
USE global_gym_db;

-- 2. Create the Unnormalized Table
-- Columns are VARCHAR to accommodate non-atomic (multi-valued) data for 1NF exercises.
CREATE TABLE gym_operations_raw (
    registration_id INT,
    member_id INT,
    member_name VARCHAR(100),
    member_email VARCHAR(100),
    member_phones VARCHAR(100),       -- Multi-valued (1NF Violation)
    gym_location_id INT,
    gym_city VARCHAR(100),            -- Transitive (3NF Violation)
    gym_country VARCHAR(50),          -- Transitive (3NF Violation)
    class_id VARCHAR(50),             -- Multi-valued (1NF Violation)
    class_name VARCHAR(255),          -- Multi-valued (1NF Violation)
    class_type VARCHAR(50),
    instructor_name VARCHAR(100),
    class_fee VARCHAR(100),           -- Multi-valued (1NF Violation)
    booking_date DATE
);

-- 3. Insert 30 Rows of Sample Data
INSERT INTO gym_operations_raw VALUES 
(1, 1001, 'John Smith', 'john.s@email.com', '555-0101, 555-0102', 10, 'New York', 'USA', 'C1, C2', 'Yoga, HIIT', 'Fitness', 'Coach Mike', '20.00, 30.00', '2024-01-10'),
(2, 1002, 'Anna Mueller', 'anna.m@email.de', '49-12345', 20, 'Berlin', 'Germany', 'C1', 'Yoga', 'Fitness', 'Coach Mike', '20.00', '2024-01-11'),
(3, 1003, 'Yuki Tanaka', 'yuki.t@email.jp', '81-90-1111', 30, 'Tokyo', 'Japan', 'C3, C4', 'Pilates, Zumba', 'Dance', 'Sensei Ken', '25.00, 15.00', '2024-01-12'),
(4, 1001, 'John Smith', 'john.s@email.com', '555-0101', 10, 'New York', 'USA', 'C5', 'Spinning', 'Cardio', 'Coach Sarah', '22.00', '2024-01-15'),
(5, 1004, 'Maria Rossi', 'maria.r@email.it', '39-06-123', 40, 'Rome', 'Italy', 'C1, C3', 'Yoga, Pilates', 'Fitness', 'Coach Mike', '20.00, 25.00', '2024-01-16'),
(6, 1005, 'Carlos Ruiz', 'carlos.r@email.es', '34-91-444', 50, 'Madrid', 'Spain', 'C2', 'HIIT', 'Fitness', 'Coach Sarah', '30.00', '2024-01-17'),
(7, 1006, 'Siti Hassan', 'siti.h@email.my', '60-12-345', 60, 'Kuala Lumpur', 'Malaysia', 'C4, C6', 'Zumba, Kickboxing', 'Martial Arts', 'Master Lee', '15.00, 35.00', '2024-01-18'),
(8, 1002, 'Anna Mueller', 'anna.m@email.de', '49-12345', 20, 'Berlin', 'Germany', 'C2', 'HIIT', 'Fitness', 'Coach Sarah', '30.00', '2024-01-19'),
(9, 1007, 'Liam Wilson', 'liam.w@email.au', '61-2-999', 70, 'Sydney', 'Australia', 'C5', 'Spinning', 'Cardio', 'Coach Sarah', '22.00', '2024-01-20'),
(10, 1008, 'Elena Petrova', 'elena.p@email.ru', '7-495-000', 80, 'Moscow', 'Russia', 'C1, C6', 'Yoga, Kickboxing', 'Mixed', 'Sensei Ken', '20.00, 35.00', '2024-01-21'),
(11, 1009, 'Fatima Al-Fassi', 'fatima@email.ma', '212-5-11', 90, 'Casablanca', 'Morocco', 'C3', 'Pilates', 'Fitness', 'Sensei Ken', '25.00', '2024-01-22'),
(12, 1010, 'Wei Chen', 'wei.c@email.cn', '86-10-888', 100, 'Beijing', 'China', 'C2, C5', 'HIIT, Spinning', 'Cardio', 'Coach Sarah', '30.00, 22.00', '2024-01-23'),
(13, 1011, 'Jean Dupont', 'jean.d@email.fr', '33-1-222', 110, 'Paris', 'France', 'C1', 'Yoga', 'Fitness', 'Coach Mike', '20.00', '2024-01-24'),
(14, 1003, 'Yuki Tanaka', 'yuki.t@email.jp', '81-90-1111', 30, 'Tokyo', 'Japan', 'C6', 'Kickboxing', 'Martial Arts', 'Master Lee', '35.00', '2024-01-25'),
(15, 1012, 'Lars Jensen', 'lars.j@email.dk', '45-33-11', 120, 'Copenhagen', 'Denmark', 'C4', 'Zumba', 'Dance', 'Master Lee', '15.00', '2024-01-26'),
(16, 1013, 'Priya Sharma', 'priya.s@email.in', '91-22-555', 130, 'Mumbai', 'India', 'C1, C2', 'Yoga, HIIT', 'Fitness', 'Coach Mike', '20.00, 30.00', '2024-01-27'),
(17, 1014, 'Ahmed Mansour', 'ahmed.m@email.eg', '20-2-777', 140, 'Cairo', 'Egypt', 'C3', 'Pilates', 'Fitness', 'Sensei Ken', '25.00', '2024-01-28'),
(18, 1015, 'Sonia Varga', 'sonia.v@email.hu', '36-1-888', 150, 'Budapest', 'Hungary', 'C5, C6', 'Spinning, Kickboxing', 'Cardio', 'Master Lee', '22.00, 35.00', '2024-01-29'),
(19, 1016, 'Kim Min-su', 'kim.m@email.kr', '82-2-333', 160, 'Seoul', 'South Korea', 'C1', 'Yoga', 'Fitness', 'Coach Mike', '20.00', '2024-01-30'),
(20, 1001, 'John Smith', 'john.s@email.com', '555-0101', 10, 'New York', 'USA', 'C3', 'Pilates', 'Fitness', 'Sensei Ken', '25.00', '2024-02-01'),
(21, 1017, 'Beatriz Gomez', 'beatriz.g@email.br', '55-11-22', 170, 'Sao Paulo', 'Brazil', 'C4', 'Zumba', 'Dance', 'Master Lee', '15.00', '2024-02-02'),
(22, 1018, 'Erik Larsson', 'erik.l@email.se', '46-8-444', 180, 'Stockholm', 'Sweden', 'C2', 'HIIT', 'Fitness', 'Coach Sarah', '30.00', '2024-02-03'),
(23, 1004, 'Maria Rossi', 'maria.r@email.it', '39-06-123', 40, 'Rome', 'Italy', 'C5', 'Spinning', 'Cardio', 'Coach Sarah', '22.00', '2024-02-04'),
(24, 1019, 'Chloe Lefebvre', 'chloe.l@email.ca', '1-416-55', 190, 'Toronto', 'Canada', 'C1, C4', 'Yoga, Zumba', 'Mixed', 'Coach Mike', '20.00, 15.00', '2024-02-05'),
(25, 1020, 'Oscar Wilde', 'oscar.w@email.uk', '44-20-77', 200, 'London', 'UK', 'C6', 'Kickboxing', 'Martial Arts', 'Master Lee', '35.00', '2024-02-06'),
(26, 1006, 'Siti Hassan', 'siti.h@email.my', '60-12-345', 60, 'Kuala Lumpur', 'Malaysia', 'C2', 'HIIT', 'Fitness', 'Coach Sarah', '30.00', '2024-02-07'),
(27, 1021, 'Hans Gruber', 'hans.g@email.at', '43-1-999', 210, 'Vienna', 'Austria', 'C1, C3', 'Yoga, Pilates', 'Fitness', 'Sensei Ken', '20.00, 25.00', '2024-02-08'),
(28, 1008, 'Elena Petrova', 'elena.p@email.ru', '7-495-000', 80, 'Moscow', 'Russia', 'C5', 'Spinning', 'Cardio', 'Coach Sarah', '22.00', '2024-02-09'),
(29, 1022, 'Zainab Balogun', 'zainab.b@email.ng', '234-1-00', 220, 'Lagos', 'Nigeria', 'C4', 'Zumba', 'Dance', 'Master Lee', '15.00', '2024-02-10'),
(30, 1010, 'Wei Chen', 'wei.c@email.cn', '86-10-888', 100, 'Beijing', 'China', 'C1, C6', 'Yoga, Kickboxing', 'Mixed', 'Master Lee', '20.00, 35.00', '2024-02-11');