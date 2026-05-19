-- Platform: DataLemur

-- Problem: Tesla-Unfinished-Parts

-- Link: https://datalemur.com/questions/tesla-unfinished-parts

-- Concept: WHERE, IS NULL

-- Query
SELECT
    part,
    assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;

/*
Explanation: Selected the part and assembly_step columns from the parts_assembly table to display the required information.
Used the WHERE clause to filter only incomplete assembly records.
Applied IS NULL on the finish_date column to identify parts that do not have a completion date.
Solved the problem by retrieving only the assembly steps that are still pending or unfinished.
*/
