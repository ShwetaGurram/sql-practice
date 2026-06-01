-- Platform: DataLemur

-- Problem: Swapped-Food-delivery

-- Link: https://datalemur.com/questions/sql-swapped-food-delivery

-- Concept: CTE, CASE WHEN, ORDER BY.

-- Query
WITH order_details AS (
    SELECT
        order_id,
        item,
        MAX(order_id) OVER () AS last_order_id
    FROM orders
)


SELECT
    CASE
        WHEN order_id % 2 <> 0
             AND order_id <> last_order_id
            THEN order_id + 1
        WHEN order_id % 2 = 0
            THEN order_id - 1
        ELSE order_id
    END AS corrected_order_id,
    item
FROM order_details
ORDER BY corrected_order_id;


/*
Explanation: First, I identified the swapping adjacent order IDs while keeping the last order unchanged if the total number of orders is odd.
Since I needed access to the highest order ID while processing every row, I created a CTE (order_details) to store that information.
Inside the CTE, I used MAX(order_id) OVER() to find the last (highest) order ID without collapsing the rows.
This allowed me to compare every order against the final order in the dataset.
In the main query, I used a CASE statement to determine the corrected order ID for each row.
For odd order IDs, I added 1 so they swap places with the next order.
For even order IDs, I subtracted 1 so they swap places with the previous order.
I added a condition to exclude the last order from swapping when it is an odd-numbered order with no matching pair.
In that scenario, the last order ID remains unchanged.
Finally, I displayed the updated order IDs along with their corresponding items.
I sorted the result by corrected_order_id to show the orders in their corrected sequence.
The final output returns the reordered list after swapping adjacent order IDs while preserving an unpaired last order.
*/