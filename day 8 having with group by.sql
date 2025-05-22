use sakila;

select * from payment;

select customer_id, count(payment_id) from payment where customer_id>3 group by customer_id;
select customer_id, count(payment_id) from payment  group by customer_id having count(payment_id)>30;

select customer_id, count(payment_id) from payment where customer_id not in(2,3) group by customer_id ;


select customer_id, count(payment_id) from payment where customer_id not in(2,3) group by customer_id 
having count(payment_id)>35;

select * from payment;

select count(payment_id) from payment group by amount;
select count(customer_id),amount from payment where amount not in(0.99,2.99) group by amount; 
select amount, sum(rental_id) , sum(amount) from payment where amount in(0.99,2.99,5.99)  group by amount having sum(rental_id)>1000;

select * from actor;
select * from film_actor;

select a.actor_id , count(film_id) from actor as a
join film_actor as f where a.actor_id = f.actor_id group by a.actor_id having count(film_id)>25;

