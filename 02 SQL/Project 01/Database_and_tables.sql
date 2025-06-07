-- Create the database
CREATE DATABASE RealWorldCo;
USE RealWorldCo;

-- Departments
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    hire_date DATE,
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12,2),
    lead_emp_id INT,
    FOREIGN KEY (lead_emp_id) REFERENCES employees(emp_id)
);

-- Clients
CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

-- Sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_date DATE,
    client_id INT,
    product_id INT,
    quantity INT,
    total DECIMAL(10,2),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Tickets
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    created_at DATETIME,
    issue TEXT,
    status ENUM('Open', 'Closed', 'Pending'),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);


# Data insertion ---

-- Department
INSERT INTO departments (name, location) VALUES
('Human Resources', 'New York'),
('Engineering', 'San Francisco'),
('Sales', 'Chicago'),
('Support', NULL);

-- Employees
INSERT INTO employees (first_name, last_name, email, phone, hire_date, salary, dept_id) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '1234567890', '2018-03-15', 75000.00, 1),
('Bob', 'Smith', NULL, NULL, '2019-07-01', 82000.00, 2),
('Carol', 'Davis', 'carol.davis@example.com', '2345678901', '2020-11-10', 90000.00, 2),
('Dave', 'Martin', 'dave.martin@example.com', NULL, '2017-02-20', 67000.00, 3),
('Eve', 'Clark', 'eve.clark@example.com', '3456789012', '2021-05-30', 58000.00, 4);

-- Clients
INSERT INTO clients (name, email, phone, address) VALUES
('Globex Corp', 'contact@globex.com', '4567890123', '742 Evergreen Terrace'),
('Initech', 'hello@initech.com', NULL, '1234 Elm Street'),
('Soylent Corp', NULL, '5678901234', NULL),
('Umbrella Inc', 'info@umbrella.com', '6789012345', '456 Oak Avenue');


-- Products
INSERT INTO products (name, price, stock) VALUES
('Laptop', 1200.00, 10),
('Monitor', 300.00, 20),
('Mouse', 25.00, 100),
('Keyboard', 45.00, 50),
('Headset', 85.00, NULL); -- stock missing


-- Sales
INSERT INTO sales (sale_date, client_id, product_id, quantity, total) VALUES
('2024-01-10', 1, 1, 1, 1200.00),
('2024-01-15', 2, 2, 2, 600.00),
('2024-02-05', 1, 3, 5, 125.00),
('2024-02-20', 4, 4, 1, 45.00),
('2024-03-01', 3, 5, 2, 170.00);

-- Projects
INSERT INTO projects (name, start_date, end_date, budget, lead_emp_id) VALUES
('Website Redesign', '2023-09-01', '2023-12-15', 15000.00, 1),
('AI Tool Development', '2024-01-10', NULL, 50000.00, 2),
('Customer App', '2024-03-01', '2024-05-30', 20000.00, 3);

-- tickets
INSERT INTO tickets (client_id, created_at, issue, status) VALUES
(1, '2024-02-10 10:30:00', 'Website down', 'Open'),
(2, '2024-02-11 11:00:00', 'Cannot login', 'Closed'),
(3, '2024-02-12 09:15:00', 'Product damaged', 'Pending'),
(4, '2024-02-15 14:45:00', 'Billing issue', 'Open');






