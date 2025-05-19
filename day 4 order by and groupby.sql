-- order by , alias , multi-row functions
use sakila;
select * from actor order by  first_name;
select * from actor order by first_name, actor_id desc;

-- =>aliyas its use for make new coulum name by write as
select actor_id , actor_id+10 as "newactor" from actor;

-- Multiple rows functions- its apply multiple row but result givr single
-- sum(),count(), max(), min(),avg() 
 select * from payment;
 
 -- distnict function -->reomve duplicate values
 
 select distinct (customer_id) from payment;
 
 select count( customer_id) from payment;
 
 
 
 