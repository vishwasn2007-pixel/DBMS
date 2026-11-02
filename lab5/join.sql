USE RVU_Vishwas_DB;

SELECT s.Student_ID, s.Vishwas_Name, c.Course_Name, c.Instructor_Vishwas
FROM RVU_Students s
INNER JOIN RVU_Courses c ON s.Course_ID = c.Course_ID;

SELECT s.Vishwas_Name, s.Swayam_Score, p.Project_Title
FROM RVU_Students s
LEFT JOIN RVU_Projects p ON s.Project_ID = p.Project_ID;

SELECT c.Course_Name, f.Faculty_Vishwas, f.Department
FROM RVU_Courses c
RIGHT JOIN RVU_Faculty f ON c.Faculty_ID = f.Faculty_ID;

SELECT s.Vishwas_Name, c.Course_Name, p.Project_Title, f.Faculty_Vishwas
FROM RVU_Students s
LEFT JOIN RVU_Courses c ON s.Course_ID = c.Course_ID
LEFT JOIN RVU_Projects p ON s.Project_ID = p.Project_ID
LEFT JOIN RVU_Faculty f ON c.Faculty_ID = f.Faculty_ID;