-- find the paymentid, customer_id , amount
-- amount i same of payment id =5'
use sakila;
select payment_id,customer_id,amount from payments
where amount=
(select amount from payment where payment_id=5);

-- =any or in
select payment_id,customer_id,amount from payment
where amount =any
(select amount from payment where payment_id=2 or payment_id=3);
-- >any=> its minum value of subquery
select payment_id,customer_id,amount from payment
where amount >any
(select amount from payment where payment_id=2 or payment_id=3);

-- >all => sab value se sabse nadi value
select payment_id,customer_id,amount from payment
where amount >all
(select amount from payment where payment_id=2 or payment_id=3
or payment_id=5);
-- <all => sabhi value se sabse choti value
select payment_id,customer_id,amount from payment
where amount <all
(select amount from payment where payment_id=2 or payment_id=3
or payment_id=5);

-- get the name of the country whos population is greather then 
-- all the  population  of the country from
-- the  continent north america
select * from country;
select name , population from country where population>all
(select population from country where continent='north america');
-- get the country code the name of the country whos life exepctency
-- is same as fro the country from europe
 select Code,Name from country where lifeexpectancy =any
(select LifeExpectancy from country where Continent='Europe');

-- get the name and the continent for the countrys who have
-- got there independence near by the indepdence year of 
-- the country for asia
select  continent, count(name) from country
where indepyear>any(select indepyear from country 
where continent="asia")
and continent<>'asia'
group by continent;

select * from country order by continent;

select name,population,(select population from country 
where name="anguilla")
from country;

