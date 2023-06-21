--      EASY    --

-- 1873. Calculate Special Bonus
----------------------------------------------------------------
-- Write an SQL query to calculate the bonus of each employee. 
-- The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and 
-- the employee name does not start with the character 'M'. The bonus of an employee is 0 otherwise.

-- Return the result table ordered by employee_id.

SELECT employee_id,
CASE
    WHEN name LIKE 'M%' OR employee_id%2 = 0 THEN salary * 0
    -- WHEN THEN salary * 0
    ELSE salary * 1
END AS bonus
FROM Employees 
ORDER BY employee_id

-- Use of case stements or IF 
-- commented out code can be there too instead of using OR in the first statement

-- 627. Swap Salary
----------------------------------------------------------------
-- Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) 
-- with a single update statement and no intermediate temporary tables.
-- Note that you must write a single update statement, do not write any select statement for this problem.

-- Something new as I have not done any update statements 
-- Approach was correct as I need case statement to solve

UPDATE Salary
SET sex = CASE sex
        WHEN 'm' THEN 'f'
        ELSE 'm'
    END; 

-- 196. Delete Duplicate Emails
----------------------------------------------------------------
-- firtst need update statement 
-- second need SET 
    -- must define the new column name and =
    -- CASE to select the condition
    -- WHEN to start its like if

-- Write an SQL query to delete all the duplicate emails, 
-- keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.

-- After running your script, the answer shown is the Person table. 
-- The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

DELETE t2
FROM Person t1, Person t2
WHERE t1.email = t2.email AND t1.id < t2.id

-- Since the question asked to keep the smallest ID I am removing P2