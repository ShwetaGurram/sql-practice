-- Platform: DataLemur

-- Problem: User-Retention

-- Link: https://datalemur.com/questions/user-retention

-- Concept: Subquery, AGGREGATE FUNCTION, WHERE, GROUP BY.

-- Query
SELECT 
    EXTRACT(MONTH FROM event_date) AS month, 
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM user_actions
WHERE user_id in (
    SELECT 
        DISTINCT user_id 
    FROM user_actions 
    WHERE EXTRACT(MONTH FROM event_date) = 6)
        AND EXTRACT(MONTH FROM event_date) = 7
GROUP BY EXTRACT(MONTH FROM event_date);


/*
Explanation: First, I identified the requirement: finding the number of users who were active in July and had also been active in June.
I used the user_actions table because it contains user activity records along with event dates.
To identify returning users, I first created a subquery that retrieves all unique users who performed an action in June.
I used DISTINCT user_id in the subquery to ensure each June user appears only once.
Then, in the main query, I filtered the data to include only records from July using EXTRACT(MONTH FROM event_date) = 7.
I used the IN operator to keep only those July users whose user_id also exists in the list of June users returned by the subquery.
This effectively identifies users who were active in both June and July.
After filtering, I counted the number of distinct users using COUNT(DISTINCT user_id) to avoid counting the same user multiple times.
I grouped the result by month to generate the monthly active user count.
The final result returns the number of active users in July who were also active in June, representing returning monthly active users (MAUs).
*/