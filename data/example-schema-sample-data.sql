-- DATABASE SCHEMA: University Registry System
-- Designed for: UIII Master of Data Science

DROP DATABASE IF EXISTS university_registry_db;
CREATE DATABASE university_registry_db;
USE university_registry_db;

-- 1. DDL: Create Instructors Table
CREATE TABLE instructors (
id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
department VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. DDL: Create Courses Table
CREATE TABLE courses (
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(150) NOT NULL,
instructor_id INT,
credits INT DEFAULT 3,
FOREIGN KEY (instructor_id) REFERENCES instructors(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. DDL: Create Students Table
CREATE TABLE students (
id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
country_origin VARCHAR(50),
enrollment_year YEAR
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. DDL: Create Enrollments (Junction Table)
CREATE TABLE enrollments (
id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
course_id INT NOT NULL,
grade DECIMAL(3, 2),
semester VARCHAR(10),
FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- DML: Data Ingestion

-- Insert Instructors
INSERT INTO instructors (full_name, email, department) VALUES
('Dr. Aris Kusuma', 'aris.k@uiii.ac.id', 'Data Science'),
('Dr. Siti Aminah', 'siti.a@uiii.ac.id', 'Data Science'),
('Prof. John Miller', 'j.miller@uiii.ac.id', 'Economics'),
('Dr. Elena Rossi', 'e.rossi@uiii.ac.id', 'Political Science'),
('Dr. Ahmad Fauzi', 'a.fauzi@uiii.ac.id', 'Education');

-- Insert Courses
INSERT INTO courses (title, instructor_id, credits) VALUES
('Machine Learning Fundamentals', 1, 4),
('Advanced SQL for Data Science', 1, 3),
('Statistical Inference', 2, 3),
('Macroeconomics Policy', 3, 3),
('Comparative Politics', 4, 3),
('Deep Learning', 2, 4),
('Education Policy in 3T Regions', 5, 3),
('Microeconomics', 3, 3);

-- Insert Students (Diverse Origins)
INSERT INTO students (full_name, country_origin, enrollment_year) VALUES
('Budi Santoso', 'Indonesia', 2024),
('Ayu Lestari', 'Indonesia', 2024),
('Tariq Mansoor', 'Pakistan', 2024),
('Fatima Zahra', 'Morocco', 2024),
('Chen Wei', 'China', 2024),
('John Doe', 'USA', 2025),
('Sara Connor', 'Australia', 2025),
('Luis Garcia', 'Mexico', 2024),
('Elena Petrova', 'Russia', 2024),
('Yuki Tanaka', 'Japan', 2025),
('Kwame Nkrumah', 'Ghana', 2024),
('Isabelle Dubois', 'France', 2025),
('Omar Khalid', 'Egypt', 2024),
('Min-jun Kim', 'South Korea', 2024),
('Maria Silva', 'Brazil', 2025);

-- Insert Enrollments (High Volume for Analytics)
INSERT INTO enrollments (student_id, course_id, grade, semester) VALUES
(1, 1, 3.80, 'Fall 2024'), (1, 2, 3.90, 'Fall 2024'), (1, 3, 3.70, 'Spring 2025'),
(2, 1, 3.50, 'Fall 2024'), (2, 2, 3.60, 'Fall 2024'), (2, 6, 3.80, 'Spring 2025'),
(3, 1, 3.95, 'Fall 2024'), (3, 3, 4.00, 'Spring 2025'), (3, 6, 3.90, 'Spring 2025'),
(4, 4, 3.20, 'Fall 2024'), (4, 8, 3.40, 'Spring 2025'), (4, 5, 3.50, 'Spring 2025'),
(5, 1, 3.75, 'Fall 2024'), (5, 2, 3.85, 'Fall 2024'), (5, 3, 3.80, 'Spring 2025'),
(6, 4, 2.90, 'Fall 2024'), (6, 5, 3.10, 'Spring 2025'), (6, 8, 3.00, 'Spring 2025'),
(7, 1, 3.65, 'Fall 2024'), (7, 6, 3.70, 'Spring 2025'), (7, 2, 3.80, 'Fall 2024'),
(8, 7, 3.90, 'Fall 2024'), (8, 5, 3.80, 'Spring 2025'), (8, 3, 3.75, 'Spring 2025'),
(9, 1, 3.40, 'Fall 2024'), (9, 2, 3.50, 'Fall 2024'), (9, 6, 3.60, 'Spring 2025'),
(10, 4, 3.10, 'Fall 2024'), (10, 8, 3.20, 'Spring 2025'),
(11, 7, 4.00, 'Fall 2024'), (11, 3, 3.90, 'Spring 2025'),
(12, 1, 3.85, 'Fall 2024'), (12, 6, 3.95, 'Spring 2025'),
(13, 4, 3.00, 'Fall 2024'), (13, 5, 3.20, 'Spring 2025'), (13, 8, 3.10, 'Spring 2025'),
(14, 1, 3.60, 'Fall 2024'), (14, 2, 3.70, 'Fall 2024'), (14, 3, 3.55, 'Spring 2025'),
(15, 7, 3.70, 'Fall 2024'), (15, 3, 3.80, 'Spring 2025');