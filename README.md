# 🏥 Hospital Database Management System (DBMS)  

## 📌 About This Project  

This project is a **Hospital Database Management System (DBMS)** developed as part of the **DATA1046B - Data Management I: Structured Data** course at **New Brunswick Community College**. The project involves **SQL-based data management**, including **table creation, data insertion, views, and complex queries** to support hospital operations such as **doctor specialization, patient management, treatments, and appointments**.  

This repository contains:  
- **SQL Scripts** for database creation, data insertion, views, and queries.  
- **ER Diagram** to visualize the database schema.  
- **Query Execution Screenshots** demonstrating successful SQL execution in **MySQL Workbench**.  

---

## 📂 Repository Structure  

```
Hospital-DBMS/
│── README.md # Overview of the project
│── Hospital-DBMS-Project.sql # SQL scripts for tables, views, and queries
│── ER diagram # ER diagram & query execution screenshots
│── Screenshots/ # Query execution results in MySQL Workbench
│ ├── Insert_Records.png
│ ├── View_Doctor_Info.png
│ ├── Join_Doctor_Specialization.png
│ ├── ... (Other execution results)
```

---

## 🎯 Project Objectives  

✅ **Objective 1:** Insert at least **10 records** into each main table.  
✅ **Objective 2:** Create **3 views** derived from multiple tables.  
✅ **Objective 3:** Write **2 queries per view** demonstrating SQL operations.  
✅ **Objective 4:** Write **2 queries per main entity table** to extract meaningful insights.  
✅ **Objective 5:** Write **10 SQL queries using JOIN operations** across multiple tables.  

---

## 🗄️ Database Schema  

The **Hospital DBMS** contains the following main tables:  

- **Specialization:** Stores medical specializations available at the hospital.
- **Doctor:** Stores information about doctors and their assigned specializations.
- **Patient:** Stores patient information.
- **Appointment:** Manages scheduled appointments between doctors and patients.
- **Treatments:** Contains medical treatments available at the hospital.
- **Patient_Treatments:** Links patients to their received treatments. 
- **Doctor_Treatments:** Links doctors to the treatments they provide.

---

📌 **ER Diagram:**

![ER_Diagram](https://github.com/user-attachments/assets/75a4fda2-08c7-45e1-ad89-ec0ecb532e62)

---

## 🛠️ SQL Implementation  

### 1️⃣ **Data Insertion (Objective 1)**  
Inserted **at least 10 records** into each table, ensuring realistic data for a functioning hospital system.  

📌 Insert data into `specialization` table  
```sql
INSERT INTO specialization (specialization_name, specialization_description, specialization_department)
VALUES
('Psychiatry', 'Mental health', 'Psychiatry'),
('Cardiology', 'Heart specialist', 'Cardiology'),
('Ophthalmology', 'Eye specialist', 'Ophthalmology'),
('Neurology', 'Brain specialist', 'Neurology'),
('Dermatology', 'Skin specialist', 'Dermatology'),
('Pediatrics', 'Child specialist', 'Pediatrics'),
('Orthopedics', 'Bone specialist', 'Orthopedics'),
('Gastroenterology', 'Digestive system', 'Gastroenterology'),
('General Surgery', 'Surgical procedures', 'Surgery'),
('Traumatology', 'Injuries and fractures', 'Orthopedics');
```

📌 Insert data into `doctor` table  
```sql
INSERT INTO doctor (specialization_id, doctor_first_name, doctor_last_name, doctor_email, doctor_phone_number)
VALUES
(1, 'Lukas', 'Steiner', 'lukas.steiner@example.ch', '+41 79 123 45 67'),
(2, 'Pierre', 'Dubois', 'pierre.dubois@example.fr', '+33 7 89 01 23 45'),
(3, 'Maximilian', 'Schmidt', 'max.schmidt@example.de', '+49 151 23456789'),
(4, 'James', 'Smith', 'james.smith@example.uk', '+44 7700 123456'),
(5, 'John', 'Williams', 'john.williams@example.com', '+1 202-555-0143'),
(6, 'Lorenzo', 'Rossi', 'lorenzo.rossi@example.it', '+39 320 1234567'),
(7, 'Carlos', 'García', 'carlos.garcia@example.es', '+34 612 345 678'),
(8, 'Daniel', 'Thompson', 'daniel.thompson@example.ca', '+1 416-555-1234'),
(9, 'Oliver', 'Jones', 'oliver.jones@example.au', '+61 412 345 678'),
(10, 'Hiroshi', 'Tanaka', 'hiroshi.tanaka@example.jp', '+81 90-1234-5678');
```

📌 Insert data into `patient` table  
```sql
INSERT INTO patient (doctor_id, patient_first_name, patient_last_name, patient_date_of_birth, patient_phone_number, patient_email)
VALUES
(1, 'Simon', 'Keller', '1980-05-15', '+41 79 987 65 43', 'simon.keller@example.ch'),
(2, 'Marie', 'Laurent', '1990-08-20', '+33 6 98 76 54 32', 'marie.laurent@example.fr'),
(3, 'Felix', 'Becker', '1982-11-30', '+49 157 98765432', 'felix.becker@example.de'),
(4, 'Emma', 'Johnson', '1995-02-14', '+44 7712 345678', 'emma.johnson@example.uk'),
(5, 'Olivia', 'Davis', '1988-12-05', '+1 303-555-0176', 'olivia.davis@example.com'),
(6, 'Giulia', 'Bianchi', '1992-03-27', '+39 320 7654321', 'giulia.bianchi@example.it'),
(7, 'Sofia', 'Martínez', '1987-09-09', '+34 612 987 654', 'sofia.martinez@example.es'),
(8, 'Chloe', 'Wilson', '1993-06-17', '+1 647-555-6789', 'chloe.wilson@example.ca'),
(9, 'Jack', 'Robinson', '1991-04-01', '+61 412 987 654', 'jack.robinson@example.au'),
(10, 'Yui', 'Sato', '1996-12-22', '+81 90-8765-4321', 'yui.sato@example.jp');
```

📌 Insert data into `appointment` table  
```sql
INSERT INTO appointment (doctor_id, patient_id, appointment_date, appointment_time, appointment_type) VALUES
(1, 1, '2025-02-19', '08:12:00', 'Consultation'),
(2, 2, '2025-02-20', '10:37:00', 'Follow-up'),
(3, 3, '2025-02-21', '11:05:00', 'Consultation'),
(4, 4, '2025-02-22', '14:22:00', 'Emergency'),
(5, 5, '2025-02-23', '15:27:00', 'Routine Check'),
(6, 6, '2025-02-24', '09:45:00', 'Consultation'),
(7, 7, '2025-02-25', '08:55:00', 'Follow-up'),
(8, 8, '2025-02-26', '12:30:00', 'Consultation'),
(9, 9, '2025-02-27', '13:40:00', 'Emergency'),
(10, 10, '2025-02-28', '16:00:00', 'Routine Check');
```

📌 Insert data into `treatments` table  
```sql
INSERT INTO treatments (treatment_name, treatment_cost, treatment_description) VALUES
('Angioplasty', 15236.10, 'Procedure to restore blood flow in blocked arteries'),
('EEG', 485.50, 'Electroencephalogram test to measure brain activity'),
('Knee Replacement', 24789.95, 'Surgical procedure to replace a knee joint with a prosthesis'),
('Vaccination', 95.25, 'Injection to stimulate immune response and provide immunity'),
('Skin Biopsy', 730.75, 'Procedure to sample skin tissue for diagnostic analysis'),
('Chemotherapy', 19850.00, 'Cancer treatment using chemical substances to destroy cancer cells'),
('Colonoscopy', 1250.00, 'Endoscopic examination of the colon to detect abnormalities'),
('Psychotherapy', 210.00, 'Talk therapy sessions focused on mental health and emotional well-being'),
('Cystoscopy', 1750.50, 'Examination of the urinary bladder using a cystoscope'),
('Cataract Surgery', 3050.00, 'Surgical procedure to remove a cataract and restore vision');
```

📌 Insert data into `patient_treatments` table  
```sql
INSERT INTO patient_treatments (patient_id, treatment_id, treatment_insurance_coverage, treatment_prescription, treatment_pharmacy) VALUES
(1, 1, b'1', 'Aspirin daily', 'City Pharmacy'),
(2, 2, b'0', 'Follow doctor instructions', 'HealthPlus Pharmacy'),
(3, 3, b'1', 'Painkillers twice daily', 'MediCare Pharmacy'),
(4, 4, b'1', 'Booster shot required', 'City Pharmacy'),
(5, 5, b'0', 'Topical cream application', 'Wellness Pharmacy'),
(6, 6, b'1', 'Anti-nausea medication', 'City Pharmacy'),
(7, 7, b'0', 'Dietary restrictions', 'HealthPlus Pharmacy'),
(8, 8, b'1', 'Weekly therapy sessions', 'MediCare Pharmacy'),
(9, 9, b'0', 'Urinary analgesics', 'City Pharmacy'),
(10, 10, b'1', 'Post-op eye drops', 'Vision Pharmacy');
```

📌 Insert data into `doctor_treatments` table  
```sql
INSERT INTO doctor_treatments (doctor_id, treatment_id, treatment_need_consent, treatment_date, treatment_research) VALUES
(1, 1, b'1', '2025-01-15', 'Study A'),
(2, 2, b'0', '2025-01-20', 'Research B'),
(3, 3, b'1', '2025-01-25', 'Trial C'),
(4, 4, b'0', '2025-01-30', 'Analysis D'),
(5, 5, b'1', '2025-02-05', 'Investigation E'),
(6, 6, b'0', '2025-02-10', 'Study F'),
(7, 7, b'1', '2025-02-15', 'Research G'),
(8, 8, b'0', '2025-02-20', 'Trial H'),
(9, 9, b'1', '2025-02-25', 'Analysis I'),
(10, 10, b'0', '2025-03-01', 'Investigation J');
```

📌 **Execution Result**:

![InsertRecors1](https://github.com/user-attachments/assets/2c0d1c67-c308-497e-bea1-54bb02236bd3)

![InsertRecors](https://github.com/user-attachments/assets/13294aff-dff4-43df-8ac8-d909f61ab382)



### 2️⃣ **Views (Objective 2)**
Created **three views** to simplify queries across multiple tables.

📌 **View 1:** ***view_doctor_info*** (Combines Doctor & Specialization)

```sql
CREATE VIEW view_doctor_info AS
SELECT d.doctor_id,
       d.doctor_first_name,
       d.doctor_last_name,
       s.specialization_name,
       s.specialization_department
FROM doctor d
JOIN specialization s ON d.specialization_id = s.specialization_id;
```

📌 Execution Result:

![view1](https://github.com/user-attachments/assets/2aead2a2-e3d6-40c2-a4a6-8d6fe0314fc9)


📌 **View 2:** ***view_appointment_details*** (Combines Appointment, Doctor, & Patient)

```sql
CREATE VIEW view_appointment_details AS
SELECT a.appointment_id,
       a.appointment_date,
       a.appointment_time,
       d.doctor_first_name,
       d.doctor_last_name,
       p.patient_first_name,
       p.patient_last_name,
       a.appointment_type
FROM appointment a
JOIN doctor d ON a.doctor_id = d.doctor_id
JOIN patient p ON a.patient_id = p.patient_id;
```

📌 Execution Result:

![view2](https://github.com/user-attachments/assets/a2894c37-0fc5-4c11-b0cf-d8d042998045)


📌 **View 3:** ***view_patient_treatment_info*** (Combines Treatments & Patients)

```sql
CREATE VIEW view_patient_treatment_info AS
SELECT pt.patient_treatment_id,
       p.patient_first_name,
       p.patient_last_name,
       t.treatment_name,
       pt.treatment_prescription,
       pt.treatment_pharmacy
FROM patient_treatments pt
JOIN patient p ON pt.patient_id = p.patient_id
JOIN treatments t ON pt.treatment_id = t.treatment_id;
```

📌 Execution Result:

![view3](https://github.com/user-attachments/assets/5f6f920a-77d9-4326-a37b-8b7f61bd9ba3)


## 3️⃣ Queries for Views (Objective 3)

✅ **Queries for** ***view_doctor_info***

```sql
SELECT * FROM view_doctor_info WHERE specialization_department = "Orthopedics";
SELECT * FROM view_doctor_info WHERE specialization_name = 'Cardiology';
```

📌 Execution Result:

![query11](https://github.com/user-attachments/assets/7a866466-c93b-4c14-ab33-58f24bd5dddf)

![query12](https://github.com/user-attachments/assets/9d5967e8-3adf-4fa2-8337-7d695d75473c)

✅ **Queries for** ***view_appointment_details***

<!-- ```sql
SELECT * FROM view_appointment_details ORDER BY appointment_date DESC;
SELECT * FROM view_appointment_details WHERE appointment_type = 'Consultation';
``` -->

📌 Execution Result:

![query21](https://github.com/user-attachments/assets/eac2848b-a9ac-489d-a32a-7f200b90cce2)

![query22](https://github.com/user-attachments/assets/f5d96c32-694f-46da-b049-d31682827b0f)

✅ **Queries for** ***view_patient_treatment_info***

```sql
SELECT * FROM view_patient_treatment_info WHERE treatment_name = "Chemotherapy";
SELECT * FROM view_patient_treatment_info WHERE treatment_pharmacy = 'City Pharmacy';
```

📌 Execution Result:

![query31](https://github.com/user-attachments/assets/9477d8ea-5666-4924-bf82-eb9d596df6f9)

![query32](https://github.com/user-attachments/assets/edf020f3-f160-4fe7-9816-922a7b051b10)




