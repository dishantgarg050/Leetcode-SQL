# Write your MySQL query statement below
-- table-USERS
-- |user_id(PK)| user_name |
-- +---------+-----------+
-- | 6       | Alice     |
-- | 2       | Bob       |
-- | 7       | Alex      |

-- table-REGISTER
-- | contest_id | user_id(FK) |
-- +------------+---------+
-- | 215        | 6       |
-- | 209        | 2       |
-- | 208        | 2       |
-- | 210        | 6       |
-- | 208        | 6       |
-- | 209        | 7       |
-- | 209        | 6       |
-- | 215        | 7       |
-- | 208        | 7       |
-- | 210        | 2       |
-- | 207        | 2       |
-- | 210        | 7       |

-- 208, 209, 210 - all users registered in this contest
-- 215- 6,7 user_id registered, 207- 2 user_id registered
-- FIND THE % OF THE USERS REGISTERED IN EACH CONTEST AND ROUNDED UPTO 2 DECIMAL PLACES 
-- Register kiya ho ya nhi but user ki kuch user_id toh hogi hi-USE LEFT JION
select contest_id, 
ROUND(COUNT(distinct user_id)*100/(select COUNT(user_id)from users), 2)as percentage FROM register
group by contest_id ORDER BY percentage desc, contest_id ;
-- total user fixed/same for all contest- but  COUNT(U.user_id)- tell count per contest _id, that's why used subquery