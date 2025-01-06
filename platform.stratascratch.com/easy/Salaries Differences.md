###  Salaries Differences

Calculates the difference between the highest salaries in the marketing and engineering departments. Output just the absolute difference in salaries. 


### Solution Query

```sql
SELECT MAX(CASE
                   WHEN dept.department = 'marketing' THEN emp.salary
               END)-MAX(CASE
                              WHEN dept.department = 'engineering' THEN emp.salary
                          END) AS salary_difference
FROM db_employee emp
JOIN db_dept dept ON emp.department_id = dept.id;

```


