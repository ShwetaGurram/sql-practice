-- Platform: DataLemur

-- Problem: Click-Through-Rate

-- Link: https://datalemur.com/questions/click-through-rate

-- Concept: CASE WHEN, GROUP BY, ROUND, WHERE.

-- Query
SELECT
    app_id,
    ROUND(
        100.0 *
        COUNT(CASE WHEN event_type = 'click' THEN 1 END) /
        COUNT(CASE WHEN event_type = 'impression' THEN 1 END),
        2
    ) AS ctr
FROM events
WHERE EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY app_id;


/*
Explanation: Selected the events table because it contains app activity events such as impressions and clicks.
Filtered the data using EXTRACT(YEAR FROM timestamp) = 2022 to include only events from the year 2022.
Grouped the records by app_id to calculate CTR separately for each app.
Used COUNT(CASE WHEN event_type = 'click' THEN 1 END) to count the total number of clicks for each app.
Used COUNT(CASE WHEN event_type = 'impression' THEN 1 END) to count the total number of impressions for each app.
Calculated CTR using the formula:
Clicks / Impressions * 100
to measure the percentage of impressions that resulted in clicks.
Multiplied by 100.0 to return the result as a percentage and ensure decimal division.
Applied ROUND(..., 2) to display the CTR value up to 2 decimal places.
Renamed the calculated result as ctr for better readability.
Solved the problem by generating app-wise click-through performance metrics for 2022.
*/