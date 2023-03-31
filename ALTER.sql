-- ALTER TABLE 

-- The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

-- The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

-- EXAMPLE

use rdbms;

create table school(
id int,
name varchar(100),
age int);

desc school;

insert into school
values
(1,"sonith",11),
(2,"tharun",12),
(3,"charn",13);

-- Add primary key to a relation
alter table school add primary key(id);
desc school;

-- Add constraint UNIQUE to an existing attribute  (ALTER TABLE table_name ADD UNIQUE (attribute name);)
alter table school add unique(name);
desc school;

-- Add an attribute to an existing table   (ALTER TABLE table_name ADD attribute name DATATYPE;)
alter table school add phoneno int;
desc school;

-- Modify datatype of an attribute    	(ALTER TABLE table_name MODIFY attribute DATATYPE;)
alter table school modify age varchar(100);
desc school;

-- Modify constraint of an attribute

-- ALTER TABLE table_name MODIFY attribute DATATYPE NOT NULL;
-- Note: We have to specify the data type of the attribute along with constraint NOT NULL while using MODIFY.
/* When we create a table, by default each attribute takes 
NULL value except for the attribute defined as primary 
key. We can change an attribute’s constraint from NULL 
to NOT NULL using an alter statement. */

alter table school modify age  varchar(100)  not null;
desc school;

-- Add default value to an attribute  
-- (ALTER TABLE table_name MODIFY attribute DATATYPE DEFAULT default_value;)
-- Note: We have to specify the data type of the attribute along with DEFAULT while using MODIFY
alter table school modify phoneno int  default 20;
desc school;


--  Remove an attribute
alter table school drop phoneno;
desc school;

-- Remove primary key from the table
alter table school drop primary key;
desc school;

-- FOREIGN KEY

create table course(
courseid int,
id int);

desc course;

insert into course
values
(1,1),
(2,1),
(3,2),
(4,3);

-- SQL FOREIGN ON ALTER TABLE 

/* ALTER TABLE table_name ADD FOREIGN KEY(attribute 
name) REFERENCES referenced_table_name 
(attribute name); */

-- EXAMPLE 

use rdbms;

create table schools(
id int PRIMARY KEY,
name varchar(100),
age int);
  
desc schools;

insert into schools
values
(1,"sonith",11),
(2,"tharun",12),
(3,"charn",13);

alter table course add foreign key(id) references schools(id);
desc course;


-- alter table rename column

/* ALTER TABLE table_name
RENAME COLUMN old_name to new_name; */

alter table school rename column id to stu_id;
desc school;






