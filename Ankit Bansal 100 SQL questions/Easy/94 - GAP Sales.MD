### 94 - GAP Sales

You have a table called gap_sales. Write an SQL query to find the total sales for each category in each store for the Q2(April-June) of  2023. Return the store ID, category name, and total sales for each category in each store. Sort the result by total sales in ascending order.
 



### Solution

```sql
select 
	store_id,category,
	sum(total_sales) AS total_sales  
from gap_sales
	where year(sale_date)=2023 and month(sale_date) in  	(4,5,6)
group by store_id, category
order by total_sales  asc;
```

