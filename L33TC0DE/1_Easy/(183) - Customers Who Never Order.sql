--Write an SQL query to report all customers who never order anything.

SELECT name AS Customers 
FROM Customers 
WHERE id NOT IN (SELECT customerId FROM Orders )

-- Another way to solve this problem 

SELECT C.name AS Customers 
FROM Customers C LEFT JOIN Orders O
    ON C.id = O.customerId
WHERE customerId IS NULL