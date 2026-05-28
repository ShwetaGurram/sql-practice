-- Platform: DataLemur

-- Problem: IBM-DB2-Product-Analytics

-- Link: https://datalemur.com/questions/sql-ibm-db2-product-analytics

-- Concept: CTE, LEFT JOIN, GROUP BY, ORDER BY, COUNT, DISTINCT.

-- Query
WITH query_count AS (

    SELECT
        e.employee_id,
        COUNT(DISTINCT q.query_id) AS unique_queries

    FROM employees AS e
    LEFT JOIN queries AS q
        ON e.employee_id = q.employee_id
       AND EXTRACT(YEAR FROM q.query_starttime) = 2023
       AND EXTRACT(QUARTER FROM q.query_starttime) = 3

    GROUP BY e.employee_id
)

SELECT
    unique_queries,
    COUNT(employee_id) AS employee_count
FROM query_count
GROUP BY unique_queries
ORDER BY unique_queries;


/*
Explanation: First, I needed to find how many unique queries each employee handled in Q3 of 2023.
I used a CTE (query_count) to make the query easier to read and solve step by step.
I started with the employees table because I wanted all employees in the result, even if they did not handle any queries.
Then, I joined the queries table using employee_id to connect employees with their queries.
I filtered the queries to include only records from Quarter 3 of 2023.
After that, I grouped the data by employee_id to calculate query counts separately for each employee.
I used COUNT(DISTINCT q.query_id) to count only unique queries and avoid duplicate counting.
The CTE result gave one row per employee with their total unique queries.
In the final query, I grouped employees based on their query count.
Then, I counted how many employees fall into each query-count group.
Finally, I sorted the result by the number of unique queries.
The final output shows how many employees handled 0 queries, 1 query, 2 queries, and so on during Q3 2023.
*/