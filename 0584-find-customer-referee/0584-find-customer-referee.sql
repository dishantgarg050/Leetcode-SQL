# Write your MySQL query statement below
-- table-CUSTOMER
-- id   name    refree_id
-- 1    will    null
-- 2    jane    null
-- 3    alex    2
-- 4    bill    null
-- 5    zack    1
-- 6    mark    2

-- find the name of customer referred by any customer with id!=2  
-- and not refeered by any cuctomer
select name  from customer where referee_id !=2 or referee_id is null;

