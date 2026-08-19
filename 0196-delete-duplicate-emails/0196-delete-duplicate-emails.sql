# Write your MySQL query statement below
-- table:PERSON
-- |id(PK)| email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |

-- find a solution to delete dupliocate emails, keep only unique email with smaalest id

delete p2 from person p2 inner join person p1
on p1.email=p2.email and p2.id>p1.id;-- use SELF JOIN(INNER JOIN)
-- DELETE P2 FROM "PERSON P1 INNER  PERSON P2"(RESULT TABLE)
