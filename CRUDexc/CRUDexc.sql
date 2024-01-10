
--01.Find All the Information About Departments
--Create a SQL query that finds all the available information about the Departments
	SELECT * FROM Departments

--02.Find all Department Names
--Create a SQL query that finds all Departments names
	SELECT [Name] FROM Departments

--03.Find Salary of Each Employee
--Create a SQL query that finds the first name, last name and salary for each employee
	SELECT FirstName, LastName, Salary FROM Employees

--04.Find Full Name of Each Employee
--Create a SQL query that finds the first, middle and last name for each employee
	SELECT FirstName, MiddleName, LastName FROM Employees

--05.Find Email Address of Each Employee
--Create a SQL query that finds the email address of each employee by their first and last name.
--Consider that the email domain is softuni.bg. Emails should look like "John.Doe@softuni.bg". 
--The produced column should be named "Full Email Address.
	SELECT	CONCAT_WS('.', FirstName, LastName) + '@softuni.bg' AS [Full Email Adress] 
	FROM Employees

--06.Find All Different Employee's Salaries
--Create a SQL query that finds all different salaries of the employees. Display the salaries only in one column, named "Salary"
	SELECT DISTINCT Salary FROM Employees AS [Salary]

--07.Find All Information About Employees
--Create a SQL query that finds all information about the employees whose job title is "Sales Representative
	SELECT * FROM Employees WHERE JobTitle = 'Sales Representative'

--08.Find Names of All Employees by Salary in Range
--Create a SQL query to find the first name, last name and job title for all employees whose salary is in a range between 20000 and 30000.
	SELECT FirstName, LastName, JobTitle 
	FROM Employees
	WHERE Salary BETWEEN 20000 AND 30000

--09.Find Names of All Employees
--Create a SQL query that finds the full name of all employees whose salary is exactly 25000, 14000, 12500 or 23600.
--The result should be displayed in a column, named "Full Name", which is a combination of the first, middle and last names, separated by a single space.
	SELECT CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [Full Name] 
	FROM Employees
	WHERE Salary IN (25000, 14000, 12500, 23600)

--10.Find All Employees Without a Manager
--Create a SQL query that finds the first and last names of those employees who do not have a manage
	SELECT FirstName, LastName 
	FROM Employees
	WHERE ManagerID IS NULL

--11.Find All Employees with a Salary More Than 50000
--Create a SQL query that finds the first name, last name and salary for employees with a salary higher than 50000.
--Order the result in decreasing order by salary.
	SELECT FirstName, LastName, Salary 
	FROM Employees
	WHERE Salary > 50000
	ORDER BY Salary DESC

--12.Find 5 Best Paid Employees.
--Create a SQL query that finds the first and last names of the 5 best-paid Employees, ordered descending by their salary.
	SELECT TOP(5) FirstName, LastName
	FROM Employees
	ORDER BY Salary DESC

--13.Find All Employees Except Marketing
--Create a SQL query that finds the first and last names of all employees whose department ID is not 4.
	SELECT FirstName, LastName 
	FROM Employees
	WHERE DepartmentID <> 4

--14.Sort Employees Table
--Create a SQL query that sorts all the records in the Employees table by the following criteria:
--· By salary in decreasing order
--· Then by the first name alphabetically
--· Then by the last name descending
--· Then by middle name alphabetically
	SELECT * FROM Employees
	ORDER BY Salary DESC, FirstName ASC, LastName DESC, MiddleName ASC

--15.Create View Employees with Salaries
--Create a SQL query that creates a view "V_EmployeesSalaries" with first name, last name and salary for each employee.
	CREATE VIEW V_EmployeesSalaries
	AS 
	SELECT FirstName, LastName, Salary
	FROM Employees

--16.Create View Employees with Job Titles
--Create a SQL query that creates a view "V_EmployeeNameJobTitle" with a full employee name and a job title.
--When the middle name is NULL replace it with an empty string ('').
	CREATE VIEW V_EmployeeNameJobTitle
	AS
	SELECT CONCAT_WS(' ', FirstName, ISNULL(MiddleName, ''), LastName) AS [Full Name], JobTitle
	FROM Employees

--17.Distinct Job Titles
--Create a SQL query that finds all distinct job titles.
	SELECT DISTINCT JobTitle 
	FROM Employees

--18.Find First 10 Started Projects
--Create a SQL query that finds the first 10 projects which were started, select all the information about them and order the result by starting date, then by name.
	SELECT TOP(10) * 
	FROM Projects
	ORDER BY StartDate, [Name]

--19.Last 7 Hired Employees
--Create a SQL query that finds the last 7 hired employees, select their first, last name and hire date.
--Order the result by hire date descending.
	SELECT TOP(7) FirstName, LastName, HireDate 
	FROM Employees
	ORDER BY HireDate DESC

--20.Increase Salaries
	UPDATE Employees
	SET Salary = Salary * 1.12
	WHERE DepartmentID IN (1, 2, 3, 11)
		SELECT Salary FROM Employees

--21.All Mountain Peaks
--Display all the mountain peaks in alphabetical order.
	SELECT PeakName FROM Peaks
	ORDER BY PeakName

--22.Biggest Countries by Population
--Find the 30 biggest countries by population, located in Europe.
--Display the "CountryName" and "Population".
--Order the results by population (from biggest to smallest), then by country alphabetically.
	SELECT TOP(30) [CountryName], [Population]
	FROM [Countries]
	WHERE ContinentCode = 'EU'
	ORDER BY [Population] DESC

--23.*Countries and Currency (Euro / Not Euro)
--Find all the countries with information about their currency.
--Display the "CountryName", "CountryCode", and information about its "Currency": either "Euro" or "Not Euro".
--Sort the results by country name alphabetically.
	SELECT CountryName, CountryCode,
	CASE
	 WHEN c.CurrencyCode = 'EUR' THEN 'Euro'
	 WHEN c.CountryCode <> 'EUR' THEN 'Not Euro'
	 END AS Currency
	FROM Countries AS c
	LEFT JOIN Currencies AS cr ON cr.CurrencyCode = c.CurrencyCode
	ORDER BY CountryName

--24.All Diablo Characters
	SELECT [Name] FROM Characters

