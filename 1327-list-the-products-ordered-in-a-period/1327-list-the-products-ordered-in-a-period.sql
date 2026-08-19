# Write your MySQL query statement below
select p.product_name, sum(o.unit) AS unit FROM products as p
right join
orders as o on p.product_id=o.product_id 
             where  year(o.order_date)= 2020 and month(o.order_date)=2

group by o.product_id  having unit>=100;
-- dsolve step by step
-- 1. join the table on condition
-- 2. group by product_id
-- 3.filter on group unit>=100
-- 4. select (feb 2020) data from result table
-- SO, FINAL OUTPUT: | product_name       | unit |
--                   | ------------------ | ---- |
--                   | Leetcode Solutions | 130  |
--                   | Leetcode Kit       | 100  |


 