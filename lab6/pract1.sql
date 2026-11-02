USE RVU_Vishwas_DB;

SELECT COUNT(*) AS Total_Students, AVG(Swayam_Score) AS Avg_Score
FROM RVU_Students;

SELECT Course_ID, COUNT(*) AS Total_Enrolled, MAX(Swayam_Score) AS Highest_Score
FROM RVU_Students
GROUP BY Course_ID;

SELECT Course_ID, AVG(Swayam_Score) AS Avg_Course_Score
FROM RVU_Students
GROUP BY Course_ID
HAVING AVG(Swayam_Score) > 85;