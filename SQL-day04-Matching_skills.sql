-- Platform: DataLemur

-- Problem: Matching skills

-- Link: https://datalemur.com/questions/matching-skills

-- Concept: Group By, HAVING, IN, COUNT(DISTINCT)

-- Query
SELECT 
    candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3
ORDER BY candidate_id;

/*
Explanation: This query retrieves the IDs of candidates who possess all three required skills — Python, Tableau, and PostgreSQL.
It first filters records to include only the required skills: Python, Tableau, and PostgreSQL.
Groups the records by candidate_id to evaluate each candidate separately.
Counts the number of distinct required skills for each candidate.
Uses the HAVING clause to keep only candidates who possess all three unique skills.
Prevents duplicate skill entries from affecting the result by using DISTINCT.
Sorts the final output in ascending order of candidate_id.
*/
