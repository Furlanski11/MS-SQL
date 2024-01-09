--01.Create Table People
--Using SQL query, create table People with the following columns:
-- · Id – unique number. For every person there will be no more than 231-1 people (auto incremented).
-- · Name – full name of the person. There will be no more than 200 Unicode characters (not null).
-- · Picture – image with size up to 2 MB (allow nulls).
-- · Height – in meters. Real number precise up to 2 digits after floating point (allow nulls).
-- · Weight – in kilograms. Real number precise up to 2 digits after floating point (allow nulls).
-- · Gender – possible states are m or f (not null).
-- · Birthdate – (not null).
-- · Biography – detailed biography of the person. It can contain max allowed Unicode characters (allow nulls).
--Make the Id a primary key. Populate the table with only 5 records. Submit your CREATE and INSERT statements as Run queries & check DB.

CREATE TABLE [People] (
	[Id] INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	[Picture] VARBINARY(MAX),
	CHECK (DATALENGTH([Picture]) <= 2000000),
	[Height] DECIMAL(3,2),
	[Weigth] DECIMAL(5,2),
	[Gender] CHAR(1) NOT NULL,
	CHECK ([Gender] = 'm' OR [Gender] = 'f'),
	[Birthdate] DATE NOT NULL,
	[Biography] NVARCHAR(MAX)
 )

 INSERT INTO [People]([Name], [Height], [Weigth], [Gender], [Birthdate])
	VALUES
	('Pesho', 1.77, 75.2, 'm', '1997-05-12'),
	('Georgi', 2.10, 120.12, 'm', '1987-01-31'),
	('Ivana', 1.60, 50.2, 'f', '2005-06-15'),
	('Gergana', 1.65, 45.7, 'f', '2000-01-01'),
	('Boris', 1.80, 96.4, 'm', '1994-05-24')

------------------------------------------------------------

--2.Create table Users
--Using SQL query create table Users with columns:
-- · Id – unique number for every user. There will be no more than 263-1 users (auto incremented).
-- · Username – unique identifier of the user. It will be no more than 30 characters (non Unicode) (required).
-- · Password – password will be no longer than 26 characters (non Unicode) (required).
-- · ProfilePicture – image with size up to 900 KB.
-- · LastLoginTime
-- · IsDeleted – shows if the user deleted his/her profile. Possible states are true or false.
--Make the Id a primary key. Populate the table with exactly 5 records. Submit your CREATE and INSERT statements as Run queries & check DB.

CREATE TABLE [Users](
	[Id] INT IDENTITY PRIMARY KEY,
	[Username] NVARCHAR(30) NOT NULL,
	[Password] NVARCHAR(26) NOT NULL,
	[ProfilePicture] IMAGE,
	[LastLoginTime] TIME,
	[IsDeleted] char(5)
	CHECK ([IsDeleted] = 'true' OR [IsDeleted] = 'false')
)
INSERT INTO Users([Username], [Password], [IsDeleted])
VALUES
('George', '118463', 'false'),
('Ivan', '168547', 'true'),
('Idem', '698753', 'false'),
('Rifat', '186sc86', 'true'),
('Mitko', 'qdq665dsa', 'false');

------------------------------------------------------------

--3.Basic Select All Fields
--Use the SoftUni database and first select all records from the Towns, then from Departments and finally from Employees table.
--Use SQL queries and submit them to Judge at once.
--Submit your query statements as Prepare DB & Run queries.

SELECT * FROM [Towns]

SELECT * FROM [Departments]

SELECT * FROM [Employees]

------------------------------------------------------------

B--4.Basic Select All Fields and Order Them

--Modify the queries from the previous problem by sorting:
-- · Towns - alphabetically by name
-- · Departments - alphabetically by name
-- · Employees - descending by salary

SELECT * FROM [Towns]
ORDER BY [Name] ASC

SELECT * FROM [Departments]
ORDER BY [Name] ASC

SELECT * FROM [Employees]
ORDER BY [Salary] DESC

------------------------------------------------------------

--5.Basic Select Some Fields
--Modify the queries from the previous problem to show only some of the columns. 
--For table:
-- · Towns – Name
-- · Departments – Name
-- · Employees – FirstName, LastName, JobTitle, Salary
--Keep the ordering from the previous problem. Submit your query statements as Prepare DB & Run queries.

SELECT [Name] FROM [Towns]
ORDER BY [Name] ASC

SELECT [Name] FROM [Departments]
ORDER BY [Name] ASC

SELECT [FirstName], [LastName], [JobTitle], [Salary] FROM [Employees]
ORDER BY [Salary] DESC

------------------------------------------------------------

--6.Increase Employees Salary
--Use SoftUni database and increase the salary of all employees by 10%.
--Then show only Salary column for all the records in the Employees table.
--Submit your query statements as Prepare DB & Run queries

UPDATE [Employees]
   SET [Salary] = [Salary] * 1.1
SELECT [Salary] 
  FROM [Employees]

  ------------------------------------------------------------

--7.Decrease Tax Rate
--Use Hotel database and decrease tax rate by 3% to all payments.  --Then select only TaxRate column from the Payments table.
--Submit your query statements as Prepare DB & Run queries

  UPDATE [Payments]
   SET [TaxRate] = [TaxRate] * 0.97
SELECT [TaxRate] FROM [Payments]

------------------------------------------------------------

--8.Delete All Records
--Use Hotel database and delete all records from the Occupancies table.
--Use SQL query.
--Submit your query statements as Run skeleton, run queries & check DB.

TRUNCATE TABLE [Occupancies]
		SELECT * 
		  FROM [Payments]