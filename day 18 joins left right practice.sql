use sakila;
select * from product;
select * from orderss;
select o.productid, o.location, o.oid,p.pname from orderss as o
natural join product as p;

-- natural join its ism,kindof join which dont use in sql if all tables 
-- have coomon table it will act as inner join other wise it will act as a cross join

-- cross joun or cartision join its is a kind of join where each raw of one table its connected a
-- maped a connected each raw of another tbale

use sakila;
select * from actor;
 -- inner joinperforom 
 -- using on ,
 -- if have common column both table we use using 
 -- or we use where 
 -- synte of inner join
 select a.actor_id,a.first_name, fa.film_id from actor as a
 join film_actor as fa where a.actor_id=fa.actor_id;

select a.actor_id, a.first_name , fa.film_id from actor as a
inner join film_actor as fa on a.actor_id=fa.actor_id;

-- practice
 select a.first_name, count(fa.film_id) from actor as a
 join film_actor as fa where a.actor_id=fa.actor_id
 group by a.first_name;
 
 select * from actor;
 select * from film_actor;
 select * from film;
 select act.actor_id, act.first_name,factor.film_id from 
 actor as act
 inner join film_actor as factor inner join  film
 on act.actor_id= factor.actor_id
 and factor.film_id=film.film_id;
 
 -- second type of do perfom multiple table in jin 
 
 select act.actor_id, act.first_name,factor.film_id from 
 actor as act
 inner join film_actor as factor 
 on act.actor_id= factor.actor_id join film
 on factor.film_id=film.film_id;

use world;
select * from city;
select * from country;
-- get the city name and distrcit where district do not have 
-- the word not have the nord
select name, district from city
where district not like '%nord%';
-- get the total number of citys present in each country
-- having the population greather then 1.5 lakhs
select c.code, c.name,count(ci.id) from country c
join city ci on c.code=ci.countrycode
where c.population>150000 group by c.code, c.name;
--  get the districr nsame which has more then 2 citys  
select district,count(id) 
from city group by district having count(id) > 2;

-- 1 find the city name the country code the country name
-- where the country population is grether then 500000 thosend
select c.name,c.countrycode,
cou.name  from city as c join 
    country  as cou on c.countrycode = cou.code
where c.population > 500000;
-- 2 get the distrit and the total populations 
-- for each country 
select * from city;
-- 3 get the total numbe ro fcountry present in each continent
-- having there indepedence year after 1920
-- 4 gtet the average surface arera the total popultion avg life
-- exepectency and total number of continent avaialble fro each region
 