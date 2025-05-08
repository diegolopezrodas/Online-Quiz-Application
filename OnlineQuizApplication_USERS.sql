/*
	CREATED BY	   : Diego Lopez-Rodas
    CREATION DATE. : 05/06/2025
    UPDATED DATE   : 05/06/2025
    Description    : This is an SQL script for the initalization of
					 users and roles Online Quiz Application Database. 
*/

USE online_quiz_application;

-- Creation of user 'onlinequizappadmin' with ALL priviledges for online_quiz_application database
CREATE USER IF NOT EXISTS 'onlinequizappadmin'@'localhost' IDENTIFIED BY 'OnQui2App@dm1n';
GRANT ALL ON online_quiz_application.* TO 'onlinequizappadmin'@'localhost';

-- Creation of user 'registeraccounts' with limited priviledges to be used on database
CREATE USER IF NOT EXISTS 'registeraccounts'@'localhost' IDENTIFIED BY '0nQuizApp@ccounts';
GRANT INSERT ON online_quiz_application.Professor TO 'registeraccounts'@'localhost';

-- Creation and priviledges of different roles
CREATE ROLE IF NOT EXISTS 'teacher', 'student', 'guest';
