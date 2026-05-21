-- Platform: DataLemur

-- Problem: Alibaba-Compressed-Mean

-- Link: https://datalemur.com/questions/alibaba-compressed-mean

-- Concept: ROUND, SUM.

-- Query
SELECT
    ROUND((
            SUM(item_count * order_occurrences)::numeric /
            SUM(order_occurrences)
        ), 1) AS mean
FROM items_per_order;


/*
Explanation: Started by calculating the average number of items per order.
Selected the items_per_order table because it contains item counts and how frequently those orders occurred.
Used item_count * order_occurrences to calculate the total number of items contributed by each order category.
Applied SUM(item_count * order_occurrences) to find the overall number of items across all orders.
Used SUM(order_occurrences) to calculate the total number of orders.
Divided the total items by the total orders to compute the weighted average number of items per order.
Applied ::numeric type casting to ensure decimal division instead of integer division.
Used ROUND(..., 1) to display the final average value up to 1 decimal place.
Renamed the calculated result as mean for better readability.
Solved the problem by calculating the weighted mean of items ordered across all customer orders.
*/