###  1 - Return Orders Customer Feedback


Namastekart, an e-commerce company, has observed a notable surge in return orders recently. They suspect that a specific group of customers may be responsible for a significant portion of these returns. To address this issue, their initial goal is to identify customers who have returned more than 50% of their orders. This way, they can proactively reach out to these customers to gather feedback.

Write an SQL to find list of customers along with their return percent (Round to 2 decimal places), display the output in ascending order of customer name.


### Solution Query

```sql
select 
	customer_name,
    round(count(r.order_id)*100/count(o.order_id),2) return_percent
from orders o
	left join returns r on r.order_id=o.order_id
		group by customer_name
		having round(count(r.order_id)*100/count(o.order_id),0)>50.00
		order by customer_name ;
```

