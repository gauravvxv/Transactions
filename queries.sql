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

-- Most of the Users Payment Method
select
payment_method,
count(transaction_id) as total_users 
from transaction
group by payment_method
order by total_users;

-- Total Purchase by Year
select 
extract(YEAR from cast(transaction_date as date)) as year,
round(sum(purchase_amount)::numeric,2) as total_amount
from transaction
group by year
order by year;

-- Highest Purchasing Month by Year
   