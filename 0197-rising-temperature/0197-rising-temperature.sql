# Write your MySQL query statement below
-- table:WEATHER
-- | id | recordDate | temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |

-- FIND all dates'id with higher temp comapre to its previous date(yesterday)
-- select id from weather where mod(id,2)=0;
-- TIME COMPLEXITY= O(n)-all rows scann one time in cond.-mod(id,2)=0
-- SO, it is optimized solution


-- CO-RELATED SUBQYERY
SELECT id FROM Weather w1 where temperature>
(SELECT temperature FROM Weather w2
WHERE w2.recordDate=subdate(w1.recordDate,1));
-- inner query references w1.recordDate(column from the outer query)
-- DRY RUN
-- (check all row one by one in cond.-w2.recordDate=subdate(w1.recordDate,1)
-- and OUTPUT gives id of the high temp than temp from inner query)
-- TIME COMPLEXITY=INNER QUERY runs 1 time completely-O(n) for one value of outer query-O(n)
-- SO, O(n)*O(n)=O(n^2) 



-- inner join(SELF JOIN)
# Write your MySQL query statement below
-- select w2.id as id from Weather w1
-- inner join 
-- Weather w2 On DATEDIFF(w2.recordDate,w1.recordDate)=1
-- where w1.temperature<w2.temperature;
-- dates equal nhi both me 1 kaq difference isliye ye condition
-- TIME COMPLEXITY= w1-O(n)-all rows scann , w2-O(n)-all row scann 
--                          in cond.-DATEDIFF(w2.recordDate,w1.recordDate)=1
-- SO, O(n)*O(n)=O(n^2)
                   