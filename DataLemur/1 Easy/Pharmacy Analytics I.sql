-- part 1
-- CVS Health

-- CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
    -- Each drug can only be produced by one manufacturer.

-- Write a query to find the top 3 most profitable drugs sold, and how much profit they made.
   -- Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

SELECT DISTINCT drug, total_sales-cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
limit 3;


-- Solving using CTE 

WITH topThree AS (

  SELECT DISTINCT RANK() OVER(ORDER BY total_sales-cogs DESC) AS ranks, drug,  total_sales-cogs AS total_profit
  FROM pharmacy_sales
  ORDER BY total_profit DESC

)

SELECT drug, total_profit
FROM topThree
WHERE ranks < 4