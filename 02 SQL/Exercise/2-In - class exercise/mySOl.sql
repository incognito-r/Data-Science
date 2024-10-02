create database Exercise; 
use Exercise;
select * from bank_inventory_pricing;

SELECT Product, Price, Month, SUM(Quantity) AS TotalQuantity
FROM bank_inventory_pricing
GROUP BY Product, Price, Month
HAVING SUM(Quantity) > 5;
