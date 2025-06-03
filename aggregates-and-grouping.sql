use northwind;
-- 1. How many suppliers are there? Use a query!

SELECT COUNT(*) AS suppliersCount FROM suppliers;

-- 2. What is the sum of all the employee's salaries?

SELECT ROUND(SUM(salary),2) FROM employees;

-- 3. What is the price of the cheapest item that Northwind sells?

SELECT ROUND(MIN(UnitPrice),2) AS cheapestPrice FROM Products;

-- 4. What is the average price of items that Northwind sells?

SELECT ROUND(AVG(UnitPrice),2) AS averagePrice FROM Products;

-- 5. What is the price of the most expensive item that Northwind sells?

SELECT ROUND(MAX(UnitPrice),2) AS expensivePrice FROM Products;

-- 6. What is the supplier ID of each supplier and the number of items they supply? You can answer this query by only looking at the Products table.

SELECT SupplierID, COUNT(*) AS numberItems FROM Products GROUP BY SupplierID;

-- 7. What is the category ID of each category and the average price of each item in the category? You can answer this query by only looking at the Products table.

SELECT CategoryID, AVG(UnitPrice) AS averagePrice FROM products GROUP BY CategoryID;

-- 8. For suppliers that provide at least 5 items to Northwind, what is the supplier ID of each supplier and the number of items they supply? You can answer this query by only looking at the Products table.

SELECT SupplierID, COUNT(*) AS numberItems FROM products GROUP BY SupplierID HAVING COUNT(*) >= 5;

-- 9. List the product id, product name, and inventory value (calculated by multiplying unit price by the number of units on hand). Sort the results in descending order by value. If two or more have the same value, order by product name

SELECT ProductID , ProductName, UnitPrice*UnitsInStock AS inventory_value FROM Products ORDER BY inventory_value DESC, ProductName ASC;
