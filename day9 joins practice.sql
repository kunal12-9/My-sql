-- joins 
-- inner join=> in this join this is show only mathicng on the 
-- both table  for same column name
-- Join Type =>	its work
-- INNER JOIN=>	Sirf matching data dono tables se laata hai.
-- LEFT JOIN=>	Left table ke sare rows, right table ka matching ho to wo bhi.
-- RIGHT JOIN=>	Right table ke sare rows, left table ka matching ho to wo bhi.

-- syntexinner join
-- select * from t1 as l inner join t2 as r on l.id=r.id;
use sakila;
select * from customer;
select * from payment;

-- 1 Display the first names of customers along with the payment amount they made.
select c.first_name,p.amount from customer c 
inner join payment p on c.customer_id = p.customer_id ;
-- 2 Find the total payment amount made by each customer (grouped by customer ID).
select sum(p.amount),p.customer_id from customer c 
inner join payment p on c.customer_id = p.customer_id group by 
p.customer_id;

-- inner joins on three table
-- syntex
-- SELECT columns
-- FROM table1
-- INNER JOIN table2 ON table1.col = table2.col
-- INNER JOIN table3 ON table2.col = table3.col;

select c.first_name, p.amount, a.address 
from customer c
inner join address a on c.address_id = a.address_id
inner join payment p on c.customer_id = p.customer_id;

-- assignment sakila databse
-- list all film with thier language name
-- get all ther  staff memeber with thier store name staf and store table use
-- display all inventry item with thier film title
-- list all address with city name
-- list all films with thier actress and language
-- display staff deatils with store address city and country