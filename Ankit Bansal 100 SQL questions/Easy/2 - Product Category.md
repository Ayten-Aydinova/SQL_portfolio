###  Product Category 2

Easy - 10 Points
You are provided with a table named Products containing information about various products, including their names and prices. Write a SQL query to count number of products in each category based on its price into three categories below. Display the output in descending order of no of products.

 

1- "Low Price" for products with a price less than 100
2- "Medium Price" for products with a price between 100 and 500 (inclusive)
3- "High Price" for products with a price greater than 500. 


### Solution Query

```sql
with cte as(
select 
	product_id,product_name,price,
	case
when price<100 then 'Low Price'
when price between 100 and 500 then 'Medium Price'
else  'High Price'
	end as category
from products)


select category,count(*) no_products 
from cte
group by category
order by no_products desc ;
```

