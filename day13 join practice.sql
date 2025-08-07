use sakila;
-- 1find the second highest salary from employee table using subquery.
select max(salary) from employee where salary < (select max(salary)
 from employee);
--  2. list the titles of all films and the names of the actors who acted in them.

select f.title, concat(a.first_name,' ',a.last_name) 
from film f join film_actor fa 
on f.film_id = fa.film_id 
join actor a on fa.actor_id = a.actor_id;
-- 3. find the names of customers and the titles of the films they rented
select * from customer;
select * from rental;
select * from film;
select * from inventory;
select concat(c.first_name,' ',c.last_name), f.title 
 from customer c  join rental r 
on c.customer_id = r.customer_id 
join inventory i on r.inventory_id = i.inventory_id 
join film f on i.film_id = f.film_id;
-- 4show the names of stores and the cities they are located in.
select * from store;
select * from address;
select * from city;
select s.store_id, c.city from store s join address a 
on s.address_id = a.address_id 
join city c on a.city_id = c.city_id;
-- 5  find the names of staff members and the stores they work at.
select * from staff;
select * from store;
select s.first_name, st.store_id  from staff s  
join store st on s.store_id = st.store_id;
-- 6 list all customers along with the total number of rentals they have made.
select * from customer;
select * from rental;
select c.first_name, count(r.rental_id) as total_rentals from customer c 
left join rental r on c.customer_id = r.customer_id
 group by c.customer_id;
