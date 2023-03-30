
-- AUTO INCREMENT 

-- Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

-- Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

-- MySQL uses the AUTO_INCREMENT keyword to perform an auto-increment feature.

-- By default, the starting value for AUTO_INCREMENT is 1, and it will increment by 1 for each new record.

-- EXAMPLE

create database rdbms;

use rdbms;

create table student(
id int primary key auto_increment,
name varchar(100),
age int);

desc student;

insert into student(name,age)                      
values
("jithu",11),
("ismail",12),
("rajesh",13),
("hansi",14),
("naveen",15);

select * from student;

/* hear in the above table we didn't mention the id, but we have give 
it as auto_increment in the create table so that it will generate the 
value automatically by default from 1 */


-- To let the AUTO_INCREMENT sequence start with another value, use the following SQL statement:

-- EXAMPLE 1

alter table student auto_increment=100; /* this statement is used for getting our own  auto_increment values */

desc student;

select * from student;

insert into student(name,age)
values
("sai raj",16);

select * from student;

insert into student(name,age)
values
("sonith",17);

select * from student;

-- EXAMPLE 2

alter table student auto_increment=1000;

desc student;

insert into student(name,age)
values
("yogo",19);
 
 select * from student;
 
 

