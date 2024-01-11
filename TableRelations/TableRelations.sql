--01.One-To-One Relationship

CREATE TABLE Passports(
	PassportID INT PRIMARY KEY IDENTITY(101, 1),
	PassportNumber NVARCHAR(20)
	)
	
CREATE TABLE Persons(
	PersonID INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50),
	Salary DECIMAL(8,2),
	PassportID INT  UNIQUE FOREIGN KEY REFERENCES Passports(PassportID)
)

INSERT INTO Passports(PassportNumber)
	VALUES ('N34FG21B'), ('K65LO4R7'), ('ZE657QP2')

INSERT INTO Persons( FirstName, Salary, PassportID)
	VALUES('Roberto', 43300.00, 102),
		  ('Tom', 56100.00, 103),
		  ('Yana', 60200.00, 101)

--------------------------------------------------------------------

--02. One-To-Many Relationship

CREATE TABLE Manufacturers(
	ManufacturerID INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
	EstablishedOn DATE
)

CREATE TABLE Models(
	ModelID INT IDENTITY(101, 1) PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
	ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Manufacturers([Name],EstablishedOn)
	VALUES	('BMW', '07/03/1916'),
			('Tesla', '01/01/2003'),
			('Lada', '01/05/1966')

INSERT INTO Models([Name], ManufacturerID)
	VALUES ('X1', 1),
		   ('I6', 1),
		   ('Model S', 2),
		   ('Model X', 2),
		   ('Model 3', 2),
		   ('Nova', 3)

--------------------------------------------------------------------

--03. Many-To-Many Relationship

CREATE TABLE Students(
	StudentID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL
)

CREATE TABLE Exams(
	ExamID INT PRIMARY KEY IDENTITY(101, 1),
	[Name] VARCHAR(30) NOT NULL
	)

CREATE TABLE StudentsExams(
	StudentID INT,
	ExamID INT,
	PRIMARY KEY(StudentID, ExamID),
	FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY(ExamID) REFERENCES Exams(ExamID)
	)

	INSERT INTO Students([Name])
	VALUES
	('Mila'),
	('Toni'),
	('Ron')

	INSERT INTO Exams([Name])
	VALUES
	('SpringMVC'),
	('Neo4j'),
	('Oracle 11g')

	INSERT INTO StudentsExams(StudentID, ExamID)
	VALUES
	(1, 101),
	(1, 102),
	(2, 101),
	(3, 103),
	(2, 102),
	(2, 103)

	--------------------------------------------------------------------

	--04. Self-Referencing

	CREATE TABLE Teachers(
	TeacherID INT PRIMARY KEY,
	[Name] NVARCHAR(30) NOT NULL,
	ManagerID INT REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers(TeacherID,[Name],ManagerID)
	VALUES		(101, 'John', NULL),
				(102, 'Maya', 106),
				(103, 'Silvia', 106),
				(104, 'Ted', 105),
				(105, 'Mark', 101),
				(106, 'Greta', 101)

--------------------------------------------------------------------

--05. Online Store Database

CREATE TABLE Cities(
	CityID INT PRIMARY KEY,
	[Name] NVARCHAR(30)
)

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
	[Name] NVARCHAR(30),
	Birthday DATE,
	CityID INT FOREIGN KEY REFERENCES Cities(CityID)
)

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE ItemTypes(
	ItemTypeID INT PRIMARY KEY,
	[Name] NVARCHAR(30)
)

CREATE TABLE Items(
	ItemID INT PRIMARY KEY,
	[Name] NVARCHAR(30),
	ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE OrderItems(
	OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
	ItemID INT FOREIGN KEY REFERENCES Items(ItemID),
	PRIMARY KEY(OrderID, ItemID)
)
--------------------------------------------------------------------

--06. University Database

CREATE TABLE Majors(
	MajorID INT PRIMARY KEY,
	[Name] NVARCHAR(30)
 )

 CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
	StudentNumber INT,
	StudentName NVARCHAR(30),
	MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Subjects(
	SubjectID INT PRIMARY KEY,
	SubjectName NVARCHAR(30)
)

 CREATE TABLE Agenda(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
	SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
	PRIMARY KEY(StudentID, SubjectID)
 )

 CREATE TABLE Payments(
	PaymentID INT PRIMARY KEY,
	PaymentDate DATE,
	PaymentAmount DECIMAL(8,2),
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
 )
 --------------------------------------------------------------------

 --09. *Peaks in Rila

 SELECT m.MountainRange, PeakName, Elevation FROM Peaks AS p
	JOIN Mountains AS  m ON m.Id = p.MountainID
	WHERE m.MountainRange = 'Rila'
	ORDER BY Elevation DESC
