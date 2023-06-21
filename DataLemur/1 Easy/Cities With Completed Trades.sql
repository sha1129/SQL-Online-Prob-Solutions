-- Robinhood SQL Interview Question

--Write a query to list the top three cities that have the most completed trade orders in descending order.
--Output the city and number of orders


WITH topTraders AS (

  SELECT RANK() OVER(ORDER BY COUNT(t.status) DESC) AS ranks, u.city AS city, count(t.status) AS total_orders
  FROM trades t JOIN users u
    ON t.user_id = u.user_id
  WHERE status = 'Completed'
  GROUP BY u.city

)


SELECT city, total_orders
FROM topTraders
ORDER BY ranks
LIMIT 3;

-- lessons learned 
    -- use limit at main query
    -- order them by ranks so I know I will get exact info