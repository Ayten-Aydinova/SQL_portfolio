###  Project




### Solution Query

1- write a query to print top 5 cities 
--with highest spends and their percentage contribution of total credit card spends 


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

/*3- write a query to print the 
transaction details(all columns from the table) for each card type 
when
it reaches a cumulative of 1000000 total spends

*/

with cte as
	(select 
		credit_transaction.*,
		sum(amount) over(
		partition by card_type order by transaction_date,transaction_id) sum_amount 
	from credit_transaction)
	
	select * from (
		select 
			cte.*,
			dense_rank() over(partition by card_type order by sum_amount) rn  
			from cte
		where sum_amount>=1000000)
where rn=1;


----4- write a query to find city which had lowest 
---percentage spend for gold card type

with cte as (
	select  
		city,sum(amount) as amount,
		sum(case when card_type='Gold' then amount end) as gold_amount
	from credit_card_transcations
		group by city
		order by city)

select 
	city,
	ratio 
from (
	select 
		city,
		gold_amount/amount as ratio,
		row_number() over(order by gold_amount/amount)as rn 
	from cte
	where gold_amount is not null) a
where rn=1
;


----5- write a query to print 3 columns:  city, highest_expense_type , 
----lowest_expense_type (example format : Delhi , bills, Fuel)

with cte as(
    select 
        city,
        exp_type,
        sum(amount) amount,
        rank() over(partition by city order by sum(amount) desc) rn_desc,
        rank() over(partition by city order by sum(amount) asc) rn_asc
    from credit_transaction
        group by city,exp_type)

select 
    city,
    max(case when rn_desc=1 then exp_type end) as highest_exp_type,
    max(case when rn_asc=1 then exp_type end) as lowest_exp_type
from cte
    group by city;



---6- write a query to find percentage contribution of spends 
---by females for each expense type
with cte as(
    select  
        exp_type,
        sum(amount) total_spent,
        sum(case when gender='F' then amount else 0 end) as female_spent
    from credit_card_transcations
        group by exp_type)

select 
    exp_type,
    female_spent/total_spent as female_contribution 
from cte
    order by female_contribution desc;


---7- which card and expense type combination saw highest month over month 
----growth in Jan-2014with cte as(
    select 
        card_type,
        exp_type,
        to_char( transaction_date,'mm-yyyy')as transaction_date,
        sum(amount) amount
    from  credit_card_transcations
        group by card_type,exp_type,to_char( transaction_date,'mm-yyyy')
        order by card_type,exp_type,transaction_date )

select 
    card_type,
    exp_type,
    growth 
from (
    select 
        card_type,
        exp_type,
        (jan_spent-dec_spent)/dec_spent as growth,
        row_number() over (order by(jan_spent-dec_spent)/dec_spent desc) as  rn
    from(
        select 
            card_type,
            exp_type,
            max(case when transaction_date='12-2013' then amount end) as dec_spent,
            max(case when transaction_date='01-2014' then amount end) as jan_spent
        from cte
            group by card_type,exp_type) a
            order by growth desc )
                where rn=1
;



--8- during weekends which city has highest total spend to total no of 
---transcations ratio 
with cte as(
select 
    city,
    sum(amount)total_spend,
    count(transaction_id) no_transaction 
from credit_card_transcations
    where TO_CHAR(transaction_date, 'D') IN ('1', '7')
        group by city)

select 
    city,
    contribution 
from(
    select 
        city,
        total_spend/no_transaction as contribution,
        row_number() over(order by total_spend/no_transaction desc) rn
    from cte
        order by contribution desc) a
where rn=1;

--9- which city took least number of days to reach its
--500th transaction after the first transaction in that city;


with cte as(
select 
    city,
    transaction_date,
    amount,
    row_number() over(partition by city order by transaction_date) rn
from credit_card_transcations)

select 
    city,
    min(transaction_date),
    max(transaction_date) 
from cte
    where  rn=1 or rn=500
    group by city
```

