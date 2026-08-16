# Write your MySQL query statement below
-- table-VISITS(LEFT TABLE)
-- | visit_id(PK) | customer_id |
-- +--------------+-------------+
-- | 1            | 23          |
-- | 2            | 9           |
-- | 4            | 30          |
-- | 5            | 54          |
-- | 6            | 96          |
-- | 7            | 54          |

-- table-TRANSACTIONS(RIGHT TABLE)
-- | transaction_id(PK) | visit_id(FK) | amount |
-- +--------------------+--------------+--------+
-- | 2                  | 5            | 310    |
-- | 3                  | 5            | 300    |
-- | 9                  | 5            | 200    |
-- | 12                 | 1            | 910    |
-- | 13                 | 2            | 970    |

-- FIND the id of the customer with no trans
--  and  no of  visits with no trans

-- SELECT customer_id, COUNT(v.visit_id) as count_no_trans 
-- FROM Visits v
-- LEFT JOIN Transactions t using(visit_id)
-- WHERE transaction_id IS NULL
-- GROUP BY customer_id;
-- include all customer where trans is null - so, use LEFT JOIN(MINUS operation)-T2.ID IS NULL
-- count no of visit with no trans customer wise (grouping)
-- (most optimized solution for null transaction- beacuse not depend on other subquery

-- other method-SUBQUERY
-- SELECT customer_id, COUNT(visit_id) as count_no_trans FROM Visits
-- where visit_id NOT IN 
-- (SELECT visit_id FROM Transactions) GROUP BY customer_id;
-- SELECT visit_id FROM Transactions- SUBQUERY(id of trans)-THAT DON'T INCLUDE

-- other method-CO-RELATED SUBQUERY
SELECT customer_id, COUNT(visit_id) as count_no_trans FROM Visits v
WHERE NOT EXISTS 
(SELECT visit_id FROM Transactions t 
WHERE t.visit_id = v.visit_id) GROUP BY customer_id;

-- DRY RUN- t.visit_id=v.visit.id
-- Outer row 	                Inner query runs             have Transactions ?     NOT EXISTS result	                          Row kept?
-- (v.visit_id, customer_id)   one time for one value                             (exist h -true, not exist result-false)                   
-- (1, 23)	                     visit_id = 1	             Yes (12)	             FALSE	                                      ❌ remove
-- (2, 9)	                     visit_id = 2	             Yes (13)	             FALSE	                                      ❌ remove
-- (4, 30)	                     visit_id = 4	             No	                     TRUE	                                      ✅ Kept
-- (5, 54)	                     visit_id = 5	             Yes (2,3,9)	         FALSE	                                      ❌ remove
-- (6, 96)	                     visit_id = 6	             No	                     TRUE	                                      ✅ Kept
-- (7, 54)	                     visit_id = 7	             No	T                    RUE	                                      ✅ Kept
-- (8, 54)	                     visit_id = 8	             No	                     TRUE	                                      ✅ Kept

-- GROUPING BY CUSTOMER ID + COUNT
-- customer_id | count_no_trans
-- 30          | 1
-- 96          | 1
-- 54          | 2