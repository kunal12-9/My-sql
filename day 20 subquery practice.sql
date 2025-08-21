-- subquery=>when my result dpedent on another query that time used subquery
use world;
select * from city;
select name,population from city
where population>
(select population from city where name = 'batna');
-- know get name of the city where the district is same as of 
-- the district name of -- the ciyt name of anstedam
select * from city;
select name,district from city where district=
(select district from city where name = 'amsterdam');
select name,district from city where district = name;
select * from city;
select * from country;
-- 1 get the country code and country name where the continent 
-- nmatched with the continent of the country albaniya
select code, name
from country where continent= 
(select continent from country where name='Albania');
-- 2 get then continent the name of the country where the 
-- life expectency matched with the life expectency of the 
-- country name of cook island
select continent, name from country 
where lifeexpectancy= (select lifeexpectancy
    from country where name='Cook Island');
-- 3 get the country code and the continent and gnp value 
-- for the country wheere the region dony match with the
-- region of the country name benin
select * from country;
select code,name,GNP from country where region<>
(select region from country where name="Benin");

-- subquery type
-- single row subquery 
-- multirow subquery if we use multirow subwuery 
-- that use =any >=

-- ineed to get the country name and population for all 
-- countrys available in the continent name as urope
select population, name from country where name in
(select name from country where continent='Europe');

-- ineed to getthe country name and the country code
-- where life expextency matched 
-- with the life expectency of the country name is bahmas
select name, code from country where lifeexpectancy=
(select lifeexpectancy from country where name='Bahamas');
