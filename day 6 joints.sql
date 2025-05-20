create database regexx;
use regexx;
create table product( pid int, pname varchar(20), price int);
insert into product values(10,"Iphone",20000), (11,"TV",10000),
(12,"LED",3000), (13,"Jeans",800);

select * from product;

create table orders11( oid int, city varchar(20), pid int);
insert into orders11 values(124111,"Jaipur",10), (124112,"GOA",11),
(145631,"Manali",12), (59869011,"Raipur",16);
select * from orders11;

select o.oid, o.city,o.pid from orders11 as o;

select o.oid, o.city,o.pid,p.pname from orders11 as o
join product as p where o.pid=p.pid;

select o.oid, o.city,o.pid,p.pname,p.pid from orders11 as o
join product as p;

-- common condtion
-- old syntex
select o.oid, o.city, o.pid, p.pname,p.pid from orders11 as o
join product as p where o.pid=p.pid; 
-- new syntex
select o.oid, o.city, o.pid, p.pname,p.pid from orders11 as o
INNER join product as p where o.pid=p.pid; 

-- outer join 3 type a. right join b. left join c. inner join
select o.oid, o.city, o.pid, p.pname,p.pid from orders11 as o
LEFT join product as p on o.pid=p.pid; 

use sakila;

select * from actor;
select * from film_actor;
select * from film;

-- 1
select fa.actor_id , fa.film_id , f.title
     from film_actor as fa
     inner join film as f on fa.film_id=f.film_id;

-- 4     
select * from film;
select film_id , title , rating from film where rating="NC-17"
order by film_id desc;

-- 2
select fa.actor_id, f.title from film_actor as fa inner join film as f on fa.film_id=f.film_id where length>100;

