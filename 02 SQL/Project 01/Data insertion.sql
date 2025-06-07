# inserting more data to database;

show databases;
use RealWorldCo;

INSERT INTO departments (name, location) VALUES
('Marketing', 'Los Angeles'),
('R&D', 'Boston');

INSERT INTO employees (first_name, last_name, email, phone, hire_date, salary, dept_id) VALUES
('Frank', 'Green', 'frank.green@example.com', '4561237890', '2016-08-12', 95000.00, 2),
('Grace', 'Lee', NULL, '5672348901', '2022-01-05', 62000.00, 5),
('Hector', 'Wong', 'hector.wong@example.com', NULL, '2023-04-18', 55000.00, 6),
('Ivy', 'Chen', 'ivy.chen@example.com', '6783459012', '2019-09-09', 72000.00, 3),
('Jack', 'O\'Neill', NULL, NULL, '2015-11-11', 88000.00, 2),
('Karen', 'Patel', 'kpatel@example.com', '7894560123', '2021-12-20', 67000.00, 1),
('Leo', 'Garcia', 'leo.garcia@example.com', '8905671234', '2020-06-01', 78000.00, 4),
('Mona', 'Singh', 'mona.singh@example.com', NULL, '2024-02-14', 50000.00, 6),
('Nate', 'Brown', 'nate.brown@example.com', '9016782345', '2018-10-30', 83000.00, 5);

INSERT INTO clients (name, email, phone, address) VALUES
('Stark Industries', 'tony@stark.com', '1112223333', '10880 Malibu Point'),
('Wayne Enterprises', NULL, '2223334444', '1007 Mountain Drive'),
('Gringotts Bank', 'info@gringotts.co.uk', NULL, 'Diagon Alley, London'),
('Wonka Industries', 'chocolate@wonka.com', '3334445555', NULL),
('Hogsmeade Traders', NULL, NULL, NULL),
('Nakatomi Trading', 'contact@nakatomi.jp', '4445556666', 'Osaka, Japan'),
('Tyrell Corp', 'replicants@tyrell.com', '5556667777', 'Los Angeles'),
('Soylent Green', NULL, '6667778888', 'New York'),
('Black Mesa', 'support@blackmesa.com', '7778889999', 'Nevada Desert');

INSERT INTO products (name, price, stock) VALUES
('Webcam', 150.00, 25),
('USB-C Cable', 10.00, 200),
('Graphics Card', 450.00, NULL),
('External HDD', 100.00, 0),
('Smartphone', 699.00, 30),
('Tablet', NULL, 15),
('Router', 120.00, 40);

INSERT INTO sales (sale_date, client_id, product_id, quantity, total) VALUES
('2024-03-05', 5, 1, 2, 300.00),
('2024-03-07', 6, 3, 1, 450.00),
('2024-03-10', 7, 4, 3, 300.00),
('2024-03-12', 8, 2, 10, 100.00),
('2024-03-15', 9, 6, 1, NULL),
('2024-03-17', 1, 7, 2, 240.00),
('2024-03-20', 2, 5, 1, 699.00),
('2024-03-22', 3, 8, 5, 50.00),
('2024-03-25', 4, 9, 1, 120.00),
('2024-04-01', 5, 3, 2, 900.00),
('2024-04-05', 6, 1, 1, 150.00),
('2024-04-10', 7, 2, 4, 1200.00),
('2024-04-12', 8, 4, 2, 200.00),
('2024-04-15', 9, 7, 1, 699.00),
('2024-04-18', 1, 6, 3, 0.00);  -- potentially bad total

INSERT INTO projects (name, start_date, end_date, budget, lead_emp_id) VALUES
('Cloud Migration', '2023-05-01', '2024-01-31', 75000.00, 7),
('Mobile App v2', '2024-02-15', NULL, 30000.00, 3),
('Data Warehouse', '2023-11-20', '2024-06-30', 120000.00, 2),
('Marketing Campaign', '2024-03-01', '2024-05-15', 20000.00, 6),
('Security Audit', '2024-04-01', NULL, 15000.00, 8);

INSERT INTO tickets (client_id, created_at, issue, status) VALUES
(1, '2024-03-05 09:00:00', 'Cannot access dashboard', 'Closed'),
(2, '2024-03-06 10:30:00', 'Payment failure', 'Open'),
(3, '2024-03-08 14:20:00', 'Error 404 on page', 'Pending'),
(4, '2024-03-10 16:45:00', 'Slow performance', 'Open'),
(5, '2024-03-12 11:10:00', 'API integration issue', 'Closed'),
(6, '2024-03-15 13:50:00', 'License key invalid', 'Pending'),
(7, '2024-03-18 15:00:00', 'Report generation error', 'Open'),
(8, '2024-03-20 17:25:00', 'UI alignment bug', 'Closed'),
(9, '2024-03-22 08:40:00', 'Password reset failure', 'Open');
