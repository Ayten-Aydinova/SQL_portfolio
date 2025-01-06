### Finding Updated Records

We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. Find the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order

### Solution Query

```sql
select 
    id, 
    first_name, 
    last_name, 
    department_ID,
    max(salary)
    from ms_employee_salary
group by id, 
    first_name, 
    last_name, 
    department_ID;
```


