-- FUNCTIONS IN SQL




/* SQL functions are 
categorised as Single Row functions and Aggregate 
functions. */



/* SINGLE ROW FUNCTIONS ARE DIVIDED INTO THREE TYPES 1.NUMERIC FUNCTIONS
													 2.STRING FUNCTIONS
                                                     3.DATE FUNCTIONS      */
													
          
          
          
          
-- SINGLE ROW FUNCTIONS

-- SINGLE ROW FUNCTIONS ARE ALSO KNOWN AS SCALAR FUNCTIONS

-- SINGLE ROW FUNCTIONS ARE APPLIED ON A SINGLE VALUE AND RETURN A SINGLE VALUE 

-- MATH FUNCTIONS
-- MATH FUNCTIONS ACCEPT NUMERIC VALUE AS INPUT AND RETURN A NUMERIC VALUE AS A RESULT.

-- STRING FUNCTIONS
-- STRING FUNCTIONS ACCEPT CHARACTER VALUE AS INPUT AND RETURN EITHER CHARACTER OR NUMERIC VALUES AS OUTPUT.

-- DATR FUNCTIONS
-- DATE AND TIME FUNCTIONS ACCEPT DATE AND TIME VALUE AS INPUT AND RETURN NUMERIC OR STRING OR DATE AND TIME AS OUTPUT.

        
    
    
-- MATH FUNCTIONS

/* MOSTLY USE MATH FUNCTIONS ARE 1.POWER
								 2.ROUND
                                 3.MOD */
  
-- POWER
-- CALCULATES X TO THE POWER Y
SELECT POWER(2,3);



-- ROUND(N,D)
-- ROUND OFF NUMBER N TO D NUMBER OF DECIMAL PLACES 
-- NOTE: IF D=0 THEN IT ROUNDS OFF THE NUMBER TO THE NEAREST INTEGER 
SELECT ROUND(291.23,1); 
SELECT ROUND(231.5624);


-- MOD(A,B)
-- RETURNS THE REMAINDER AFTER DIVIDING NUMBER A BY NUMBER B 
SELECT MOD(23,2);




USE RDBMS;

CREATE TABLE INVENTORY(
CARID VARCHAR(100),
CARNAME VARCHAR(100),
PRICE INT,
MODEL VARCHAR(100),
YEAR_MANUFAVTURE INT,
FUELTYPE VARCHAR(100)); 

DESC INVENTORY;

INSERT INTO INVENTORY
VALUES
("D001","DZIRE",582613.00,"LXI",2017,"PETROL"),
("D002","Dzire",673112.00,"VXI",2018,"Petrol"),
("B001","Baleno",567031.00,"Sigma1.2",2019,"Petrol"),
("B002","Baleno",647858.00,"Delta1.2",2018,"Petrol"),
("E001","EECO",355205.00,"5 STR STD",2017,"CNG"),
("E002","EECO",654914.00,"CARE",2018,"CNG"),
("S001","SWIFT",514000.00,"LXI",2017,"Petrol"),
("S002","SWIFT",614000.00,"VXI",2018,"Petrol"); 

SELECT * FROM INVENTORY;

USE RDBMS;

CREATE TABLE CUSTOMER(
CUSTID VARCHAR(100),
CUSTNAME VARCHAR(100),
CUSTADD VARCHAR(100),
PHONE BIGINT,
EMAIL VARCHAR(100));

DESC CUSTOMER;

INSERT INTO CUSTOMER
VALUES
("C0001","Amit Saha","L-10, Pitampura",4564587852,"amitsaha2@gmail.com"),
("C0002","Rehnuma","J-12, SAKET",5527688761,"rehnuma@hotmail.com"),
("C0003","Charvi Nayyar","10/9, FF, Rohini",6811635425,"charvi123@yahoo.com"),
("C0004","Gurpreet","A-10/2, SF, Mayur Vihar",3511056125,"gur_singh@yahoo.com");

SELECT * FROM CUSTOMER;


USE RDBMS;

CREATE TABLE SALE(
INVOICENO VARCHAR(100),
CARID VARCHAR(100),
CUSTID VARCHAR(100),
SALEDATE DATE,
PAYMENTMODE VARCHAR(100),
EMPID VARCHAR(100),
SALEPRICE INT);

DESC SALE;

INSERT INTO SALE
VALUES
("I00001","D001","C0001","2019-01-24","Credit Card","E004",613248.00),
("I00002","S001","C0002","2018-12-12","Online","E001",590321.00),
("I00003","S002","C0004","2019-01-25","Cheque","E010",604000.00),
("I00004","D002","C0001","2018-10-15","Bank Finance","E007",659982.00),
("I00005","E001","C0003","2018-12-20","Credit Card","E002",369310.00),
("I00006","S002","C0002","2019-01-30","Bank Finance","E007",620214.00);

SELECT * FROM SALE;

USE RDBMS;

CREATE TABLE EMPLOYEE(
EMPID VARCHAR(100),
EMPNAME VARCHAR(100),
DOB DATE,
DOJ DATE,
DESIGNATION VARCHAR(100),
SALARY INT);

DESC EMPLOYEE;

INSERT INTO EMPLOYEE
VALUES
("E001","Rushil","1994-07-10","2017-12-12","Salesman",25550),
("E002","Sanjay","1990-03-12","2016-06-05","Salesman",33100),
("E003","Zohar","1975-08-30","1999-01-08","Peon",20000),
("E004","Arpit","1989-06-06","2010-12-02","Salesman",39100),
("E006","Sanjucta","1985-11-03","2012-07-01","Receptionist",27350),
("E007","Mayank","1993-04-03","2017-01-01","Salesman",27352),
("E010","Rajkumar","1987-02-26","2013-10-23","Salesman",31111);

SELECT * FROM EMPLOYEE;






-- Calculate GST as 12 per cent of Price and display the result after rounding it off to one decimal place.
SELECT ROUND(12/100*PRICE,1) AS GST FROM INVENTORY;


-- Add a new column FinalPrice to the table inventory which will have the value as sum of Price and 12 per cent of the GST.
ALTER TABLE INVENTORY ADD FINALPRICE INT;
UPDATE INVENTORY SET FINALPRICE= PRICE+ROUND(PRICE*12/100,1);
SELECT * FROM INVENTORY;


-- Calculate and display the amount to be paid each month (in multiples of 1000) which is to be 
-- calculated after dividing the FinalPrice of the car into 10 instalments.   
-- After dividing the amount into EMIs, find out the remaining amount to be paid immediately, by 
-- performing modular division     
SELECT CARID,FINALPRICE,ROUND(FINALPRICE-MOD(FINALPRICE,1000)/10,0) AS EMI,MOD(FINALPRICE,10000) AS "REMAINING AMOUNT" FROM INVENTORY;


/* Let us now add a new column Commission to the 
SALE table. The column Commission should have 
a total length of 7 in which 2 decimal places to be there. */
ALTER TABLE SALE ADD COMMISSION NUMERIC(7,2);
DESC SALE;



/* Let us now calculate commission for sales agents as 
12% of the SalePrice, Insert the values to the newly 
added column Commission and then display records 
of the table SALE where commission > 73000.  */
UPDATE SALE SET COMMISSION=(12/100*SALEPRICE);
SELECT * FROM SALE;
SELECT * FROM SALE WHERE COMMISSION>73000;


-- Display InvoiceNo, SalePrice and Commission such that commission value is rounded off to 0
SELECT INVOICENO,SALEPRICE,ROUND(COMMISSION,0) FROM SALE;





-- STRING FUNCTIONS

-- 1. UPPER(STRING)
-- CONVERTS STRING INTO UPPERCASE
SELECT UPPER("jithu");

-- 2. LOWER(STRING)
-- CONVERTS STRING INTO LOWERCASE
SELECT LOWER("JITHU");


-- 3. SUBSTRING(STRING.POS,N) OR MID(STRING,POS,N)
/* Returns a substring of size n starting from the specified position 
(pos) of the string. If n is not specified, it returns the substring 
from the position pos till end of the string. */
SELECT SUBSTRING("JITHENDAR",2,8);
SELECT MID("JITHENDAR",5);


-- 4. LENGTH(STRING)
-- RETURN THE NUMBER OF CHARACTERS IN THE SPECIFIED STRING
SELECT LENGTH("JITHENDAR");
SELECT LENGTH("JITHU");
 
 
 -- 5. LEFT(STRING,N)
 -- RETURNS N NUMBER OF CHARACTERS FROM THE LEFT OF THE STRING
 SELECT LEFT("JITHENDAR",6);
 
 
 -- 6. RIGTH(STRING,N)
 -- RETURN N NUMBER OF CHARACTERS FROM THE RIGHT SIDE OF THE STRING
 SELECT RIGHT("JITHENDRA",4);
 
 -- 7. INSTR(STRING,SUBSTRING)
 /* Returns the position of the first occurrence of the substring in 
the given string. Returns 0, if the substring is not present in the string. */
SELECT INSTR("JITHENDAR","AR");

-- 8. LTRIM(STRING)
-- RETURNS THE GIVEN STRING AFTER REMOVING LEADING WHITE SPACE CHARACTERS
SELECT LTRIM("  JITHENDAR"),LENGTH(LTRIM("  JITHENDAR")),LENGTH("  JITHENDAR");


-- 9. RTRIM(STRING)
-- RETURNS THE GIVEN STRING AFTER REMOVING TRAILING WHITE SPACE CHARACTERS
SELECT RTRIM("JITHENDAR   "),LENGTH(RTRIM("JITHENDAR   ")),LENGTH("JITHENDAR  ");

-- 10. TRIM(STRING)
-- RETURN THE GIVEN STRING AFTER REMOVING BOTH LEADING AND TRAILING WHITE SPACE CHARACTERS
SELECT LENGTH("  JITHENDAR  "),TRIM("  JITHENDAR  "),LENGTH(TRIM("  JITHENDAR  "));


-- Display customer name in lower case and customer email in upper case from table CUSTOMER. 
SELECT LOWER(CUSTNAME),UPPER(EMAIL) FROM CUSTOMER;

-- Display the length of the email and part of the email 
-- from the email id before the character ‘@’. Note - Do not print ‘@’.
SELECT LENGTH(EMAIL),LEFT(EMAIL,INSTR(EMAIL,"@")-1) FROM CUSTOMER;
SELECT INSTR(EMAIL,"@")-1 FROM CUSTOMER;


-- Let us assume that four-digit area code is reflected in 
-- the mobile number starting from position number 3. 
-- For example, 1851 is the area code of mobile number 
-- 9818511338. Now, write the SQL query to display 
-- the area code of the customer living in Rohini.
SELECT SUBSTRING(PHONE,3,4)FROM CUSTOMER WHERE CUSTADD LIKE "%ROHINI%";
SELECT * FROM CUSTOMER;

-- Display emails after removing the domain name extension “.com” from emails of the customers
SELECT LEFT(EMAIL,INSTR(EMAIL,".COM")-1) FROM CUSTOMER;


-- Display details of all the customers having yahoo emails only.
SELECT * FROM CUSTOMER WHERE EMAIL LIKE "%YAHOO%";



-- DATE AND TIME FUNCTIONS

-- 1. NOW()
-- IT RETURNS THE CURRENT SYSTEM DATE AND TIME 
SELECT NOW();

-- 2. DATE()
-- IT RETURNS THE DATE PART FROM  GIVEN DATE/TIME EXPRESSION 
SELECT DATE(NOW());

-- 3. TIME()
-- IT RETURNS THE TIME PART FROM GIVEN DATE/TIME EXPRESSION
SELECT TIME(NOW());

-- 4. MONTH()
-- IT RETURNS THE MONTH IN NUMERIC FORM FROM DATE 
SELECT MONTH(NOW());

-- 5. YEAR()
-- IT RETURNS THE YEAR FROM THE  DATE
SELECT YEAR(NOW());

-- 6. DAY()
-- IT RETURN THE DAY PART FROM THE DATE
SELECT DAY(NOW());

-- 7. DAYNAME()
-- IT RETURNS THE NAME OF THE DAY FROM THE DATE
SELECT DAYNAME(NOW());

-- 8. MONTHNAME()
-- IT RETURNS THE NAME OF MONTH FROM THE DATE 
SELECT MONTHNAME(NOW());


SELECT * FROM EMPLOYEE;
-- Select the day, month number and year of joining of all employees.
SELECT DAY(DOJ),MONTH(DOJ),YEAR(DOJ) FROM EMPLOYEE;

-- If the date of joining is not a Sunday, then display it in the following format "Wednesday, 26, 
-- November, 1979."
SELECT DAYNAME(DOJ),date_format(DOJ,"%D %M %Y") FROM EMPLOYEE WHERE NOT DAYNAME(DOJ)="SUNDAY";



-- AGGREGATE FUNCTIONS

-- AGGREGATE FUNCTIONS ARE ALSO CALLED MULTIPLE ROW FUNCTIONS
-- THESE FUNCTIONS WORKS ON ASET OF RECORDS AS A WHOLE AND RETURN A SINGLE VALUE FOR 
-- EACH COLUMN OF THE RECORDS ON WHICH THE FUNCTION IS APPLIED.

-- 1. MAX(COLUMN)
-- RETURN THE LARGEST VALUE FROM THE SPECIFIED COLUMN
SELECT MAX(PRICE) FROM INVENTORY;

-- 2. MIN(COLUMN)
-- RETURN THE SMALLEST VALUE FROM THE SPECIFIED COLUMN
SELECT MIN(PRICE) FROM INVENTORY;

-- 3. AVG(COLUMN) 
-- RETURN THE AVERAGE OF THE VALUES IN THE SPECIFIED COLUMN
SELECT AVG(PRICE) FROM INVENTORY;

-- 4. SUM(COLUMN)
-- RETURN THE SUM OF THE VALUES FOR THE SPECIFIED 
SELECT SUM(PRICE) FROM INVENTORY;

-- 5. COUNT(*) 
-- RETURNS THE NUMBER OF RECORDS IN THR TABLE 
-- Note: In order to display the number of records that matches a particular criteria 
-- in the table, we have to use COUNT(*) with WHERE clause.
SELECT COUNT(*) FROM INVENTORY;

-- 6. COUNT(COLUMN)
/* Returns the number of values in the specified column ignoring the NULL values.
Note:In this example, let us consider a MANAGER table having two 
attributes and four records. */
SELECT COUNT(PRICE) FROM INVENTORY;

-- Display the total number of records from table INVENTORY having a model as VXI
SELECT COUNT(*) FROM INVENTORY WHERE MODEL="VXI";

-- Display the total number of different types of Models available from table INVENTORY
SELECT COUNT(DISTINCT(MODEL)) FROM INVENTORY;

-- Display the average price of all the cars with Model LXI from table INVENTORY.
SELECT AVG(PRICE) FROM INVENTORY WHERE MODEL="LXI";