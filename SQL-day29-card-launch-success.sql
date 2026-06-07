-- Platform: DataLemur

-- Problem: Card-Launch-Success

-- Link: https://datalemur.com/questions/card-launch-success

-- Concept: CTE,  WINDOW FUNCTION, WHERE, ORDER BY.

-- Query
WITH monthly_cards_ranked AS (
    SELECT
        *,
        
        DENSE_RANK() OVER(
            PARTITION BY card_name
            ORDER BY issue_year, issue_month
        ) AS ranking

FROM monthly_cards_issued
)


SELECT
    card_name,
    issued_amount
FROM monthly_cards_ranked
WHERE ranking = 1
ORDER BY issued_amount DESC;

/*
Explanation: The requirement is to find the first issued amount recorded for each card type.
Since I needed to determine the earliest record for every card, I used a CTE (monthly_cards_ranked) to rank records within each card category.
I started with the monthly_cards_issued table because it contains card names, issue dates, and issued amounts.
I applied the DENSE_RANK() window function to assign a rank to each record.
I partitioned the ranking by card_name so that each card type is analyzed separately.
Then, I ordered the records by issue_year and issue_month in ascending order to ensure the earliest issuance record receives rank 1.
The CTE produced a ranked list of issuance records for every card type.
In the final query, I filtered the data to keep only records where ranking = 1, which represents the first issuance record for each card.
I selected card_name and issued_amount as the required output columns.
Finally, I sorted the results by issued_amount in descending order to display cards with the highest initial issued amount first.
The final result shows the earliest issued amount recorded for each card type.
*/