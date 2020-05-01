-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT P.ProductName, C.CategoryName FROM Product as P
JOIN Category AS C ON P.CategoryId = C.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id,
       s.CompanyName,
       o.ShippedDate
  FROM [order] AS o
       JOIN
       shipper AS s ON o.ShipVia = s.Id
 WHERE o.ShippedDate < '2012-08-09'
 ORDER BY o.shippeddate DESC;

-- Display the name and quantity of the products 
--ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName,
       od.Quantity
  FROM orderdetail AS od
       JOIN
       product AS p ON od.productid = p.Id
 WHERE od.OrderId = 10251
 ORDER BY p.ProductName ASC;


-- Display the OrderID, Customer's Company Name and the 
--employee's LastName for every order. All columns should 
--be labeled clearly. Displays 16,789 records.
SELECT [order].Id AS [Order ID],
       customer.CompanyName AS [Customer's Company Name],
       employee.LastName AS [Employee's Last Name]
  FROM [order]
       JOIN
       customer ON [order].CustomerId = customer.Id
       JOIN
       employee ON [order].EmployeeId = employee.Id;