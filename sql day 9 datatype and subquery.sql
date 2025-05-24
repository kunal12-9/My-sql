use sakila;

select * from actor;
select first_name, count(actor_id) from actor group by first_name
order by count(actor_id) desc limit 5;

create table  test( id int);
insert into test values(10);
select * from test; 

create table  test2( id tinyint);
insert into test2 values(127);
select * from test2; 

-- unsigned
create table  test3( id tinyint unsigned);
insert into test3 values(255);
select * from test3; 

create table  test4( id decimal(5,3));
insert into test4 values(845);
insert into test4 values(8454.7); -- will give eerror
select * from test4; 

-- string 
create table  test5( fname char(5) ); -- fixed length
insert into test5 values('hi');
insert into test5 values('hihhk');
insert into test5 values('hihhkj');
select * from test5;

create table  test6( fname varchar(5) ); -- varchar - variable chrecter
insert into test6 values('hi');
insert into test6 values('hey      ');
insert into test6 values('kuanltailor');
select fname, char_length(fname) from test6;

-- date and timestamp
create table  test7( dob date ); 
insert into test7 values('2023-12-01'); -- right syntex yyyy-mm-dd
insert into test7 values( '01-01-2025'); #error (incoorect format 
select * from test7;

create table  test8( dob timestamp ); 
insert into test8 values('2023-12-01 10:15:59'); -- right syntex yyyy-mm-dd
insert into test8 values( now() ); 
select * from test8;

-- subquery 
-- query within a query
select amount from payment where payment_id=15;
select * from payment where amount=2.99;

-- subquery example
select * from payment
where amount=(select amount from payment where payment_id=15);

select * from payment;

select payment_id, staff_id, amount from payment 
where staff_id=(select staff_id from payment where rental_id=1422);