-- Platform: DataLemur

-- Problem: Third-Transaction

-- Link: https://datalemur.com/questions/sql-third-transaction

-- Concept: Subquery, ROW_NUMBER(), WHERE.

-- Query
SELECT
    user_id,
    spend,
    transaction_date
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY transaction_date
        ) AS row_num
    FROM transactions
) t
WHERE row_num = 3;


/*
Explanation: Started by finding the third transaction made by each user.
Selected the transactions table because it contains user transaction details and transaction dates.
Used the ROW_NUMBER() window function to assign a sequential number to each transaction for every user.
Applied PARTITION BY user_id to restart the row numbering separately for each user.
Used ORDER BY transaction_date to assign row numbers based on transaction order from earliest to latest.
Renamed the generated sequence as row_num for easier filtering.
Stored the result of the window function inside a subquery with alias t.
Used the outer query to filter only rows where row_num = 3.
Selected user_id, spend, and transaction_date for the final output.
Solved the problem by retrieving the third transaction record for each user.
*/