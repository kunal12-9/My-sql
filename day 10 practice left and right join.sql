-- use kunal;
-- create table k(
-- student int,
-- salary int,
-- region varchar(20)
-- );
-- insert into k values(1,5000,'east'),
-- insert into k(student,salary)
-- values(1,5000);
-- select * from t1 where id is null; -- it will dispaly null value sonly
-- select * from t1 where id is not null; -- it will display not null value

-- left join => iska matalb ye ki left table ka data sara aur inner join 
create table t1(id int);
insert into t1 values(1),(2),(3),(4),(5);
select * from t1;
create table t2(id int);
insert into t2 values(1),(2),(1),(3),(4);

select * from t1
left join t2 on t1.id=t2.id;
select * from t1
right join t2 on t1.id=t2.id;

-- cutomer name -customer, rental id, payment amount
-- if the customer have no payment but that record show 
use sakila;
select * from customer;
select * from rental;
select * from payment;
SELECT c.first_name , r.rental_id,
    p.amount from customer c
left join rental r on c.customer_id = r.customer_id
left join payment p on r.rental_id = p.rental_id;

-- learning assignment
-- 1 list customer with their rental and payment detail customer with no rental id
-- 2 find all films and thier inventory item with rental details films with not invertry and not rental also will display
-- 3 display customer their rental count and ther total paymrnt amount
-- 4 list alll staff mebers and thier payment payment amount
-- display all payment given if satff record is missing

-- 1️List customer with their rental and payment detail (including customers with no rental)
select * from customer;
select * from rental;
select * from payment;
select c.first_name, r.rental_id , p.payment_id from customer c 
left join rental r on c.customer_id=r.customer_id
left join payment p on r.rental_id= p.rental_id;

-- 2️Find all films and their inventory item with rental details (include films with no inventory and no rental)
select * from film;
select * from inventory;
select * from rental;
select f.title, i.inventory_id, r.rental_id from film f 
left join inventory i on f.film_id=i.film_id
left join rental r on i.inventory_id=r.inventory_id;

-- 3 Display customer, their rental count, and their total payment amount
select * from customer;
select * from rental;
select * from payment;
select c.customer_id, count(r.rental_id) , sum(amount) from customer c 
left join rental r on c.customer_id=r.customer_id
left join payment p on r.rental_id=p.rental_id group by c.customer_id;
