-- Platform: DataLemur

-- Problem: Final-Account-Balance

-- Link: https://datalemur.com/questions/final-account-balance

-- Concept: CASE WHEN, GROUP BY.

-- Query
SELECT
    account_id,
    SUM(
        CASE
            WHEN transaction_type = 'Deposit' THEN amount
            ELSE -amount
        END
    ) AS final_balance
FROM transactions
GROUP BY account_id;


/*
Explanation: Started by calculating the final account balance for each account based on deposits and withdrawals.
Selected the transactions table because it contains account transaction details and transaction amounts.
Used GROUP BY account_id to calculate balances separately for each account.
Applied a CASE statement to handle different transaction types.
Added the transaction amount when the transaction_type was 'Deposit'.
Subtracted the transaction amount for all other transaction types, such as withdrawals.
Used the SUM() function to combine all transaction values and calculate the net balance for each account.
Renamed the calculated result as final_balance for better readability.
Solved the problem by generating the remaining balance available in each account after processing all transactions.
*/