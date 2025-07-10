DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS movies;

CREATE TABLE movies(
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    rating VARCHAR(100) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    run_time INT NOT NULL
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    membership_status VARCHAR(100) NOT NULL,
    membership_num INT,
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    employment VARCHAR(100) NOT NULL,
    hourly_rate INT NOT NULL,
    years_worked INT NOT NULL,
    dept_id INT NOT NULL REFERENCES departments(department_id) ON DELETE CASCADE
);

CREATE TABLE services(
    service_id SERIAL PRIMARY KEY,
    reviews INT CHECK (reviews >= 1 AND reviews <= 10),
    transaction_amount INT NOT NULL,
    upsell_amount INT NOT NULL,
    cust_id INT NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE,
    emp_id INT NOT NULL REFERENCES employees(employee_id) ON DELETE CASCADE
);

INSERT INTO movies(title, rating, genre, run_time) VALUES
('Superman', 'M', 'Action/Sci-Fi', 130),
('Lilo & Stitch', 'PG', 'Comedy', 108),
('28 Years Later', 'MA15+', 'Horror', 115),
('Sinners', 'MA15+', 'Drama/Thriller', 137),
('The Phoenician Scheme', 'M', 'Comedy/Drama', 101),
('The Shrouds', 'MA15+', 'Thriller', 119),
('F1: The Movie', 'M', 'Drama', 115),
('How To Train Your Dragon', 'PG','Adventure', 125);

INSERT INTO departments(department_name) VALUES
('Ticket Sales'),
('Candy Bar'),
('Cinema Attendant/Usher');

INSERT INTO customers(membership_status, membership_num, movie_id) VALUES
('Yes', 200, 1),
('Yes', 201, 1),
('Yes', 199, 1),
('No', 0, 1),
('Yes', 201, 2),
('No', 0, 2),
('Yes', 200, 1),
('Yes', 201, 1),
('Yes', 199, 1),
('No', 0, 1),
('Yes', 201, 2),
('No', 0, 3),
('No', 0, 3),
('Yes', 198, 3),
('Yes', 198, 3),
('Yes', 200, 1),
('Yes', 201, 1),
('No', 0, 3),
('Yes', 199, 1),
('No', 0, 1),
('Yes', 201, 2),
('Yes', 205, 4),
('Yes', 205, 4),
('Yes', 205, 4),
('No', 0, 4),
('No', 0, 4),
('No', 0, 4),
('Yes', 150, 4),
('Yes', 150, 4),
('Yes', 150, 4),
('No', 0, 5),
('No', 0, 5),
('No', 0, 5),
('Yes', 101, 5),
('Yes', 101, 5),
('Yes', 101, 5),
('Yes', 98, 6),
('Yes', 98, 6),
('Yes', 98, 6),
('Yes', 77, 6),
('Yes', 77, 6),
('Yes', 77, 6),
('Yes', 59, 6),
('Yes', 59, 6),
('Yes', 59, 6),
('Yes', 205, 6),
('Yes', 205, 6),
('Yes', 205, 6),
('Yes', 200, 6),
('Yes', 200, 6),
('Yes', 200, 6),
('Yes', 59, 7),
('Yes', 59, 7),
('Yes', 59, 7),
('Yes', 101, 7),
('Yes', 101, 7),
('Yes', 101, 7),
('No', 0, 8);

INSERT INTO employees (first_name, last_name, employment, hourly_rate, years_worked, dept_id) VALUES
('John', 'Smith', 'Full-Time', 30, 5, 1),
('Jane', 'Doe', 'Full-Time', 30, 1, 1),
('Jim', 'Beau', 'Casual', 35, 4, 2),
('Jade', 'Solomon', 'Part-Time', 20, 5, 2),
('Brian', 'Jordan', 'Casual', 35, 2, 1),
('Alexis', 'Harper', 'Part-Time', 20, 1, 1),
('Phillip', 'Yang', 'Full-Time', 30, 5, 3),
('Victoria', 'Hoffman', 'Full_Time', 30, 4, 2),
('Savannah', 'Russo', 'Part-Time', 20, 2, 3);

INSERT INTO services (reviews, transaction_amount, upsell_amount, cust_id, emp_id) VALUES
(9, 25, 0, 1, 1),
(10, 35, 0, 2, 2),
(10, 30, 0, 3, 1),
(10, 60, 0, 5, 2),
(9, 30, 10, 7, 3),
(10, 10, 0, 8, 3),
(10, 20, 0, 9, 4),
(10, 20, 0, 11, 4),
(10, 25, 0, 14, 6),
(10, 30, 5, 15, 3),
(9, 0, 0, 16, 7),
(10, 0, 0, 17, 7),
(9, 0, 0, 21, 7),
(8, 25, 0, 22, 7),
(8, 0, 0, 23, 8),
(8, 0, 0, 24, 7),
(10, 100, 0, 28, 2),
(10, 75, 10, 29, 4),
(10, 0, 0, 30, 9),
(10, 25, 0, 34, 1),
(10, 10, 0, 35, 4),
(10, 0, 0, 36, 7),
(9, 75, 0, 37, 1),
(9, 50, 0, 38, 3),
(9, 0, 0, 39, 9),
(8, 50, 0, 40, 1),
(8, 60, 10, 41, 3),
(8, 0, 0, 42, 9),
(9, 50, 0, 43, 2),
(9, 25, 5, 44, 3),
(9, 0, 0, 45, 7),
(7, 75, 10, 46, 2),
(7, 25, 5, 47, 3),
(7, 0, 0, 48, 7),
(10, 75, 10, 49, 2),
(10, 20, 0, 50, 3),
(10, 0, 0, 51, 7),
(10, 75, 0, 52, 5),
(10, 50, 15, 53, 8),
(10, 0, 0, 54, 9),
(9, 50, 0, 55, 6),
(9, 30, 5, 56, 8),
(9, 0, 0, 57, 9);

INSERT INTO services (transaction_amount, upsell_amount, cust_id, emp_id) VALUES
(25, 0, 4, 1),
(35, 0, 6, 2),
(0, 0, 10, 4),
(25, 0, 12, 5),
(10, 0, 13, 3),
(0, 0, 18, 7),
(0, 0, 19, 7),
(0, 0, 20, 7),
(50, 0, 25, 2),
(5, 0, 26, 3),
(0, 0, 27, 9),
(50, 0, 31, 2),
(10, 0, 32, 4),
(0, 0, 33, 9),
(25, 0, 58, 6);

SELECT * FROM movies;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM services;