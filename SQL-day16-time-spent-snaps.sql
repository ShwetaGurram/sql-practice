-- Platform: DataLemur

-- Problem: Time-Spent-Snaps

-- Link: https://datalemur.com/questions/time-spent-snaps

-- Concept: CTE, Subquery, CASE WHEN, LEFT JOIN.

-- Query
WITH time_spent AS (
    SELECT
        ab.age_bucket,
        SUM(
            CASE
                WHEN a.activity_type = 'send'
                THEN a.time_spent
                ELSE 0
            END
        ) AS send_time,

        SUM(
            CASE
                WHEN a.activity_type = 'open'
                THEN a.time_spent
                ELSE 0
            END
        ) AS open_time

    FROM activities AS a
    LEFT JOIN age_breakdown AS ab
        USING(user_id)

    GROUP BY ab.age_bucket
)

SELECT
    age_bucket,
    ROUND(100.0 * send_time / (send_time + open_time), 2) AS send_perc,
    ROUND(100.0 * open_time / (send_time + open_time), 2) AS open_perc
FROM time_spent;


/*
Explanation: First, I needed to compare how users from different age groups spend time on two activities: sending and opening.
To make the calculation easier and cleaner, I created a CTE (time_spent) to store intermediate aggregated results.
I joined the activities table with the age_breakdown table using user_id so that each activity could be linked to an age group.
Then, I separated the total time spent on send activities and open activities using conditional aggregation with CASE WHEN.
After that, I grouped the data by age_bucket to calculate total send time and open time for each age group individually.
Once the total times were calculated, I used them to compute the percentage contribution of send activity and open activity within each age group.
I multiplied by 100.0 to convert the values into percentages and used ROUND(..., 2) to keep the output readable with 2 decimal places.
Finally, the query returns the percentage of time spent on sending versus opening activities for every age bucket.
*/