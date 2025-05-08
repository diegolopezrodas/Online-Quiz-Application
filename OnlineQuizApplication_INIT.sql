/*
	CREATED BY     : Diego Lopez-Rodas
	CREATION DATE  : 04/30/2025
	UPDATED DATE   : 05/07/2025
	Description    : This is an SQL script for the initalization 
					 (creation of database and tables) of Online 
					 Quiz Application Database.
*/


CREATE DATABASE IF NOT EXISTS online_quiz_application;
USE online_quiz_application;

CREATE TABLE IF NOT EXISTS Professor(
	ProfessorID INT AUTO_INCREMENT,
    BirthDate   DATE NOT NULL,
    PhoneNumber CHAR(10) NOT NULL,
    Email       VARCHAR(62) UNIQUE NOT NULL,
    FirstName   VARCHAR(50) NOT NULL,
    MiddleName  VARCHAR(50),
    LastName    VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (ProfessorID)
);

CREATE TABLE IF NOT EXISTS Exam(
	ExamID          INT AUTO_INCREMENT,
    ProfessorID     INT NOT NULL,
    NumOfQuestions  INT,
    TimeLimit       TIME NOT NULL,
    ExamDescription VARCHAR(250),
    GradeLevel      ENUM('Elementary', 'Middle School', 'High School', 'College') NOT NULL,
    SubjectMatter  ENUM('Social Sciences', 'Sciences', 'Mathematics', 'Literature', 'Languages') NOT NULL,
    
    PRIMARY KEY (ExamID),
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);

CREATE TABLE IF NOT EXISTS Question(
	QuestionID     INT AUTO_INCREMENT,
    TypeOfQuestion ENUM('MCQ', 'True-Or-False', 'Fill-In-Blank', 'Short-Answer', 'Matching', 'Essay') NOT NULL,
    SubjectMatter  ENUM('Social Sciences', 'Sciences', 'Mathematics', 'Literature', 'Languages') NOT NULL,
	Question       JSON NOT NULL,
    
    PRIMARY KEY (QuestionID)
);

CREATE TABLE IF NOT EXISTS Exam_Question(
	ExamID     INT,
    QuestionID INT,
    
    PRIMARY KEY (ExamID, QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

CREATE TABLE IF NOT EXISTS Student(

	StudentID  INT AUTO_INCREMENT,
    BirthDate  DATE NOT NULL,
    Email 	   VARCHAR(62) UNIQUE NOT NULL,
    FirstName  VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName   VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (StudentID)
);
