-- Write an SQL query to calculate the total time in minutes spent by each employee on each day at the office. 
-- Note that within one day, an employee can enter and leave more than once. 
-- The time spent in the office for a single entry is out_time - in_time.

-- hints --
-- to write this code we need to do group by
-- we have group by both days and emp_id
-- we also need sum total time

SELECT event_day  AS 'day', emp_id ,SUM(out_time - in_time) AS 'total_time'
FROM Employees
Group by day, emp_id;