# Write your MySQL query statement below
-- table-EMPLOYEE
-- 1st case input
-- |id(PK)| salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |

-- 2nd case input
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |


-- FIND the second highest salary 
-- select salary from employee order by salaru desc 
-- then
select max(e1.salary) as SecondHighestSalary from employee e1 where 2=
(select count(distinct e2.salary) from employee e2 
        where e2.salary>=e1.salary);
-- 2nd case input only 100 h table me then count-->1!=2 then no second highest salary, return null