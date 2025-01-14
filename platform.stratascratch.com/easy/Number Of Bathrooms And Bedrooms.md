### Number Of Bathrooms And Bedrooms

Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type.


### Solution Query




```sql
select 
    city,
    PROPERTY_TYPE,
    avg(bathrooms),
    avg(bedrooms) 
from airbnb_search_details
	group by 
		city,
		PROPERTY_TYPE;
```

