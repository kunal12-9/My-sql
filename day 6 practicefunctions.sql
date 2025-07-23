-- aggricate function min, max ,count , sum , avg , power , abs
use skaila;
select * from payment;
select max(amount) as max_amount from payment;
select min(amount) as min_amount from payment;
select avg(amount) as avg_amount from payment;
select count(amount) as count_amount from payment;
-- if we count total records 
select count(*) as count_total_records from customer;
select power(2,3) as power;
select abs(-90) as positive;
show tables;
-- agricate function practice
select * from customer;
select max(address_id) as max_addres_id from customer where customer_id between 1 and 10;
select sum(address_id) as add_id from customer where customer_id>=10 and customer_id<=15;
select sum(address_id) as add_id from customer where customer_id between 10 and 15;
select avg(address_id) as add_id from customer 
where active=0;

-- limit iska use string se ktine record rakhne hai
select * from customer limit 5;
-- offset=> iska use staruing se kitne record skip karne hai 
-- aur isko use karne ke liye limit ka bhi use karna hponga
select * from customer;
-- limit 3 offset 5;

-- string functions
select first_name , last_name , concat(first_name, '  ', last_name) from actor;
select first_name , last_name , concat_ws(' - ', first_name,' - ' , last_name,'$') from actor;
select  first_name,lower(first_name) as f_name from customer;
select first_name , substr(first_name,2,3) as sub_name 
from customer;
select first_name, rpad(first_name,6,'$') from customer;
select first_name, lpad(first_name,6,'$') from customer;
-- right and left functions
select * from customer where first_name like 'a__%';
select right(first_name,2) from customer where first_name
 like '%a%';
 -- locate functions=> --  ye batatat hia ki konsa letter us column me kis position me tha
-- interview queston
select locate('A',first_name) as f_name from customer;
select first_name , 
substr(first_name,locate('A',first_name)+1,2)
 as f_name
 from customer;
 