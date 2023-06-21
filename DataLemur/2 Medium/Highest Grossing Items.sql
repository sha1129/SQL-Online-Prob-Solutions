-- Amazon SQL Interview Question

-- Assume you are given the table containing information on Amazon customers and their spending on products in various categories.
-- Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend


WITH  TopTwoEachCatgry AS (
    
    SELECT RANK() OVER(PARTITION BY category ORDER BY SUM(SPEND) DESC) AS ranks, category, product, SUM(spend) as  total_spend
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY product, category 
    ORDER BY category
)

SELECT category, product, total_spend
FROM TopTwoEachCatgry
WHERE ranks < 3
