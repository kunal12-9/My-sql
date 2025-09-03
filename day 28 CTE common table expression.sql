use regex1;
-- method 1
select * from employees;
select avg(salary), deptid from employees group by deptid 
order by avg(salary) desc limit 1;
select salary empid,empname,salary,deptid from employees as oute
where salary >
(select avg(salary) from employees as inn where
 inn.dept_id=oute.dept_id);
 
 -- CTE=> common table expression
 
 with xyz as 
 (
 select deptid, avg(salary) as dsalary
 from employees group by deptid
 )
 select e.empname,e.salary,xyz.dsalary from employees as e
 join xyz  where e.deptid=xyz.deptid and e.salary>xyz.dsalary;
use sakila;
 select * from actor;
 -- join the actor table and film actor table to find out
 -- the actor the first anme and moviue the actor ahs work 
 -- actor id >10
select a.actor_id, a.first_name, fa.film_id from actor as a
join film_actor as fa on a.actor_id = fa.actor_id
where a.actor_id > 10;

-- cte threw soll
with cte as 
(select * from film_actor where actor_id>10)
select a.actor_id, first_name , film_id
from cte join actor as a where a.actor_id=cte.actor_id;
-- new question with cte
with actorCount as 
(select actor_id, count(film_id)  as movies from film_actor 
group by actor_id)
select first_name,actorCount.actor_id,actorCount.movies
from actorCount join actor as a
 where actorCount.actor_id=a.actor_id;
with actorCount as (
select a.actor_id, a.first_name, count(f.film_id) as movies
from actor as a join film_actor as fa on a.actor_id = fa.actor_id
join film as f on fa.film_id = f.film_id group by 
a.actor_id, a.first_name
)
select actorCount.actor_id, actorCount.first_name,actorCount.movies
from actorCount;

-- learning assignment normalisation 1nf 2nf 3 nf
