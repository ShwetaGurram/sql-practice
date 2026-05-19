-- Platform: DataLemur

-- Problem: Average-Post-Hiatus-1

-- Link: https://datalemur.com/questions/sql-average-post-hiatus-1

-- Concept: GROUP BY, HAVING, WHERE, EXTRACT, MAX, MIN.

-- Query
SELECT
    user_id,
    EXTRACT(DAY FROM (MAX(post_date) - MIN(post_date))) AS days_between
FROM posts
WHERE post_date BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY user_id
HAVING COUNT(post_id) >= 2;

/*
Explanation: Selected the user_id column to identify each user separately.
Used MAX(post_date) and MIN(post_date) to find the latest and earliest post dates for each user in 2021.
Calculated the difference between the first and last post dates to determine the number of days between them.
Applied the EXTRACT(DAY FROM ...) function to retrieve only the day difference from the date interval.
Filtered records using the WHERE clause to include only posts made in the year 2021.
Grouped records by user_id to calculate results for each user individually.
Used the HAVING clause to keep only users who posted at least twice in 2021.
Solved the problem by returning each eligible user along with the number of days between their first and last post.
*/
