-- SHOW STATEMENTS

-- SHOW databases;

-- SHOW tables;

-- DROP STATEMENTS

-- DROP TABLE TABLENAME;

-- DROP database DATABASENAME;





-- INSERTION OF RECORDS

-- THE INSERTION CAN BE DONE FOLLOWING DIFFERENT WAYS

-- EXAMPLE:

USE RDBMS;

CREATE TABLE STUDENT1(
ID INT,
NAME VARCHAR(100),
AGE INT);

DESC STUDENT1;

-- 1ST WAY

INSERT INTO STUDENT1(ID,NAME,AGE)
VALUES
(1,"JITHU",11),
(2,"RAJESH",12),
(3,"HANSI",13),
(4,"ISMAIL",14),
(5,"SHRUTHY",15);

SELECT * FROM STUDENT1;

-- 2ND WAY

INSERT INTO STUDENT1
VALUES
(6,"NAVEEN",16),
(7,"GALI",17),
(8,"VERU",18),
(9,"SAI RAJ",19);

SELECT *  FROM STUDENT1;

-- 3RD WAY

INSERT INTO STUDENT1
VALUES
(10,"SONITH",20),
(11,"NAVEEN",21),
(12,"YOGO",22),
(13,"THARUN",NULL);

SELECT * FROM STUDENT1;

-- 4TH WAY

insert into STUDENT1(NAME)
VALUES
("CHARN"),
("SIGDHA"),
("DHURJAY"),
("ANVITHA");
SELECT * FROM STUDENT1;



