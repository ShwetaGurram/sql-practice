-- Platform: DataLemur

-- Problem: Signup-Confirmation-Rate

-- Link: https://datalemur.com/questions/signup-confirmation-rate

-- Concept: LEFT JOIN, CASE WHEN, COUNT, DISTINCT.

-- Query
SELECT
    ROUND(
        1.0 *
        SUM(
            CASE
                WHEN t.signup_action = 'Confirmed' THEN 1
                ELSE 0
            END
        ) /
        COUNT(DISTINCT e.email_id),
        2
    ) AS confirm_rate
FROM emails AS e
LEFT JOIN texts AS t
    ON e.email_id = t.email_id;


/*
Explanation: I started with the emails table because it contains all registered email records.
Then, I used a LEFT JOIN with the texts table to connect each email with its corresponding signup action.
I used a left join so that emails without confirmation records would still be included in the calculation.
After joining the tables, I used a CASE WHEN statement to identify confirmed signups.
If signup_action = 'Confirmed', I counted it as 1; otherwise, I counted it as 0.
Then, I used SUM() to calculate the total number of confirmed emails.
I divided the confirmed count by COUNT(DISTINCT e.email_id) to calculate the confirmation rate based on total unique emails.
I multiplied by 1.0 to ensure decimal division instead of integer division.
Used ROUND(..., 2) to display the result up to 2 decimal places.
Finally, I renamed the calculated value as confirm_rate for better readability.
The final result shows the percentage of users who successfully confirmed their signup emails.
*/