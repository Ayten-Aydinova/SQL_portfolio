###  Highest Cost Orders










Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.


For simplicity, you can assume that every first name in the dataset is unique.

### Solution Query

```sql
WITH daily_sums AS
  (SELECT c.first_name,
          o.order_date,
          SUM(o.total_order_cost) AS total_daily_cost
   FROM orders o
   JOIN customers c ON o.cust_id = c.id
   WHERE o.order_date BETWEEN TO_DATE('2019-02-01', 'YYYY-MM-DD') AND TO_DATE('2019-05-01', 'YYYY-MM-DD')
   GROUP BY c.first_name,
            o.order_date),
     ranked_sums AS
  (SELECT first_name,
          order_date,
          total_daily_cost,
          ROW_NUMBER() OVER (
                             ORDER BY total_daily_cost DESC) AS rn
   FROM daily_sums)
SELECT first_name,
       order_date,
       total_daily_cost AS max_cost
FROM ranked_sums
WHERE rn = 1; ;
```

