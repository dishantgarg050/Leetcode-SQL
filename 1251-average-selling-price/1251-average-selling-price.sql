# Write your MySQL query statement below
-- taable:PRICES
-- | product_id | start_date | end_date   | price  |
-- +------------+------------+------------+--------+
-- | 1          | 2019-02-17 | 2019-02-28 | 5      |
-- | 1          | 2019-03-01 | 2019-03-22 | 20     |
-- | 2          | 2019-02-01 | 2019-02-20 | 15     |
-- | 2          | 2019-02-21 | 2019-03-31 | 30     |
-- (product_id + start_date+ end_date)=composite pk is unique means that comintion is UNIQUE(not same)
-- no two intersecting period/month for same product-id

-- table:UNITEDSOLD
-- | product_id | purchase_date | units |
-- +------------+---------------+-------+
-- | 1          | 2019-02-25    | 100   |
-- | 1          | 2019-03-01    | 15    |
-- | 2          | 2019-02-10    | 200   |
-- | 2          | 2019-03-22    | 30    |


-- find the avg. selling price for each product and should round upto 2 decimal places
select p.product_id, IFNULL(ROUND(sum(p.price*u.units)/sum(u.units), 2), 0)AS average_price from prices as p LEFT join unitssold as u 
on p.product_id=u.product_id
AND u.purchase_date between p.start_date and p.end_date
group by p.product_id;
-- we find avg selling price - 0 bhi ho salkta h
-- so, LEFT JOIN- USED because show the all prices of every product even no one units sold. in thaat case RETURNS avg. selling price -NULL
-- MEANS (product sold ho or na ho,but product kuch  price/MRP toh hoga hi)

-- so, not used INNER JOIN- not include 0 units(no purchaed date)
