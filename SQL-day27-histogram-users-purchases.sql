-- Platform: DataLemur

-- Problem: Histogram-Users-Purchases

-- Link: https://datalemur.com/questions/histogram-users-purchases

-- Concept: CTE,  WINDOW FUNCTION, GROUP BY, ORDER BY.

-- Query
WITH recent_transactions AS (
    SELECT
        user_id,
        transaction_date,
        product_id,
        DENSE_RANK() OVER (
            PARTITION BY user_id
            ORDER BY transaction_date DESC
        ) AS ranking
    FROM user_transactions
)

SELECT
    transaction_date,
    user_id,
    COUNT(product_id) AS purchase_count
FROM recent_transactions
WHERE ranking = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date;

/*
Explanation: Since I needed to identify the latest transaction for every user before counting purchases, I used a CTE (recent_transactions) to simplify the process.
I started with the user_transactions table because it contains user, product, and transaction date information.
I used the DENSE_RANK() window function to rank transaction dates for each user.
I partitioned the ranking by user_id so that each user's transactions are evaluated independently.
I ordered the ranking by transaction_date DESC so the most recent transaction date receives rank 1.
The CTE produced a ranked list of transactions, making it easy to identify the latest transaction date for each user.
In the final query, I filtered the data to keep only rows where ranking = 1, which represents each user's most recent transaction date.
Then, I grouped the data by transaction_date and user_id to calculate purchases for each user on that latest date.
I used COUNT(product_id) to count the number of products purchased on the user's most recent transaction date.
Finally, I sorted the results by transaction_date for a structured output.
The final result shows, for each user, the most recent transaction date and the number of products purchased on that date.
*/