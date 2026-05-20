-- Platform: DataLemur

-- Problem: Second-Day-Confirmation

-- Link: https://datalemur.com/questions/second-day-confirmation

-- Concept: JOIN, WHERE.

-- Query
SELECT
    e.user_id
FROM emails e
JOIN texts t
    ON e.email_id = t.email_id
WHERE t.action_date = e.signup_date + INTERVAL '1 day';


/*
Explanation: Started by finding users who confirmed their signup one day after registering.
Selected the emails table because it contains user signup information and email IDs.
Selected the texts table because it stores confirmation actions and action dates.
Joined both tables using email_id to connect each signup email with its corresponding confirmation action.
Used e.user_id to return the users who satisfied the condition.
Applied the WHERE clause to compare the confirmation date with the signup date.
Used e.signup_date + INTERVAL '1 day' to calculate the next day after signup.
Filtered records where the confirmation action happened exactly one day after registration.
Solved the problem by identifying users who confirmed their signup on the second day after signing up.
*/