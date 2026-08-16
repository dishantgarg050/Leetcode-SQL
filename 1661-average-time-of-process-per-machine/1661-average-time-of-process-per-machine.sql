# Write your MySQL query statement below
-- table:ACTIVITY
-- | machine_id | process_id | activity_type | timestamp(float) |
-- +------------+------------+---------------+------------------+
-- | 0          | 0          | start         | 0.712     |
-- | 0          | 0          | end           | 1.520     |
-- | 0          | 1          | start         | 3.140     |
-- | 0          | 1          | end           | 4.120     |
-- | 1          | 0          | start         | 0.550     |
-- | 1          | 0          | end           | 1.550     |
-- | 1          | 1          | start         | 0.430     |
-- | 1          | 1          | end           | 1.420     |
-- | 2          | 0          | start         | 4.100     |
-- | 2          | 0          | end           | 4.512     |
-- | 2          | 1          | start         | 2.500     |
-- | 2          | 1          | end           | 5.000     |

-- (machine_id + process_id + activity_type)= composite PK
-- process_id is the ID of a process running on the machine with machine_id
-- [machine id=1- process=0, start process}-it is 1 work (pk)
-- same type of process run on every machine
-- average time machinewise - particluar machine takes time to complete every process divide by total proces run on particluar machine

-- FIND THE machine_id along with the average time AS processing_time 
-- which should be rounded to 3 decimal places.
select a1.machine_id,ROUND(avg(a2.timestamp - a1.timestamp), 3)as processing_time from activity as a1
inner join
activity as a2 ON a1.machine_id=a2.machine_id AND a1.process_id=a2.process_id
                  and a1.activity_type= 'start' and a2.activity_type='end'
group by a1.machine_id;


