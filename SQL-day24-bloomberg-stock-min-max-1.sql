-- Platform: DataLemur

-- Problem: Bloomberg-Stock-Min-Max-1

-- Link: https://datalemur.com/questions/sql-bloomberg-stock-min-max-1

-- Concept: CTE, CASE WHEN, WINDOW FUNCTION, AGGREGATE FUNCTION, GROUP BY, ORDER BY.

-- Query
WITH ranked_prices AS (
    SELECT
        ticker,
        date,
        open,

        ROW_NUMBER() OVER (
            PARTITION BY ticker
            ORDER BY open DESC
        ) AS highest_rank,

        ROW_NUMBER() OVER (
            PARTITION BY ticker
            ORDER BY open
        ) AS lowest_rank

    FROM stock_prices
)

SELECT
    ticker,

    MAX(
        CASE
            WHEN highest_rank = 1
            THEN TO_CHAR(date, 'Mon-YYYY')
        END
    ) AS highest_mth,

    MAX(
        CASE
            WHEN highest_rank = 1
            THEN open
        END
    ) AS highest_open,

    MAX(
        CASE
            WHEN lowest_rank = 1
            THEN TO_CHAR(date, 'Mon-YYYY')
        END
    ) AS lowest_mth,

    MAX(
        CASE
            WHEN lowest_rank = 1
            THEN open
        END
    ) AS lowest_open

FROM ranked_prices
GROUP BY ticker
ORDER BY ticker;


/*
Explanation: finding the month and opening price when each stock reached its highest and lowest opening values.
Since I needed both the highest and lowest records for every stock ticker, I used a CTE (ranked_prices) to rank the rows before extracting the required values.
I partitioned the data by ticker so that each stock would be analyzed independently.
To find the highest opening price, I used ROW_NUMBER() ordered by open DESC, which assigns rank 1 to the row with the highest opening price for each ticker.
To find the lowest opening price, I used another ROW_NUMBER() ordered by open ASC, which assigns rank 1 to the row with the lowest opening price for each ticker.
After creating these rankings, I used the CTE in the final query.
I grouped the data by ticker because I wanted one summary row for each stock.
Then, I used CASE WHEN statements to pick only the rows where the highest or lowest rank equals 1.
For the highest-ranked row, I extracted the month and year using TO_CHAR(date, 'Mon-YYYY') and also selected the corresponding opening price.
Similarly, for the lowest-ranked row, I extracted the month-year and opening price.
I wrapped the CASE expressions inside MAX() to return the selected value after grouping.
Finally, I ordered the output by ticker for a clean and organized result.
The final result shows, for each stock ticker, the month and opening price of its highest opening value and the month and opening price of its lowest opening value.
*/