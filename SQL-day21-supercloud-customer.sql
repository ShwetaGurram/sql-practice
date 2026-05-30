-- Platform: DataLemur

-- Problem: Supercloud-Customer

-- Link: https://datalemur.com/questions/supercloud-customer

-- Concept: LEFT JOIN, GROUP BY, COUNT, DISTINCT.

-- Query
SELECT
    c.customer_id
FROM customer_contracts AS c
LEFT JOIN products AS p
    ON c.product_id = p.product_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT p.product_category) = (
    SELECT COUNT(DISTINCT product_category)
    FROM products);


/*
Explanation: First, finding customers who have purchased products from every available product category.
I started with the customer_contracts table because it contains the products associated with each customer.
Then, I joined the products table to get the category information for each product.
After joining the tables, I grouped the data by customer_id so I could analyze each customer separately.
For each customer, I counted the number of distinct product categories they have purchased using COUNT(DISTINCT p.product_category).
Next, I needed to know the total number of product categories available in the company.
I used a subquery to count all distinct categories present in the products table.
Then, I compared the number of categories purchased by each customer with the total number of available categories.
If both counts were equal, it means the customer has purchased at least one product from every category.
I used the HAVING clause to keep only those customers who satisfied this condition.
The final result returns the IDs of customers who have products from all available product categories.
*/