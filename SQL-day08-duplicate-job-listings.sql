-- Platform: DataLemur

-- Problem: Duplicate-Job-Listings

-- Link: https://datalemur.com/questions/duplicate-job-listings

-- Concept: ROW_NUMBER() (Window Function), WHERE, COUNT, DISTINCT.

-- Query
SELECT
    COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY description
            ORDER BY title
        ) AS row_num
    FROM job_listings
) duplicate
WHERE row_num > 1;


/*
Explanation: Selected data from the job_listings table to identify duplicate job postings.
Used the ROW_NUMBER() window function to assign a unique row number to each record within the same job description group.
Applied PARTITION BY description to group rows having the same job description.
Used ORDER BY title to determine the sequence for assigning row numbers within each description group.
Assigned the alias row_num to store generated row numbers.
Stored the intermediate result in a subquery named duplicate.
Filtered records where row_num > 1 to identify duplicate job listings beyond the first occurrence.
Used COUNT(DISTINCT company_id) to count the number of unique companies having duplicate job postings.
Solved the problem by returning the total number of companies with duplicate job listings.
*/
