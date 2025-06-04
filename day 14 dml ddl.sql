use sakila;
create table xyz2(id int  not null, fname varchar(20) unique);
insert into xyz2 values(2,"tushar2");
insert into xyz2 values(1,"tushar3");
select * from xyz2;
create table xyz3(id int, fname varchar(20) default 'regex');
insert into xyz3 values(1,"tushar");
insert into xyz3(id) values(2);
select*from xyz3;

create table xyz4(dob datetime default now() );
insert into xyz4 values('2024-10-09');
insert into xyz4() values();
select*from xyz4;

create table xyz5(id int primary key );
insert into xyz5 values(1);
insert into xyz5() values(null);
select*from xyz5;

create table student( studentId int primary key, studentName varchar(300));
create table addmission1( addmissionId int primary key,collegeName varchar(300),studentId int ,
foreign key(studentId) references student(studentId));

desc addmission1;

create table students(studentID int primary key, studentname varchar(300),age int, grade int, city varchar(300));
-- create table Marks( subject 

create table test99 as
        select actor_id, first_name from actor;
        
select * from test99;

delete from test99
where actor_id = ( select first_namw from first_name where first_name = 'PENELOPE'
);

create table test11 as 
        select customer_id,payment_id,amount from payment;

select * from test11;
select * from payment;
update test11 t1
set amount = (select amount from test11 t2
    where t2.customer_id = t1.customer_id
      and t2.payment_id=2
)
where t1.customer_id=1
and t1.payment_id=1;

