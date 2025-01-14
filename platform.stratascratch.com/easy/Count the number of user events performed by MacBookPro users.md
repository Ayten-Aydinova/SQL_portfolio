### Count the number of user events performed by MacBookPro users

Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in the descending order.


### Solution Query




```sql
select 
    event_name,
    count(*) no_of_events 
from playbook_events
    where device='macbook pro'
        group by event_name
            order by no_of_events desc;
```

