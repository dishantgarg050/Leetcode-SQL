# Write your MySQL query statement below
-- table:PRODUCTS
-- |product_id(PK)| product_name         | product_category |
-- +-------------+-----------------------+------------------+
-- | 1           | Leetcode Solutions    | Book             |
-- | 2           | Jewels of Stringology | Book             |
-- | 3           | HP                    | Laptop           |
-- | 4           | Lenovo                | Laptop           |
-- | 5           | Leetcode Kit          | T-shirt          |
-- table:ORDERS
-- | product_id   | order_date   | unit     |
-- +--------------+--------------+----------+
-- | 1            | 2020-02-05   | 60       |
-- | 1            | 2020-02-10   | 70       |
-- | 2            | 2020-01-18   | 30       |
-- | 2            | 2020-02-11   | 80       |
-- | 3            | 2020-02-17   | 2        |
-- | 3            | 2020-02-24   | 3        |
-- | 4            | 2020-03-01   | 20       |
-- | 4            | 2020-03-04   | 30       |
-- | 4            | 2020-03-04   | 60       |
-- | 5            | 2020-02-25   | 50       |
-- | 5            | 2020-02-27   | 50       |
-- | 5            | 2020-03-01   | 50       |

-- FIND THE NAME OF PRODUCT THAT HAVE UNIT ATLEAST 100 ORDERRD IN 
-- FEB 2020
select p.product_name, sum(o.unit) AS unit FROM products as p
right join
orders as o on p.product_id=o.product_id 
             where  year(o.order_date)= 2020 and month(o.order_date)=2

group by o.product_id  having unit>=100;
-- solve step by step
-- 1. join the table on condition
-- 2. group by product_id
-- 3.filter on group unit>=100
-- 4. select (feb 2020) data from result table
-- SO, FINAL OUTPUT: | product_name       | unit |
--                   | ------------------ | ---- |
--                   | Leetcode Solutions | 130  |
--                   | Leetcode Kit       | 100  |


 