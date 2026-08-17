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
-- (both inner references outer query )
-- both subquery use q.queryname as 


-- DRY RUN-CO-RELATED SUBQUERY
-- STEP 1: FROM Queries AS q

-- STEP 2: GROUP BY query_name
-- GROUP "Dog" - Row1, Row2, Row3
-- GROUP "Cat" - Row4, Row5, Row6
-- (Ab ek group ko process karega, phir doosre ko - one at a time.)

-- STEP 3: group "Dog" (q.query_name = 'Dog')
--  -->quality = ROUND(AVG(rating/position), 2)=2.50
-- (Numerator subquery: WHERE rating < 3 AND query_name = 'Dog'
-- Row1: rating=5, <3?-NO
-- Row2: rating=5, <3?-NO
-- Row3: rating=1, <3?-YES-->count=1
-- Denominator subquery: WHERE query_name = 'Dog'
-- Row1, Row2, Row3 --> count = 3)
--  -->Calculate:poor_query_percentage = 1 *100 / 3 = 33.33
-- SO, Dog output: ('Dog', 2.50, 33.33)

-- STEP 4: group "Cat" (q.query_name = 'Cat')
--  -->quality = ROUND(AVG(rating/position), 2)=0.66
-- (Numerator subquery: WHERE rating < 3 AND query_name = 'Cat'
-- Row1: rating=5, <3?-YES-->count=1
-- Row2: rating=5, <3?-NO
-- Row3: rating=1, <3?-NO 
-- Denominator subquery: WHERE query_name = 'Cat'
-- Row1, Row2, Row3 --> count = 3)
--  -->Calculate:poor_query_percentage = 1 *100 / 3 = 33.33
-- SO, Cat output: ('Cat', 0.66, 33.33)

-- Final Output:
-- query_name	quality	  poor_query_percentage
--     Dog	    2.50	        33.33
--     Cat	    0.66	        33.33