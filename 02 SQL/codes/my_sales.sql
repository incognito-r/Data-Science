create database store_sales; use store_sales;

create table my_sales(
month varchar(10),
prod_name varchar(15),
sales int);

insert into my_sales (month, prod_name, sales) value
('jan', 'fruits', 78348),
('jan', 'vegetables', 67000),
('jan', 'dairy', 65999),
('feb', 'fruits', 70348),
('feb', 'vegetables', 37000),
('feb', 'dairy', 98999),
('mar', 'fruits', 40348),
('mar', 'vegetables', 63000),
('mar', 'dairy', 23999);

select * from my_sales;

select count(distinct month) from my_sales;
select sum(sales) from my_sales where month = 'jan';
select sum(sales) from my_sales where prod_name = 'fruits' and month <> 'mar';
select sum(sales) from my_sales where prod_name = 'vegetables' and (month = 'mar' or month = 'jan');
select avg(sales) from my_sales where prod_name = 'vegetables';
select min(sales) from my_sales;


select month, sum(sales) from my_sales group by month;
select month, min(sales) from my_sales group by month;
select prod_name from my_sales group by prod_name;
select prod_name, avg(sales) from my_sales group by prod_name;
select prod_name, min(sales) from my_sales group by prod_name;
select prod_name, max(sales) from my_sales group by prod_name;




