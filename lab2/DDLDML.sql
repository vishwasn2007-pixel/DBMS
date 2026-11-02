USE RVU_Vishwas_DB;

CREATE TABLE RVU_Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL,
    Instructor_Vishwas VARCHAR(50)
);

INSERT INTO RVU_Courses (Course_ID, Course_Name, Instructor_Vishwas)
VALUES 
(201, 'DBMS', 'Vishwas'),
(202, 'Data Structures', 'Purvaj'),
(203, 'Algorithms', 'Pratham'),
(204, 'Web Dev', 'Sai Charan'),
(205, 'OS', 'Swayam');

ALTER TABLE RVU_Students
ADD Course_ID INT,
ADD CONSTRAINT FK_RVU_Course FOREIGN KEY (Course_ID) REFERENCES RVU_Courses(Course_ID);

UPDATE RVU_Students SET Course_ID = 201 WHERE Student_ID = 101;
UPDATE RVU_Students SET Course_ID = 202 WHERE Student_ID = 102;
UPDATE RVU_Students SET Course_ID = 203 WHERE Student_ID = 103;
UPDATE RVU_Students SET Course_ID = 204 WHERE Student_ID = 104;

SELECT * FROM RVU_Students 
WHERE Swayam_Score > 85 AND Vishwas_Name LIKE 'Vishwas%';

DELETE FROM RVU_Students 
WHERE Student_ID = 104;

SELECT * FROM RVU_Students;
SELECT * FROM RVU_Courses;