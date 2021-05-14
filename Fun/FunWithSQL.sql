use NORTHWND
GO

--1.
--Return all category names with their descriptions from the Categories table.
SELECT C.CategoryName, C.Description FROM Categories C
--2.
-- Return the contact name, customer id, and company name of all Customers in London
SELECT C.ContactName, C.CustomerID, C.CompanyName FROM Customers C
--3.
--Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
SELECT * FROM Suppliers S WHERE S.Fax IS NOT NULL
--4.
--Return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units
SELECT * FROM Orders O WHERE O.OrderDate BETWEEN '01/01/1997' and '01/01/1998' AND O.Freight < 100.00 ORDER BY O.Freight
--5.
--Return a list of company names and contact names of all the Owners from the Customer table from Mexico, Sweden and Germany.
SELECT C.CompanyName, C.ContactName, C.Country FROM Customers C WHERE C.Country IN ('Germany', 'Sweden', 'Mexico')
--6.
--Return a count of the number of discontinued products in the Products table.
SELECT COUNT(Discontinued) AS DISCCON FROM Products P WHERE P.Discontinued = 1
--7.
--Return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
SELECT C.CategoryName, C.Description FROM Categories C WHERE C.CategoryName LIKE 'CO%'
--8.
--Return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.
SELECT S.CompanyName, S.City, S.Country FROM Suppliers S WHERE S.Address LIKE '%rue%'
--9.
--Return the product id and the total quantities ordered for each product id in the Order Details table.
SELECT OD.ProductID, SUM(Quantity) AS Quantity FROM [Order Details] OD GROUP BY OD.ProductID ORDER BY OD.ProductID
--10.
--Return the customer name and customer address of all customers with orders that shipped using Speedy Express.
SELECT DISTINCT C.ContactName, C.Address
FROM Customers C INNER JOIN Orders O
ON C.CustomerID = O.CustomerID
INNER JOIN Shippers S ON O.ShipVia = S.ShipperID
WHERE S.CompanyName = 'Speedy Express'
ORDER BY C.ContactName
--11.
--Return a list of Suppliers that have regions. The list should contain company name, contact name, contact title and region.
SELECT S.CompanyName, S.ContactName, S.ContactTitle, S.Region FROM Suppliers S WHERE S.Region IS NOT NULL ORDER BY S.CompanyName
--12.
--Return all product names from the Products table that are condiments.
SELECT P.ProductName FROM Products P INNER JOIN Categories C 
ON P.CategoryID = C.CategoryID 
WHERE C.CategoryName = 'Condiments'
--13.
--Return a list of customer names who have no orders in the Orders table.
SELECT C.CompanyName FROM Customers C LEFT JOIN Orders O 
ON c.CustomerID = O.CustomerID WHERE O.OrderID IS NULL
--14.
--Add a shipper named 'Amazon' to the Shippers table using SQL.
INSERT INTO Shippers (CompanyName, Phone) VALUES ('Amazon', '(888) 280-4331')
SELECT * FROM Shippers S
--15.
--Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
UPDATE Shippers SET CompanyName = 'Amazon Prime Shipping' WHERE CompanyName = 'Amazon'
SELECT * FROM Shippers S
--16.
--Return a complete list of company names from the Shippers table. 
--Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
SELECT S.CompanyName, ROUND(SUM(Freight),0) FROM Shippers S INNER JOIN Orders O ON S.ShipperID = O.ShipVia GROUP BY S.CompanyName
--17.
--Return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. 
--The combined format should be 'LastName, FirstName'.
SELECT E.FirstName + ' ' + E.LastName AS 'Display Name' FROM Employees E
--18.
--Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
INSERT INTO Customers VALUES ('JMYXX', 'Jim''s Company', 'Jim Yahnke', 'Owner', '123 Any Street', 'San Diego', NULL, '92126', 'USA', '(619) 456-5486', NULL)
INSERT INTO Orders VALUES ('JMYXX', 1, GETDATE(), CONVERT(DATETIME, '05/31/2016'), NULL, 4, 125.00, 
'Shipping away on the expressway of life!', '1 Anywhere ST.', 'Los Angeles', NULL, '92101', 'USA')
INSERT INTO Products VALUES ('Grandma''s Boysenberry Spread',4 , 2, '1 Jar', 20.00, 20, 10, 10, 1)
INSERT INTO [Order Details] VALUES (11079,79,29.95, 2, 0)

--SELECT * FROM Customers C INNER JOIN
--Orders O ON C.CustomerID = O.CustomerID
--INNER JOIN
--[Order Details] OD on O.OrderID = OD.OrderID
--INNER JOIN
--Products P ON OD.ProductID = P.ProductID
--WHERE C.CustomerID = 'JMYXX'
--SELECT * FROM Products
--SELECT * FROM [Order Details]
--SELECT * FROM Orders
--19
--Remove yourself and your order from the database.
DELETE FROM [Order Details]  WHERE OrderID = 11087
DELETE FROM Products WHERE ProductID = 78
DELETE FROM Orders WHERE CustomerID = 'JMYXX'
DELETE FROM Customers WHERE CustomerID = 'JMYXX'
--20
--Return a list of products from the Products table along with the total units in stock for each product. 
--Give the computed column a name using the alias, 'TotalUnits'. Include only products with TotalUnits greater than 100.
SELECT P.ProductName, P.UnitsInStock AS 'Total Units' FROM Products P
WHERE P.UnitsInStock > 100
