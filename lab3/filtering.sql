USE RVU_Vishwas_DB;

CREATE TABLE RVU_Projects (
    Project_ID INT PRIMARY KEY,
    Project_Title VARCHAR(100) NOT NULL,
    Lead_Vishwas VARCHAR(50) DEFAULT 'Vishwas',
    Budget DECIMAL(10,2) CHECK (Budget > 0)
);

INSERT INTO RVU_Projects (Project_ID, Project_Title, Lead_Vishwas, Budget) 
VALUES 
(301, 'AI Platform', 'Vishwas', 50000.00),
(302, 'DBMS Engine', 'Purvaj', 35000.00),
(303, 'Network Monitor', 'Pratham', 42000.00),
(304, 'Security Suite', 'Sai Charan', 60000.00),
(305, 'Cloud Portal', 'Swayam', 28000.00);

ALTER TABLE RVU_Students
ADD Project_ID INT,
ADD CONSTRAINT FK_RVU_Project FOREIGN KEY (Project_ID) REFERENCES RVU_Projects(Project_ID);

UPDATE RVU_Students SET Project_ID = 301 WHERE Student_ID = 101;
UPDATE RVU_Students SET Project_ID = 302 WHERE Student_ID = 102;
UPDATE RVU_Students SET Project_ID = 303 WHERE Student_ID = 103;

SELECT * FROM RVU_Projects 
WHERE Budget BETWEEN 30000.00 AND 55000.00;

SELECT * FROM RVU_Projects 
WHERE Lead_Vishwas IN ('Vishwas', 'Purvaj', 'Pratham')
ORDER BY Budget DESC;

DELETE FROM RVU_Projects 
WHERE Project_ID = 305;

SELECT * FROM RVU_Projects;