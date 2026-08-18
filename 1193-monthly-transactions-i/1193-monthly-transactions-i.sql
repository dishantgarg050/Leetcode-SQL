# Write your MySQL query statement below
-- table:TRANSACTIONS
-- |id(PK)| country | state    | amount | trans_date |
-- +------+---------+----------+--------+------------+
-- | 121  | US      | approved | 1000   | 2018-12-18 |
-- | 122  | US      | declined | 2000   | 2018-12-19 |
-- | 123  | US      | approved | 2000   | 2019-01-01 |
-- | 124  | DE      | approved | 2000   | 2019-01-07 |
--  incoming transaction- maine transaction ki kisi dusre ko

-- find for each month and country,the no of trans and their total amount,
-- no of approved trans and their total amount
select DATE_FORMAT(trans_DATE, '%Y-%m') as month, country, 
count(state) as trans_count, sum(state="approved" ) as approved_count,
sum(amount) as trans_total_amount, sum((state="approved") * amount) as approved_total_amount
from transactions group by month, country;
-- count(state="approved" )- COUNT fn only skip NULL value- that's why not use
-- it count the non-null value- means existence count karta hai only

-- OTHER METHOD-SUBQUERY
-- [SELECT DATE_FORMAT(t1.trans_date, '%Y-%m') AS month,t1.country,
-- COUNT(t1.id) AS trans_count,
-- (SELECT COUNT(t2.id) FROM transactions t2 
-- WHERE t2.trans_date=t1.trans_date AND t2.country = t1.country 
--                         AND t2.state ='approved') AS approved_count,
-- SUM(t1.amount) AS trans_total_amount,
-- (SELECT SUM(t2.amount) FROM transactions t2 
-- WHERE t2.trans_date=t1.trans_date AND t2.country = t1.country 
--                         AND t2.state ='approved') AS approved_total_amount
-- FROM transactions t1 GROUP BY month, t1.country;]

-- if ek month with ek country se many approved transaction h toh 
-- t1.rans_date ka logic glat ho jayega but isme ek month with ek country se one approved transaction
-- then use DATE_FORMAT(t2.trans_date, '%Y-%m')=DATE_FORMAT(t1.trans_date, '%Y-%m')