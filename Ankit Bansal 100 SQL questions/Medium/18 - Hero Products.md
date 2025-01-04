###  18 - Hero Products


Flipkart an ecommerce company wants to find out its top most selling product by quantity in each category. In case of a tie when quantities sold are same for more than 1 product, then we need to give preference to the product with higher sales value.

Display category and product in output with category in ascending order.


### Solution Query

```sql
with cte as
  (select 
      category,
      product_id,
      sum(quantity) no_sold,
      sum(quantity*unit_price) total_sales
  from orders
  	group by category,product_id)


select 
	category,
    product_id 
from(
    select *,
    	row_number() OVER(partition by category order by no_sold desc, 			total_sales desc) rn from cte) t
where rn=1
```

