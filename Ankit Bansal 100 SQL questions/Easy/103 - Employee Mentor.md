### 103 - Employee Mentor


You are given a table Employees that contains information about employees in a company. Each employee might have been mentored by another employee. Your task is to find the names of all employees who were not mentored by the employee with id = 3.

### Solution

```sql
select 
	name 
from employees
	where mentor_id!=3 or 
	mentor_id is null;
```

