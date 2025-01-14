### Customer Details

Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
Sort records based on the customer's first name and the order details in ascending order.


### Solution Query




```sql
select 
    first_name,
    last_name,
    city,
    order_details 
from customers
    left join orders on customers.id=orders.cust_id
        order by order_details asc;
```

