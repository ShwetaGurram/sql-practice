-- Platform: DataLemur

-- Problem: International-Call-Percentage

-- Link: https://datalemur.com/questions/international-call-percentage

-- Concept: AGGREGATE FUNCTION, ROUND, JOIN.

-- Query
SELECT
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN c.country_id <> r.country_id THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        1
    ) AS international_calls_pct
FROM phone_calls AS pc
JOIN phone_info AS c
    ON pc.caller_id = c.caller_id
JOIN phone_info AS r
    ON pc.receiver_id = r.caller_id;


/*
Explanation: First, I identified the requirement: calculating the percentage of calls that were made between people in different countries (international calls).
I started with the phone_calls table because it contains the caller and receiver information for each call.
To determine the country of both participants, I joined the phone_info table twice.
The first join (c) was used to get the country information of the caller.
The second join (r) was used to get the country information of the receiver.
After obtaining both country IDs, I compared them using a CASE WHEN condition.
If the caller's country ID and receiver's country ID were different, I treated the call as an international call and assigned a value of 1.
Otherwise, I assigned a value of 0, indicating a domestic call.
I used SUM() to count the total number of international calls.
Then, I divided that count by COUNT(*), which represents the total number of calls.
I multiplied the result by 100.0 to convert it into a percentage and ensure decimal division.
I applied ROUND(..., 1) to display the percentage up to one decimal place.
Finally, I renamed the result as international_calls_pct for better readability.
The final output shows what percentage of all calls were international calls.
*/