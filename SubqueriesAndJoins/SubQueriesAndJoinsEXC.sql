--1. Employee Address
--Create a query that selects: EmployeeId, JobTitle, AddressId, AddressText
--Return the first 5 rows sorted by AddressId in ascending order.

SELECT TOP(5)
e.EmployeeID, e.JobTitle, a.AddressID, a.AddressText 
FROM Employees as e
JOIN Addresses as a ON e.AddressID = a.AddressID
ORDER BY AddressID ASC

----------------------------------------------------

--2. Addresses with Towns
--Write a query that selects: FirstName, LastName, Town, AddressText
--Sort them by FirstName in ascending order, then by LastName. Select the first 50 employees.

SELECT TOP(50)
e.FirstName, e.LastName, t.[Name], a.AddressText 
FROM Employees as e
JOIN Addresses as a ON e.AddressID = a.AddressID
JOIN Towns as t ON a.TownID = t.TownID
ORDER BY e.FirstName ASC, E.LastName ASC

----------------------------------------------------

--3. Sales Employee
--Create a query that selects: EmployeeID, FirstName, LastName, DepartmentName
--Sort them by EmployeeID in ascending order. Select only employees from the "Sales" department

SELECT e.EmployeeID, e.FirstName, e.LastName, d.Name 
FROM Employees as e
JOIN Departments as d ON e.DepartmentID = d.DepartmentID
WHERE d.[Name] = 'Sales'
ORDER BY EmployeeID ASC

----------------------------------------------------

--4. Employee Departments
--Create a query that selects: EmployeeID, FirstName, Salary, DepartmentName
--Filter only employees with a salary higher than 15000.
--Return the first 5 rows, sorted by DepartmentID in ascending order.

SELECT TOP(5) e.EmployeeID, e.FirstName, e.Salary, d.Name 
FROM Employees as e
JOIN Departments as d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 15000
ORDER BY d.DepartmentID ASC

----------------------------------------------------

--5. Employees Without Project
--Create a query that selects: EmployeeID, FirstName
--Filter only employees without a project.
--Return the first 3 rows, sorted by EmployeeID in ascending order

SELECT TOP(3) e.EmployeeID, e.FirstName
FROM Employees AS e
WHERE e.EmployeeID NOT IN
	(SELECT EmployeeID FROM EmployeesProjects)
ORDER BY e.EmployeeID

----------------------------------------------------

--6. Employees Hired After
--Create a query that selects: FirstName, LastName, HireDate, DeptName
--Filter only employees hired after 1.1.1999 and are from either "Sales" or "Finance" department.
--Sort them by HireDate (ascending).

SELECT e.FirstName, e.LastName, e.HireDate, d.[Name] 
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate > '1.1.1999' AND d.[Name] IN ('Sales', 'Finance')
ORDER BY e.HireDate

----------------------------------------------------

--7. Employees with Project
--Create a query that selects: EmployeeID, FirstName, ProjectName
--Filter only employees with a project which has started after 13.08.2002 and it is still ongoing (no end date).
--Return the first 5 rows sorted by EmployeeID in ascending order.

SELECT TOP(5) e.EmployeeID, e.FirstName, p.[Name]
FROM Employees AS e
JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects AS p ON ep.ProjectID = p.ProjectID
WHERE p.StartDate > '2002-08-13 00:00:00' AND p.EndDate IS NULL
ORDER BY e.EmployeeID

----------------------------------------------------

--8. Employee 24
--Create a query that selects: EmployeeID, FirstName, ProjectName
--Filter all the projects of employee with Id 24.
--If the project has started during or after 2005 the returned value should be NULL.

SELECT e.EmployeeID, e.FirstName,
	CASE
		WHEN p.StartDate > '2004-12-31' THEN NULL
		ELSE p.Name
	END ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects AS p ON ep.ProjectID = p.ProjectID
WHERE E.EmployeeID = 24

----------------------------------------------------

--9. Employee Manager
--Create a query that selects: EmployeeID, FirstName, ManagerID, ManagerName
--Filter all employees with a manager who has ID equals to 3 or 7. 
--Return all the rows, sorted by EmployeeID in ascending order.

SELECT e.EmployeeID, e.FirstName, e.ManagerID, m.FirstName
FROM Employees AS e
JOIN Employees AS m ON e.ManagerID = m.EmployeeID
WHERE e.ManagerID IN (3,7)
ORDER BY e.EmployeeID

----------------------------------------------------

--10. Employees Summary
--Create a query that selects: EmployeeID, EmployeeName, ManagerName, DepartmentName
--Show the first 50 employees with their managers and the departments they are in (show the departments of the employees).
--Order them by EmployeeID.

SELECT TOP(50) e.EmployeeID, CONCAT_WS(' ',e.FirstName, e.LastName) AS EmployeeName,CONCAT_WS(' ', m.FirstName, m.LastName )AS ManagerName, d.[Name] AS DepartmentName
FROM Employees AS e
JOIN Employees AS m ON e.ManagerID = m.EmployeeID
JOIN Departments as d ON e.DepartmentID = d.DepartmentID
ORDER BY e.EmployeeID

----------------------------------------------------

--11. Min Average Salary
--Create a query that returns the value of the lowest average salary of all departments.

SELECT TOP(1) AVG(e.Salary) AS MinAverageSalary
FROM Employees AS e
JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
GROUP BY d.[Name]
ORDER BY MinAverageSalary

----------------------------------------------------

--12. Highest Peaks in Bulgaria
--Create a query that selects: CountryCode, MountainRange, PeakName, Elevation
--Filter all the peaks in Bulgaria, which have elevation over 2835.
--Return all the rows, sorted by elevation in descending order.

SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
FROM Peaks AS p
JOIN Mountains as m ON m.Id = p.MountainId
JOIN MountainsCountries AS mc ON mc.MountainId = p.MountainId
JOIN Countries AS c ON mc.CountryCode = c.CountryCode
WHERE c.CountryCode = 'BG' AND p.Elevation > 2835
ORDER BY p.Elevation DESC

----------------------------------------------------

--13. Count Mountain Ranges
--Create a query that selects: CountryCode, MountainRanges
--Filter the count of the mountain ranges in the United States, Russia and Bulgaria.

SELECT c.CountryCode, COUNT(m.MountainRange) AS MountaintRanges
FROM Mountains AS m
JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
JOIN Countries AS c ON c.CountryCode = mc.CountryCode
WHERE c.CountryCode IN ('BG', 'RU', 'US')
GROUP BY c.CountryCode

----------------------------------------------------

--14. Countries With or Without Rivers
--Create a query that selects: CountryName, RiverName
--Find the first 5 countries with or without rivers in Africa. 
--Sort them by CountryName in ascending order.

SELECT TOP(5) CountryName, r.RiverName
FROM Countries AS c
LEFT JOIN CountriesRivers AS cr ON CR.CountryCode = C.CountryCode
left join Rivers r ON r.Id = cr.RiverId
WHERE ContinentCode = 'AF'
ORDER BY CountryName

----------------------------------------------------

--15. Countries Without Any Mountains
--Create a query that returns the count of all countries, which don’t have a mountain

SELECT COUNT(*)
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
WHERE mc.MountainId IS NULL

----------------------------------------------------

--16. Highest Peak and Longest River by Country
--For each country, find the elevation of the highest peak and the length of the longest river, sorted by the highest peak elevation (from highest to lowest), then by the longest river length (from longest to smallest), then by country name (alphabetically). 
--Display NULL when no data is available in some of the columns.
--Limit only the first 5 rows.

SELECT TOP(5) CountryName, MAX(p.Elevation) as [HighestPeakElevation] ,MAX(r.[Length]) as [LongestRiverLength]
FROM Countries AS c
LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers as r ON r.Id = cr.RiverId
LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
LEFT JOIN Peaks AS p ON p.MountainId = m.Id
GROUP BY c.CountryName
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName