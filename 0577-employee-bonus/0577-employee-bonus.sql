# Write your MySQL query statement below
-- table-EMPLOYEE
-- | empId | name   |supervisor(manager)| salary |
-- +-------+--------+------------+--------+
-- | 3     | Brad   | null       | 4000   |
-- | 1     | John   | 3          | 1000   |
-- | 2     | Dan    | 3          | 2000   |
-- | 4     | Thomas | 3          | 4000   |

-- table:BONUS
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |

-- find the name and bonus of  employee whose bonus<1000 or didn't get any bonus
select e.name, b.bonus from employee as e 
left join 
bonus as b on e.empid=b.empid 
where b.bonus<1000 or b.bonus is null;
-- left join - left table ki all id where bonus<1000 or null h




