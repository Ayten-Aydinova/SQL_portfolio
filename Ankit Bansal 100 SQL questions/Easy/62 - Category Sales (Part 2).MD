### Category Sales (Part 2)

Write an SQL query to retrieve the total sales amount in each category. Include all categories, if no products were sold in a category display as 0. Display the output in ascending order of total_sales.


### Solution

```sql
select 
	category_name,
	coalesce(sum(amount),0) as total_sales
from sales s
	right join categories c on c.category_id=s.category_id
group by category_name
order by total_sales asc;
```

