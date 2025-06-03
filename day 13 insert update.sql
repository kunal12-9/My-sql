use sakila;
select * from payment;

select payment_id, customer_id, amount,
rank() over(partition by customer_id order by amount desc) 
from payment;

select payment_id, customer_id, amount,
dense_rank() over(partition by customer_id order by amount desc) 
from payment;

select * from
( select payment_id , customer_id, amount,
  dense_rank()
        over(order by amount desc) as drank1
        from payment ) as tab where drank1=3;

-- how to insert and update
-- 1.insert
use sakila;
create table xyz(id int, fname varchar(20));
insert into xyz values(10,"aman");
insert into xyz(fname) values(11);  -- fname=> null
select * from xyz;

-- 2 update
update xyz set fname="regex";
update xyz set fname="tushar" where id=10;

delete from xyz where id=11;  -- dml => insert update delete

-- drop table xyz; -- ddl