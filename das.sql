CREATE DATABASE digital_admission_system;
USE digital_admission_system;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    national_id VARCHAR(20) UNIQUE
);

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    head VARCHAR(100)
);

CREATE TABLE StudentDepartment (
    student_id INT,
    department_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, department_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    purpose VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


CREATE TABLE Reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    academic_year VARCHAR(9),
    term VARCHAR(10),
    performance_summary TEXT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


CREATE TABLE AcademicRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_name VARCHAR(100),
    score DECIMAL(5,2),
    term VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


CREATE TABLE Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    activity_name VARCHAR(100),
    role VARCHAR(50),
    achievement TEXT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
