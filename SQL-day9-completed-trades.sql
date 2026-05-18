-- Platform: DataLemur

-- Problem: Completed-Trades

-- Link: https://datalemur.com/questions/completed-trades

-- Concept: LEFT JOIN, USING, WHERE, COUNT, GROUP BY, ORDER BY, LIMIT.

-- Query
SELECT
    u.city,
    COUNT(t.user_id) AS total_orders
FROM users u
LEFT JOIN trades t
USING(user_id)
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;


/*
Explanation: Started by finding the top cities with the highest number of completed orders.
Selected the `users` table because it contains city information, and the `trades` table because it stores order details and trade status.
Joined both tables using `user_id` to connect each trade with the corresponding user’s city.
Focused only on successful transactions by filtering records where `status = 'Completed'`.
Grouped the data by city to analyze total completed orders for each location separately.
Used `COUNT(t.user_id)` to measure the number of completed orders in every city.
Sorted the results in descending order to prioritize cities with the highest activity.
Applied `LIMIT 3` to return only the top 3 performing cities.
Solved the problem by creating a city-level summary of completed trade activity.
*/


