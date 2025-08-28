--  small int, medium, int , big int
use regex;

-- datatype
-- int (4byte) 2**32
use regexregex;
create table yash1(id int unsigned); -- unsigned means store oinly positive value
insert into yash1 values(-10);
create table yash2(id bigint unsigned);
insert into yash2 values(4656545454);

-- tiny int(1 byte)
-- small int (2 byte) mediumbyte(3byte)
-- big int 2**6
drop table yash2;
create table yash2(name char(10));
insert into yash2 values('abc');
insert into yash2 values('abc                        ');
insert into yash values('a  bc');
select char_length(name) from yash2;

-- date 
drop table yash2;


create table yash2(dob date);
insert into yash2 values(curdate());
insert into yash2 values('2023-01-30'); -- yy-mm-dd
insert into yash values('2021-13-30'); -- incorrect
insert into yash2 values(now()); 
select * from yash2;

-- time stamp
-- create table yash2(dob timestamp);
-- insert into yash2 values( curdate());

-- time stamp me kitni bhi year tak date dal skte hai -- its tsored 4 byte 
-- date time me sirf ek spice year lik 2038 tak ki date hi dal skte hai -- its tored 8 byte
create table yash4(salary float);
insert into yash4 values(10.2),(20.12345659);
select * from yash4;
-- float or double => its use 
create table yash5(salary float);
insert into yash5 values(10.2),(20.12345659);
select * from yash5;
drop table yash5;
create table yash5(salary double(5,2)); -- 5 means total value and 2 decimal value 2 number tak deciml value
insert into yash5 values(10.2);
insert into yash5 values(103.45);
insert into yash5 values(103.543525);
select * from yash5;