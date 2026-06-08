-- Platform: DataLemur

-- Problem: Uncategorized-Calls-Percentage

-- Link: https://datalemur.com/questions/uncategorized-calls-percentage

-- Concept: WINDOW FUNCTION, ROUND.

-- Query
SELECT 
    ROUND(
        (COUNT(CASE WHEN call_category = 'n/a' OR call_category IS NULL THEN 1 END) * 100.0) 
        / COUNT(*), 
        1
    ) AS uncategorised_call_pct
FROM callers;


/*
Explanation: First, I identified the requirement: calculating the percentage of calls that are uncategorized.
I started with the callers table because it contains the call category information for every call record.
I defined an uncategorized call as one where call_category is either 'n/a' or NULL.
To count such calls, I used a CASE WHEN condition that returns 1 only for uncategorized records.
Then, I applied COUNT() to calculate the total number of uncategorized calls.
To find the percentage, I divided the uncategorized call count by the total number of calls using COUNT(*).
I multiplied the result by 100.0 to convert it into a percentage and ensure decimal division.
I used ROUND(..., 1) to display the percentage up to one decimal place.
Finally, I renamed the calculated value as uncategorised_call_pct for better readability.
The final result shows the percentage of calls that do not have a valid category assigned.
*/