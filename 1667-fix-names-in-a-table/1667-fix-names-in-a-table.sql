# Write your MySQL query statement below
-- table:USERS
-- |user_id(PK)| name  |
-- +---------+-------+
-- | 1       | aLice |
-- | 2       | bOB   |

-- find the sol to fix the first charac is upper case abs resta re lowercase
select user_id, concat( ucase(left(name,1)), lcase(substring(name,2)) ) as name from users order by user_id;