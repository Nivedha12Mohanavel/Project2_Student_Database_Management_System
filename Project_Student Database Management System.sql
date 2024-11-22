--PROJECT 2: Student Database Management System

-- Database Setup

CREATE DATABASE student_database;
USE student_database;

CREATE TABLE student_table (
    Student_id INT PRIMARY KEY,
    Stu_name NVARCHAR(100) NOT NULL,
    Department NVARCHAR(100),
    email_id NVARCHAR(100),
    Phone_no NUMERIC(15,0),
    Address NVARCHAR(255),
    Date_of_birth DATE,
    Gender NVARCHAR(10),
    Major NVARCHAR(100),
    GPA NUMERIC(3,2),
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);

-- Data Entry

INSERT INTO student_table (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
(1, 'Alice', 'Computer Science', 'alice@gmail.com', 1234567890, '123 Elm St', '2001-05-15', 'Female', 'AI', 8.5, 'A'),
(2, 'Bob', 'Mathematics', 'bob@gmail.com', 9876543210, '456 Maple Ave', '2000-09-20', 'Male', 'Statistics', 6.8, 'B'),
(3, 'Charlie', 'Physics', 'charlie@gmail.com', 5678901234, '789 Oak Blvd', '2002-03-12', 'Male', 'Astrophysics', 9.1, 'A'),
(4, 'Diana', 'Biology', 'diana@gmail.com', 1122334455, '321 Pine St', '2001-07-08', 'Female', 'Genetics', 7.0, 'B'),
(5, 'Evan', 'Computer Science', 'evan@gmail.com', 9988776655, '654 Cedar Dr', '1999-11-21', 'Male', 'Cybersecurity', 4.5, 'C'),
(6, 'Fiona', 'Chemistry', 'fiona@gmail.com', 2233445566, '789 Birch Rd', '2003-01-02', 'Female', 'Organic Chemistry', 5.2, 'C'),
(7, 'George', 'Mathematics', 'george@gmail.com', 3344556677, '890 Spruce Way', '2000-06-17', 'Male', 'Algebra', 6.0, 'B'),
(8, 'Hannah', 'Physics', 'hannah@gmail.com', 5566778899, '901 Fir Ln', '2002-04-10', 'Female', 'Quantum Mechanics', 9.0, 'A'),
(9, 'John', 'Biology', 'john@gmail.com', 6677889900, '234 Cypress St', '2001-02-28', 'Male', 'Microbiology', 3.9, 'D'),
(10, 'Jane', 'Chemistry', 'jane@gmail.com', 7788990011, '456 Willow Rd', '2002-12-11', 'Female', 'Analytical Chemistry', 7.8, 'B');

SELECT * FROM student_table;

-- To retrieve all students' information from the "student_table" and sort them in descending order by their grade

SELECT * FROM student_table
ORDER BY Grade DESC;

-- To retrieve information about all male students from the "student_table"

SELECT * FROM student_table
WHERE Gender = 'Male';

-- To fetch the details of students who have a GPA less than 5.0 from the "student_table"

SELECT * FROM student_table
WHERE GPA < 5.0;

-- To modify the email and grade of a student with a specific ID in the "student_table"

UPDATE student_table
SET email_id = 'evanevan123@gmail.com', Grade = 'B'
WHERE Student_id = 5;

-- To retrieve the names and ages of all students who have a grade of "B" from the "student_table"

SELECT Stu_name, DATEDIFF(YEAR, Date_of_birth, GETDATE()) AS Age
FROM student_table
WHERE Grade = 'B';

-- To group the "student_table" by the "Department" and "Gender" columns and calculate the average GPA for each combination

SELECT Department, Gender, AVG(GPA) AS Avg_GPA
FROM student_table
GROUP BY Department, Gender;

-- Rename the "student_table" to "student_info" using the appropriate SQL statement

EXEC sp_rename 'student_table', 'student_info';

-- To retrieve the name of the student with the highest GPA from the "student_info" table

SELECT TOP 1 Stu_name, GPA FROM student_info
ORDER BY GPA DESC;