USE RVU_Vishwas_DB;

DELIMITER //

CREATE PROCEDURE Get_Vishwas_Student_Details()
BEGIN
    SELECT s.Student_ID, s.Vishwas_Name, s.Swayam_Score, c.Course_Name
    FROM RVU_Students s
    LEFT JOIN RVU_Courses c ON s.Course_ID = c.Course_ID;
END //

CREATE PROCEDURE Add_RVU_Student(
    IN p_id INT,
    IN p_name VARCHAR(50),
    IN p_partner VARCHAR(50),
    IN p_peer VARCHAR(50),
    IN p_contact VARCHAR(15),
    IN p_score INT,
    IN p_course_id INT
)
BEGIN
    INSERT INTO RVU_Students (Student_ID, Vishwas_Name, Purvaj_Partner, Pratham_Peer, Sai_Charan_Contact, Swayam_Score, Course_ID)
    VALUES (p_id, p_name, p_partner, p_peer, p_contact, p_score, p_course_id);
END //

CREATE PROCEDURE Get_Student_Score_Status(
    IN p_id INT,
    OUT p_status VARCHAR(20)
)
BEGIN
    DECLARE v_score INT;
    
    SELECT Swayam_Score INTO v_score
    FROM RVU_Students
    WHERE Student_ID = p_id;
    
    IF v_score >= 90 THEN
        SET p_status = 'Excellent';
    ELSEIF v_score >= 80 THEN
        SET p_status = 'Good';
    ELSE
        SET p_status = 'Average';
    END IF;
END //

DELIMITER ;

CALL Get_Vishwas_Student_Details();

CALL Add_RVU_Student(106, 'Swayam Secondary', 'Vishwas Lead', 'Pratham B', '9876543215', 91, 201);

CALL Get_Student_Score_Status(101, @Vishwas_Status);
SELECT @Vishwas_Status AS Vishwas_Grade_Status;