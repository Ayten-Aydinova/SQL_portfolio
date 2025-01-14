### Churro Activity Date

Find the activity date and the pe_description of facilities with the name 'STREET CHURROS' and with a score of less than 95 points.### 

Solution Query




```sql
select 
    ACTIVITY_DATE,
    PE_DESCRIPTION 
from los_angeles_restaurant_health_inspections
        where 
            FACILITY_NAME='STREET CHURROS' 
            and score<95;
```

