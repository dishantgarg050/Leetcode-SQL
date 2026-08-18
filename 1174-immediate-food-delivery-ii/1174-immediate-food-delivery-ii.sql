# Write your MySQL query statement below
-- table-DELIVERY
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date |
-- +-------------+-------------+------------+-----------------------------+
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  |
-- | 2           | 2           | 2019-08-02 | 2019-08-02                  |
-- | 3           | 1           | 2019-08-11 | 2019-08-12                  |
-- | 4           | 3           | 2019-08-24 | 2019-08-24                  |
-- | 5           | 3           | 2019-08-21 | 2019-08-22                  |
-- | 6           | 2           | 2019-08-11 | 2019-08-13                  |
-- | 7           | 4           | 2019-08-09 | 2019-08-09                  |
-- IMMEDIATE_ORDER- ORDER DATE= DELIVERY_DATE

-- find the percentage of immediate orders in the first orders of all customers, and rounded to 2 decimal places
SELECT ROUND(SUM(IF(CUSTOMER_PREF_DELIVERY_DATE=ORDER_DATE,1,0)) *100/
count(d1.customer_id), 2)as immediate_percentage from delivery d1
WHERE ORDER_DATE=
                (SELECT MIN(order_date) FROM delivery d2 
                WHERE d2.customer_id = d1.customer_id );
 -- co-related subquery like remove reverse no pair remove example


