# Write your MySQL query statement below
-- Y- MEANS PRODUCT IS LOW FAT AND RECYLABLE
-- N- MEANS NOT LOW FAT AND NOT  RECYCLABLE
-- product_id    low_fat     recyclable
-- 0              Y            N
-- 1              Y            Y  
-- 2              N            Y
-- 3              Y            Y
-- 4              N            N

-- find that id in which product is both -low fat and recyclable
select product_id from products where low_fats='Y' and recyclable='Y';
