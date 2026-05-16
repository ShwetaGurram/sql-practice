-- Platform: DataLemur

-- Problem: Laptop-Mobile-viewership

-- Link: https://datalemur.com/questions/laptop-mobile-viewership

-- Concept: CASE WHEN, IN.

-- Query
SELECT
    SUM(CASE
            WHEN device_type = 'laptop' THEN 1
            ELSE 0
        END) AS laptop_views,

    SUM(CASE
            WHEN device_type IN ('tablet', 'phone') THEN 1
            ELSE 0
        END) AS mobile_views
FROM viewership;

/*
Explanation: Selected data from the viewership table to analyze device-based view counts.
Used CASE WHEN conditions to categorize views based on device type.
Counted laptop views by checking if device_type = 'laptop'.
Returned 1 for laptop records and 0 for all other devices.
Applied SUM() to calculate the total number of laptop views.
Counted mobile views by checking if device_type is either 'tablet' or 'phone' using the IN operator.
Returned 1 for mobile device records and 0 for non-mobile devices.
Applied SUM() again to calculate the total number of mobile views.
Renamed the calculated columns as laptop_views and mobile_views for better readability.
*/