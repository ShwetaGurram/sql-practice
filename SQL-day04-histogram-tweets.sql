-- Platform: DataLemur

-- Problem: Histogram-tweets

-- Link: https://datalemur.com/questions/sql-histogram-tweets

-- Concept: Group By, Aggregate Function (COUNT), Subquery

-- Query
SELECT
    tweet_count AS tweet_bucket,
    COUNT(user_id) AS users_num
FROM (
    SELECT
        user_id,
        COUNT(tweet_id) AS tweet_count
    FROM tweets
    WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY user_id
) AS user_num
GROUP BY tweet_count
ORDER BY tweet_bucket;

/*
Explanation: Retrieves tweet activity data from the tweets table for the year 2022.
Uses a subquery to count the total number of tweets posted by each user.
Groups records by user_id to calculate individual user tweet counts.
Stores each user’s total tweet count as tweet_count.
In the outer query, groups users based on their tweet counts.
Counts how many users fall into each tweet count category using COUNT(user_id).
Renames tweet_count as tweet_bucket to represent tweet frequency groups.
Renames the user count as users_num for better readability.
Sorts the final output in ascending order of tweet count.
*/
