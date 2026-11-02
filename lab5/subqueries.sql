USE RVU_Vishwas_DB;

SELECT s.Vishwas_Name, s.Swayam_Score
FROM RVU_Students s
WHERE s.Swayam_Score > (
    SELECT AVG(Swayam_Score) 
    FROM RVU_Students
);

SELECT s.Vishwas_Name, s.Project_ID
FROM RVU_Students s
WHERE s.Project_ID IN (
    SELECT Project_ID 
    FROM RVU_Projects 
    WHERE Budget >= 40000.00
);

SELECT p.Project_Title, p.Budget
FROM RVU_Projects p
WHERE p.Budget > ALL (
    SELECT Budget 
    FROM RVU_Projects 
    WHERE Lead_Vishwas IN ('Swayam', 'Purvaj')
);

SELECT s.Vishwas_Name, s.Swayam_Score, s.Course_ID
FROM RVU_Students s
WHERE s.Swayam_Score > (
    SELECT AVG(s2.Swayam_Score)
    FROM RVU_Students s2
    WHERE s2.Course_ID = s.Course_ID
);

SELECT p.Project_Title
FROM RVU_Projects p
WHERE EXISTS (
    SELECT 1 
    FROM RVU_Students s 
    WHERE s.Project_ID = p.Project_ID AND s.Vishwas_Name LIKE 'Vishwas%'
);