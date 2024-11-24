
with cte as(
select 
product_id,product_name,price,
case
when price<100 then 'low'
when price between 100 and 500 then 'medium'
when price>500 then 'high price'
end as category
from products)
select category,count(*) from cte
group by category;