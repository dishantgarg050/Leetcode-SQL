# Write your MySQL query statement below
-- table-PATIENTS
-- |patient_id(PK)| patient_name | conditions   |
-- +------------+--------------+--------------+
-- | 1          | Daniel       | YFEV COUGH   |
-- | 2          | Alice        |              |
-- | 3          | Bob          | DIAB100 MYOP |
-- | 4          | George       | ACNE DIAB100 |
-- | 5          | Alain        | DIAB201      |

-- Find the patient_id, patient_name, and conditions of the patients who have Type|Diabetes Type|Diabetes always starts with DIAB1 prefix.
select patient_id,patient_name , conditions from patients where conditions like "DIAB1%" or conditions like "% DIAB1%";