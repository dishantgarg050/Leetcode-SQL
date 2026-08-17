# Write your MySQL query statement below
-- table-QUERIES
-- | query_name | result            | position | rating |
-- +------------+-------------------+----------+--------+
-- | Dog        | Golden Retriever  | 1        | 5      |
-- | Dog        | German Shepherd   | 2        | 5      |
-- | Dog        | Mule              | 200      | 1      |
-- | Cat        | Shirazi           | 5        | 2      |
-- | Cat        | Siamese           | 3        | 3      |
-- | Cat        | Sphynx            | 7        | 4      |

-- query quality-average of the ratio between query rating and its position.
-- poor query percentage-percentage of all queries with rating less than 3.

-- find each query name, quality and poor_query_percentage
-- and both quality and percentage rounded upto 2 decimal places
select query_name, ROUND(avg(rating/position), 2) as quality, 
ROUND((select count(query_name) from queries where rating<3 AND 
query_name = q.query_name)*100/
(select count(query_name) from queries where query_name = q.query_name), 2) as poor_query_percentage 
from queries as q  group by query_name;