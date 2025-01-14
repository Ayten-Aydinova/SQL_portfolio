### Admin Department Employees Beginning in April or Later

Find the number of employees working in the Admin department that joined in April or later.

### Solution Query




```sql
select 
	count(*) 
from worker
	where 
		department='Admin' and 
		to_char(joining_date,'yyyy-mm')>='2014-04';
```

