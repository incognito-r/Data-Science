select curdate();
select date_format(curdate(), '%d/%m/%y') today;

show databases; use store_sales;
CREATE TABLE SalesOrders (
ID INTEGER, 
CustomerID Integer, 
OrderDate Date, 
FinancialCode Char(2), 
Region Char(7),
SalesRepresentative Integer
);

INSERT INTO SalesOrders VALUES 
(2001, 101, '2000-03-16', 'r1', 'Eastern', 299),
(2002, 102, '2000-03-17', 'r2', 'Western', 399),
(2003, 103, '2000-03-18', 'r3', 'Western', 499),
(2004, 104, '2001-01-02', 'y1', 'Eastern', 599),
(2005, 105, '2001-01-03', 'y2', 'Western', 699),
(2006, 106, '2001-01-04', 'y3', 'Eastern', 799); 

select * from SalesOrders;
select * from SalesOrders where OrderDate between '2000-03-15' and '2000-03-20';
select extract(year from OrderDate) from SalesOrders;
select extract(month from OrderDate) from SalesOrders;

-- select * from SalesOrders where extract(year from OrderDate) = 2000;
select * from SalesOrders where year(OrderDate) = 2000;

select date_format(curdate(), '%d/%m/%y') today;
select date_format(str_to_date(OrderDate, '%Y-%m-%d'),'%d-%m-%Y') as DateFormat from SalesOrders;



