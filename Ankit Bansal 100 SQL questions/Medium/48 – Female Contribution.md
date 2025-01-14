###  48 – Female Contribution

You are given a history of credit card transaction data for the people of India across cities. Write an SQL to find percentage contribution of spends by females in each city.  Round the percentage to 2 decimal places. Display city, total spend , female spend and female contribution in ascending order of city.

### Solution Query

```sql
with cte1 as(
select 
	city,
  	sum(amount) spend_female 
from credit_card_transactions
	where gender="F"
	group by city),
cte2 as(
	select 
		city,
  		sum(amount)  Total_spend 
  	from credit_card_transactions
	group by city)
    
select 
	cte1.city,
    cte2.total_spend,
    cte1.spend_female,
	round((cte1.spend_female/cte2.total_spend)*100,2) female_contribution
from cte1 
join  cte2 on cte1.city=cte2.city
order by cte1.city asc;

```


