###  Category Sales (Part 1)

Write an SQL query to retrieve the total sales amount for each product category in the month of February 2022, only including sales made on weekdays (Monday to Friday). Display the output in ascending order of total sales.



### Solution Query

```sql
select 
	category,
	sum(amount ) as total_sales  
from sales
	where year(order_date)=2022 
	and month(order_date)=2
	and dayofweek(order_date) between 2 and 6
group by category
order by total_sales ;
```

