-- Part 2
-- CVS Health


-- CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
    -- Each drug can only be produced by one manufacturer.
-- Write a query to find out which manufacturer is associated with the drugs 
    -- that were not profitable and how much money CVS lost on these drugs. 
-- Output the manufacturer, number of drugs and total losses. 
    -- Total losses should be in absolute value. Display the results with the highest losses on top.

SELECT DISTINCT manufacturer, COUNT(DRUG) drug_count, SUM(ABS(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs < 0
GROUP BY manufacturer
ORDER BY total_loss DESC;

-- lessons learned
    -- can you where statements to find Negative Revenue
    -- SUM can be used to aggregate the column so that we do not have to use it again 
