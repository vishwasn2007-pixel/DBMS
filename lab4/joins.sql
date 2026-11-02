USE RVU_Vishwas_DB;

CREATE TABLE RVU_Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Vishwas VARCHAR(50) NOT NULL,
    Department VARCHAR(50)
);

INSERT INTO RVU_Faculty (Faculty_ID, Faculty_Vishwas, Department) 
VALUES 
(401, 'Prof. Vishwas', 'CSE'),
(402, 'Dr. Purvaj', 'ISE'),
(403, 'Prof. Pratham', 'ECE'),
(404, 'Dr. Sai Charan', 'AIML'),
(405, 'Prof. Swayam', 'Mech');

ALTER TABLE RVU_Courses
ADD Faculty_ID INT,
ADD CONSTRAINT FK_RVU_Faculty FOREIGN KEY (Faculty_ID) REFERENCES RVU_Faculty(Faculty_ID);

UPDATE RVU_Courses SET Faculty_ID = 401 WHERE Course_ID = 201;
UPDATE RVU_Courses SET Faculty_ID = 402 WHERE Course_ID = 202;
UPDATE RVU_Courses SET Faculty_ID = 403 WHERE Course_ID = 203;
UPDATE RVU_Courses SET Faculty_ID = 404 WHERE Course_ID = 204;

SELECT s.Student_ID, s.Vishwas_Name, c.Course_Name
FROM RVU_Students s
INNER JOIN RVU_Courses c ON s.Course_ID = c.Course_ID;

SELECT s.Vishwas_Name, p.Project_Title, p.Budget
FROM RVU_Students s
LEFT JOIN RVU_Projects p ON s.Project_ID = p.Project_ID;

SELECT c.Course_Name, f.Faculty_Vishwas, f.Department
FROM RVU_Courses c
RIGHT JOIN RVU_Faculty f ON c.Faculty_ID = f.Faculty_ID;

SELECT s.Vishwas_Name, c.Course_Name
FROM RVU_Students s
CROSS JOIN RVU_Courses c;

SELECT s.Vishwas_Name, c.Course_Name, p.Project_Title, f.Faculty_Vishwas
FROM RVU_Students s
INNER JOIN RVU_Courses c ON s.Course_ID = c.Course_ID
LEFT JOIN RVU_Projects p ON s.Project_ID = p.Project_ID
LEFT JOIN RVU_Faculty f ON c.Faculty_ID = f.Faculty_ID;