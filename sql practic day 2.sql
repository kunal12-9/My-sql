use kunal;
CREATE TABLE students9(
    student_id INT,
    first_name VARCHAR(50),
    age INT,
    phone_number VARCHAR(15),
    prices DECIMAL(10,2),
    discount DECIMAL(10,2),
    date_of_birth DATE
);

INSERT INTO students9(student_id, first_name, age, phone_number, prices, discount, date_of_birth)
VALUES
(1, 'Anil', 20, '1234567890', 100.00, 10.00, '2003-01-01'),
(2, 'Pankaj', 22, '0987654321', 150.00, 15.00, '2001-02-02'),
(3, 'Rohit', 19, '1122334455', 120.00, 5.00, '2004-03-03'),
(4, 'Pankaj', 21, '5566778899', 130.00, 20.00, '2002-04-04'),
(5, 'John', 20, '1234567890', 100.00, 10.00, '2003-01-01'),
(6, 'Jane', 22, '0987654321', 150.00, 15.00, '1991-02-02'),
(7, 'Alice', 19, '1122334455', 120.00, 5.00, '2004-03-03');

select * from students9;

-- 1addition
select first_name, prices, discount, (prices + discount) AS total_price
from students9;

-- 2 substraction
SELECT first_name, prices, discount, (prices - discount) AS net_price
FROM students9;

-- 3 multipication
select first_name, prices, (prices * 2) as double_price
from students9;
select * from students9;

-- 4 division
select first_name, prices , (prices/discount) as dish_percentsge
from students9;

-- 5 mod
select first_name, age, (age % 5) as age_mod_5
from students9;


-- create table
use kunal;
create table employeess (id int , e_name varchar(5), salary integer);
insert into employeess values(1, 'pawan', 90000);

insert into employeess values
(2, 'ram', 20000),
(3, 'xyz', 78999),
(4, 'anil', 90000);

insert into employeess(id, e_name) values(5, 'rahul');

insert into employeess(id, e_name) values
(6, 'rahul'),
(7, 'abc'),
(8, 'pqr');

select * from employeess;
