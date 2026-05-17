-- Platform: DataLemur

-- Problem: Teams-Power-Users

-- Link: https://datalemur.com/questions/teams-power-users

-- Concept: GROUP BY, ORDER BY, LIMIT, WHERE, BETWEEN, COUNT.

-- Query
SELECT
    sender_id,
    COUNT(sent_date) AS message_count
FROM messages
WHERE sent_date BETWEEN '08/01/2022' AND '08/31/2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;

/*
Explanation: Selected the sender_id column to identify each message sender.
Used COUNT(sent_date) to calculate the total number of messages sent by each user.
Retrieved data from the messages table.
Applied the WHERE clause to filter messages sent during August 2022.
Grouped records by sender_id to count messages for each sender individually.
Used ORDER BY message_count DESC to sort users by highest message count in descending order.
Applied LIMIT 2 to return only the top 2 users with the most messages sent.
Solved the problem by identifying the two most active message senders in August 2022.
*/