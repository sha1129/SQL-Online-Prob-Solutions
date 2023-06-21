-- Part 3
-- CVS Health

-- Write a query to find the total sales of drugs for each manufacturer. 
    -- Round your answer to the closest million, and report your results in descending order of total sales.

-- Because this data is being directly fed into a dashboard which is being 
   -- seen by business stakeholders, format your result like this: "$36 million".


SELECT manufacturer, 
    CONCAT ('$',ROUND(sum(total_sales)/1000000,0),' million') AS sales_mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sum(total_sales) DESC;

-- notes use concat to add info for clear presentation 