# show databases
show databases;
# use database
use Bookstore;
# show tables in a database
show tables;
show tables in Bookstore;

# Describe table
DESCRIBE Books;
# View relationships
SHOW CREATE TABLE Books;

# select rows from a table
SELECT * FROM Books;
SELECT * FROM Books LIMIT 5;

# select specific columns from a table
SELECT Title, Price FROM Books;

# FILTERING (the WHERE CLAUSE)
 -- Operators(=, <>, !=, <, <=, >, >=, LIKE"%expression%", in ('exp1', 'exp2', 'exp3'))
 -- single condition
SELECT * FROM Books WHERE Price < 11;
SELECT * FROM Books WHERE Author LIKE"%Harper%";
SELECT * FROM Books WHERE Genre IN ("Fiction", "Adventure");
-- multiple conditions
SELECT * FROM Books WHERE Genre = "Fiction" AND Price <= 10;

# Proper Formating
SELECT *
FROM Books
WHERE Genre = "Fiction"
	AND Price <= 10
LIMIT 2;

# SORTING values - ORDER BY
SELECT * FROM Books ORDER BY Title;
SELECT * FROM Books ORDER BY Title DESC;

# UNIQUE values - DISTINCT
SELECT DISTINCT Genre FROM Books;

# AGGREGATION Functions - COUNT(), SUM(), AVG(), MIN(), MAX()
SELECT COUNT(*) FROM Books WHERE Genre = 'Fiction';
SELECT SUM(Price) FROM Books;
SELECT MIN(Price) FROM Books WHERE Genre = 'Fiction';

# GROUP BY clause (usually used with aggregation functions)
SELECT Genre, COUNT(Title) FROM Books GROUP BY Genre;
SELECT Genre, MIN(Price) FROM Books GROUP BY Genre;

# ALIAS - AS
SELECT Genre, MIN(Price) AS MinimumPrice 
FROM Books
WHERE Price < 15
GROUP BY Genre;

# HAVING
-- The execution order of the different SQL keywords doesn't allow you to filter with the WHERE clause on the result of an aggregate function (COUNT, SUM, etc.). 
-- This is because WHERE is executed before the aggregate functions. But that's what HAVING is for.
-- WHERE -> Filtering before AGG. FXNS
-- HAVING -> Filtering After AGG. FXNS

SELECT Genre, COUNT(Title) 
FROM Books
GROUP BY Genre
HAVING COUNT(Title) = 1;

# JOIN
-- 1. Inner Join
SELECT Orders.OrderID, Customers.FirstName, Customers.LastName, Orders.OrderDate
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

-- 2. Right Join
SELECT Orders.OrderID, Customers.FirstName, Customers.LastName
FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

-- 3. Left Join
SELECT Customers.FirstName, Customers.LastName, Orders.OrderID
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- 4. Full Join
SELECT Customers.FirstName, Orders.OrderID
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.FirstName, Orders.OrderID
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- 5. Cross Join
SELECT Customers.FirstName, Orders.OrderID
FROM Customers
CROSS JOIN Orders;

-- 6. Self Join
SELECT A.FirstName AS Customer1, B.FirstName AS Customer2
FROM Customers A
INNER JOIN Customers B
ON A.JoinDate > B.JoinDate;

# Correct keyword order: SELECT -> FROM -> JOIN(ON) -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT

