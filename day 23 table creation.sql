-- table creation (DDL),DML
use sakila;
-- ddl-> data defination language its use to  make a changesin the table 
-- 1 ddl me create tbale, drop table or databse its part of ddl 
-- dml=> data manipulation language its use to change the data
-- 1 update is part of dml,insetr value in table its part of dml menas insert upfdatedelet part of dm
create table studentaccses(id int, sname varchar(10)); -- its a aprt of ddl we create a sturture
-- first way to insert
insert into studentaccses values(9,'abc'); -- its => its a dml part when we insert into dtaa 

-- second way to insert =.syntex => creat etable table name(column name  data type)
insert into studentaccses(id,sname) values(19,'abc');
insert into studentaccses(id) values(22);

select * from studentaccses;
drop table studentaccses; -- drop is  part of  ddl
create table studentaccses(id int, sname varchar(10));
insert into studentaccses(id) values(22);
insert into studentaccses(sname) values('yash');

-- dml(update) -- if we use this method its apply on all raw of table 
update studentaccses set sname='raj';
-- 1 row update with where clause
update studentaccses set sname='abhisek' where id =22;
select * from  studentaccses;

create table studentaccses(id int, sname varchar(10));
insert into studentaccses(id) values(22);
insert into studentaccses(sname) values('yash');

drop table studentaccses;

create table studentaccses(id int, sname varchar(10));
insert into studentaccses(id,sname) values('21','aman');
insert into studentaccses(id,sname) values(23,'naina');

select * from studentaccses;
-- delete => its a spqart of dml
 delete from studentaccses where id between 20 and 22;
 
 -- merge => its dml sattement when we work on condtion acoring insert update delete when use merge 
 -- merge into table name 
 -- using refrence table name
 -- when conditon
 -- then statement( insert/update/delete)
 
 truncate table studentaccses; -- truncate drop table + again recrete
 select * from studentaccses;
 
 -- data type
 -- tinyint --> its stored one byte
 create table test18(id tinyint);
insert into test18 values(10);
insert into test18 values(-128);
insert into test18 values(-129); -- size is smaller 1 byte 2^8
select * from test18;
 create table test19(id tinyint unsigned); -- all number is postive
insert into test19 values(10);
insert into test19 values(-128);
insert into test19 values(-129); -- size is smaller 1 byte 2^8

-- small int, mediumint,int , big int

