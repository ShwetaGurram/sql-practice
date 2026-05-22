-- Platform: DataLemur

-- Problem: Non-Profitable-Drugs

-- Link: https://datalemur.com/questions/non-profitable-drugs

-- Concept: GROUP BY, ORDER BY, WHERE, COUNT, SUM.

-- Query
SELECT
    manufacturer,
    COUNT(drug) AS drug_count,
    SUM(cogs - total_sales) AS total_loss
FROM pharmacy_sales
WHERE cogs > total_sales
GROUP BY manufacturer
ORDER BY total_loss DESC;


/*
Explanation: Started by finding manufacturers that generated losses on drug sales.
Selected the pharmacy_sales table because it contains manufacturer details, sales revenue, and production costs.
Used the WHERE clause to filter only loss-making records where cogs > total_sales.
Selected the manufacturer column to analyze losses manufacturer-wise.
Applied COUNT(drug) to calculate how many drugs from each manufacturer resulted in losses.
Renamed the count result as drug_count for better readability.
Calculated total loss using the formula: cogs - total_sales
to measure how much cost exceeded sales revenue.
Applied SUM(cogs - total_sales) to calculate the overall loss for each manufacturer.
Renamed the calculated result as total_loss for clarity in the output.
Grouped the records by manufacturer to perform calculations separately for each company.
Used ORDER BY total_loss DESC to rank manufacturers from highest loss to lowest loss.
Solved the problem by identifying manufacturers with the largest financial losses from drug sales.
*/