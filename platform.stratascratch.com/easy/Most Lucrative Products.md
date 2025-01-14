### Most Lucrative Products




You have been asked to find the 5 most lucrative products in terms of total revenue for the first half of 2022 (from January to June inclusive).


Output their IDs and the total revenue.

### Solution Query




```sql
select 
	product_id,
	sum(cost_in_dollars*units_sold) revenue
from online_orders
	WHERE "date" BETWEEN DATE '2022-01-01' AND DATE '2022-06-30'
		group by product_id
			order by revenue desc
				fetch first 5 row only;
```

