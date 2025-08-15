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

-- Total Purchase Amount of Product Category
select
product_category,
round(sum(purchase_amount)::numeric,2) as total_amount
from transaction
group by product_category
order by total_amount desc;

-- Age Group that spend more
SELECT
CASE
WHEN age BETWEEN 18 AND 25 THEN '18-25'
WHEN age BETWEEN 26 AND 35 THEN '26-35'
WHEN age BETWEEN 36 AND 50 THEN '36-50'
ELSE '50+'
END AS age_group,
COUNT(*) AS total_users,
ROUND(SUM(purchase_amount)::NUMERIC,2) AS total_spent
FROM transaction
GROUP BY age_group
ORDER BY total_spent DESC;

-- Total Purchase by Year
select 
extract(YEAR from cast(transaction_date as date)) as year,
round(sum(purchase_amount)::numeric,2) as total_amount
from transaction
group by year
order by year;

-- Highest Purchasing Month by Year
SELECT DISTINCT ON (EXTRACT(YEAR FROM cast(transaction_date as date)))
    EXTRACT(YEAR FROM cast(transaction_date as date)) AS year,
    TO_CHAR(cast(transaction_date as date), 'Month') AS month_name,
    round(SUM(purchase_amount)::numeric,2) AS total_amount
FROM transaction
GROUP BY year, month_name
ORDER BY year, total_amount DESC;
   