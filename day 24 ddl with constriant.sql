-- ddl with constraints
-- constraint=> there ARE THE RULE APPLY TO TABLE do that to make sure the invalid data not inserted to the table

-- 1 not null cunstraints=> if we apply in column its give the error when we put a null value in column
-- and which column we set contriant its only apply specific column where we apply that
use sakila;
create table test1(id int, salary int not null);
insert into test1 values(10,300);
insert into test1 (id,salary) values(11,2); 
select * from test1;
drop table test1;

-- defalut=> agar hum kisi column agar value insert nhi karegeneg to vo by default 1 degi
create table test1(id int  default 1, salary int not null);
insert into test1 values(10,300);
insert into test1 (salary) values(11); 
select * from test1;

-- unique
create table test21(id int, salary int default 100 unique);
insert into test21 values(10,300);
insert into test21 (id,salary) values(11,300); -- its give error beacuse column we create a unique
insert into test21 (id) values(25653);
insert into test21 (id) values(23453); -- isme humne by defallut 100 set kar rkaha lekin vo ek insert hiogya upoer ab nhi honga kyoki ye reapt ho raha vapas

select * from test21;

-- primary key
create table test22(id int primary key, salary int);
insert into test22 values(10,300);
insert into test22 (id,salary) values(11,300); 
insert into test22 (id,salary) values(12,301);
insert into test22 (id) values(null); -- primary key not allowed null

-- foregin key => a key should be relation ship between a table

create table courses1(
    course_id int primary key,
    cname varchar(20));
insert into courses1 values(10, 'DSA'), (11, 'Python');
select * from courses1;
create table studentinfo(
    sid int primary key,
    sname varchar(20),
    courseid int,
    foreign key (courseid) references courses1(course_id)
);
insert into studentinfo values(1, 'tushar', 10);
insert into studentinfo values(2, 'aman', 11);
insert into courses1 values( 11,numpy);


select * from courses1;
select * from studentinfo;
-- create 1 table jiske andar 2 column ke combination ko primary keyy bana hai
-- aur isi table me 2 foriegn key banani hai
-- Parent Tables
create table Students (
    student_id int primary key,
    sname varchar(50)
);

create table Courses (
    course_id int primary key,
    cname varchar(50)
);

-- Child Table with Composite Primary Key and 2 Foreign Keys
create table Enrollments (
    student_id int,
    course_id int,
    enroll_date date,
    primary key(student_id, course_id),   -- Composite Primary Key
    foreign key(student_id) references Students(student_id), -- First FK
    foreign key(course_id) references Courses(course_id)     -- Second FK
);

-- Insert data into parent tables
insert into Students values (1, 'Tushar'), (2, 'Aman');
insert into Courses values (10, 'DSA'), (11, 'Python');

-- Insert data into child table
insert into Enrollments values (1, 10, '2025-08-28');
insert into Enrollments values (2, 11, '2025-08-28');

-- Check
select * from Enrollments;
