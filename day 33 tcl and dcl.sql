-- tranction control languae 
-- transaction :  set oflogical statement consistnent
-- transaction (start / stop)
-- transiction commit=> it meanss save 
-- how to start @@autocommit
 select @@autocommit;
 use regex1;
 show 
 tables;
 select * from customers;
 insert into customers(customer_id,customer_name,city)
 values (6,'abhisek','jodhpur');
 -- yaha tak jo data vo agar hum client me claygeye to svae honga 
 -- lekin jese @@autocommit =0 karenege to vo isme to sav eho jayenga lekin jese hiclient me chekc
 -- krenege to usme ye save nhi honga kyoki humne autocommit =0 kr diya
 set @@autocommit=1;
insert into customers(customer_id,customer_name,city)
 values (7,'aryan','jaipur');
 
 -- transaction start=> when we write start transaction or when we disable the autocommit
 -- in this jab bhi hum dml opration calagye to save nhi honga
 
 -- transction stop => ye karne ke loiye hum likhege 
 -- commit or rollback or ddl statement clagye 
 
 insert into customers values(9,'naman','kanpur');
 update customers set city='nagpur' where customer_id=9;
 select * from customers;
 rollback;
 insert into customers values(10,'aman','hamirpur');
 update customers set city='udaipur' where customer_id=10;
 select * from customers;
 rollback;
 set @@autocommit=0;
select @@autocommit;
start transaction;
 insert into customers values(11,'mohit','ajmer');
 select * from customers;
 rollback;
 -- roll back => isk amenas ye hota ki jaha humne koi dml opration kiya 
 -- autocommit =0 hone ke abd to roll back krne par ye use hata denga 
 -- lekin agar autocommit =1 hai to dml kiya toroll baclk ke ba dbhi ye savenhi honga
 
 -- commit => its use to make save pending trascation to savepoint
 -- man lijiye autocommit =0 ya 1 h lekin humne dml opration krnbe ke bad
 -- commit li,kh diya uske bad agar rollback kiya to jo dml opration vo hatega nhi or humne phele roll back kr diya auto commit =0 hione ke bad
 -- fir commit kiya to vo bhi sav  nhi honga
 select * from customers;
 -- save point
 select @@autocommit;
 start transaction;
 insert into customers values(11,'mohit','ajmer');
 insert into customers values(12,'rohit','rohtak');
 savepoint customers_insert_chk;
 update customers set city='gurugram' where customer_id=12;
 select * from customers;
 rollback to customers_insert_chk;
 rollback;
 
 
 
--  --  -- -- -- -- --  --  -- -- -- 
 
 -- data control language
 use mysql;
 show tables;
 select * from mysql.user;
 
 -- assginment
 -- apkosirf yash user select ki privleges deni ek hi column ka accses
 -- give selct and update privldges assign krne hai
 -- craate roll name as sales in the roll add 2 user name aditya aman
 
 -- dcl practical work
 create database ecommerce;
use ecommerce;

create table customer(
    id int,
    cname varchar(20)
);

insert into customer values (1, 'Abhi'), (2, 'Naina');
select * from customer;

create user 'yash'@'localhost' identified by 'yash123';

-- ecommerce database ke sabhi tables par full access
grant all privileges on ecommerce.* to 'yash'@'localhost';

-- changes ko apply karna na bhoolo
flush privileges;


-- remove prvildges
revoke all privileges on ecommerce.* from 'yash'@'localhost';
flush privileges;



