--      EASY    --
----------------------------------------------------------------
-- 595. Big Countries 
----------------------------------------------------------------

--A country is big if:

    -- it has an area of at least three million (i.e., 3000000 km2), or
    -- it has a population of at least twenty-five million (i.e., 25000000).

-- Write an SQL query to report the name, population, and area of the big countries.

SELECT  name, population, area AS 'area'
FROM World
WHERE area >= 3000000 OR population >=  25000000
----------------------------------------------------------------
-- 1757. Recyclable and Low Fat Products
----------------------------------------------------------------

-- Write an SQL query to find the ids of products that are both low fat and recyclable.

SELECT product_id  
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y'
-- Have to use AND here

----------------------------------------------------------------
-- 584. Find Customer Referee
----------------------------------------------------------------

-- Write an SQL query to report the names of the customer that are not 
-- referred by the customer with id = 2.

SELECT name
FROM Customer
WHERE referee_id NOT LIKE '2' OR referee_id is NUll

-- NEED TO SELECT THE NULLs As null is not a number
----------------------------------------------------------------
-- 183. Customers Who Never Order
----------------------------------------------------------------

-- Write an SQL query to report all customers who never order anything.

SELECT name AS Customers 
FROM Customers 
WHERE id NOT IN (
    SELECT customerId 
    FROM Orders 
)