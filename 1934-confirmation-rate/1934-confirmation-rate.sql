# Write your MySQL query statement below
-- table:SIGNUPS
-- | user_id(PK) | time_stamp          |
-- +---------+---------------------+
-- | 3       | 2020-03-21 10:16:13 |
-- | 7       | 2020-01-04 13:57:59 |
-- | 2       | 2020-07-29 23:09:44 |
-- | 6       | 2020-12-09 10:39:37 |
-- u.time_stamp=SIGNUP TIME

-- TABLE:CONFIRMATIONS
-- |user_id(FK)| time_stamp        | action    |
-- +---------+---------------------+-----------+
-- | 3       | 2021-01-06 03:30:46 | timeout   |
-- | 3       | 2021-07-14 14:00:00 | timeout   |
-- | 7       | 2021-06-12 11:57:29 | confirmed |
-- | 7       | 2021-06-13 12:58:28 | confirmed |
-- | 7       | 2021-06-14 13:59:27 | confirmed |
-- | 2       | 2021-01-22 00:00:00 | confirmed |
-- | 2       | 2021-02-28 23:59:59 | timeout   |
-- (user_id+ time_stamp)=composite PK
-- Action- requested a confirmation message for signup at time_stamp that message was either confirmed or expired(timeout)

-- confirmation_rate="confirmed" message/total requested message
-- any user-not request a message then confirmation rate=0
-- FIND THE confirmation rate of each user and rounded upto 2 decimal places.
select s.user_id, IFNULL(ROUND(sum(c.action="confirmed")/count(c.action), 2), 0)as confirmation_rate from signups as s
left join 
confirmations as c on s.user_id=c.user_id
group by s.user_id;