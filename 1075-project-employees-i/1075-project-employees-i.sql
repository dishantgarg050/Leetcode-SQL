# Write your MySQL query statement below
-- table:PROJECT
-- | project_id  | employee_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- | 1           | 2           |
-- | 1           | 3           |
-- | 2           | 1           |
-- | 2           | 4           |
-- (project_id + employee_id)=composite PK

-- table:EMPLOYEE
-- | employee_id | name   | experience_years |
-- +-------------+--------+------------------+
-- | 1           | Khaled | 3                |
-- | 2           | Ali    | 2                |
-- | 3           | John   | 1                |
-- | 4           | Doe    | 2                |

-- find the avg experience years 0f all em-ployee for each project and rounded upto 2 decimal places

-- experience ho yq na ho employee id toh kuch hogi emplyee ki
select p.project_id, IFNULL(ROUND(avg(E.experience_years),2), 0)as average_years from project as p
left join employee as E ON P.EMPLOYEE_ID=E.EMPLOYEE_ID 

group by p.project_id;
