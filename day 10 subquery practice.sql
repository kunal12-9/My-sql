use sakila;
-- subquery another example
select * from payment
 where amount=(select amount from payment where payment_id=6);

-- ineed to get all the columns for the actor whos actor id> a actor id of a person whos first_name is ed and last name chase
select * from actor;
select * from actor
 where actor_id>(select actor_id from actor  where first_name = 'ED' and last_name='CHASE');

select * from payment;
-- get allt he payment information from payment table where the month of  the payment should be equal to the month of payment id 5

-- select month(payment_date) from payment where payment_id=5

-- select * from payment where
-- month(payment_date)=(select month(payment_date) from payment where payment_id=5
-- );
select * from payment;

-- get the customer_id payment id and the amount for the payments where the rental id less then the 
-- rental id of payment id 7 and amount less than 5
-- (select customer_id,payment_id , amount from payment  where rental_id in( pyament_id=5 and amount<5) group by customer_id)

select * from payment 
where rental_id<(select rental_id from payment where payment_id=7 and amount<5);

select * from payment;
-- get the amount and total number of payments done where the total number of payments is greter than 
-- the total number of payment done by amount 5.99

select * from payment 
where payment_id>(select payment_id , amount from payment where amount>5.99);

-- get the amount and total number of payments done where the total number of payments is greter than 
-- the total number of payment done by amount 5.99

select amount,count(amount) from payment
group by amount
having count(amount)>(select count(amount) from payment 
							where amount=5.99);

-- multirow subquery--> dont use this oprator-- =,>=,<=,<
-- in oprator=> use in multirowsubquery
select * from payment
where amount in (select amount from payment where payment_id in(3,1));

-- =any oprstor
select * from payment
where amount =any (select amount from payment where payment_id in(3,1));

-- >any
select * from payment
where amount >any (select amount from payment where payment_id in(3,1));

-- <any 
select * from payment
where amount <any (select amount from payment where payment_id in(3,1));

-- >all
select * from payment
where amount <all (select amount from payment where payment_id in(3,1));

-- >=all
select * from payment
where amount >=all (select amount from payment where payment_id in(3,1));
