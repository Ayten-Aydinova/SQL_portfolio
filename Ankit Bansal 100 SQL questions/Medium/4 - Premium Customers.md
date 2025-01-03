### 4 - Premium Customers




An e-commerce company want to start special reward program for their premium customers.  The customers who have placed a greater number of orders than the average number of orders placed by customers are considered as premium customers.

Write an SQL to find the list of premium customers along with the number of orders placed by each of them, display the results in highest to lowest no of orders.

 
### Solution Query

```sql
with cte1 as
	(select customer_name,count(order_id) no_ord from orders
	group by customer_name),
		cte2 as 
		(select avg(no_ord) from cte1)


select 
	customer_name,
    count(order_id) order_no 
from orders
	group by customer_name
	having count(order_id)>(select * from cte2);
```

