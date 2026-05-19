-- Platform: DataLemur

-- Problem: Well-Paid-Employees

-- Link: https://datalemur.com/questions/sql-well-paid-employees

-- Concept: SELF JOIN, WHERE, AS.

-- Query
SELECT
    e.employee_id,
    e.name AS employee_name
FROM employee e
JOIN employee m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;


/*
Explanation: Started by finding employees who earn more than their managers.
Used the employee table twice because both employee and manager information exist in the same table.
Applied a self join to compare employee records with their corresponding manager records.
Assigned alias e for employee data and alias m for manager data to make the query easier to read.
Joined the tables using e.manager_id = m.employee_id to connect each employee with their manager.
Selected employee_id and employee name from the employee table.
Renamed the name column as employee_name for better clarity in the output.
Used the WHERE clause to filter employees whose salary is greater than their manager’s salary.
Solved the problem by identifying employees who are paid more than the managers.
*/