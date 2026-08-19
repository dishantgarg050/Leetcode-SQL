# Write your MySQL query statement below
# Write your MySQL query statement below
-- table:STUDENTS
-- | student_id | student_name |   
-- +------------+--------------+
-- | 1          | Alice        |
-- | 2          | Bob          |
-- | 13         | John         |
-- | 6          | Alex         |

-- table:SUBJECTS
-- | subject_name |
-- +--------------+
-- | Math         |
-- | Physics      |
-- | Programming  |

-- table:EXAMINATIONS
-- | student_id | subject_name |
-- +------------+--------------+
-- | 1          | Math         |
-- | 1          | Physics      |
-- | 1          | Programming  |
-- | 2          | Programming  |
-- | 1          | Physics      |
-- | 1          | Math         |
-- | 13         | Math         |
-- | 13         | Programming  |
-- | 13         | Physics      |
-- | 2          | Math         |
-- | 1          | Math         |

-- find the no. of times each studemt attended each exam and ordered by student_id and subject_name
select st.student_id,st.student_name ,s.subject_name, 
IFNULL(COUNT(e.subject_name),0)
as attended_exams from students as st
join subjects as s 
left join
examinations as e on st.student_id=e.student_id 
                     and s.subject_name=e.subject_name
group by st.student_id,s.subject_name 
order by student_id,subject_name;