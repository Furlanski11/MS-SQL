--1. Employees with Salary Above 35000
--Create stored procedure usp_GetEmployeesSalaryAbove35000 that returns all employees' first and last names, whose salary above 35000.

CREATE OR ALTER PROC usp_GetEmployeesSalaryAbove35000
AS
	SELECT FirstName, LastName 
	FROM Employees
	WHERE Salary > 35000

---------------------------------------------------------

--2. Employees with Salary Above Number
--Create a stored procedure usp_GetEmployeesSalaryAboveNumber that accepts a number (of type DECIMAL(18,4)) as parameter and returns all employees' first and last names, whose salary is above or equal to the given number.

CREATE  OR ALTER PROC usp_GetEmployeesSalaryAboveNumber(@aboveSalary DECIMAL(18,4))
AS
	SELECT FirstName, LastName
	FROM Employees
	WHERE Salary >= @aboveSalary

---------------------------------------------------------

--3. Town Names Starting With
--Create a stored procedure usp_GetTownsStartingWith that accepts a string as parameter and returns all town names starting with that string.

CREATE OR ALTER PROC usp_GetTownsStartingWith(@startChar VARCHAR(10))
AS
	SELECT [Name]
	FROM Towns
	WHERE LEFT([name],	DATALENGTH(@startChar)) = @startChar

---------------------------------------------------------

--4. Employees from Town
--Create a stored procedure usp_GetEmployeesFromTown that accepts town name as parameter and returns the first and last name of those employees, who live in the given town.

CREATE  OR ALTER PROC usp_GetEmployeesFromTown(@townName VARCHAR(10))
AS
 SELECT e.FirstName, e.LastName 
 FROM Employees AS e
 JOIN Addresses AS a ON e.AddressID = a.AddressID
 JOIN Towns AS t ON a.TownID = t.TownID
 WHERE t.[Name] = @townName

---------------------------------------------------------

--5. Salary Level Function
--Create a function ufn_GetSalaryLevel(@salary DECIMAL(18,4)) that receives salary of an employee and returns the level of the salary.
-- · If salary is < 30000, return "Low"
-- · If salary is between 30000 and 50000 (inclusive), return "Average"
-- · If salary is > 50000, return "High

CREATE OR ALTER FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(10)
AS
  BEGIN
  DECLARE @output VARCHAR(10);
		if(@salary < 30000)
			SET @output = 'Low'
		else if(@salary BETWEEN 30000 AND 50000)
			SET @output = 'Average'
		else 
			SET @output = 'High'
  RETURN @output;
  END

---------------------------------------------------------

--6. Employees by Salary Level
--Create a stored procedure usp_EmployeesBySalaryLevel that receives as parameter level of salary (low, average, or high) and print the names of all employees, who have the given level of salary.
--You should use the function - "dbo.ufn_GetSalaryLevel(@Salary)", which was part of the previous task, inside your "CREATE PROCEDURE …" query.

CREATE PROC usp_EmployeesBySalaryLevel(@SalaryLevel NVARCHAR(50))
AS
BEGIN
	Select FirstName, Lastname
	FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @SalaryLevel
END

---------------------------------------------------------

--7. Define Function
--Define a function ufn_IsWordComprised(@setOfLetters, @word) that returns true or false, depending on that if the word is comprised of the given set of letters.

CREATE  OR ALTER FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(50), @word NVARCHAR(100))
RETURNS BIT
AS
BEGIN
	DECLARE @i INT = 1
	WHILE @i <= LEN(@word)
	BEGIN
	DECLARE @ch NVARCHAR(1) = SUBSTRING(@word, @i, 1)
	IF CHARINDEX(@ch, @setOfLetters) = 0
		RETURN 0
	ELSE
		SET @i += 1;
	END
	RETURN 1
END

---------------------------------------------------------

--8. Find Full Name
--You are given a database schema with tables AccountHolders(Id (PK), FirstName, LastName, SSN) and Accounts(Id (PK), AccountHolderId (FK), Balance).
--Write a stored procedure usp_GetHoldersFullName that selects the full name of all people.

CREATE OR ALTER PROC usp_GetHoldersFullName
AS
	SELECT CONCAT_WS(' ', FirstName, LastName) AS [Full Name] 
	FROM AccountHolders

---------------------------------------------------------

--9. People with Balance Higher Than
--Your task is to create a stored procedure usp_GetHoldersWithBalanceHigherThan that accepts a number as a parameter and returns all the people, who have more money in total in all their accounts than the supplied number.
--Order them by their first name, then by their last name.

CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan(@number MONEY)
AS
	SELECT FirstName, LastName 
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON a.AccountHolderId = ah.Id
	GROUP BY ah.Id, ah.FirstName, ah.LastName
	HAVING SUM(A.Balance) > @number
	ORDER BY FirstName, LastName

---------------------------------------------------------

--10. Future Value Function
--Your task is to create a function ufn_CalculateFutureValue that accepts as parameters – sum (decimal), yearly interest rate (float), and the number of years (int). 
--It should calculate and return the future value of the initial sum rounded up to the fourth digit after the decimal delimiter. 
--Use the following formula: 𝐹𝑉=𝐼×((1+𝑅)𝑇)
-- · I – Initial sum
-- · R – Yearly interest rate
-- · T – Number of years

CREATE OR ALTER FUNCTION ufn_CalculateFutureValue(@sum DECIMAL(18,2), @yearlyInterestRate FLOAT, @numberOfYears INT )
RETURNS DECIMAL(20,4)
AS
	BEGIN
	DECLARE @answear FLOAT;
	SET @answear =  @sum * (POWER(1 + @yearlyInterestRate, @numberOfYears))
	RETURN ROUND(@answear, 4)
	END

---------------------------------------------------------

--11. Calculating Interest
--Your task is to create a stored procedure usp_CalculateFutureValueForAccount that uses the function from the previous problem to give an interest to a person's account for 5 years, along with information about their account id, first name, last name and current balance as it is shown in the example below.
--It should take the AccountId and the interest rate as parameters.
--Again, you are provided with the dbo.ufn_CalculateFutureValue function, which was part of the previous task.

CREATE OR ALTER PROCEDURE usp_CalculateFutureValueForAccount(@AccountId INT, @InterestRate FLOAT)
AS
	DECLARE @Years INT = 5

	SELECT a.Id AS [Account Id], ah.FirstName, ah.LastName, a.Balance,
		dbo.ufn_CalculateFutureValue(a.balance, @interestRate, @Years) AS [Balance in 5 years]
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON a.AccountHolderId = ah.Id
	WHERE a.Id = 1