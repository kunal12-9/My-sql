use regex1;
create table test(id int, name varchar(20));
insert into test(id,name) values(10,'abc'),
(11,"def"),(15,"ghi"),(18,"ujjwal"),(14,"piyush");

explain select * from test where  id=5;


-- indexs=>this are mechanishim how your optimize sql query  it suse to 
-- your data in fster wya in our databse
-- question 2=2how will be you optimize sql query  
-- answer we will bhi use indexing

select * from test;
explain select * from test where name="ujjwal" and id=18;
show indexes from test;

create index test_index on test(name,id);

explain select * from test where name="ujjwal";
explain select * from test where id=20 and name="ujjwal";
show indexes from test;
-- assignment
-- q1 try to create a unique index on your table 
-- q2 on a table one column primary , 2nd unique and chekc it which are 
-- clustred and non clustred
-- q3 create a non clustred index and of there vivibilty 
-- and check run select query its use not use
-- q4 agar mere pass million me rrecords aare to muje uspr indexing laganacaiye ya nhi ciaye
-- learning assignment
-- assume we creat a index on a table  hamre pass naya data100000 reocrds
-- aahya to hume index kesath kya karna caiye  drop wrtie or new index
