
Derive Points table for ICC tournament

### Solution Query

```sql
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');
select * from icc_world_cup;

select
team_name,count(*) no_games,sum(win_flag) no_games_win,count(*)-sum(win_flag) no_games_lost
from
(select team_1 as team_name,
case when team_1=winner then 1 else 0 end as win_flag from icc_world_cup
union all
select team_2,
case when team_2=winner then 1 else 0 end as win_flag from icc_world_cup) A
group by team_name
 ;
```

