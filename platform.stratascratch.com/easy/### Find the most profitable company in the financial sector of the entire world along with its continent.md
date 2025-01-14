### Find the most profitable company in the financial sector of the entire world along with its continent

Find the most profitable company from the financial sector. Output the result along with the continent.



### Solution Query




```sql
select 
    company,
    continent 
from forbes_global_2010_2014
    where lower(sector) like 'financ%'
        order by profits desc
            fetch first 1 rows only;
```

