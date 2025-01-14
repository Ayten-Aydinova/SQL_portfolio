###  51 - Balanced Team

Suppose you are a manager of a data analytics company. You are tasked to build a new team consists of senior and junior data analysts. The total budget for the salaries is 70000.  You need to use the below criterion for hiring:

 

1- Keep hiring the seniors with the smallest salaries until you cannot hire anymore seniors.
2- Use the remaining budget to hire the juniors with the smallest salaries until you cannot hire anymore juniors.


### Solution Query

```sql
with cte as(
  select 
  	emp_id,experience,
	MIN(salary)OVER(partition by salary order by experience) as salary,
	sum(salary)OVER(order by salary) as cum
	from
		candidates)

select 
	emp_id,
    experience,
    salary
from cte
	where 
		cum<70000
	order by salary desc;

```


