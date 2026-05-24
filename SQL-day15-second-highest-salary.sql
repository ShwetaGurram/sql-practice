-- Platform: DataLemur

-- Problem: Second-Highest-Salary

-- Link: https://datalemur.com/questions/sql-second-highest-salary

-- Concept: Subquery, DENSE_RANK(), WHERE.

-- Query
SELECT 
    DISTINCT salary AS second_highest_salary
FROM (
    SELECT
        salary,
        DENSE_RANK() OVER(
            ORDER BY salary DESC
        ) AS dense_row
    FROM employee
) d
WHERE d.dense_row = 2;


/*
Explanation: Started by finding the second highest unique salary from the employee table.
Selected the salary column because the analysis focuses on employee salary values.
Used the DENSE_RANK() window function to assign rankings to salaries in descending order.
Applied ORDER BY salary DESC so the highest salary receives rank 1, the second highest receives rank 2, and so on.
Chose DENSE_RANK() instead of ROW_NUMBER() to handle duplicate salary values correctly without skipping ranks.
Stored the ranked salary data inside a subquery with alias d.
Used the outer query to filter only rows where dense_row = 2, representing the second highest salary.
Applied DISTINCT to avoid duplicate salary values in the final output.
Renamed the result as second_highest_salary for better readability.
Solved the problem by identifying the second highest unique salary in the organization.
*/