### Order Details

Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.


### Solution Query




```sql
select 
    customers.first_name,
    ORDER_DATE,
    ORDER_DETAILS,
    TOTAL_ORDER_COST from customers 
join orders on  customers.id=orders.cust_id
where customers.first_name in ('Jill','Eva')
order by cust_id asc;
```

