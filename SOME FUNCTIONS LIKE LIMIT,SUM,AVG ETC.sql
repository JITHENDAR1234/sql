USE RDBMS;

CREATE TABLE PRODUCT(
PRODUCTID INT,
PRODUCTNAME VARCHAR(100),
SUPPLIERID INT,
CATEGORYID INT,
UNIT VARCHAR(100),
PRICE INT);

DESC PRODUCT;

INSERT INTO PRODUCT
VALUES
(1,"Chais",1,1,"10 boxes x 20 bags",18),
(2,"Chang",1,1,"24 - 12 oz bottles",19),
(3,"Aniseed Syrup",1,2,"12 - 550 ml bottles",10),
(4,"Chef Anton's Cajun Seasoning",2,2,"48 - 6 oz jars",22),
(5,"Chef Anton's Gumbo Mix",2,2,"36 boxes",21.35);




-- UPDATE STATEMENT

/*  UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition; */

-- Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!

UPDATE PRODUCT SET PRODUCTNAME="MUNCH" WHERE PRODUCTID=1;
SELECT * FROM PRODUCT;



-- DELETE STATEMENT

/* DELETE FROM table_name WHERE condition; */ 

/* Note: Be careful when deleting records in a table! Notice the WHERE
clause in the DELETE statement. The WHERE clause specifies which record(s) should be deleted. 
If you omit the WHERE clause, all records in the table will be deleted! */

DELETE FROM PRODUCT WHERE PRODUCTID=5;
SELECT * FROM PRODUCT;



-- LIMIT
SELECT * FROM PRODUCT LIMIT 1;

SELECT * FROM PRODUCT LIMIT 3;

SELECT * FROM PRODUCT WHERE PRICE<20 LIMIT 3;



-- MIN()
SELECT MIN(PRICE) FROM PRODUCT;



-- MAX()
SELECT MAX(PRICE) FROM PRODUCT;



-- COUNT()
SELECT COUNT(SUPPLIERID) FROM PRODUCT;



-- AVG()
SELECT AVG(PRICE) FROM PRODUCT;



-- SUM()
SELECT SUM(PRICE) FROM PRODUCT;
