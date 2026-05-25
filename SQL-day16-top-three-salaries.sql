-- Platform: DataLemur

-- Problem: Top-Three-Salaries

-- Link: https://datalemur.com/questions/sql-top-three-salaries

-- Concept: CTE, Subquery, DENSE_RANK(), JOIN.

-- Query
WITH  top_3_salary_rank AS(
    SELECT 
        d.department_name,
        e.name,
        e.salary,
        DENSE_RANK() OVER(
            PARTITION BY d.department_name
            ORDER BY e.salary DESC
        ) AS ranking
    FROM employee e
    JOIN department d
    USING(department_id)
)

SELECT
    department_name,
    name,
    salary
FROM top_3_salary_rank
WHERE ranking <= 3
ORDER BY department_name ASC, salary DESC, name ASC


/*
Explanation: Started by finding the top 3 highest-paid employees in each department.
Used a Common Table Expression (CTE) named top_3_salary_rank to organize the ranking logic in a readable way.
Selected data from both employee and department tables to combine employee details with department names.
Joined the tables using department_id to connect employees with their respective departments.
Selected department_name, employee name, and salary for analysis.
Used the DENSE_RANK() window function to rank employees based on salary within each department.
Applied PARTITION BY d.department_name to restart the ranking separately for every department.
Used ORDER BY e.salary DESC so employees with the highest salaries receive the top ranks.
Chose DENSE_RANK() to correctly handle employees with equal salaries without skipping ranks.
Stored the ranked employee data inside the CTE for further filtering.
In the final query, filtered records where ranking <= 3 to return only the top 3 salary ranks in each department.
Ordered the final result by department name, highest salary, and employee name for a structured and readable output.
Solved the problem by generating a department-wise list of the top 3 highest-paid employees.
*/