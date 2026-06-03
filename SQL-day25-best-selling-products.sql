-- Platform: DataLemur

-- Problem: Best-Selling-Products

-- Link: https://datalemur.com/questions/best-selling-products

-- Concept: CTE, LEFT JOIN, WINDOW FUNCTION.

-- Query
WITH ranking_sales_quantity AS (
    SELECT
        p.category_name,
        p.product_name,
        ps.sales_quantity,
        ps.rating,
        DENSE_RANK() OVER(
            PARTITION BY p.category_name
            ORDER BY ps.sales_quantity DESC, ps.rating DESC
        ) AS sales_rank
    FROM products AS p
    LEFT JOIN product_sales AS ps
        ON  p.product_id = ps.product_id
)


SELECT
    category_name,
    product_name
FROM ranking_sales_quantity
WHERE sales_rank = 1;


/*
Explanation: Since the ranking logic was a bit complex, I used a CTE (ranking_sales_quantity) to calculate rankings before filtering the final results.
I started with the products table because it contains product and category information.
Then, I joined it with the product_sales table to get sales quantity and rating data for each product.
After combining the data, I needed to rank products within each category.
I used the DENSE_RANK() window function to assign rankings.
I partitioned the ranking by category_name so that products are compared only with other products in the same category.
I ordered the ranking by sales_quantity DESC because higher sales quantity is the primary factor for determining the top product.
As a tie-breaker, I added rating DESC so that if two products have the same sales quantity, the product with the higher rating gets the better rank.
The CTE produced a ranked list of products for every category.
In the final query, I filtered the results to keep only products with sales_rank = 1.
This returns the highest-ranked product from each category.
The final output shows the top-selling product in every category, with rating used to break ties when sales quantities are equal.
*/