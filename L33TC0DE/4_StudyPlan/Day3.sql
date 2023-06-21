--      EASY    --
----------------------------------------------------------------
--1667. Fix Names in a Table
----------------------------------------------------------------

-- Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.
-- Return the result table ordered by user_id.

SELECT user_id , CONCAT(UPPER(left(name,1)),LOWER(right(name,(length(name)-1)))) as Name
FROM Users
ORDER BY user_id ASC
----------------------------------------------------------------
-- 1484. Group Sold Products By The Date
----------------------------------------------------------------

-- Write an SQL query to find for each date the number of different products sold and their names.
-- The sold products names for each date should be sorted lexicographically.
-- Return the result table ordered by sell_date.

SELECT sell_date , 
    COUNT(DISTINCT product) AS num_sold , 
    GROUP_CONCAT( DISTINCT product ORDER BY product) AS products
FROM Activities
GROUP BY sell_date 
ORDER BY sell_date

----------------------------------------------------------------
--1527. Patients With a Condition
----------------------------------------------------------------

-- Write an SQL query to report the patient_id, patient_name and conditions of the patients who have Type I Diabetes. 
-- Type I Diabetes always starts with DIAB1 prefix

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%'