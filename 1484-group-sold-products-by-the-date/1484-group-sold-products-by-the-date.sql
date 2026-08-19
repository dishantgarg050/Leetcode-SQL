# Write your MySQL query statement below
-- table:ACTIVITIES
-- | sell_date  | product     |
-- +------------+------------+
-- | 2020-05-30 | Headphone  |
-- | 2020-06-01 | Pencil     |
-- | 2020-06-02 | Mask       |
-- | 2020-05-30 | Basketball |
-- | 2020-06-01 | Bible      |
-- | 2020-06-02 | Mask       |
-- | 2020-05-30 | T-Shirt    |

-- find for each date , the no of diiferent products sold and their names and  order by sell_date
-- and sorted the sold product for each date lexiographically 
select  sell_date, count(distinct product) as num_sold, 
                   group_concat(distinct product) as products  
 from activities
 group by sell_date order by sell_date, product;
 -- group_concat- concat the string present in multiple rows
 -- but concat-concat the string in multiple col of row
 -- concat_ws-concat the string in multiple col of row with separator or space

 


