--Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
--The test cases are generated so that exactly one customer will have placed more orders than any other customer.test

WITH countOrders AS (
    SELECT count(order_number) AS counts, customer_number 
    FROM Orders
    GROUP BY customer_number
)


SELECT DISTINCT C.customer_number
FROM Orders O JOIN countOrders C
    ON C.customer_number = O.customer_number
WHERE C.counts = (
    SELECT MAX(C.counts) 
    FROM countOrders C)


-- MUCH easy way of doing it
-- not sure if limit is ok

-- Opinion, this is not correct as it will go through the whole table
--  

SELECT
    customer_number
FROM
    orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1