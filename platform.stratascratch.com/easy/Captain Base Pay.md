### Captain Base Pay

Find the base pay for Police Captains.
Output the employee name along with the corresponding base pay.


### Solution Query




```sql
SELECT
    employeename,
    basepay
FROM sf_public_salaries
WHERE
    jobtitle LIKE '%CAPTAIN%POLICE%' ;
```

