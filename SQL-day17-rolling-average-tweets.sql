-- Platform: DataLemur

-- Problem: Rolling-Average-Tweets

-- Link: https://datalemur.com/questions/rolling-average-tweets

-- Concept: Subquery, ROUND, ROWS BETWEEN.

-- Query
SELECT 
    user_id, 
    tweet_date, 
    ROUND(
        AVG(tweet_count) OVER (
            PARTITION BY user_id 
            ORDER BY tweet_date 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
    ) AS rolling_avg_3d
FROM tweets;

/*
Explanation: First, I identified the requirement of calculating a 3-day rolling average of tweet counts for each user over time.
Since the calculation needs to follow each user's activity timeline separately, I used a window function instead of GROUP BY.
I selected user_id, tweet_date, and tweet_count from the tweets table to work with user-level daily activity data.
I applied AVG() as a window function to calculate a moving average rather than a single aggregated result.
Used PARTITION BY user_id so the rolling calculation is performed independently for each user.
Used ORDER BY tweet_date to ensure the calculation follows the chronological order of tweets.
Applied ROWS BETWEEN 2 PRECEDING AND CURRENT ROW to define a rolling window that includes the current day and previous 2 rows, creating a 3-row moving average.
Used ROUND(..., 2) to display the rolling average up to 2 decimal places for cleaner output.
Solved the problem by generating a time-based trend metric that shows how each user’s tweet activity changes over a rolling 3-day period.
*/