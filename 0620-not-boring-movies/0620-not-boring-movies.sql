# Write your MySQL query statement below
-- table:CINEMA
-- | id | movie      | description | rating |
-- +----+------------+-------------+--------+
-- | 1  | War        | great 3D    | 8.9    |
-- | 2  | Science    | fiction     | 8.5    |
-- | 3  | irish      | boring      | 6.2    |
-- | 4  | Ice song   | Fantacy     | 8.6    |
-- | 5  | House card | Interesting | 9.1    |\

-- report the movies with odd no.id and a description that is not"boring"

select * from cinema where mod(id,2)!=0 and description not in("boring") order by rating desc;