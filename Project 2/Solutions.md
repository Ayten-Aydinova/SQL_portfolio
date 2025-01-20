###  Solutions



```sql
----1 which team has won the maximum gold medals over the years.
select 
    team,
    gold_medal 
from
    (select 
        team,
        count(medal)gold_medal,
        row_number() over (order by count(medal) desc) rn 
    from athlete_events ae
    left join athlete a on ae.athlete_id=a.id
        where medal='Gold'
        group by team)
where rn=1;




```

