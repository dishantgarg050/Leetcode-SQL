# Write your MySQL query statement below
-- table: PRODUCT-LEFT TABLE
-- | product_id(PK) | product_name |
-- +----------------+--------------+
-- | 100            | Nokia        |
-- | 200            | Apple        |
-- | 300            | Samsung      |

-- table: SALES-RIGHT TABLE
-- | sale_id | product_id(FK) | year | quantity | price |
-- +---------+----------------+------+----------+-------+ 
-- | 1       | 100            | 2008 | 10       | 5000  |
-- | 2       | 100            | 2009 | 12       | 5000  |
-- | 7       | 200            | 2011 | 15       | 9000  |

--  find a solution to report the product name, year, price for each sale_id in the sales table
-- each sale_id inlcude- means left table includes complete -so RIGHT join apply
select product_name, year, price from product as P 
RIGHT join Sales as S  on P.product_id=S.product_id;