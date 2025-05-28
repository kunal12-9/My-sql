create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;

select deptid, avg(salary) from employees group by deptid;

-- corelated query 
select * from employees as emp
  where salary >  (select avg(salary) 
					from employees as emp4 where emp.deptid = emp4.deptid);

-- list departments where at least one employee earns more than 600000
select * from departments;
select * from employees;

select deptid,deptname from departments as d where exists (select deptid from employees as e where d.deptid=e.deptid 
and e.salary>60000);

-- find employees whohave the highest salary in their department 
select deptid, max(salary) from employees  group by deptid;

select * from employees as outt
where salary = ( select max(salary)  from employees as inn where outt.deptid= inn.deptid);

use regex;
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


select * from employees as outt
where salary = ( select max(salary)  from employees as inn where outt.deptid= inn.deptid);

select * from Students;
select *  from Courses;
select *  from enrollments;

-- select st.studentname, st.studentid , cs.coursename from student as st
-- join courses as cs on st.department = cs.department; 

select * from enrollments as e
where grade > (select avg(grade)  from enrollments as e1 where e.studentid = e1.studentid);

-- assginment ==> list  all the students who have the highest grade atleast one course

select studentid from enrollments
 as e
 where grade > (select max(grade) from enrollments as e1 where e.studentid = e1.studentid)
