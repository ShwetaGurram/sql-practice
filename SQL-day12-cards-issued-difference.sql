-- Platform: DataLemur

-- Problem: Cards-Issued-Difference

-- Link: https://datalemur.com/questions/cards-issued-difference

-- Concept: GROUP BY, ORDER BY, MIN, MAX.

-- Query
SELECT
    card_name,
    MAX(issued_amount) - MIN(issued_amount) AS difference 
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;


/*
Explanation: Started by calculating the difference between the highest and lowest issued amounts for each card type.
Selected the monthly_cards_issued table because it contains card issuance details and issued amounts.
Chose the card_name column to analyze issuance trends for each card separately.
Used MAX(issued_amount) to find the highest issued amount for each card.
Used MIN(issued_amount) to find the lowest issued amount for each card.
Calculated the difference between the maximum and minimum issued amounts using: MAX(issued_amount) - MIN(issued_amount).
Renamed the calculated result as difference for better readability.
Grouped the records by card_name to perform calculations separately for each card type.
Sorted the final output in descending order of difference to show cards with the largest variation first.
Solved the problem by identifying how much the issued amount fluctuated for each card type.
*/