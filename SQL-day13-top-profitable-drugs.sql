-- Platform: DataLemur

-- Problem: Top-Profitable-Drugs

-- Link: https://datalemur.com/questions/top-profitable-drugs

-- Concept: ORDER BY, LIMIT.

-- Query
SELECT
    drug,
    (total_sales - cogs)  AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;


/*
Explanation: Started by finding the top 3 most profitable drugs based on sales performance.
Selected the pharmacy_sales table because it contains sales revenue and cost information for each drug.
Chose the drug column to analyze profit for each medicine separately.
Calculated profit using the formula: total_sales - cogs
where cogs represents the cost of goods sold.
Renamed the calculated value as total_profit for better readability.
Used ORDER BY total_profit DESC to sort drugs from highest profit to lowest profit.
Applied LIMIT 3 to return only the top 3 most profitable drugs.
Solved the problem by identifying the drugs generating the highest profit for the business.
*/