-- Write an SQL query to find employees who have the highest salary in each of the departments.
-- Return the result table in any order

WITH findRank AS (

    SELECT RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC ) as ranks, e.name as Employee , e.salary as Salary, d.name as Department 
    FROM Employee e JOIN Department d ON d.id = e.departmentId 
)

SELECT Department, Employee, Salary 
FROM  findRank
WHERE ranks = 1


-- This was bit tricky 
-- First need to find ranking and partition by department name
    -- The department name located in Department table so need to join 
    -- Ranking will show which salary are highest based on Department partition 
-- Write another query to show only rank 1s