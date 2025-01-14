### Average Salaries

Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.


### Solution Query




```sql
select 
    department,
    first_name,
    salary,
    avg(salary) over(partition by department) avg_salary
from employee;
```

