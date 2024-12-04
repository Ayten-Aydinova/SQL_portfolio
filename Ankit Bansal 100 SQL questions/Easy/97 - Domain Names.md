### 97 - Domain Names


Write an SQL query to extract the domain names from email addresses stored in the Customers table.


### Solution

```sql
select 
	email,
	substring(email,instr(email,'@')+1) as domain_name   
from customers;
```

