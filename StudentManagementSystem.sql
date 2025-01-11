-- Step 1: Create the Database
create database StudentManagementSystem;

-- Step 2: Use the Database
Use StudentManagementSystem;

-- Step 3: Create the Student Table
create table Student(
	StudentID int Primary Key AUTO_INCREMENT,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	DateOfBirth DATE NOT NULL, 
	Gender CHAR(1) CHECK (Gender IN ('M', 'F', 'O')),
	Email varchar(100) unique not null,
	Phone varchar(10) unique not null
);

INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, Phone)
VALUES
(1, 'John', 'Doe', '2000-05-15', 'M', 'john.doe@example.com', '9876543210'),
(2, 'Jane', 'Smith', '1999-08-20', 'F', 'jane.smith@example.com', '8765432109'),
(3, 'Alex', 'Taylor', '2001-12-10', 'O', 'alex.taylor@example.com', '7654321098'),
(4, 'Emily', 'Johnson', '2002-03-25', 'F', 'emily.johnson@example.com', '6543210987'),
(5, 'Michael', 'Brown', '2000-11-30', 'M', 'michael.brown@example.com', '5432109876');

-- Step 4: Create the Course Table
create table Course(
	CourseID int Primary Key AUTO_INCREMENT,
	CourseTitle varchar(100) not null,
	Credits INT NOT NULL CHECK (Credits > 0)
);

INSERT INTO Course (CourseID, CourseTitle, Credits)
VALUES
(1, 'Introduction to Computer Science', 3),
(2, 'Data Structures and Algorithms', 4),
(3, 'Database Management Systems', 3),
(4, 'Software Engineering', 4),
(5, 'Artificial Intelligence', 3);

-- Step 5: Create the Course Table
create table Instructor(
	InstructorID int Primary Key AUTO_INCREMENT,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Email varchar(100) unique not null
);

INSERT INTO Instructor (InstructorID, FirstName, LastName, Email)
VALUES
(1, 'Dr. Smith', 'Johnson', 'dr.smith.johnson@example.com'),
(2, 'Prof. Brown', 'Taylor', 'prof.brown.taylor@example.com'),
(3, 'Dr. Green', 'Williams', 'dr.green.williams@example.com'),
(4, 'Ms. White', 'Davis', 'ms.white.davis@example.com'),
(5, 'Prof. Black', 'Clark', 'prof.black.clark@example.com');

-- Step 6: Create the Enrollment Table
Create table Enrollment(
	EnrollmentID int Primary Key AUTO_INCREMENT,
	EnrollmentDate date not null,
	StudentID INT NOT NULL,                    
	CourseID INT NOT NULL,               
	InstructorID INT NOT NULL,
	Foreign key (StudentID) references Student(StudentID),
	foreign key (CourseID) references Course(CourseID),
	foreign key (InstructorID) references Instructor(InstructorID)
);

INSERT INTO Enrollment (EnrollmentID, EnrollmentDate, StudentID, CourseID, InstructorID)
VALUES
(1, '2025-01-01', 1, 1, 1),
(2, '2025-01-02', 2, 2, 2),
(3, '2025-01-03', 3, 3, 3),
(4, '2025-01-04', 4, 4, 1),
(5, '2025-01-05', 5, 5, 2);

-- Step 7: Create the Score Table
Create table Score(
	ScoreID int Primary Key auto_increment,
	DateOfExam date not null,
	CourseID int not null,
	StudentID int not null,
	CreditObtained INT NOT NULL CHECK (CreditObtained >= 0),
	foreign key (CourseID) references Course(CourseID),
	foreign key (StudentID) references Student(StudentID)
);

INSERT INTO Score (ScoreID, DateOfExam, CourseID, StudentID, CreditObtained)
VALUES
(1, '2025-01-10', 1, 1, 3),
(2, '2025-01-12', 2, 2, 4),
(3, '2025-01-15', 3, 3, 3),
(4, '2025-01-18', 4, 4, 4),
(5, '2025-01-20', 5, 5, 3);

-- Step 8: Create the Feedback Table
Create table Feedback(
	FeedbackID int Primary Key auto_increment,
	StudentID int not null,
	Date date not null,
	InstructorName varchar(100) not null,
	Feedback text(500) not null,
	Foreign key (StudentID) references Student(StudentID)
);

INSERT INTO Feedback (FeedbackID, StudentID, Date, InstructorName, Feedback)
VALUES
(1, 1, '2025-01-01', 'Dr. Smith', 'The lectures were well-organized and informative.'),
(2, 2, '2025-01-02', 'Prof. Brown', 'The practical sessions were highly beneficial.'),
(3, 3, '2025-01-03', 'Dr. Johnson', 'Overall, a very enriching learning experience.'),
(4, 4, '2025-01-04', 'Ms. Taylor', 'The instructor was very approachable and helpful.'),
(5, 5, '2025-01-05', 'Dr. Green', 'The teaching pace was perfect for beginners.');


-- Step 1: Create the Database
CREATE DATABASE EmployeeEmergencyContacts;

-- Step 2: Use the Database
USE EmployeeEmergencyContacts;

-- Step 3: Create the Employee Table
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(100),
    Department VARCHAR(100),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15)
);

INSERT INTO Employee (FirstName, LastName, Position, Department, Email, Phone)
VALUES
('John', 'Doe', 'Software Engineer', 'IT', 'john.doe@example.com', '9876543210'),
('Jane', 'Smith', 'Project Manager', 'Operations', 'jane.smith@example.com', '8765432109'),
('Michael', 'Brown', 'Data Analyst', 'Analytics', 'michael.brown@example.com', '7654321098'),
('Alice', 'Johnson', 'HR Specialist', 'Human Resources', 'alice.johnson@example.com', '6543210987'),
('Robert', 'Davis', 'Network Administrator', 'IT', 'robert.davis@example.com', '5432109876');


-- Step 4: Create the EmergencyContact Table
CREATE TABLE EmergencyContact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    ContactName VARCHAR(50) NOT NULL,
    Relationship VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    Address TEXT,
    PrivacyLevel ENUM('Low', 'Medium', 'High') DEFAULT 'High',
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO EmergencyContact (EmployeeID, ContactName, Relationship, Phone, Email, Address, PrivacyLevel)
VALUES
(1, 'Alice Doe', 'Spouse', '1234567890', 'alice.doe@example.com', '123 Main Street, Springfield', 'High'),
(2, 'Robert Smith', 'Brother', '2345678901', 'robert.smith@example.com', '456 Elm Street, Shelbyville', 'Medium'),
(3, 'Sarah Brown', 'Mother', '3456789012', 'sarah.brown@example.com', '789 Pine Street, Metropolis', 'Low'),
(4, 'David Johnson', 'Father', '4567890123', 'david.johnson@example.com', '321 Oak Avenue, Smallville', 'High'),
(5, 'Emma Davis', 'Friend', '5678901234', 'emma.davis@example.com', '654 Maple Lane, Gotham', 'Medium');
