CREATE TABLE students
(
    StudentId INT PRIMARY KEY NOT NULL AUTOINCREMENT,
    FirstName VARCHAR(80) NOT NULL,
    LastName VARCHAR(80) NOT NULL,
    Birthday DATE NOT NULL,
    City VARCHAR(50) NOT NULL
)