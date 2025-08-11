use sakila;
select * from actor;
select char_length(first_name) from actor;
select concat_ws('-',first_name,last_name) from actor;
select substr(first_name,3,4) from actor;
select first_name, instr(first_name,'e') from actor;
select first_name, locate('e',first_name,5) from actor;
-- replace function
select first_name, locate('e',first_name,5)
, replace(first_name,'e','-') from actor;
-- trim()
select  char_length(trim('   hey  ')) ;
select char_length(trim( leading from '   hey    '));
-- leaidng remove only front white space

-- agrricate functtions
select * from payment;
-- count
select count(amount),sum(amount),avg(amount)
 from payment;
select customer_id,count(amount) as total_transiction
,sum(amount),avg(amount) as avg_amount from payment
where customer_id=1 group by customer_id ; 

select customer_id,count(amount) as total_transiction
,sum(amount),avg(amount) as avg_amount from payment
group by customer_id ; 

select * from payment;
-- get total number of customer serve satff id i
select count(customer_id) as total
from payment
where staff_id = 1;
-- get total amount and the avg amount spent by
-- customer_id 5
select sum(amount) as total_amount, avg(amount) as avg_amount
from payment where customer_id = 5;
-- get  the total amount spenet and amxium amount spent
-- in the month of may
select sum(amount) as total_amount,max(amount) as maximum_amount
from payment where month(payment_date) = 5;
-- get the number of transiction and the avg transction amount 
-- done for each month
select monthname(payment_date) as month_name
,count(amount) as t_tansictions,avg(amount) as avg_transaction
 from payment group by  monthname(payment_date);