### 72 - Product Sales

You are provided with two tables: Products and Sales. The Products table contains information about various products, including their IDs, names, and prices. The Sales table contains data about sales transactions, including the product IDs, quantities sold, and dates of sale. Your task is to write a SQL query to find the total sales amount for each product. Display product name and total sales . Sort the result by product name.


### Solution

```sql
select 
	p.product_name,
	sum(price*quantity) as total_sales
from sales s
	left join products p on p.product_id=s.product_id
group by product_name
order by product_name;
```

