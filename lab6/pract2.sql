USE RVU_Vishwas_DB;

SELECT UPPER(Vishwas_Name) AS Student_Upper, LENGTH(Vishwas_Name) AS Name_Length
FROM RVU_Students;

SELECT Vishwas_Name, CONCAT('RVU_', Vishwas_Name) AS RVU_Handle
FROM RVU_Students;

SELECT Project_Title, ROUND(Budget, -3) AS Rounded_Budget, SQRT(Budget) AS Budget_Sqrt
FROM RVU_Projects;