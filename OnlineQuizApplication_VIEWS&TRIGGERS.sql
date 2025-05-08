/*
	CREATED BY	   : Diego Lopez-Rodas
    CREATION DATE. : 05/06/2025
    UPDATED DATE   : 05/06/2025
    Description    : This is an SQL script for the initalization of
					 views and triggers Online Quiz Application Database. 
*/

USE online_quiz_application;

-- Trigger to Increase NumOfQuestions field in Exam table for addition of rows in Exam_Question table
DELIMITER $$
CREATE TRIGGER Increase_NumOfQuestions_OnInsert
AFTER INSERT ON Exam_Question
FOR EACH ROW
    BEGIN
		UPDATE Exam AS E
        SET E.NumOfQuestions = E.NumOfQuestions + 1
        WHERE E.ExamID = NEW.ExamID;
	END;$$
DELIMITER ;

-- Trigger to Decrease NumOfQuestions field in Exam table for deletion  of rows in Exam_Question table
DELIMITER $$
CREATE TRIGGER Decrease_NumOfQuestions_OnDelete
AFTER DELETE ON Exam_Question
FOR EACH ROW
    BEGIN
		UPDATE Exam AS E
        SET E.NumOfQuestions = E.NumOfQuestions - 1
        WHERE E.ExamID = OLD.ExamID;
	END;$$
DELIMITER ;

-- Stored Procedure used to retrieve ALL exam details of a specific exam using ExamID
DELIMITER $$
CREATE PROCEDURE Get_ExamDetails(IN inputExamID INT)
BEGIN
	SELECT e.NumOfQuestions, e.TimeLimit, e.ExamDescription,
		   e.GradeLevel, e.SubjectMatter, q.Question, q.TypeOfQuestion
	FROM Exam AS e JOIN Exam_Question AS eq ON e.ExamID = eq.ExamID
				   JOIN Question AS q ON q.QuestionID = eq.QuestionID
	WHERE e.ExamID = inputExamID;
END $$
DELIMITER ;

-- View for admins to retrieve ALL of Professors' Details
CREATE VIEW GetALL_ProfessorDetails AS
	SELECT ProfessorID, CONCAT(FirstName, ' ', LastName) AS Professor_Name, BirthDate, PhoneNumber, Email
    FROM Professor;
    


