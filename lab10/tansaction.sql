USE RVU_Vishwas_DB;

-- 1. TRANSACTION MANAGEMENT: COMMIT & ROLLBACK
START TRANSACTION;

UPDATE RVU_Students 
SET Swayam_Score = Swayam_Score + 5 
WHERE Student_ID = 101;

INSERT INTO RVU_Students (Student_ID, Vishwas_Name, Purvaj_Partner, Pratham_Peer, Sai_Charan_Contact, Swayam_Score, Course_ID)
VALUES (108, 'Pratham Secondary', 'Vishwas', 'Purvaj', '9876543217', 78, 202);

-- Rollback the temporary insert and update
ROLLBACK;

-- Verify that the rollback reverted the changes
SELECT * FROM RVU_Students;


-- 2. SAVEPOINT DEMONSTRATION
START TRANSACTION;

UPDATE RVU_Students 
SET Swayam_Score = 95 
WHERE Student_ID = 101;

SAVEPOINT Vishwas_Checkpoint1;

UPDATE RVU_Students 
SET Swayam_Score = 60 
WHERE Student_ID = 102;

SAVEPOINT Purvaj_Checkpoint2;

-- Revert back to first savepoint (undoes Student 102 update, keeps Student 101 update)
ROLLBACK TO SAVEPOINT Vishwas_Checkpoint1;

COMMIT;

SELECT * FROM RVU_Students;


-- 3. EXPLICIT TABLE LOCKING (Concurrency Control)
LOCK TABLES RVU_Students WRITE, RVU_Courses READ;

UPDATE RVU_Students 
SET Course_ID = 202 
WHERE Student_ID = 103;

UNLOCK TABLES;