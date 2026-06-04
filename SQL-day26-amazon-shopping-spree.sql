-- Platform: DataLemur

-- Problem: Amazon-Shopping-Spree

-- Link: https://datalemur.com/questions/amazon-shopping-spree

-- Concept: CTE,  WINDOW FUNCTION, GROUP BY, HAVING, ORDER BY.

-- Query
WITH purchase_streaks AS (
    SELECT
        user_id,
        transaction_date,
        transaction_date
        - DENSE_RANK() OVER (
            PARTITION BY user_id
            ORDER BY transaction_date
        ) * INTERVAL '1 day' AS grp
    FROM transactions
)


SELECT
    user_id
FROM purchase_streaks
GROUP BY user_id, grp
HAVING COUNT(*) >= 3
ORDER BY user_id;

/*
Explanation: To detect consecutive purchase streaks, I used a CTE (purchase_streaks) to create a grouping key for consecutive dates.
I started with the transactions table because it contains user purchase dates.
For each user, I sorted the transactions by transaction_date using ORDER BY transaction_date.
I applied DENSE_RANK() partitioned by user_id to assign a sequential number to each purchase date for that user.
Then, I used the common streak-detection technique:
transaction_date - DENSE_RANK() * INTERVAL '1 day'.
For consecutive dates, this calculation produces the same value (grp), effectively placing those dates into the same group.
As a result, all transactions that belong to the same consecutive-day streak share the same grp value.
In the outer query, I grouped the data by both user_id and grp to isolate each streak for every user.
I used COUNT(*) to calculate the length of each streak.
Then, I applied HAVING COUNT(*) >= 3 to keep only streaks that lasted at least 3 consecutive days.
Finally, I selected the corresponding user_id values and sorted them in ascending order.
The final result returns users who made purchases on three or more consecutive days.
*/