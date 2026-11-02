USE RVU_Vishwas_DB;

SELECT Course_ID, COUNT(*) AS Total_Students, AVG(Swayam_Score) AS Average_Score
FROM RVU_Students
GROUP BY Course_ID;

SELECT Course_ID, MAX(Swayam_Score) AS Top_Score
FROM RVU_Students
GROUP BY Course_ID
HAVING AVG(Swayam_Score) >= 85;

SELECT Student_ID, Vishwas_Name, Swayam_Score, Course_ID
FROM RVU_Students
ORDER BY Swayam_Score DESC;

SELECT Course_ID, COUNT(*) AS Total_Students, AVG(Swayam_Score) AS Avg_Score
FROM RVU_Students
WHERE Swayam_Score >= 80
GROUP BY Course_ID
HAVING COUNT(*) >= 1
ORDER BY Avg_Score DESC;