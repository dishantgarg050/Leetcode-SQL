# Write your MySQL query statement below
-- table-EMPLOYEE
-- |id(PK)| salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |

-- FIND the second highest salary 
-- select salary from employee order by salaru desc 
-- then
select max(e1.salary) as SecondHighestSalary from employee e1 where 1=
(select count(distinct e2.salary) from employee e2 
        where e2.salary>e1.salary);