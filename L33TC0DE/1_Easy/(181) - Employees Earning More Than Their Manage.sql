--Write an SQL query to find the employees who earn more than their managers.
--Return the result table in any order


SELECT name AS Employee 
FROM  Employee
HAVING MAX(salary) > (
    SELECT MAX(salary)
    FROM Employee
    WHERE managerId IS Null
)


--- WRONG ---
-- Unable to solve 
-- try 2

WITH mgmt AS (
    SELECT SALARY as mSal, id 
    FROM Employee 
    WHERE managerId is null 
)

SELECT E.name AS Employee 
FROM Employee E LEFT JOIN mgmt M ON E.id = m.id

--- WRONG ---
-- Close but still wrong
-- Need to look at soloution 

SELECT B.name AS Employee 
FROM Employee A JOIN Employee B
ON A.id = b.managerId AND B.salary > A.salary
