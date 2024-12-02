###  Deliveroo Top Customer

You are provided with data from a food delivery service called Deliveroo. Each order has details about the delivery time, the rating given by the customer, and the total cost of the order. Write an SQL to find customer with highest total expenditure. Display customer id and total expense by him/her.

### Solution Query

```sql


select 
	customer_id,
	sum(total_cost)  as total_expense 
from orders
group by customer_id 
order by total_expense desc
limit 1;

```

