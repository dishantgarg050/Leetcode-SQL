# Write your MySQL query statement below
-- table:ACTIVITY
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-03-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- (player_id + event_date)=composite PK

-- FIND THE fraction/percentage of players that logged in again on the day after the day they first logged in and  rounded to 2 decimal places.
-- means  kitne playerse ne again login kiya usdin ke baad jb unhone initial login kiya tha

SELECT ROUND(COUNT(a1.player_id) /(select COUNT(DISTINCT player_id) from activity), 2) AS fraction 
FROM Activity a1
WHERE DATEDIFF(a1.event_date, (SELECT MIN(a2.event_date)FROM Activity a2
                               WHERE a1.player_id = a2.player_id)
                ) = 1;
-- CO-RELATED SUBQUERY
             
