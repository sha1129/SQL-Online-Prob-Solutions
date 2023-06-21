-- Uber SQL Interview Question

-- Assume you are given the table below on Uber transactions made by users. 
-- Write a query to obtain the third transaction of every user. 
-- Output the user id, spend and transaction date

WITH rankTanx AS (

  SELECT RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) as ranks, user_id, spend, transaction_date
  FROM transactions
  GROUP BY transaction_date,user_id,spend
)

SELECT user_id, spend, transaction_date 
FROM rankTanx
WHERE ranks = 3

-- USE of Common Table Expressions (CTE) are temporary in the sense that they only exist during the execution of the query 