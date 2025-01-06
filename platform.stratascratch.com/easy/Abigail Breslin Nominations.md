### Abigail Breslin Nominations


Count the number of movies for which Abigail Breslin was nominated for an Oscar.




### Solution Query

```sql
select 
    count(distinct movie) no_oscars 
        from oscar_nominees
            where nominee='Abigail Breslin';

```


