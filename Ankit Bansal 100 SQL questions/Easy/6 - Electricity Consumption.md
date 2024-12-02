###  Electricity Consumption 6

You have access to data from an electricity billing system, detailing the electricity usage and cost for specific households over billing periods in the years 2023 and 2024. Your objective is to present the total electricity consumption, total cost and average monthly consumption for each household per year display the output in ascending order of each household id & year of the bill.
 
Tables: electricity_bill
+-----------------+---------------+
| COLUMN_NAME     | DATA_TYPE     |
+-----------------+---------------+
| bill_id         | int           |
| household_id    | int           |
| billing_period  | varchar(7)    |
| consumption_kwh | decimal(10,2) |
| total_cost      | decimal(10,2) |
+-----------------+---------------+



### Solution Query

```sql
select  
	household_id,
	left(billing_period,4) as bil_year,
	sum(consumption_kwh) as consumption ,
	sum(total_cost) as total_cost,
avg(consumption_kwh) as avg_consumption
from electricity_bill
group by household_id,left(billing_period,4)
order by household_id,bil_year asc;
```from electricity_bill

