# Write your MySQL query statement below
-- table:EMPLOYEES
-- | id | name     |
-- +----+----------+
-- | 1  | Alice    |
-- | 7  | Bob      |
-- | 11 | Meir     |
-- | 90 | Winston  |
-- | 3  | Jonathan |

-- table:EMPLOYEEUNI
-- | id | unique_id |
-- +----+-----------+
-- | 3  | 1         |
-- | 11 | 2         |
-- | 90 | 3         |

-- find unique id of each user if doesn't have unique id replace with NULL
select unique_id, name from employees as e left join employeeUNI AS U 
on e.id=u.id;
