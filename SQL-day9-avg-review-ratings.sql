-- Platform: DataLemur

-- Problem: Avg-Review-Ratings

-- Link: https://datalemur.com/questions/sql-avg-review-ratings

-- Concept: GROUP BY, ORDER BY, EXTRACT.

-- Query
SELECT
    EXTRACT(MONTH FROM submit_date) AS mth,
    product_id,
    ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product_id;


/*
Explanation: Selected the `reviews` table because it contains review dates, product information, and star ratings.
Used `EXTRACT(MONTH FROM submit_date)` to retrieve the month from each review submission date.
Created a new column alias `mth` to represent the review month clearly.
Selected `product_id` to evaluate ratings for each product separately.
Applied `AVG(stars)` to calculate the average rating received by each product.
Used `ROUND(AVG(stars), 2)` to display the average rating up to 2 decimal places for better readability.
Grouped the data by month and product ID to calculate monthly average ratings for every product.
Used `ORDER BY mth, product_id` to organize the output first by month and then by product.
Solved the problem by generating a month-wise product rating.
*/