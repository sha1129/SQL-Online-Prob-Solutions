--      EASY    --
----------------------------------------------------------------
-- 175. Combine Two Tables
----------------------------------------------------------------

-- Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 
-- If the address of a personId is not present in the Address table, report null instead.
-- Return the result table in any order.

SELECT P.firstName, P.lastName, A.city, A.state 
FROM Person P LEFT JOIN Address A 
    ON P.personId = A.personId
----------------------------------------------------------------
-- 1581. Customer Who Visited but Did Not Make Any Transactions
----------------------------------------------------------------
-- Write a SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
-- Return the result table sorted in any order.

WITH numbOfTrans AS (

    SELECT customer_id, transaction_id 
    FROM Visits V LEFT JOIN Transactions T 
            ON V.visit_id = T.visit_id 
    WHERE transaction_id IS NULL 
    


)
SELECT customer_id, COUNT(customer_id) AS count_no_trans 
FROM numbOfTrans
GROUP BY customer_id
ORDER BY customer_id ASC

----------------------------------------------------------------
-- 1148. Article Views I
----------------------------------------------------------------

--Write an SQL query to find all the authors that viewed at least one of their own articles.
--Return the result table sorted by id in ascending order.

SELECT DISTINCT author_id AS id
FROM Views  
WHERE author_id  = viewer_id   
ORDER BY id ASC 
