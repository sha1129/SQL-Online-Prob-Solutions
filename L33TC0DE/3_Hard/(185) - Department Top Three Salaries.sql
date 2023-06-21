-- A company's executives are interested in seeing who earns the most money in each of the company's departments. 
-- A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

-- Write an SQL query to find the employees who are high earners in each of the departments.
-- Return the result table in any order.


WITH salaryRanks AS(
    SELECT D.name AS Department, 
        E.name AS Employee, 
        E.salary AS Salary,
        DENSE_RANK() OVER(Partition BY E.departmentId Order by E.salary desc) as Ranks
    FROM Employee E JOIN Department D 
    ON E.departmentId = D.id

)

SELECT Department, Employee, Salary
FROM salaryRanks
WHERE ranks = 1 OR ranks = 2 OR ranks = 3

-- Same As 184 but need to use dense Ranking 
-- Dense Rank will not skip the order of ranks as ranks will skip if there are duplicates
-- Dense rank   1 2 2 3
-- Rank         1 2 2 4