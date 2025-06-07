
show databases;
use RealWorldCo;

show tables; 

select * from employees;
select * from departments;
select * from projects;
select * from products; 
select * from sales;
select * from clients;
select * from tickets;

-- 1. Clients who purchased a product named "Monitor"
select * from clients;
select * from products;
select * from sales;

select 
	clients.client_id, clients.name,
    sales.quantity

from clients
join sales on clients.client_id = sales.client_id
join products on sales.product_id = products.product_id
where products.name = 'Monitor'
order by sales.quantity desc;

	-- 1.1 Group by client to count total monitors purchased:

SELECT 
    clients.client_id,
    clients.name,
    SUM(sales.quantity) AS total_monitors_bought
FROM clients
JOIN sales ON clients.client_id = sales.client_id
JOIN products ON sales.product_id = products.product_id
WHERE products.name = 'Monitor'
GROUP BY clients.client_id, clients.name
ORDER BY total_monitors_bought DESC;

-- 2. Employees who work in the same department as 'Alice'

SELECT first_name
FROM employees
WHERE dept_id = (
    SELECT dept_id
    FROM employees
    WHERE first_name = 'Alice'
);

-- using self join
select e2.first_name
from employees as e1
join employees as e2 on e1.dept_id = e2.dept_id
where e1.first_name = 'Alice';

-- 3. Clients who never raised a ticket

select * from tickets;
select * from clients;

select 
	c1.client_id, c1.name,
    t1.ticket_id
from clients as c1
left join tickets as t1 on c1.client_id = t1.client_id
where t1.client_id is null;


-- 4. Top 3 products by revenue (already touched a bit)

SELECT
    p.product_id,
    p.name,
    SUM(s.total) AS total_revenue
FROM products AS p
JOIN sales AS s ON p.product_id = s.product_id
GROUP BY p.product_id, p.name
ORDER BY total_revenue DESC
LIMIT 3;


-- 5. Total sales per client, only showing those above average.
select 
	c.client_id, 
    c.name,
	sum(s.total) as totalsales
    
from clients as c
join sales as s on c.client_id = s.client_id
group by c.client_id, c.name
having sum(s.total) > (
	select avg(clienttotal) from (
    select sum(s2.total) as clienttotal
    from sales s2
    group by s2.client_id
    ) as sub
);


