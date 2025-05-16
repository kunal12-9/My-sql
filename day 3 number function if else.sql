use sakila;

select * from actor where first_name not like '%A%';

select 9*1547 from dual;

select sysdate() , curdate() , current_timestamp(), now() from dual;

select now() , adddate(now(),2) from dual;

select now() , adddate(now(),interval 2 month ) from dual;

select now() , adddate(now(),interval 2 week ) from dual;

select now() , datediff( '2025-05-16 17:17:56', '2025-05-30 17:17:56' ) from dual;

select last_day(now())  from dual;

select month(now()) , year(now()) from dual;

select extract( year from now() ) from dual;

select extract( minute from now() ) from dual;

-- %y =>accses modifier
select now(), date_format( now(), 'this is year is %Y') from dual;

-- round(), truncate() , pow, floor() ,ceil()

select 24.675,round(24.646,2) from dual;

select round(24.32 ,-1) from dual;

select round(364.32 ,-1) from dual;

-- truncat
select round(364.37 ,-1) , truncate(364.37 , -1) from dual;

-- mod, pow  , floor , ceil ,
select mod(11,2) , pow(2,3) , floor(10.9999) , ceil(19.0001) from dual;

select * from actor;

select first_name , actor_id*10 from actor where first_name = 'NICK';

select first_name , actor_id*10 from actor where first_name = 'NICK';

-- if(condition , true , false)
select first_name , actor_id, 
if(first_name="NICK" , "Yes" , if(first_name= "ED" , "hello" , "NO")) 
from actor;

-- q.1
select actor_id ,  if(actor_id%2=0, concat(first_name ," ",last_name),concat(first_name ," ",last_name,"$")) from actor;

select * from actor;
select first_name,
case 
	when mod (actor_id,2)=0 then "yes"
    when actor_id =5 then "####yes###"
    else "NO"
end
from actor;