use northwind;

-- 1. List the product id, product name, unit price and category name of all
-- products. Order by category name and within that, by product name.

SELECT ProductID, ProductName, UnitPrice, CategoryName 
FROM Products AS p 
JOIN Categories AS c 
ON p.categoryID = c.categoryID
ORDER BY CategoryName, ProductName;

-- 2. List the product id, product name, unit price and supplier name of all
-- products that cost more than $75. Order by product name.

SELECT ProductID, ProductName, UnitPrice, CompanyName
FROM Products AS p
JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE UnitPrice > 75
ORDER BY ProductName;

-- 3. List the product id, product name, unit price, category name, and supplier
-- name of every product. Order by product name.

SELECT ProductID, ProductName, UnitPrice, CategoryName, CompanyName
FROM Products AS p
JOIN Categories AS c
JOIN Suppliers AS s
ON p.supplierID = s.supplierID AND p.categoryID = c.categoryID
ORDER BY ProductName;

-- 4. What is the product name(s) and categories of the most expensive
-- products? HINT: Find the max price in a subquery and then use that in
-- your more complex query that joins products with categories.
SELECT MAX(UnitPrice) FROM Products;
SELECT ProductName , CategoryName 
FROM Products AS p
JOIN Categories AS c
ON p.categoryID = c.categoryID
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

-- 5. List the order id, ship name, ship address, and shipping company name of
-- every order that shipped to Germany.

SELECT OrderID, ShipName, ShipAddress, CompanyName 
FROM Orders AS o
JOIN Shippers AS s
ON o.shipVia = s.shipperID
WHERE ShipCountry = "Germany";

-- 6. List the order id, order date, ship name, ship address of all orders that
-- ordered "Sasquatch Ale"?

SELECT o.OrderID, OrderDate, ShipName, ShipAddress
FROM Orders AS o
JOIN Products AS p
JOIN `Order details` AS d
ON o.orderID = d.orderID AND p.productID = d.productID
WHERE ProductName = "Sasquatch Ale";
