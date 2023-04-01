-- QUERYING USING DATABASE OFFICE

-- LET'S TAKE AN EXAMPLE

USE RDBMS;

CREATE TABLE OFFICE(
EMPNO INT,
ENAME VARCHAR(100),
SALARY INT,
BONUS INT,
DEPTID VARCHAR(100));

DESC OFFICE;

INSERT INTO OFFICE
VALUES
(101,"Aaliya",10000,234,"D02"),
(102,"Kritika",60000,123,"D01"),
(103,"Shabbbir",45000,566,"D01"),
(104,"Gurpreet",19000,565,"D04"),
(105,"Joseph",34000,875,"D03"),
(106,"Sanya",48000,695,"D02"),
(107,"Vergese",15000,null,"D01"),
(108,"Nachaobi",29000,null,"D05"),
(109,"Daribha",42000,null,"D04"),
(110,"Tanya",50000,467,"D05");




-- RETRIVE THE SELECTED COLUMNS

-- The following query selects employee numbers of all the employees
SELECT EMPNO FROM OFFICE;

-- The following query selects the employee number and employee name of all the employees, we write
SELECT EMPNO,ENAME FROM OFFICE;




-- RENAMING OF COLUMNS  [USE "AS" TO RENAME] [ AS IS ALSO KNOWN AS ALIASES]

-- In case we want to rename any column while displaying the output, it can be done by using the alias 'AS'.

-- The following query selects Employee name as Name in the output for all the employees:
SELECT ENAME AS NAME FROM OFFICE;

-- SQL aliases are used to give a table, or a column in a table, a temporary name.

-- Aliases are often used to make column names more readable.

-- An alias only exists for the duration of that query.

-- An alias is created with the AS keyword.

/* ALIAS COLUMN SYNTAX
SELECT column_name AS alias_name
FROM table_name; */

/* ALIAS TABLE SYANTAX
SELECT column_name(s)
FROM table_name AS alias_name; */ 
-- EXAMPLE 
SELECT ENAME FROM OFFICE AS OFFICES;


/* Select names of all employees along with their 
annual income (calculated as Salary*12). While displaying 
the query result, rename the column EName as Name */
SELECT ENAME AS NAME , (SALARY*12) FROM OFFICE;

/* Observe that in the output, Salary*12 is displayed as 
the column name for the Annual Income column. In the 
output table, we can use alias to rename that column as 
Annual Income as shown below: */
SELECT ENAME AS NAME,(SALARY*12) AS "ANNUAL INCOME" FROM OFFICE;

/* Note: Annual Income will not be added as a new column in the 
database table. It is just for displaying the output of the query. 
If an aliased column name has space as in the case of Annual */

SELECT EMPNO, CONCAT(ENAME,",",SALARY,",",BONUS) AS DETAILS FROM OFFICE;




-- DISTINCT CLAUSE 

-- The SELECT statement when combined with DISTINCT clause, returns records without repetition (distinct records). 

-- To select unique department number for all the employees, we use DISTINCT as shown below:
SELECT DISTINCT(DEPTID) FROM OFFICE;
SELECT COUNT(DISTINCT(DEPTID)) FROM OFFICE;




-- WHERE CLAUSE
-- The WHERE clause is used to retrieve data that meet some specified conditions.


 -- Following query gives distinct salaries of the employees working in the department number D01:
 SELECT DISTINCT(SALARY) FROM OFFICE WHERE DEPTID="D01";
 
 
 -- DIFFERENT TYPE OF OPERATORS IN THE WHERE CLAUSE
 
 -- 1. (=) OPERATOR
 SELECT ENAME FROM OFFICE WHERE DEPTID ="D01";
 
 -- Following query gives distinct salaries of the employees working in the department number D01:
 SELECT DISTINCT(SALARY) FROM OFFICE WHERE DEPTID="D01";
 
 
 -- 2. (>) OPERATOR
 SELECT ENAME FROM OFFICE WHERE SALARY>10000;
 

 
 -- 3. (<) OPERATOR
 SELECT ENAME FROM OFFICE WHERE SALARY<48000; 
 
 -- 4. (>=) OPERATOR 
 SELECT ENAME FROM OFFICE WHERE SALARY>=10000;
 
 -- 5. (<=) OPERATOR
 SELECT ENAME FROM OFFICE WHERE SALARY<=48000;
 
 -- 6. (NOT) OPERATOR
 SELECT ENAME FROM OFFICE WHERE NOT SALARY=10000;
 
 -- The following query selects records of all the employees except Aaliya
 SELECT * FROM OFFICE WHERE NOT ENAME="Aaliya";
 
 
 -- 7. (AND) OPERATOR
 
 -- Display all the details of those employees of D04 department who earn more than 5000.
 SELECT * FROM OFFICE WHERE DEPTID="D04" AND SALARY>5000;
 
 -- The following query selects the name and department number of all those employees who are earning 
-- salary between 20000 and 50000 (both values inclusive).
SELECT ENAME,DEPTID FROM OFFICE WHERE SALARY>=20000 AND SALARY<=50000;
 
  --  The following query selects the name and department number of all those employees who are earning 
-- salary between 20000 and 50000 (both values EXclusive).
SELECT ENAME,DEPTID FROM OFFICE WHERE SALARY>20000 AND SALARY<50000;


-- 8. (IN) OPERATOR
 
-- [The IN operator is a shorthand for multiple OR conditions.]

-- The IN operator compares a value with a set of values and returns true if the value belongs to that set

SELECT * FROM OFFICE WHERE DEPTID IN ("D01","D02","D04");

-- The following query selects details of all the employees except those working in department number D01 or D02. 
SELECT * FROM OFFICE WHERE DEPTID NOT IN ("D01","D02");

-- 9. (OR) OPERATOR

-- The following query selects details of all the employees who work in the departments having deptid D01, D02 or D04
SELECT * FROM OFFICE WHERE DEPTID="D01" OR DEPTID="D02" OR DEPTID="D04";


 -- 10. (BETWEEN) OPERATOR
 
 --  The following query selects the name and department number of all those employees who are earning 
-- salary between 20000 and 50000 (USE BETWEEN OPERATOR).
SELECT ENAME,DEPTID FROM OFFICE WHERE SALARY BETWEEN 20000 AND 50000;

-- NOT BETWEEN 
 SELECT ENAME,DEPTID FROM OFFICE WHERE SALARY NOT BETWEEN 20000 AND 50000;
 
 -- BETWEEN WITH IN 
  SELECT ENAME,DEPTID FROM OFFICE WHERE SALARY NOT BETWEEN 20000 AND 50000 AND DEPTID IN ("D01","D02");
  
  -- -- BETWEEN WITH NOT IN 
  SELECT ENAME,DEPTID FROM OFFICE WHERE SALARY NOT BETWEEN 20000 AND 50000 AND DEPTID NOT IN ("D01","D02");
  

-- 11. (LIKE) OPERATOR

-- The LIKE operator makes use of the following two wild card characters:

--   % (per cent)- used to represent zero, one, or multiple characters

--  _(underscore)- used to represent exactly a single character

-- The following query selects details of all those employees whose name starts with 'K'.
SELECT * FROM OFFICE WHERE ENAME LIKE "K%";

-- The following query selects details of all those employees whose name ends with 'a', and gets a salary more than 45000
SELECT * FROM OFFICE WHERE ENAME LIKE "%A" AND SALARY>45000;

-- The following query selects details of all those employees whose name consists of exactly 5 letters 
-- and starts with any letter but has ‘ANYA’ after that.
SELECT * FROM OFFICE WHERE ENAME LIKE "_ANYA";

-- The following query selects names of all employees containing 'se' as a substring in name.
SELECT ENAME FROM OFFICE WHERE ENAME LIKE "%SE%";

-- The following query selects names of all employees containing 'a' as the second character
SELECT ENAME FROM OFFICE WHERE ENAME LIKE "_A%";




-- ORDER BY CLAUSE

/* ORDER BY clause is used to display data in an ordered 
form with respect to a specified column. By default, 
ORDER BY displays records in ascending order of 
the specified column’s values. To display the records 
in descending order, the DESC (means descending) 
keyword needs to be written with that column. */

-- The following query selects details of all the employees in ascending order of their salaries.
SELECT * FROM OFFICE ORDER BY SALARY;

-- Select details of all the employees in descending order of their salaries
SELECT * FROM OFFICE ORDER BY SALARY DESC;


-- HANDLING NULL VALUES

/*It is important to note that NULL 
is different from 0 (zero). Also, any arithmetic operation 
performed with NULL value gives NULL. For example: 
5 + NULL = NULL because NULL is unknown hence 
the result is also unknown. In order to check for NULL 
value in a column, we use IS NULL operator */ 

-- The following query selects details of all those employees who have not been given a bonus. This implies 
-- that the bonus column will be blank. 
SELECT * FROM OFFICE WHERE BONUS IS NULL;

-- The following query selects names of all employees who have been given a bonus (i.e., Bonus is not 
-- null) and works in the department D01. 
SELECT ENAME FROM OFFICE WHERE BONUS IS NOT NULL AND DEPTID="D01";