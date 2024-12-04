### 73 - Category Product Count

You are provided with a table that lists various product categories, each containing a comma-separated list of products. Your task is to write a SQL query to count the number of products in each category. Sort the result by product count.

 



### Solution

```sql
select 
	category,
	length(products)-length(replace(products,',',''))+1 	as 	product_count  
from categories
order by product_count ;```

