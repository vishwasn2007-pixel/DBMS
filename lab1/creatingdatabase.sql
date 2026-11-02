CREATE DATABASE RVU_Vishwas_DB;
USE RVU_Vishwas_DB;

CREATE TABLE RVU_Students (
    Student_ID INT PRIMARY KEY,
    Vishwas_Name VARCHAR(50) NOT NULL,
    Purvaj_Partner VARCHAR(50),
    Pratham_Peer VARCHAR(50),
    Sai_Charan_Contact VARCHAR(15),
    Swayam_Score INT CHECK (Swayam_Score >= 0)
);

INSERT INTO RVU_Students (Student_ID, Vishwas_Name, Purvaj_Partner, Pratham_Peer, Sai_Charan_Contact, Swayam_Score) 
VALUES 
(101, 'Vishwas Lead', 'Purvaj A', 'Pratham B', '9876543210', 95),
(102, 'Purvaj Member', 'Vishwas Lead', 'Pratham B', '9876543211', 88),
(103, 'Pratham Member', 'Purvaj A', 'Vishwas Lead', '9876543212', 92),
(104, 'Sai Charan Member', 'Swayam C', 'Pratham B', '9876543213', 90),
(105, 'Swayam Member', 'Sai Charan', 'Vishwas Lead', '9876543214', 85);

ALTER TABLE RVU_Students 
ADD RVU_Department VARCHAR(30) DEFAULT 'CSE';

SELECT * FROM RVU_Students;