###  Highest Number Of Orders







Find the customer who has placed the highest number of orders. Output the id of the customer along with the corresponding number of orders.


### Solution Query

```sql
select  
    cust_id,
    count(id) n1 
from orders
    group by cust_id
        order by n1 desc
        fetch first 1 rows only
 ;
```

