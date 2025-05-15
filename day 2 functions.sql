use sakila;

select * from actor where first_name not like '%A%';

-- distnct , count

select distinct (first_name) from actor;

-- functions 
-- stirng functions
-- scaler function

select first_name, lower(first_name) from actor;

select first_name, lower(first_name) from actor;

select first_name, lower(first_name),
    upper( lower(first_name) ) , length(first_name) from actor;

-- substr (col , index)
select first_name, substr(first_name,1) from actor;

select first_name, substr(first_name,1) , substr(first_name,2,3) from actor;

select first_name, substr(first_name,1) , substr(first_name,2,3) , substr(first_name,-3) from actor;

select first_name, substr(first_name,1) , substr(first_name,2,3) , substr(first_name,-3,2) from actor;

select first_name, instr(first_name,'E') from actor;

-- concate , concate_ws
select first_name , last_name , concat(first_name,' - ' , last_name) from actor;

select first_name , last_name , concat_ws(' - ', first_name,' - ' , last_name,'$') from actor;

-- trim() => white spacechrecter => its remove space

select first_name, trim('  hey   ') from actor;

-- lpad() , rpad() 

select first_name, rpad(first_name,6,'$') from actor;



