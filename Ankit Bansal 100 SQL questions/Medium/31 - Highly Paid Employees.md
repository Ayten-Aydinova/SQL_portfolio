###  31 - Highly Paid Employees

You are given the data of employees along with their salary and department. Write an SQL to find list of employees who have salary greater than average employee salary of the company.  However, while calculating the company average salary to compare with an employee salary do not consider salaries of that employee's department, display the output in ascending order of employee ids.


### Solution Query

```sql
with cte as
(	select 
		e1.emp_id,
		e1.salary,
		e1.department,
		(select avg(e2.salary) from employee e2
		where e2.department!=e1.department) avg_salary
	from employee e1)


select 
	emp_id,
	salary,
	department 
from cte
	where salary>avg_salary
	order by
		emp_id asc
;
```

