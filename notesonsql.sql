/*sql notes
RDBMS stands for Relational Database Management System.
*/
SELECT * FROM Customers;


/*most important commands in sql
	SELECT - extracts data from a database
	UPDATE - updates data in a database
	DELETE - deletes data from a database
	CREATE DATABASE - creates a new database
	ALTER DATABASE - modifies a database
	CREATE TABLE - creates a new table
	ALTER TABLE - modifies a table
	DROP TABLE - deletes a table
	CREATE INDEX - creates an index (search key)
	DROP INDEX - deletes an index
*/






/*select command syntax */

SELECT column1, column2, ...
FROM table_name;

/*select all */
SELECT * FROM table_name;




/*SELECT DISTINCT command syntax 
returns only distinct values
*/

SELECT DISTINCT column1, column2, ...
FROM table_name;

/*number of different data pieces from country  */
SELECT COUNT(DISTINCT Country) FROM Customers;



/* WHERE clause
	filters record
	get data under specified condition*/
SELECT column1, column2, ...
FROM table_name
WHERE condition;

/*
Note: The WHERE clause is not only used in SELECT statement, it is also used in UPDATE, DELETE statement, etc.!
*/

SELECT * FROM Customers
WHERE Country='Mexico';


/*numerical values do not have '' but text values do */
SELECT * FROM Customers
WHERE CustomerID=1;






/* WHERE clause operators */
=	Equal
<>	Not equal. Note: In some versions of SQL this operator may be written as !=
>	Greater than
<	Less than
>=	Greater than or equal
<=	Less than or equal
BETWEEN	Between an inclusive range
LIKE	Search for a pattern
IN	To specify multiple possible values for a column





/* AND, OR, NOT operators with the WHERE clause
AND and OR operators are only used when it conditions are true
NOT is used when they are not true
*/
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;


/*AND all*/
SELECT * FROM Customers
WHERE City='Berlin' OR City='München';

/*OR all*/
SELECT * FROM Customers
WHERE City='Berlin' OR City='München';

/*NOT all*/
SELECT * FROM Customers
WHERE NOT Country='Germany';


/*AND and OR*/
SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='München');

/*AND and NOT*/
SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';







/* ORDER BY keyword */


SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

/* ORDER all*/
SELECT * FROM Customers
ORDER BY Country;

/*ORDER all descending */
SELECT * FROM Customers
ORDER BY Country DESC;


/* ORDER by several columns*/
SELECT * FROM Customers
ORDER BY Country, CustomerName;

/**/
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;



/*INSERT INTO */
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);


/*make sure order of columns is correct*/
INSERT INTO table_name
VALUES (value1, value2, value3, ...);


/*
Did you notice that we did not insert any number into the CustomerID field?
The CustomerID column is an auto-increment field and will be generated 
automatically when a new record is inserted into the table.
*/

/*into specified columns*/
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');







/*Note: It is very important to understand that a NULL value is different from a zero 
value or a field that contains spaces. 
A field with a NULL value is one that has been left blank during record creation!

*/


/*test for NULL data*/

SELECT column_names
FROM table_name
WHERE column_name IS NULL;

SQL NULL Values
What is a NULL Value?
A field with a NULL value is a field with no value.

If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field. Then, the field will be saved with a NULL value.

Note: It is very important to understand that a NULL value is different from a zero value or a field that contains spaces. A field with a NULL value is one that has been left blank during record creation!

How to Test for NULL Values?
It is not possible to test for NULL values with comparison operators, such as =, <, or <>.

We will have to use the IS NULL and IS NOT NULL operators instead.

IS NULL Syntax
SELECT column_names
FROM table_name
WHERE column_name IS NULL;

SELECT LastName, FirstName, Address FROM Persons
WHERE Address IS NULL;


/*not null*/
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

SELECT LastName, FirstName, Address FROM Persons
WHERE Address IS NOT NULL;



/*update system*/
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

/*Note: Be careful when updating records in a table! Notice the WHERE clause 
in the UPDATE statement. The WHERE clause specifies which record(s) that should be updated. 
If you omit the WHERE clause, all records in the table will be updated!
*/

/*1 record*/
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;


/*multiple records*/
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;


UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';

/*delete*/
DELETE FROM table_name
WHERE condition;

/*be careful of WHERE clause it*/



DELETE FROM Customers
WHERE CustomerName='Alfreds Futterkiste';

/*delete all*/

DELETE * FROM Customers;


DELETE FROM Customers;



/*SELECT TOP specifies the number of records to return*/
/*Note: Not all database systems support the SELECT TOP clause. MySQL supports the 
LIMIT clause to select a limited number of records, while Oracle uses ROWNUM.*/

/*SQL record syntax*/
SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;


/*MySQL record syntax*/
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;


/*ORACLE syntax*/
SELECT column_name(s)
FROM table_name
WHERE ROWNUM <= number;




/*TOP SQL*/
SELECT TOP 3 * FROM Customers;

/*LIMIT SQL*/
SELECT * FROM Customers
LIMIT 3;

/*oracle ROWNUM*/
SELECT * FROM Customers
WHERE ROWNUM <= 3;

/*TOP percent*/
SELECT TOP 50 PERCENT * FROM Customers;







/*Min() and Max() functions 
min = smallest value of column
max = largest value of a column*/

/*MIN*/
SELECT MIN(column_name) 
FROM table_name
WHERE condition;

SELECT MIN(Price) AS SmallestPrice
FROM Products;


/*MAX*/
SELECT MAX(column_name)
FROM table_name
WHERE condition;

SELECT MAX(Price) AS LargestPrice
FROM Products;




/*
COUNT() = returns number of rows that follows a specified condition
AVG() = returns the average value of a numeric column
SUM() = returns the sum of the numeric column*/

/*COUNT*/
SELECT COUNT(column_name)
FROM table_name
WHERE condition;

/*AVG*/
SELECT AVG(column_name)
FROM table_name
WHERE condition;

/*SUM*/
SELECT SUM(column_name)
FROM table_name
WHERE condition;


/*LIKE column searches for a specified column and is used with WHERE clause
Note: MS Access uses a question mark (?) instead of the underscore (_).
*/

SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;


/*Tip: You can also combine any number of conditions using AND or OR operators.*/


LIKE Operator	Description
WHERE CustomerName LIKE 'a%'	Finds any values that starts with "a"
WHERE CustomerName LIKE '%a'	Finds any values that ends with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%_%'	Finds any values that starts with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that starts with "a" and ends with "o"



/*wildcard character
	substitue values in strings
	used with LIKE operator

		% - The percent sign represents zero, one, or multiple characters
		_ - The underscore represents a single character
		are used with LIKE operator
*/
/*MS Acess and SQL server
Note: MS Access uses a question mark (?) instead of the underscore (_).
In MS Access and SQL Server you can also use:

[charlist] - Defines sets and ranges of characters to match
[^charlist] or [!charlist] - Defines sets and ranges of characters NOT to match
*/

LIKE Operator	Description
WHERE CustomerName LIKE 'a%'	Finds any values that starts with "a"
WHERE CustomerName LIKE '%a'	Finds any values that ends with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%_%'	Finds any values that starts with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that starts with "a" and ends with "o"





/*IN is shorthand for using multiple OR operators*/
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);



/*BETWEEN selects values within a given range
it's inclusive*/
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;



/*Alias give temporay names to columns*/

/*column*/
SELECT column_name AS alias_name
FROM table_name;

/*table*/
SELECT column_name AS alias_name
FROM table_name AS alias_name


/*Aliases can be useful when:

	There are more than one table involved in a query
	Functions are used in the query
	Column names are big or not very readable
	Two or more columns are combined together
*/




/*JOIN is used to combine rows or columns*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*INNER JOIN = selects value from both tables*/


/*types of JOIN
Here are the different types of the JOINs in SQL:

(INNER) JOIN: Returns records that have matching values in both tables
LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN: Return all records when there is a match in either left or right table
*/
/*to CHANGE operator chagne INNER JOIN to LEFT JOIN or in some databases LEFT OUTER BASES*/


/*
Note: The LEFT JOIN keyword returns all records from the left table (Customers), even if there are no matches in the right table (Orders).
*/

/*
Note: The RIGHT JOIN keyword returns all records from the right table (Employees), even if there are no matches in the left table (Orders).
*/







/*self JOIN*/

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;


/*UNION operator returns the result-set of 2 or more SELECT statments
Each SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in each SELECT statement must also be in the same order
*/


SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;


/*all syntax'
allows duplicate values*/

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

/*Note: The column names in the result-set are usually equal to the column 
names in the first SELECT statement in the UNION.*/



/*GROUP BY function is used with aggregates functions to group a result-set by 1 or 
more columns*/

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);


/*lists the number of order by each shipper*/
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;



/*HAVING does the same thing as WHERE clause but can be used with aggregate functions*/
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);


/*EXISTS is udes to test for a record of a subquery
	returns true if there is one or more record of subquery
	*/




SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);



/*ANY and ALL are used with WHERE or HAVING clauses*/

/*ANY*/
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
(SELECT column_name FROM table_name WHERE condition);


/*ALL*/
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
(SELECT column_name FROM table_name WHERE condition);

/*
Note: The operator must be a standard comparison operator (=, <>, !=, >, >=, <, or <=).
*/

/*INTO IN copies data from one table and puts into another one*/
/*ALL*/
SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

/*only a few*/
SELECT column1, column2, column3, ...
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

/*
Tip: SELECT INTO can also be used to create a new, empty table using the schema of another. 
Just add a WHERE clause that causes the query to return no data:
*/
SELECT * INTO newtable
FROM oldtable
WHERE 1 = 0;



/*INSERT INTO SELECT requries data type */

/*ALL*/
INSERT INTO table2
SELECT * FROM table1
WHERE condition;

/*some*/
INSERT INTO table2
SELECT table1, table2, table3
WHERE condition;




/*MySQL*/

/* IFNULL() return alternate data if the function is NULL*/
SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
FROM Products

/*or COALESCE() */
SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
FROM Products


/*SQL*/

/*ISNULL()*/
SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
FROM Products


/*MS*/
SELECT ProductName, UnitPrice * (UnitsInStock + IIF(IsNull(UnitsOnOrder), 0, UnitsOnOrder))
FROM Products

/*oracle*/
/*NVL*/
SELECT ProductName, UnitPrice * (UnitsInStock + NVL(UnitsOnOrder, 0)) 
FROM Products







--Single Line comment


--create database in SQL
CREATE DATABASE  databasename;

/*
Tip: Make sure you have admin privilege before creating any database. 
Once a database is created, you can check it in the list of databases 
with the following SQL command: SHOW DATABASES;

*/



--Delete database
DROP DATABASE databasename;

/*
Note: Be careful before dropping a database. Deleting a database will result in 
loss of complete information stored in the database!
*/

/*
Tip: Make sure you have admin privilege before dropping any database.
Once a database is dropped, you can check it in the list of databases with
 the following SQL command: SHOW DATABASES;
*/



--Create tables

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

--parameters = names of table and columns


/*Tip: The empty "Persons" table can now be filled with 
data with the SQL INSERT INTO statement.*/


--copy of existing table can be created by a combination of CREATE TABLE and SELECT
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;



--DROP table
DROP TABLE table_name;

/*
Note: Be careful before dropping a table. Deleting a table will result in 
loss of complete information stored in the table!
*/

--TRUNCATE delete data inside but not table
TRUNCATE TABLE table_name;



--ALTER table
--add column in table
ALTER TABLE table_name
ADD column_name datatype;

--drop column
ALTER TABLE table_name
DROP COLUMN column_name;

--SQL server/MS access
ALTER TABLE table_name
ALTER COLUMN column_name datatype;

--MySQL/ Oracle(prior version 10G)
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

--Oracle 10G and later
ALTER TABLE table_name
MODIFY column_name datatype;





--Constrats can be created with CREATE or ALTER
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);


--common consraints
NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Uniquely identifies a row/record in another table
CHECK - Ensures that all values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column when no value is specified
INDEX - Used to create and retrieve data from the database very quickly




--NOT NULL constraint
/*Tip: If the table has already been created, you can add a NOT NULL
 constraint to a column with the ALTER TABLE statement.*/
 CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);



--UNIQUE
--all values in a column are different
--UNIQUE and PRIMARY KEY guarentee uniqueness

--SQL/Oracle/MS Access
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

--MySQL
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);


--define constraint on multiple column
--everything
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);


--ALTER TABLE
--everything
ALTER TABLE Persons
ADD UNIQUE (ID);


--to name and define on multiple columns use
ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);


--Drop a uniqure constraint
--MySQL
ALTER TABLE Persons
DROP INDEX UC_Person;

--SQL, MS Access, Oracle
ALTER TABLE Persons
DROP CONSTRAINT UC_Person;

--DROP a PRIMARY KEY on mysql
ALTER TABLE Persons
DROP PRIMARY KEY;

--SQL, oracle, ms access
ALTER TABLE Persons
DROP CONSTRAINT PK_Person;





--FOREIGN KEY
--prevents actions that would destroy links between tables
--creates a FOREIGN KEY on the "Person ID" column when the "orders" table is created
--mysql
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

--SQL, oracle, ms access
CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);



--allows naming of a FOREIGN KEY and defining of FOREIGN KEY constraint on multiple columns
--all sqls
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);



/*to create a FOREIGN KEY constraint on the "Personal ID 
" column where the "orders" table is already created*/

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);



--naming and defining on multiple lines
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);


--drop a foreign key
--mysql
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

--sql, oracle, ms access
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;


--the CHECK constraint limits the value of a range of a certain column
--creates a CHECK constraint on the "age" column when the "Persons" table is created
--checks to make sure nobody is below 18
--mysql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);


--sql, oracle, ms access
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);


--to check "age" when the table is alreay created
ALTER TABLE Persons
ADD CHECK (Age>=18);



--for naming and defining on multiple lines use:  
--all
ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');

--drop CHECK
--MYSQL
ALTER TABLE Persons
DROP CHECK CHK_PersonAge;


--SQL, oracle, ms access
ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;




--DEFAULT constraint adds a default value for a column
--will be added to all IF no columns are specified
--all
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

--also used to adde system values
CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);



--all ready created
--mysql
ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';


--sql, ms access
ALTER TABLE Persons
ALTER COLUMN City SET DEFAULT 'Sandnes';

--oracle
ALTER TABLE Persons
MODIFY City DEFAULT 'Sandnes';

--DROP a default constraint
ALTER TABLE Persons
ALTER City DROP DEFAULT;

--sql server, oracle, ms access
ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;



--CREATE INDEX = create an index
--indexes are ways of gettind data very quickly
/*Note: Updating a table with indexes takes more time than 
updating a table without (because the indexes also need an update). 
So, only create indexes on columns that will be frequently searched against.
*/

--CREATE INDEX
CREATE INDEX index_name
ON table_name (column1, column2, ...);

--CREATE UNIQUE INDEX(duplicate values are not allowed)
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);
/*Note: The syntax for creating indexes varies among different databases. 
Therefore: Check the syntax for creating indexes in your database.*/


--DROP INDEX
--MS access
DROP INDEX index_name ON table_name;

--SQL server
DROP INDEX table_name.index_name;

--DB2/Oracle
DROP INDEX index_name;

--Mysql 
ALTER TABLE table_name
DROP INDEX index_name;



/*AUTO INCREMENT allows an automatically generated number to be generated
when a new record is inserted into a table */ 
--the primary key that should be created automatically when a new record is being inserted
CREATE TABLE Persons (
    ID int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);


--it automatically starts with 1 and increases by 1 and to change that use this
ALTER TABLE Persons AUTO_INCREMENT=100;

--we do not have to specify the ID becuase the AUTO INCREMENT does that for us
--insert new record into "Persons"
INSERT INTO Persons (FirstName,LastName)
VALUES ('Lars','Monsen');


-- MS SQL server uses INDENTITY
CREATE TABLE Persons (
    ID int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

/*Tip: To specify that the "ID" column should start at value 10 and 
increment by 5, change it to IDENTITY(10,5).*/



--MS access
CREATE TABLE Persons (
    ID Integer PRIMARY KEY AUTOINCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);


--MS access uses AUTOINCREMENT
/*Tip: To specify that the "ID" column should start at value 10 and increment 
by 5, change the autoincrement to AUTOINCREMENT(10,5).*/
CREATE TABLE Persons (
    ID Integer PRIMARY KEY AUTOINCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);





--Oracle
/*you have to create an auto-increment field with the sequence object (that 
generates a number sequence)*/
CREATE SEQUENCE seq_person
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;


/* to insert a new record into a oracle table, we will have to use the 
nextval function which retrieves a new value from seq _person sequence
*/
INSERT INTO Persons (ID,FirstName,LastName)
VALUES (seq_person.nextval,'Lars','Monsen');








--SQL dates
--format of date being inserted has to = format of the date column of the database

--mysql date data types
DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
YEAR - format YYYY or YY

--sql server
DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: a unique number

/*Note: The date types are chosen for a 
column when you create a new table in your database!*/

--date types can be compared easily if there are no time involved
SELECT * FROM Orders WHERE OrderDate='2008-11-11'

--if not all time components are not present then there will be no result
/*Tip: To keep your queries simple and 
easy to maintain, do not allow time components in your dates!*/

--view is a virtual table based on the result-set of an sql statement
/*WHERE and JOIN statements can be used to view and present the data as if the data
 were coming from one table */
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;




/*Note: A view always shows up-to-date data! The database engine recreates the
 data, using the view's SQL statement, every time a user queries a view.
*/

--CREATE VIEW or REPLACE VIEW
CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

--add "catagory" column to the 'current product list' view 
CREATE OR REPLACE VIEW [Current Product List] AS
SELECT ProductID, ProductName, Category
FROM Products
WHERE Discontinued = No;

--DROP VIEW
DROP VIEW view_name;



--SQL injnections can be used to destroy and hack your tables
--this usually occurs when you ask to user for input
SELECT * FROM Users WHERE UserId = 105 OR 1=1;

--OR "=" is also dangerous
SELECT * FROM Users WHERE Name ="" or ""="" AND Pass ="" or ""=""




--use sql parameters to protect against sql injection
--asp.net razor
txtUserId = getRequestString("UserId");
txtSQL = "SELECT * FROM Users WHERE UserId = @0";
db.Execute(txtSQL,txtUserId);

--@ marker represents a parameter
txtNam = getRequestString("CustomerName");
txtAdd = getRequestString("Address");
txtCit = getRequestString("City");
txtSQL = "INSERT INTO Customers (CustomerName,Address,City) Values(@0,@1,@2)";
db.Execute(txtSQL,txtNam,txtAdd,txtCit);


--SELECT in asp.net razor
txtUserId = getRequestString("UserId");
sql = "SELECT * FROM Customers WHERE CustomerId = @0";
command = new SqlCommand(sql);
command.Parameters.AddWithValue("@0",txtUserID);
command.ExecuteReader();


--INSERT in asp.net razor
txtNam = getRequestString("CustomerName");
txtAdd = getRequestString("Address");
txtCit = getRequestString("City");
txtSQL = "INSERT INTO Customers (CustomerName,Address,City) Values(@0,@1,@2)";
command = new SqlCommand(txtSQL);
command.Parameters.AddWithValue("@0",txtNam);
command.Parameters.AddWithValue("@1",txtAdd);
command.Parameters.AddWithValue("@2",txtCit);
command.ExecuteNonQuery();


--INSERT INTO in php
$stmt = $dbh->prepare("INSERT INTO Customers (CustomerName,Address,City) 
VALUES (:nam, :add, :cit)");
$stmt->bindParam(':nam', $txtNam);
$stmt->bindParam(':add', $txtAdd);
$stmt->bindParam(':cit', $txtCit);
$stmt->execute();





--SQL hosting
--if your web browser is hosted by an ISP, you need a hosting plans
--these include Oracle, MS SQL Server, MySQl, and MS access
--Oracle and MS access are poplular for database-driven websites with high traffic
--MySQL is a cheapre alternative to Oracle and MS access

--simple database should be used with Microsoft Access
--not good for high traffic though







--MySQL built in functions
Function	Description
ASCII	Returns the number code that represents the specific character
CHAR_LENGTH	Returns the length of the specified string (in characters)
CHARACTER_LENGTH	Returns the length of the specified string (in characters)
CONCAT	Concatenates two or more expressions together
CONCAT_WS	Concatenates two or more expressions together and adds a separator between them
FIELD	Returns the position of a value in a list of values
FIND_IN_SET	Returns the position of a string in a string list
FORMAT	Formats a number as a format of "#,###.##", rounding it to a certain number of decimal places
INSERT	Inserts a substring into a string at a specified position for a certain number of characters
INSTR	Returns the position of the first occurrence of a string in another string
LCASE	Converts a string to lower-case
LEFT	Extracts a substring from a string (starting from left)
LENGTH	Returns the length of the specified string (in bytes)
LOCATE	Returns the position of the first occurrence of a substring in a string
LOWER	Converts a string to lower-case
LPAD	Returns a string that is left-padded with a specified string to a certain length
LTRIM	Removes leading spaces from a string
MID	Extracts a substring from a string (starting at any position)
POSITION	Returns the position of the first occurrence of a substring in a string
REPEAT	Repeats a string a specified number of times
REPLACE	Replaces all occurrences of a specified string
REVERSE	Reverses a string and returns the result
RIGHT	Extracts a substring from a string (starting from right)
RPAD	Returns a string that is right-padded with a specified string to a certain length
RTRIM	Removes trailing spaces from a string
SPACE	Returns a string with a specified number of spaces
STRCMP	Tests whether two strings are the same
SUBSTR	Extracts a substring from a string (starting at any position)
SUBSTRING	Extracts a substring from a string (starting at any position)
SUBSTRING_INDEX	Returns the substring of string before number of occurrences of delimiter
TRIM	Removes leading and trailing spaces from a string
UCASE	Converts a string to upper-case
UPPER	Converts a string to upper-case




--MySQL numerical built in functions
Function	Description
ABS	Returns the absolute value of a number
ACOS	Returns the arc cosine of a number
ASIN	Returns the arc sine of a number
ATAN	Returns the arc tangent of a number or the arc tangent of n and m
ATAN2	Returns the arc tangent of n and m
AVG	Returns the average value of an expression
CEIL	Returns the smallest integer value that is greater than or equal to a number
CEILING	Returns the smallest integer value that is greater than or equal to a number
COS	Returns the cosine of a number
COT	Returns the cotangent of a number
COUNT	Returns the number of records in a select query
DEGREES	Converts a radian value into degrees
DIV	Used for integer division
EXP	Returns e raised to the power of number
FLOOR	Returns the largest integer value that is less than or equal to a number
GREATEST	Returns the greatest value in a list of expressions
LEAST	Returns the smallest value in a list of expressions
LN	Returns the natural logarithm of a number
LOG	Returns the natural logarithm of a number or the logarithm of a number to a specified base
LOG10	Returns the base-10 logarithm of a number
LOG2	Returns the base-2 logarithm of a number
MAX	Returns the maximum value of an expression
MIN	Returns the minimum value of an expression
MOD	Returns the remainder of n divided by m
PI	Returns the value of PI displayed with 6 decimal places
POW	Returns m raised to the nth power
POWER	Returns m raised to the nth power
RADIANS	Converts a value in degrees to radians
RAND	Returns a random number or a random number within a range
ROUND	Returns a number rounded to a certain number of decimal places
SIGN	Returns a value indicating the sign of a number
SIN	Returns the sine of a number
SQRT	Returns the square root of a number
SUM	Returns the summed value of an expression
TAN	Returns the tangent of a number
TRUNCATE	Returns a number truncated to a certain number of decimal places






--MySQL date functions

Function	Description
ADDDATE	Returns a date after a certain time/date interval has been added
ADDTIME	Returns a time/datetime after a certain time interval has been added
CURDATE	Returns the current date
CURRENT_DATE	Returns the current date
CURRENT_TIME	Returns the current time
CURRENT_TIMESTAMP	Returns the current date and time
CURTIME	Returns the current time
DATE	Extracts the date value from a date or datetime expression
DATEDIFF	Returns the difference in days between two date values
DATE_ADD	Returns a date after a certain time/date interval has been added
DATE_FORMAT	Formats a date as specified by a format mask
DATE_SUB	Returns a date after a certain time/date interval has been subtracted
DAY	Returns the day portion of a date value
DAYNAME	Returns the weekday name for a date
DAYOFMONTH	Returns the day portion of a date value
DAYOFWEEK	Returns the weekday index for a date value
DAYOFYEAR	Returns the day of the year for a date value
EXTRACT	Extracts parts from a date
FROM_DAYS	Returns a date value from a numeric representation of the day
HOUR	Returns the hour portion of a date value
LAST_DAY	Returns the last day of the month for a given date
LOCALTIME	Returns the current date and time
LOCALTIMESTAMP	Returns the current date and time
MAKEDATE	Returns the date for a certain year and day-of-year value
MAKETIME	Returns the time for a certain hour, minute, second combination
MICROSECOND	Returns the microsecond portion of a date value
MINUTE	Returns the minute portion of a date value
MONTH	Returns the month portion of a date value
MONTHNAME	Returns the full month name for a date
NOW	Returns the current date and time
PERIOD_ADD	Takes a period and adds a specified number of months to it
PERIOD_DIFF	Returns the difference in months between two periods
QUARTER	Returns the quarter portion of a date value
SECOND	Returns the second portion of a date value
SEC_TO_TIME	Converts numeric seconds into a time value
STR_TO_DATE	Takes a string and returns a date specified by a format mask
SUBDATE	Returns a date after which a certain time/date interval has been subtracted
SUBTIME	Returns a time/datetime value after a certain time interval has been subtracted
SYSDATE	Returns the current date and time
TIME	Extracts the time value from a time/datetime expression
TIME_FORMAT	Formats a time as specified by a format mask
TIME_TO_SEC	Converts a time value into numeric seconds
TIMEDIFF	Returns the difference between two time/datetime values
TIMESTAMP	Converts an expression to a datetime value and if specified adds an optional time interval to the value
TO_DAYS	Converts a date into numeric days
WEEK	Returns the week portion of a date value
WEEKDAY	Returns the weekday index for a date value
WEEKOFYEAR	Returns the week of the year for a date value
YEAR	Returns the year portion of a date value
YEARWEEK	Returns the year and week for a date value



--MySQL advanced functions

Function	Description
BIN	Converts a decimal number to a binary number
BINARY	Converts a value to a binary string
CASE	Lets you evaluate conditions and return a value when the first condition is met
CAST	Converts a value from one datatype to another datatype
COALESCE	Returns the first non-null expression in a list
CONNECTION_ID	Returns the unique connection ID for the current connection
CONV	Converts a number from one number base to another
CONVERT	Converts a value from one datatype to another, or one character set to another
CURRENT_USER	Returns the user name and host name for the MySQL account used by the server to authenticate the current client
DATABASE	Returns the name of the default database
IF	Returns one value if a condition is TRUE, or another value if a condition is FALSE
IFNULL	Lets you to return an alternate value if an expression is NULL
ISNULL	Tests whether an expression is NULL
LAST_INSERT_ID	Returns the first AUTO_INCREMENT value that was set by the most recent INSERT or UPDATE statement
NULLIF	Compares two expressions
SESSION_USER	Returns the user name and host name for the current MySQL user
SYSTEM_USER	Returns the user name and host name for the current MySQL user
USER	Returns the user name and host name for the current MySQL user
VERSION	Returns the version of the MySQL database









--SQL server functions
Function	Description
ASCII	Returns the number code that represents the specific character
CHAR	Returns the ASCII character based on the number code
CHARINDEX	Returns the location of a substring in a string
CONCAT	Concatenates two or more strings together
Concat with +	Concatenates two or more strings together
DATALENGTH	Returns the length of an expression (in bytes)
LEFT	Extracts a substring from a string (starting from left)
LEN	Returns the length of the specified string
LOWER	Converts a string to lower-case
LTRIM	Removes leading spaces from a string
NCHAR	Returns the Unicode character based on the number code
PATINDEX	Returns the location of a pattern in a string
REPLACE	Replaces a sequence of characters in a string with another set of characters
RIGHT	Extracts a substring from a string (starting from right)
RTRIM	Removes trailing spaces from a string
SPACE	Returns a string with a specified number of spaces
STR	Returns a string representation of a number
STUFF	Deletes a sequence of characters from a string and then inserts another sequence of characters into the string, starting at a specified position
SUBSTRING	Extracts a substring from a string
UPPER	Converts a string to upper-case



--SQL server numeric functions
Function	Description
ABS	Returns the absolute value of a number
AVG	Returns the average value of an expression
CEILING	Returns the smallest integer value that is greater than or equal to a number
COUNT	Returns the count of an expression
FLOOR	Returns the largest integer value that is equal to or less than a number
MAX	Returns the maximum value of an expression
MIN	Returns the minimum value of an expression
RAND	Returns a random number or a random number within a range
ROUND	Returns a number rounded to a certain number of decimal places
SIGN	Returns a value indicating the sign of a number
SUM	Returns the summed value of an expression





--SQL server date functions
Function	Description
CURRENT_TIMESTAMP	Returns the current date and time
DATEADD	Returns a date after a certain time/date interval has been added
DATEDIFF	Returns the difference between two date values, based on the interval specified
DATENAME	Returns a specified part of a given date, as a string value
DATEPART	Returns a specified part of a given date, as an integer value
DAY	Returns the day of the month (from 1 to 31) for a given date
GETDATE	Returns the current date and time
GETUTCDATE	Returns the current UTC date and time
MONTH	Returns the month (from 1 to 12) for a given date
YEAR	Returns the year (as a four-digit number) for a given date




--SQL server conversion functions

Function	Description
CAST	Converts an expression from one data type to another
CONVERT	Converts an expression from one data type to another


--SQL server advance functions


Function	Description
COALESCE	Returns the first non-null expression in a list
CURRENT_USER	Returns the name of the current user in the SQL Server database
ISDATE	Returns 1 if the expression is a valid date, otherwise 0
ISNULL	Lets you return an alternative value when an expression is NULL
ISNUMERIC	Returns 1 if the expression is a valid number, otherwise 0
NULLIF	Compares two expressions
SESSION_USER	Returns the user name of the current session in the SQL Server database
SESSIONPROPERTY	Returns the setting for a specified option of a session
SYSTEM_USER	Returns the login name information for the current user in the SQL Server database
USER_NAME	Returns the user name in the SQL Server database


--MS access string functions
Function	Description
Asc	Returns the number code that represents the specific character
Chr	Returns the character based on the number code
Concat with &	Concatenates multiple strings together into a single string with the & operator
CurDir	Returns the current path
Format	Formats a string expression
InStr	Returns the position of the first occurrence of a string in another string
InstrRev	Returns the position of the first occurrence of a string in another string, starting from the end of the string
LCase	Converts a string to lower-case
Left	Extracts a substring from a string (starting from left)
Len	Returns the length of the specified string
LTrim	Removes leading spaces from a string
Mid	Extracts a substring from a string (starting at any position)
Replace	Replaces a sequence of characters in a string with another set of characters (a number of times)
Right	Extracts a substring from a string (starting from right)
RTrim	Removes trailing spaces from a string
Space	Returns a string with a specified number of spaces
Split	Splits a string into substrings (based on a delimiter) and returns the result as an array of substrings
Str	Returns a string representation of a number
StrComp	Returns an integer value representing the result of a string comparison
StrConv	Returns a converted string
StrReverse	Returns a string whose characters are in reverse order
Trim	Removes leading and trailing spaces from a string
UCase	Converts a string to upper-case



--MS Access numeric functions
Function	Description
Abs	Returns the absolute value of a number
Atn	Returns the arctangent of a number
Avg	Returns the average value of an expression
Cos	Returns the cosine of an angle
Count	Returns the number of records in a select query
Exp	Returns e raised to the nth power
Fix	Returns the integer portion of a number
Format	Takes a numeric expression and returns it as a formatted string
Int	Returns the integer portion of a number
Max	Returns the maximum value of an expression
Min	Returns the minimum value of an expression
Randomize	Allows you to change the seed value used by the random number generator for the Rnd() function
Rnd	Generates a random number
Round	Returns a number rounded to a certain number of decimal places
Sgn	Returns the sign of a number
Sqr	Returns the square root of a number
Sum	Returns the summed value of an expression
Val	Accepts a string as input and returns the numbers found in that string




--MS Access date functions

Function	Description
Date	Returns the current system date
DateAdd	Returns a date after a time/date interval has been added
DateDiff	Returns the difference between two date values
DatePart	Returns a specified part of a date
DateSerial	Returns a date given a year, month, and day value
DateValue	Converts a string to a date
Day	Returns the day of the month (from 1 to 31) for a date
Format	Takes a date expression and returns it as a formatted string
Hour	Returns the hour (from 0 to 23) for a time value
Minute	Returns the minute of the hour (from 0 to 59) for a time value
Month	Returns the month (from 1 to 12) for a date
MonthName	Returns the monthname given a number from 1 to 12
Now	Returns the current system date and time
Second	Returns the second of the minute (from 0 to 59) for a time value
Time	Returns the current system time
TimeSerial	Returns a time given an hour, minute, and second value
TimeValue	Converts a string to a time
Weekday	Returns a number (from 1 to 7) representing the day of the week for a date
WeekdayName	Returns the weekday name given a number from 1 to 7
Year	Returns the year (four digits) for a date



--MS Access information functions

Function	Description
CurrentUser	Returns the name of the current Access user
Environ	Returns the value of an operating system environment variable
IsDate	Returns TRUE if the expression is a valid date, otherwise FALSE
IsNull	Returns TRUE if the expression is a null value, otherwise FALSE
IsNumeric	Returns TRUE if the expression is a valid number, otherwise FALSE




--Oracle string functions

Function	Description
ASCII	Returns the number code that represents the specified character
ASCIISTR	Converts a string in any character set to an ASCII string using the database character set
CHR	Returns the character based on the number code
COMPOSE	Returns a Unicode string
CONCAT	Allows you to concatenate two strings together
Concat with ||	Allows you to concatenate two or more strings together
CONVERT	Converts a string from one character set to another
DECOMPOSE	Accepts a string and returns a Unicode string
DUMP	Returns a varchar2 value that includes the datatype code, the length in bytes, and the internal representation of the expression
INITCAP	Sets the first character in each word to uppercase and the rest to lowercase
INSTR	Returns the location of a substring in a string
INSTR2	Returns the location of a substring in a string, using UCS2 code points
INSTR4	Returns the location of a substring in a string, using UCS4 code points
INSTRB	Returns the location of a substring in a string, using bytes instead of characters
INSTRC	Returns the location of a substring in a string, using Unicode complete characters
LENGTH	Returns the length of the specified string
LENGTH2	Returns the length of the specified string, using UCS2 code points
LENGTH4	Returns the length of the specified string, using UCS4 code points
LENGTHB	Returns the length of the specified string, using bytes instead of characters
LENGTHC	Returns the length of the specified string, using Unicode complete of characters
LOWER	Converts all letters in the specified string to lowercase
LPAD	Pads the left-side of a string with a specific set of characters
LTRIM	Removes all specified characters from the left-hand side of a string
NCHR	Returns the character based on the number code in the national character set
REGEXP_INSTR	Returns the location of a regular expression pattern in a string
REGEXP_REPLACE	Allows you to replace a sequence of characters in a string with another set of characters using regular expression pattern matching
REGEXP_SUBSTR	Allows you to extract a substring from a string using regular expression pattern matching
REPLACE	Replaces a sequence of characters in a string with another set of characters
RPAD	Pads the right-side of a string with a specific set of characters
RTRIM	Removes all specified characters from the right-hand side of a string
SOUNDEX	Returns a phonetic representation (the way it sounds) of a string
SUBSTR	Allows you to extract a substring from a string
TRANSLATE	Replaces a sequence of characters in a string with another set of characters
TRIM	Removes all specified characters either from the beginning or the end of a string
UPPER	Converts all letters in the specified string to uppercase
VSIZE	Returns the number of bytes in the internal representation of an expression



--Oracle numeric functions

Function	Description
ABS	Returns the absolute value of a number
ACOS	Returns the arc cosine of a number
ASIN	Returns the arc sine of a number
ATAN	Returns the arc tangent of a number
ATAN2	Returns the arc tangent of n and m
AVG	Returns the average value of an expression
BITAND	Returns an integer representing an AND operation on the bits of expr1 and expr2
CEIL	Returns the smallest integer value that is greater than or equal to a number
COS	Returns the cosine of a number
COSH	Returns the hyperbolic cosine of a number
COUNT	Returns the count of an expression
EXP	Returns e raised to the power of number
FLOOR	Returns the largest integer value that is equal to or less than a number
GREATEST	Returns the greatest value in a list of expressions
LEAST	Returns the smallest value in a list of expressions
LN	Returns the natural logarithm of a number
LOG	Returns the natural logarithm of a number to a specified base
MAX	Returns the maximum value of an expression
MEDIAN	Returns the median of an expression
MIN	Returns the minimum value of an expression
MOD	Returns the remainder of n divided by m
POWER	Returns m raised to the nth power
REGEXP_COUNT	Counts the number of times that a pattern occurs in a string
REMAINDER	Returns the remainder of m divided by n
ROUND	Returns a number rounded to a certain number of decimal places
ROWNUM	Returns a number that represents the order that a row is
SIGN	Returns a value indicating the sign of a number
SIN	Returns the sine of a number
SQRT	Returns the square root of a number
SUM	Returns the summed value of an expression
TAN	Returns the tangent of a number
TANH	Returns the hyperbolic tangent of n
TRUNC	Returns a number truncated to a certain number of decimal places




--Oracle date functions

Function	Description
ADD_MONTHS	Returns a date with a specified number of months added
CURRENT_DATE	Returns the current date in the time zone of the current SQL session as set by the ALTER SESSION command
CURRENT_TIMESTAMP	Returns the current date and time in the time zone of the current SQL session as set by the ALTER SESSION command
DBTIMEZONE	returns the database time zone as a time zone offset or a time zone region name
EXTRACT	Extracts a value from a date or interval value
LAST_DAY	Returns the last day of the month based on a date value
LOCALTIMESTAMP	Returns the current date and time in the time zone of the current SQL session as set by the ALTER SESSION command
MONTHS_BETWEEN	Returns the number of months between date1 and date2
NEW_TIME	Converts a date from time zone1 to a date in time zone2
NEXT_DAY	Returns the first weekday that is greater than a date
ROUND	Returns a date rounded to a specific unit of measure
SESSIONTIMEZONE	Returns the current sessions time zone as a time zone offset or a time zone region name
SYSDATE	Returns the current system date and time on your local database
SYSTIMESTAMP	Returns the current system date and time (including fractional seconds and time zone) on your local database
TRUNC	Returns a date truncated to a specific unit of measure
TZ_OFFSET	Returns the time zone offset of a value












--SQL arithemetic operators
/*
+ = add
- = subtract
* = multiply
/ = divide
% = module
*/


--SQL bitwise operators
/*
& - bitwise AND
| - bitwise OR 
^ - bitwise exclusive OR
*/


--SQL comparison operators
/*
= = equal to 
> = greater than
< = less than
>= = greater than or equal to
<= = less than or equal to
<> = not equal
*/

--SQL compound operators
/*
+= = add equals
-= = subtract equals
*= = multiply equals
/= = divide equals
%= = modulo equals
&= = Bitwise AND equals
^-= = Bitwise exclusive equals
|*= = Bitwise OR equals
*/



--SQL logical operators
ALL	TRUE if all of the subquery values meet the condition	
AND	TRUE if all the conditions separated by AND is TRUE	
ANY	TRUE if any of the subquery values meet the condition	
BETWEEN	TRUE if the operand is within the range of comparisons	
EXISTS	TRUE if the subquery returns one or more records	
IN	TRUE if the operand is equal to one of a list of expressions	
LIKE	TRUE if the operand matches a pattern	
NOT	Displays a record if the condition(s) is NOT TRUE	
OR	TRUE if any of the conditions separated by OR is TRUE	
SOME	TRUE if any of the subquery values meet the condition







--SQL datatypes for MySQL, SQL server, and MS Access
--each column NEEDS a datatype and name
/*
Note: Data types might have different names in different database.
 And even if the name is the same, the size and other details 
may be different! Always check the documentation!
*/

--there are 3 datatypes in mysql; text, number, and date


--1 - text
CHAR(size)	Holds a fixed length string (can contain letters, numbers, and special characters). The fixed size is specified in parenthesis. Can store up to 255 characters
VARCHAR(size)	Holds a variable length string (can contain letters, numbers, and special characters). The maximum size is specified in parenthesis. Can store up to 255 characters. Note: If you put a greater value than 255 it will be converted to a TEXT type
TINYTEXT	Holds a string with a maximum length of 255 characters
TEXT	Holds a string with a maximum length of 65,535 characters
BLOB	For BLOBs (Binary Large OBjects). Holds up to 65,535 bytes of data
MEDIUMTEXT	Holds a string with a maximum length of 16,777,215 characters
MEDIUMBLOB	For BLOBs (Binary Large OBjects). Holds up to 16,777,215 bytes of data
LONGTEXT	Holds a string with a maximum length of 4,294,967,295 characters
LONGBLOB	For BLOBs (Binary Large OBjects). Holds up to 4,294,967,295 bytes of data
ENUM(x,y,z,etc.)	Let you enter a list of possible values. You can list up to 65535 values in an ENUM list. If a value is inserted that is not in the list, a blank value will be inserted.
Note: The values are sorted in the order you enter them.

You enter the possible values in this format: ENUM('X','Y','Z')
SET	Similar to ENUM except that SET may contain up to 64 list items and can store more than one choice


--2- number
TINYINT(size)	-128 to 127 normal. 0 to 255 UNSIGNED*. The maximum number of digits may be specified in parenthesis
SMALLINT(size)	-32768 to 32767 normal. 0 to 65535 UNSIGNED*. The maximum number of digits may be specified in parenthesis
MEDIUMINT(size)	-8388608 to 8388607 normal. 0 to 16777215 UNSIGNED*. The maximum number of digits may be specified in parenthesis
INT(size)	-2147483648 to 2147483647 normal. 0 to 4294967295 UNSIGNED*. The maximum number of digits may be specified in parenthesis
BIGINT(size)	-9223372036854775808 to 9223372036854775807 normal. 0 to 18446744073709551615 UNSIGNED*. The maximum number of digits may be specified in parenthesis
FLOAT(size,d)	A small number with a floating decimal point. The maximum number of digits may be specified in the size parameter. The maximum number of digits to the right of the decimal point is specified in the d parameter
DOUBLE(size,d)	A large number with a floating decimal point. The maximum number of digits may be specified in the size parameter. The maximum number of digits to the right of the decimal point is specified in the d parameter
DECIMAL(size,d)	A DOUBLE stored as a string , allowing for a fixed decimal point. The maximum number of digits may be specified in the size parameter. The maximum number of digits to the right of the decimal point is specified in the d parameter
/**The integer types have an extra option called UNSIGNED. 
Normally, the integer goes from an negative to positive value. 
Adding the UNSIGNED attribute will move that 
range up so it starts at zero instead of a negative number.*/


--3 - date
DATE()	A date. Format: YYYY-MM-DD
Note: The supported range is from '1000-01-01' to '9999-12-31'

DATETIME()	*A date and time combination. Format: YYYY-MM-DD HH:MI:SS
Note: The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'

TIMESTAMP()	*A timestamp. TIMESTAMP values are stored as the number of seconds since the Unix epoch ('1970-01-01 00:00:00' UTC). Format: YYYY-MM-DD HH:MI:SS
Note: The supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC

TIME()	A time. Format: HH:MI:SS
Note: The supported range is from '-838:59:59' to '838:59:59'

YEAR()	A year in two-digit or four-digit format.
Note: Values allowed in four-digit format: 1901 to 2155. Values allowed in two-digit format: 70 to 69, representing years from 1970 to 2069
/**Even if DATETIME and TIMESTAMP return the same format, 
they work very differently. In an INSERT or UPDATE query, the 
TIMESTAMP automatically set itself to the current date and time. 
TIMESTAMP also accepts various 
formats, like YYYYMMDDHHMISS, YYMMDDHHMISS, YYYYMMDD, or YYMMDD.*/



--SQL server datatypes = string, number, date, other
--1 - string

Data type	Description	Max size	Storage
char(n)	Fixed width character string	8,000 characters	Defined width
varchar(n)	Variable width character string	8,000 characters	2 bytes + number of chars
varchar(max)	Variable width character string	1,073,741,824 characters	2 bytes + number of chars
text	Variable width character string	2GB of text data	4 bytes + number of chars
nchar	Fixed width Unicode string	4,000 characters	Defined width x 2
nvarchar	Variable width Unicode string	4,000 characters	 
nvarchar(max)	Variable width Unicode string	536,870,912 characters	 
ntext	Variable width Unicode string	2GB of text data	 
binary(n)	Fixed width binary string	8,000 bytes	 
varbinary	Variable width binary string	8,000 bytes	 
varbinary(max)	Variable width binary string	2GB	 
image	Variable width binary string	2GB


--2 - number

Data type	Description	Storage
bit	Integer that can be 0, 1, or NULL	 
tinyint	Allows whole numbers from 0 to 255	1 byte
smallint	Allows whole numbers between -32,768 and 32,767	2 bytes
int	Allows whole numbers between -2,147,483,648 and 2,147,483,647	4 bytes
bigint	Allows whole numbers between -9,223,372,036,854,775,808 and 9,223,372,036,854,775,807	8 bytes
decimal(p,s)	Fixed precision and scale numbers.
Allows numbers from -10^38 +1 to 10^38 –1.

The p parameter indicates the maximum total number of digits that can be stored (both to the left and to the right of the decimal point). p must be a value from 1 to 38. Default is 18.

The s parameter indicates the maximum number of digits stored to the right of the decimal point. s must be a value from 0 to p. Default value is 0

5-17 bytes
numeric(p,s)	Fixed precision and scale numbers.
Allows numbers from -10^38 +1 to 10^38 –1.

The p parameter indicates the maximum total number of digits that can be stored (both to the left and to the right of the decimal point). p must be a value from 1 to 38. Default is 18.

The s parameter indicates the maximum number of digits stored to the right of the decimal point. s must be a value from 0 to p. Default value is 0

5-17 bytes
smallmoney	Monetary data from -214,748.3648 to 214,748.3647	4 bytes
money	Monetary data from -922,337,203,685,477.5808 to 922,337,203,685,477.5807	8 bytes
float(n)	Floating precision number data from -1.79E + 308 to 1.79E + 308.
The n parameter indicates whether the field should hold 4 or 8 bytes. float(24) holds a 4-byte field and float(53) holds an 8-byte field. Default value of n is 53.

4 or 8 bytes
real	Floating precision number data from -3.40E + 38 to 3.40E + 38	4 bytes



--3 - date datatypes

Data type	Description	Storage
datetime	From January 1, 1753 to December 31, 9999 with an accuracy of 3.33 milliseconds	8 bytes
datetime2	From January 1, 0001 to December 31, 9999 with an accuracy of 100 nanoseconds	6-8 bytes
smalldatetime	From January 1, 1900 to June 6, 2079 with an accuracy of 1 minute	4 bytes
date	Store a date only. From January 1, 0001 to December 31, 9999	3 bytes
time	Store a time only to an accuracy of 100 nanoseconds	3-5 bytes
datetimeoffset	The same as datetime2 with the addition of a time zone offset	8-10 bytes
timestamp	Stores a unique number that gets updated every time a row gets created or modified. The timestamp value is based upon an internal clock and does not correspond to real time. Each table may have only one timestamp variable


--4 - other datatypes

Data type	Description
sql_variant	Stores up to 8,000 bytes of data of various data types, except text, ntext, and timestamp
uniqueidentifier	Stores a globally unique identifier (GUID)
xml	Stores XML formatted data. Maximum 2GB
cursor	Stores a reference to a cursor used for database operations
table	Stores a result-set for later processing


--MS Access datatypes

Data type	Description	Storage
Text	Use for text or combinations of text and numbers. 255 characters maximum	 
Memo	Memo is used for larger amounts of text. Stores up to 65,536 characters. Note: You cannot sort a memo field. However, they are searchable	 
Byte	Allows whole numbers from 0 to 255	1 byte
Integer	Allows whole numbers between -32,768 and 32,767	2 bytes
Long	Allows whole numbers between -2,147,483,648 and 2,147,483,647	4 bytes
Single	Single precision floating-point. Will handle most decimals	4 bytes
Double	Double precision floating-point. Will handle most decimals	8 bytes
Currency	Use for currency. Holds up to 15 digits of whole dollars, plus 4 decimal places. Tip: You can choose which countrys currency to use	8 bytes
AutoNumber	AutoNumber fields automatically give each record its own number, usually starting at 1	4 bytes
Date/Time	Use for dates and times	8 bytes
Yes/No	A logical field can be displayed as Yes/No, True/False, or On/Off. In code, use the constants True and False (equivalent to -1 and 0). Note: Null values are not allowed in Yes/No fields	1 bit
Ole Object	Can store pictures, audio, video, or other BLOBs (Binary Large OBjects)	up to 1GB
Hyperlink	Contain links to other files, including web pages	 
Lookup Wizard	Let you type a list of options, which can then be chosen from a drop-down list





--quick reference for SQL Statements
SQL Statement	Syntax
AND / OR	SELECT column_name(s)
FROM table_name
WHERE condition
AND|OR condition
ALTER TABLE	ALTER TABLE table_name 
ADD column_name datatype
or

ALTER TABLE table_name 
DROP COLUMN column_name

AS (alias)	SELECT column_name AS column_alias
FROM table_name
or

SELECT column_name
FROM table_name  AS table_alias

BETWEEN	SELECT column_name(s)
FROM table_name
WHERE column_name
BETWEEN value1 AND value2
CREATE DATABASE	CREATE DATABASE database_name
CREATE TABLE	CREATE TABLE table_name
(
column_name1 data_type,
column_name2 data_type,
column_name3 data_type,
...
)
CREATE INDEX	CREATE INDEX index_name
ON table_name (column_name)
or

CREATE UNIQUE INDEX index_name
ON table_name (column_name)

CREATE VIEW	CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition
DELETE	DELETE FROM table_name
WHERE some_column=some_value
or

DELETE FROM table_name 
(Note: Deletes the entire table!!)

DELETE * FROM table_name 
(Note: Deletes the entire table!!)

DROP DATABASE	DROP DATABASE database_name
DROP INDEX	DROP INDEX table_name.index_name (SQL Server)
DROP INDEX index_name ON table_name (MS Access)
DROP INDEX index_name (DB2/Oracle)
ALTER TABLE table_name
DROP INDEX index_name (MySQL)
DROP TABLE	DROP TABLE table_name
EXISTS	IF EXISTS (SELECT * FROM table_name WHERE id = ?)
BEGIN
--do what needs to be done if exists
END
ELSE
BEGIN
--do what needs to be done if not
END
GROUP BY	SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING	SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value
IN	SELECT column_name(s)
FROM table_name
WHERE column_name
IN (value1,value2,..)
INSERT INTO	INSERT INTO table_name
VALUES (value1, value2, value3,....)
or

INSERT INTO table_name
(column1, column2, column3,...)
VALUES (value1, value2, value3,....)

INNER JOIN	SELECT column_name(s)
FROM table_name1
INNER JOIN table_name2 
ON table_name1.column_name=table_name2.column_name
LEFT JOIN	SELECT column_name(s)
FROM table_name1
LEFT JOIN table_name2 
ON table_name1.column_name=table_name2.column_name
RIGHT JOIN	SELECT column_name(s)
FROM table_name1
RIGHT JOIN table_name2 
ON table_name1.column_name=table_name2.column_name
FULL JOIN	SELECT column_name(s)
FROM table_name1
FULL JOIN table_name2 
ON table_name1.column_name=table_name2.column_name
LIKE	SELECT column_name(s)
FROM table_name
WHERE column_name LIKE pattern
ORDER BY	SELECT column_name(s)
FROM table_name
ORDER BY column_name [ASC|DESC]
SELECT	SELECT column_name(s)
FROM table_name
SELECT *	SELECT *
FROM table_name
SELECT DISTINCT	SELECT DISTINCT column_name(s)
FROM table_name
SELECT INTO	SELECT *
INTO new_table_name [IN externaldatabase]
FROM old_table_name
or

SELECT column_name(s)
INTO new_table_name [IN externaldatabase]
FROM old_table_name

SELECT TOP	SELECT TOP number|percent column_name(s)
FROM table_name
TRUNCATE TABLE	TRUNCATE TABLE table_name
UNION	SELECT column_name(s) FROM table_name1
UNION
SELECT column_name(s) FROM table_name2
UNION ALL	SELECT column_name(s) FROM table_name1
UNION ALL
SELECT column_name(s) FROM table_name2
UPDATE	UPDATE table_name
SET column1=value, column2=value,...
WHERE some_column=some_value
WHERE	SELECT column_name(s)
FROM table_name

--https://www.w3schools.com/sql/sql_quickref.asp
--


























