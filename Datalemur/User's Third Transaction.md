###User's Third Transaction


This is the same question as problem #11 in the SQL Chapter of Ace the Data Science Interview!

Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.
### Solution Query

```sql
select 
	user_id,
	spend,
	transaction_date
from 
	(SELECT 
		user_id,
		spend,
		transaction_date,
		dense_rank() over(partition by user_id order by transaction_date) rn 
	FROM transactions) t
		where rn=3
;```


