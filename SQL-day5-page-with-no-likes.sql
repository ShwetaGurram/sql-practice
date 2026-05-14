-- Platform: DataLemur

-- Problem: Page-With-No-Like

-- Link: https://datalemur.com/questions/sql-page-with-no-likes

-- Concept: NOT IN, Subquery

-- Query
SELECT 
    page_id
FROM pages
WHERE PAGE_ID NOT IN (
		            SELECT page_id
		            FROM page_likes
		            )
ORDER BY page_id ASC;

/*
Explanation: Retrieves page_id values from the pages table.
Uses a subquery to get all page_id values present in the page_likes table.
Applies the NOT IN operator to filter pages that have not received any likes.
Excludes all pages that exist in the page_likes table.
Returns only pages with zero likes.
Sorts the final result in ascending order of page_id.
*/
