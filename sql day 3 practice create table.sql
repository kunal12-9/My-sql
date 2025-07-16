use kunal;

select * from students9;

select first_name , age from students9;
select prices , discount from students9;

select * from employeess;

select salary, (salary+1000) as new_salary from employeess;

-- we create table and inserrt value in this
use kunal;
create table employee6(
	id int , 
    emp_name varchar(20) , 
    desigation_name varchar(20),
    salary int);
    
insert into employee6 values
( 1, 'rahul', 'electrical_engineer' , 28000),
( 2, 'mohit', 'computer_science' , 33000),
( 3, 'rohit', 'mechanical' , 27000),
( 4, 'pradeep', 'civil' , 41000);
insert into employee6 (id , emp_name , desigation_name) 
values (5, 'kunal' , 'trainer');

select * from employee6;

select emp_name from employee6 where salary>30000;

-- Relational oprator
-- = oprator
select emp_name , salary from employee6 where id = 3; 
-- <> not equal to oprator
-- >
-- <
-- >=
-- <=

-- Logical oprator and or not
-- and oprator
select emp_name,id from employee6 where salary>10000 and salary<30000;
-- or oprator
select emp_name,id from employee6 where salary>25000 or salary<40000;
-- not oprator
select emp_name,id from employee6 where not id=2;

-- home work --
-- 1.you have to filter out who joining date between 2023 and 2024
-- 2.you ghave to filter the emp whos designation is not hr
-- 3.you have to filter emp name whose desigation is manager or trainer
select * from employee6;
select emp_name from employee6 where desigation_name= 'mechanical' or desigation_name='electrical_engineer';