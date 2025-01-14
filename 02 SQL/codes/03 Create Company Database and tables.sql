CREATE DATABASE IF NOT EXISTS company_management;

USE company_management;

-- Create the department table first
CREATE TABLE IF NOT EXISTS department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- Create the manager table
CREATE TABLE IF NOT EXISTS manager (
    manager_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Create the employee table
CREATE TABLE IF NOT EXISTS employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
);

-- Create the projects table
CREATE TABLE IF NOT EXISTS projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE,
    budget DECIMAL(15, 2),
    team_member_id INT,
    FOREIGN KEY (team_member_id) REFERENCES employee(employee_id)
);

-- Create the employee_projects table for the many-to-many relationship
CREATE TABLE IF NOT EXISTS employee_projects (
    employee_id INT,
    project_id INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert sample data into department table
INSERT INTO department (department_id, department_name)
VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'Sales'),
(6, 'Operations'),
(7, 'Legal');

-- Insert sample data into manager table
INSERT INTO manager (manager_id, first_name, last_name, email, phone_number, department_id)
VALUES
(1, 'John', 'Smith', 'john.smith@example.com', '1234567890', 1),
(2, 'Alice', 'Johnson', 'alice.johnson@example.com', '9876543210', 2),
(3, 'Robert', 'Brown', 'robert.brown@example.com', '4567891230', 3),
(4, 'Michael', 'Clark', 'michael.clark@example.com', '5678901234', 4),
(5, 'Jessica', 'Lopez', 'jessica.lopez@example.com', '6789012345', 5),
(6, 'Jolie', 'clark', 'jolie.clark@example.com', '6585076344', 6),
(7, 'Anna', 'jensen', 'anna.jensen@example.com', '9889572344', 7);

-- Insert sample data into employee table
INSERT INTO employee (employee_id, first_name, last_name, email, phone_number, hire_date, salary, department_id, manager_id)
VALUES
(1, 'Emma', 'Wilson', 'emma.wilson@example.com', '1112223333', '2023-01-15', 50000.00, 1, 1),
(2, 'Liam', 'Taylor', 'liam.taylor@example.com', '2223334444', '2022-11-01', 60000.00, 2, 2),
(3, 'Sophia', 'Davis', 'sophia.davis@example.com', '3334445555', '2024-03-10', 55000.00, 3, 3),
(4, 'Noah', 'Miller', 'noah.miller@example.com', '4445556666', '2023-06-20', 65000.00, 2, 2),
(5, 'Olivia', 'Moore', 'olivia.moore@example.com', '5556667777', '2023-08-01', 70000.00, 4, 4),
(6, 'James', 'Anderson', 'james.anderson@example.com', '6667778888', '2022-09-15', 75000.00, 4, 4),
(7, 'Mia', 'White', 'mia.white@example.com', '7778889999', '2021-12-05', 65000.00, 5, 5),
(8, 'Ethan', 'Martin', 'ethan.martin@example.com', '8889990000', '2023-02-20', 55000.00, 5, 5),
(9, 'Charlotte', 'Garcia', 'charlotte.garcia@example.com', '9990001111', '2023-03-15', 60000.00, 1, 1),
(10, 'Aiden', 'Thomas', 'aiden.thomas@example.com', '0001112222', '2023-11-01', 72000.00, 2, 2);

-- Insert sample data into projects table
INSERT INTO projects (project_id, project_name, start_date, end_date, budget, team_member_id)
VALUES
(1, 'Website Redesign', '2023-05-01', '2023-10-01', 20000.00, 1),
(2, 'AI Development', '2023-01-01', '2024-01-01', 50000.00, 2),
(3, 'Marketing Campaign', '2024-02-01', '2024-08-01', 30000.00, 3),
(4, 'Payroll Automation', '2024-01-01', '2024-06-01', 40000.00, 2),
(5, 'Data Analytics Dashboard', '2023-09-01', '2024-03-01', 45000.00, 6),
(6, 'CRM Implementation', '2023-07-01', '2024-01-01', 50000.00, 1),
(7, 'E-commerce Platform Upgrade', '2023-10-01', '2024-05-01', 60000.00, 8),
(8, 'Employee Training Program', '2024-02-01', '2024-07-01', 35000.00, 9),
(9, 'Cybersecurity Enhancement', '2023-11-01', '2024-04-01', 55000.00, 10);

-- Insert sample data into employee_projects table
INSERT INTO employee_projects (employee_id, project_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2),
(1, 8),
(5, 4),
(6, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9);
