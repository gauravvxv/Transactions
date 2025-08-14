-- Total Transactions
SELECT COUNT(DISTINCT transaction_id) FROM TRANSACTION;

-- Total Users
SELECT COUNT(DISTINCT user_name) FROM TRANSACTION;

--Top 5 Highest Purchasing User
SELECT 
user_name,
ROUND(SUM(purchase_amount)::NUMERIC,2) AS total_amount 
FROM transaction
GROUP BY user_name
ORDER BY total_amount DESC
LIMIT 5;

-- Top 5 Lowest Purchasing User
SELECT 
user_name,
ROUND(SUM(purchase_amount)::NUMERIC,2) AS total_amount 
FROM transaction
GROUP BY user_name
ORDER BY total_amount 
LIMIT 5;

-- 