-- Platform: DataLemur

-- Problem: Frequent-Callers

-- Link: https://datalemur.com/questions/frequent-callers

-- Concept: Subquery, GROUP BY, HAVING, DISTINCT, COUNT.

-- Query
SELECT
    COUNT(policy_holder_id) AS policy_holder_count
FROM (
    SELECT
        policy_holder_id,
        COUNT(DISTINCT case_id) AS unique_case_id
    FROM callers
    GROUP BY policy_holder_id
    HAVING COUNT(DISTINCT case_id) >= 3
) AS a;


/*
Explanation: Started by finding how many policy holders made at least 3 unique claim-related calls.
Selected the callers table because it contains policy holder IDs and case IDs related to customer calls.
Used a subquery to first analyze call activity for each policy holder individually.
Grouped the records by policy_holder_id to calculate metrics separately for each customer.
Applied COUNT(DISTINCT case_id) to count the number of unique cases associated with each policy holder.
Used DISTINCT to avoid counting duplicate case IDs multiple times.
Applied the HAVING clause to keep only policy holders with 3 or more unique cases.
Stored the filtered result temporarily using the alias a.
In the outer query, used COUNT(policy_holder_id) to calculate the total number of qualifying policy holders.
Renamed the final result as policy_holder_count for better readability.
Solved the problem by identifying the number of policy holders who handled at least three distinct cases.
*/