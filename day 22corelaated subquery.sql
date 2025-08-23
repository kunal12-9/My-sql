use regex1;
select * from departments;
select * from employees;
--  employe have salary as that of thier deparmeent
select empid,empname,deptid,salary
from employees
where (salary,deptid) in (select avg(salary), deptid from
employees group by deptid);

-- corletaded subquery--> its a subquery where the ouput depend on outer  query
 -- its process for each row and the nested query will be executed repteivly
 
select e1.empid,e1.empname,e1.deptid,e1.salary
from employees as e1
where e1.salary >
(select avg(salary) from employees as e2 where e1.deptid=e2.deptid);
select * from courses;

create database regexregex;
use regexregex;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;

--   last table

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);
select * from courses;
select * from students;
select * from enrollments;
-- get the student id,student name departmentname
-- and course name student has enrolled
select s.studentid,s.studentname,s.department,c.coursename
from students s join courses c 
on c.courseid in (select e.courseid from enrollments e
        where e.studentid = s.studentid);
-- get the studnet name an average grade
--  the person has recived
select s.studentname,(select avg(e.grade) from enrollments e
where e.studentid = s.studentid) as avg_grade from students s;
use sakila;
select * from payment;
-- get the payment id  the customername the month,the last working 
-- day of month where the amount spent by the customer is grethaer then
-- the avg spentdby user it self only after the year 2000 and 2004
select p.payment_id,p.customer_id,date(p.payment_date) as payment_month,last_day(p.payment_date) as last_day_of_month,
p.amount from payment where year(p.payment_date) between 2000 and 2004 and p.amount>(select avg(p2.amount) from payment p2
where p2.customer_id = p.customer_id and year(p2.payment_date) between 2000 and 2004);
