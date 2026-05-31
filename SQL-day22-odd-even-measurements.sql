-- Platform: DataLemur

-- Problem: Odd-Even-Measurements

-- Link: https://datalemur.com/questions/odd-even-measurements

-- Concept: CTE, CASE WHEN, GROUP BY, ORDER BY.

-- Query
WITH rank_table AS (
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY DATE(measurement_time)
            ORDER BY measurement_time
        ) row_rank
FROM measurements
)


SELECT
    DATE(measurement_time) AS measurement_day,
    
    SUM(
        CASE
            WHEN row_rank % 2 <> 0 THEN measurement_value
            ELSE 0
        END
        ) AS odd_sum,
        
     SUM(
        CASE
            WHEN row_rank % 2 = 0 THEN measurement_value
            ELSE 0
        END
        ) AS even_sum
        
FROM rank_table
GROUP BY DATE(measurement_time)
ORDER by measurement_day;


/*
Explanation: First, calculating separate sums of measurement values for odd-numbered and even-numbered measurements on each day.
Since I needed to know the position of each measurement within a day, I used a CTE (rank_table) to assign row numbers before performing the final aggregation.
I used the ROW_NUMBER() window function to give each measurement a sequential number.
I partitioned the data by DATE(measurement_time) so the numbering restarts for each day.
Then, I ordered the measurements by measurement_time to ensure row numbers follow the actual sequence in which measurements were recorded.
After assigning row numbers, I used the CTE result in the main query.
I grouped the data by date to calculate daily totals.
To calculate the sum of odd-positioned measurements, I used a CASE WHEN condition that selects values where row_rank % 2 <> 0.
To calculate the sum of even-positioned measurements, I used another CASE WHEN condition that selects values where row_rank % 2 = 0.
I applied SUM() on both conditions to get the total odd and even measurement values for each day.
Finally, I sorted the output by measurement_day to display the results in chronological order.
The final result shows, for each day, the total of measurements recorded in odd positions and the total of measurements recorded in even positions.
*/