### Number of Workers by Department Starting in April or Later

Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
Sort records based on the customer's first name and the order details in ascending order.


### Solution Query




```sql
select 
    department,
    count(*) no from worker
where to_char(joining_date,'yyyy-mm')>='2014-04'
    group by department
        order by no ;
```

