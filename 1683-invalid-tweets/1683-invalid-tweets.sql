# Write your MySQL query statement below
-- table:TWEETS
-- |tweet_id(PK) | content(varchar)                  |
-- +-------------+-----------------------------------+
-- | 1           | Let us Code                       |
-- | 2           | More than fifteen chars are here! |
 
 -- find inalid tweet(char>15)
select tweet_id from tweets where char_length(content)>15;
