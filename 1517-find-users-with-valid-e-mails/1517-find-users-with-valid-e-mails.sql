# Write your MySQL query statement below
-- table:USERS
-- | user_id(PK) | name      | mail                    |
-- +---------+-----------+-------------------------+
-- | 1       | Winston   | winston@leetcode.com    |
-- | 2       | Jonathan  | jonathanisgreat         |
-- | 3       | Annabelle | bella-@leetcode.com     |
-- | 4       | Sally     | sally.come@leetcode.com |
-- | 5       | Marwan    | quarz#2020@leetcode.com |
-- | 6       | David     | david69@gmail.com       |
-- | 7       | Shapiro   | .shapo@leetcode.com     |
-- valid email-i thas prefix name and domain
-- prefix name- it's a string coontain letters(upper or lower), digits, underscore, dash(-) and period(.). THE prefix name must start with a letter.
-- domain- its must be exactly @leetcode.com in lowercase

-- FIND the users  who have valid emails
-- select user_id, name, mail from users as U where mail like 

select * from Users 
where regexp_like(mail, '^[A-Za-z]+[A-Za-z0-9\_\.\-]*@leetcode[.]com$')
     and mail like binary'%@leetcode.com';