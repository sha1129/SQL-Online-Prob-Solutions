--      EASY    --
----------------------------------------------------------------
-- 1965. Employees With Missing Information
----------------------------------------------------------------

-- Write an SQL query to report the IDs of all the employees with missing information. The information of an employee is missing if:
   -- The employee's name is missing, or
   -- The employee's salary is missing.
-- Return the result table ordered by employee_id in ascending order.

SELECT E.employee_id
FROM  
  (SELECT * FROM Employees LEFT JOIN Salaries USING(employee_id)
   UNION 
   SELECT * FROM Employees RIGHT JOIN Salaries USING(employee_id))
AS E
WHERE E.salary IS NULL OR E.name IS NULL
ORDER BY employee_id;

-- kinda dumb
----------------------------------------------------------------
-- 1795. Rearrange Products Table
----------------------------------------------------------------

-- Write an SQL query to rearrange the Products table so that each row has (product_id, store, price).
-- If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
-- Return the result table in any order.

SELECT product_id, 'store1' AS store, store1 AS price 
FROM Products 
WHERE store1 IS NOT NULL

UNION 

SELECT product_id, 'store2' AS store, store2 AS price 
FROM Products 
WHERE store2 IS NOT NULL

UNION 
SELECT product_id, 'store3' AS store, store3 AS price 
FROM Products 
WHERE store3 IS NOT NULL

-- its not good because if we had more stores then its not efficent 
-- better do in excel 
-- kinda dumb
----------------------------------------------------------------
-- 608. Tree Node
----------------------------------------------------------------

-- Each node in the tree can be one of three types:

   -- "Leaf": if the node is a leaf node.
   -- "Root": if the node is the root of the tree.
   -- "Inner": If the node is neither a leaf node nor a root node.

--Write an SQL query to report the type of each node in the tree.
--Return the result table in any order.

WITH nodeClasification AS (

    SELECT T.id,
    CASE
        when T.p_id is null then 'Root'
        when T1.p_id is null then 'Leaf'
        ELSE 'Inner'
    END AS Type
    FROM Tree T left join Tree T1
        ON T.id = T1.p_id
    
)

SELECT DISTINCT *
FROM nodeClasification

-- create sub query 
-- join with two tables 
---------------------------------------------------------------
-- 176. Second Highest Salary
----------------------------------------------------------------

-- Write an SQL query to report the second highest salary from the Employee table. 
-- If there is no second highest salary, the query should report null.

SELECT MAX(salary) AS SecondHighestSalary 
FROM Employee 
WHERE salary < ( 
        SELECT MAX(salary)
        FROM Employee )