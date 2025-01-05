###  34 - Employee vs Manager

You are given the table of employee details. Write an SQL to find details of employee with salary more than their manager salary but they joined the company after the manager joined.

Display employee name, salary and joining date along with their manager's salary and joining date, sort the output in ascending order of employee name.

Please note that manager id in the employee table referring to emp id of the same table
```sql
with 
select 
	e.emp_name,
    e.salary,
    e.joining_date,
    m.salary manager_salary,
    m.joining_date managarer_join_date 
from employee e
join employee m on e.manager_id=m.emp_id
		where e.salary>m.salary 
        and e.joining_date>m.joining_date
	order by e.emp_name;
```

