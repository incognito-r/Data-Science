-- show databases
show databases;
use RealWorldCo;

-- show tables
show tables;

select * from employees;
select * from departments;
select * from projects;
select * from clients;
select * from products;
select * from tickets;
select * from sales;

# Joins --
-- 1.  List all employees with their department names.
select employees.first_name, departments.name
from employees
left Join departments
on employees.dept_id = departments.dept_id;

select 
	concat(e.first_name, " ", e.last_name) as emp_name,
    d.name
from employees as e 
join departments as d on e.dept_id = d.dept_id;


-- 2. Show all projects and the full name of the lead employee.
select 
	projects.name as project_name, 
	concat(employees.first_name," ",  employees.last_name) as lead_name
from projects
left join employees
on projects.lead_emp_id = employees.emp_id;

-- 3. List all sales with client names and product names.
select 
	clients.name, products.name, 
	sales.sale_date, sales.quantity, sales.total
from sales
join clients on sales.client_id = clients.client_id
join products on sales.product_id = products.product_id;

-- 4. Get all clients, and include their tickets (if any).
select clients.name, tickets.issue, tickets.status
from clients
left join tickets on clients.client_id = tickets.client_id;

-- 5. List all employees and their projects (if any).
select employees.first_name, projects.name
from employees
left join projects on employees.emp_id = projects.lead_emp_id;


# Aggregations ----

-- 1. Show number of employees per department.
select 
	departments.name as dept_name,
    count(emp_id) as emp_count
from departments
left join employees on departments.dept_id = employees.dept_id
group by departments.dept_id;

-- 2. Find total sales amount per product.
select
	products.name,
    sum(sales.quantity) as total_qty,
    sum(sales.total) as total_sales
from products
left join sales on products.product_id = sales.product_id
group by products.product_id;

-- 3. List clients who have raised more than 2 tickets.

select * from tickets;
select * from clients;

select
	clients.client_id,
	clients.name,
    count(tickets.ticket_id) as total_tickets
from clients 
left join tickets on clients.client_id = tickets.client_id
group by clients.client_id
having total_tickets > 2
ORDER BY total_tickets DESC;

-- 4. Find the average number of tickets per client.

select avg(ticket_counts) as avg_ticket_count_per_client
from(
	select count(tickets.ticket_id) as ticket_counts
    from clients
    left join tickets on clients.client_id = tickets.client_id
    group by clients.client_id
) as tic_sum;
    
-- 5. Which product has been sold in the highest quantity?

select * from products;
select * from sales;

SELECT p.name, SUM(s.quantity) AS total_quantity
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.name
ORDER BY total_quantity DESC
LIMIT 1;











