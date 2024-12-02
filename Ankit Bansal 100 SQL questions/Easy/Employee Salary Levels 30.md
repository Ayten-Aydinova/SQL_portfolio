###   Employee Salary Levels 30


Write an SQL query to find the average salaries of employees at each salary level. "Salary Level" are defined as per below conditions:

 

If the salary is less than 50000, label it as "Low".

If the salary is between 50000 and 100000 (inclusive), label it as "Medium".

If the salary is greater than 100000, label it as "High".

Round the average to nearest integer. Display the output in ascending order of salary level.### Solution Query

```sql


select 
	case 
    		when salary < 50000 then 'Low'
		when salary between 50000 and 100000 then 'Medium'
        	when salary >100000 then 'High'
    	end as Salary_Level,
	round(avg(salary),0) as avg_salary
from employees 
group by Salary_Level
order by Salary_Level ;


```




