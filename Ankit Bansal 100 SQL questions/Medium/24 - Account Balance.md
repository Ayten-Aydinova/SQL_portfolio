###  24 - Account Balance

You are given a list of users and their opening account balance along with the transactions done by them. Write a SQL to calculate their account balance at the end of all the transactions. Please note that users can do transactions among themselves as well, display the output in ascending order of the final balance.


### Solution Query

```sql
with cte as
	(select  
		from_userid ,
		amount*-1 as  balance  from transactions 
	union all
	select  
		to_userid  ,
		amount as  balance from transactions),
cte2 as(
	select 
		from_userid,
		sum(balance)  balance from cte
	group by from_userid)

select 
	username,
	coalesce(balance,0)+opening_balance as amount  
	from cte2 c
right join users u 
	on u.user_id=c.from_userid
	order by amount asc;

```

