### Department Average Salary

You are provided with two tables: Employees and Departments. The Employees table contains information about employees, including their IDs, names, salaries, and department IDs. The Departments table contains information about departments, including their IDs and names. Your task is to write a SQL query to find the average salary of employees in each department, but only include departments that have more than 2 employees . Display department name and average salary round to 2 decimal places. Sort the result by average salary in descending order.

### Solution

```sql
select 
	department_name,
	round(avg(salary),2) as average_salary 
from employees e
	left join departments d on d.department_id=e.department_id
group by d.department_name
having count(employee_id)>2
order by average_salary  desc;
```

