-- show databases
show databases;
use RealWorldCo;

-- show tables
show tables;
select * from employees;
select * from departments;
select * from projects;
select * from products;
select * from sales;
select * from tickets;

-- 1. List all employees with their first and last names.

select employees.first_name, employees.last_name
from employees;
--
select e.first_name, e.last_name
from employees as e;

-- 2. Get the names and prices of all products.

select products.name, products.price
from products;

-- 3. Show all products that have a stock value (NOT NULL).
select * 
from products
where products.stock IS NOT NULL;

-- 4. List all clients whose email is missing.
select * from clients;

select *
from clients as c
where c.email IS NUll;

-- 5. Find employees hired after January 1, 2020.
select *
from employees
where employees.hire_date > '2020-01-01';

-- 6 Get clients whose name starts with S.
select *
from clients
where clients.name LIKE 'S%';

