###   
### Solution Query

```
---Employee Attrition Analysis
--1.Calculate the attrition rate (percentage of employees who left the company).
select
    (count(case
        when attrition='Yes' then 1  end)/count(*))*100
from hr_data;

--2.Find the average age of employees who have left.
select 
    trunc(avg(age)) 
        from hr_data
            where attrition='Yes';

---Identify the top 5 departments with the highest attrition rates.


select 
    department,
    ratio
from (
select department,
    round((count(case
        when attrition='Yes' then 1  end)/count(*))*100,2) as ratio,
        row_number() over(order by round((count(case
        when attrition='Yes' then 1  end)/count(*))*100,2)) rn
from hr_data
    group by department
    order by ratio desc)
where rn <=5;

---4.Calculate the average monthly income 
--for employees who stayed vs. employees who left.

select 
    attrition,
    round(avg(monthlyincome),2) avg_income
from hr_data
    group by attrition;

--Determine if there is any correlation between job satisfaction and attrition.

select 
    jobsatisfaction,
    sum(case when attrition='Yes' then 1 else 0 end )as left_job,
    sum(case when attrition='No' then 1 else 0 end )as stayed_job
from hr_data
    group by jobsatisfaction;

SELECT 
  ATTRITION,
  AVG(JOBSATISFACTION) AS avg_job_satisfaction
FROM 
  hr_data
GROUP BY 
  ATTRITION;
  
---Find the employees with the longest tenure who have left the company.


SELECT 
    EMPLOYEENUMBER, 
    YEARSATCOMPANY
FROM hr_data
WHERE ATTRITION = 'Yes'
ORDER BY YEARSATCOMPANY DESC;

```

