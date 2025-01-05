###  33 - Average Order Value

Write an SQL query to determine the transaction date with the lowest average order value (AOV) among all dates recorded in the transaction table. Display the transaction date, its corresponding AOV, and the difference between the AOV for that date and the highest AOV for any day in the dataset. Round the result to 2 decimal places.### Solution Query

```sql
with 
cte as(
	select 
  		transaction_date,
  		avg(transaction_amount) avg 
from transactions
	group by transaction_date),
cte1 as (
  	select 
  		transaction_date,
  		avg,row_number() over (order by avg) as rn,
 		 max(avg) over() as max_avg 
from cte)
  
select 
	transaction_date,
    round(avg,2) avg,
    round(max_avg-avg,2) diff-avg
 from cte1
  where rn=1
```

