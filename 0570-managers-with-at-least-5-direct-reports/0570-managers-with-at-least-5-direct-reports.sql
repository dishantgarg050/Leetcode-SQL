# Write your MySQL query statement below
-- table:EMPLOYEE
-- |id(PK)| name  | department | managerId |
-- +-----+-------+------------+-----------+
-- | 101 | John  | A          | null      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |


-- find the manager with atleast direct 5 reports
select m.name from employee as e
inner join
employee as m on e.managerid=m.id 
 group by m.id having  count(e.id)>=5 ;
-- e.managerid=m.id- us employee ke manager ki id equals manager ki id
-- result table filter-group with having

