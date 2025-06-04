use kunal;
create table abc( studentid int, studentname varchar(20));
insert into abc values(10,"abhsek");
insert into abc (studentid) values(11); -- studentname=> null
insert into abc (studentname) values("kunal");
select * from abc;

create database tushar;
use tushar;
create table test(id int);
insert into test values(3),(4);
commit; -- save data in myndatabase
insert into test values(500);
update test set id=99;
rollback;
select * from test;
-- transiction 
-- transiction start : DML, start tansiction
-- end => commit, rollback , ddl , dcl

select * from test;
commit;
insert into test values(90),(91);
delete from test where id=1;
savepoint test_chpoint;
update test set id=10000;
rollback to test_chpoint;
select * from test;

commit;

start transaction;
update test set id=9999999;
rollback;
select * from test;

use sakila;
create table t_actor as
     select * from sakila.actor limit 20;
     
select * from t_actor;
create view actor_view as 
select actor_id, first_name from t_actor;
select * from actor_view;
select * from t_actor;
delete from actor_view
rollback;

create view t_actor as
select avg(actor_id) as avg_movies
from t_actor;
