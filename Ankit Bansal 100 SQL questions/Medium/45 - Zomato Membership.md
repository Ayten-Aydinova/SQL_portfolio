### 45 - Zomato Membership

Zomato is planning to offer a premium membership to customers who have placed multiple orders in a single day.

Your task is to write a SQL to find those customers who have placed multiple orders in a single day at least once , total order value generate by those customers and order value generated only by those orders, display the results in ascending order of total order value.




```with 
	cte as
	(select 
       customer_name,
       order_value,
       date(order_date) as tarix 
     from orders),
 	cte1 as(
	select 
      	customer_name,
      	tarix,count(tarix),
      	sum(order_value) ord_value
	from cte
		group by customer_name,tarix
		having count(tarix)>=2),
	cte3 as(
		select 
      		customer_name,
      		sum(ord_value) order_value_date
		from cte1
			group by customer_name),
	cte4 as
		(select 
         	customer_name,
         	sum(order_value) total_order_value 
        from orders
			group by customer_name)

select 
	cte3.customer_name,
    total_order_value,
    order_value_date 
from cte3
inner join cte4 on 
cte3.customer_name=cte4.customer_name
order by total_order_value asc

```

