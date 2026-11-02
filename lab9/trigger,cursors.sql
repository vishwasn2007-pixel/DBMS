USE RVU_Vishwas_DB;

-- Create Audit Log Table for Triggers
CREATE TABLE IF NOT EXISTS RVU_Student_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT,
    Vishwas_Name VARCHAR(50),
    Action_Type VARCHAR(20),
    Action_Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

-- 1. BEFORE UPDATE TRIGGER: Audit changes to student scores
CREATE TRIGGER Before_RVU_Student_Update
BEFORE UPDATE ON RVU_Students
FOR EACH ROW
BEGIN
    IF NEW.Swayam_Score < 0 THEN
        SET NEW.Swayam_Score = 0;
    END IF;
END //

-- 2. AFTER INSERT TRIGGER: Log new student insertions into audit table
CREATE TRIGGER After_RVU_Student_Insert
AFTER INSERT ON RVU_Students
FOR EACH ROW
BEGIN
    INSERT INTO RVU_Student_Audit (Student_ID, Vishwas_Name, Action_Type)
    VALUES (NEW.Student_ID, NEW.Vishwas_Name, 'INSERT');
END //

-- 3. CURSOR: Process rows sequentially to evaluate student bonus points
CREATE PROCEDURE Process_Vishwas_Student_Scores()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_score INT;

    -- Cursor Declaration
    DECLARE student_cursor CURSOR FOR 
        SELECT Student_ID, Swayam_Score FROM RVU_Students;

    -- Declare continue handler for cursor loop termination
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO v_id, v_score;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Apply bonus if score is below threshold
        IF v_score < 85 THEN
            UPDATE RVU_Students 
            SET Swayam_Score = Swayam_Score + 5 
            WHERE Student_ID = v_id;
        END IF;
    END LOOP;

    CLOSE student_cursor;
END //

DELIMITER ;

-- Test Trigger & Cursor Execution
INSERT INTO RVU_Students (Student_ID, Vishwas_Name, Purvaj_Partner, Pratham_Peer, Sai_Charan_Contact, Swayam_Score, Course_ID)
VALUES (107, 'Sai Charan Secondary', 'Vishwas', 'Pratham', '9876543216', 82, 201);

CALL Process_Vishwas_Student_Scores();

SELECT * FROM RVU_Student_Audit;
SELECT * FROM RVU_Students;