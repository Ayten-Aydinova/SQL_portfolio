###  Project


1- write a query to print top 5 cities 
--with highest spends and their percentage contribution of total credit card spends 


### Solution Query

```sql
select * 
	from (
	select 
		city,
		sum(amount) total_spend,
		round(sum(amount)/
		(select sum(amount) from credit_transaction)*100,2),
		row_number() over(order by sum(amount) desc) rn
	from credit_transaction
		group by city)
			where rn<=5; ;

---2- write a query to print highest spent month and 
---amount spent in that month for each card type
select * 
    from (
        select 
            card_type,
            extract(year from transaction_date),
            extract(month from transaction_date) as month,
            sum(amount),
            dense_rank() over(partition by card_type order by sum(amount) desc) rn
        from credit_transaction
    group by card_type,extract(month from transaction_date),extract(year from transaction_date))
    where rn=1;
```

