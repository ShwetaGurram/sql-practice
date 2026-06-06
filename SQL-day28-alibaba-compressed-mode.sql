-- Platform: DataLemur

-- Problem: Alibaba-Compressed-Mode

-- Link: https://datalemur.com/questions/alibaba-compressed-mode

-- Concept: CTE,  WINDOW FUNCTION, AGGREGATE FUNCTION, WHERE, ORDER BY.

-- Query
WITH ranked_modes AS (
    SELECT 
        item_count,
        order_occurrences,
        DENSE_RANK() OVER (ORDER BY order_occurrences DESC) as rank_id
    FROM items_per_order
)


SELECT item_count AS mode
FROM ranked_modes
WHERE rank_id = 1
ORDER BY item_count ASC;


OR


SELECT item_count AS mode
FROM items_per_order
WHERE order_occurrences = (
    SELECT MAX(order_occurrences) 
    FROM items_per_order
)
ORDER BY item_count ASC;

/*
Explanation: 

Approach 1: Using DENSE_RANK()
First, I identified that the mode is the value that occurs most frequently in the dataset.
Since there could be multiple values with the same highest frequency, I used a CTE to rank all item_count values based on their order_occurrences.
I applied the DENSE_RANK() window function and ordered the data by order_occurrences in descending order.
This assigns rank 1 to the item count(s) with the highest occurrence frequency.
The CTE creates a ranked list of all item counts and their frequencies.
In the final query, I filtered for rank_id = 1 to keep only the most frequent item count values.
Finally, I sorted the result by item_count in ascending order.
This approach is useful when multiple item counts share the highest frequency because it automatically returns all modes.


Approach 2: Using MAX()
First, I identified that the mode corresponds to the highest value in the order_occurrences column.
I used a subquery to find the maximum occurrence count from the table.
Then, I filtered the records where order_occurrences equals that maximum value.
This returns all item counts that have the highest frequency.
Finally, I sorted the result by item_count in ascending order.
This approach is simpler and more direct when the goal is only to find the most frequent value(s).
*/