# 🏥 Hospital Database Management System (DBMS)  

## 📌 About This Project  

This project is a **Hospital Database Management System (DBMS)** developed as part of the **DATA1046B - Data Management I: Structured Data** course at **New Brunswick Community College**. The project involves **SQL-based data management**, including **table creation, data insertion, views, and complex queries** to support hospital operations such as **doctor specialization, patient management, treatments, and appointments**.  

This repository contains:  
- **SQL Scripts** for database creation, data insertion, views, and queries.  
- **ER Diagram** to visualize the database schema.  
- **Query Execution Screenshots** demonstrating successful SQL execution in **MySQL Workbench**.  

---

## 📂 Repository Structure  



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

![Screenshot 2025-02-26 223840](https://github.com/user-attachments/assets/344a404b-6633-4e0e-8166-81f600eb0abe)

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

📌 Insert data into `treatments` table  
```sql

```

📌 **Execution Result**:

### 2️⃣ **Views (Objective 2)**
Created **three views** to simplify queries across multiple tables.

📌 **View 1:** ***view_doctor_info*** (Combines Doctor & Specialization)

```sql
CREATE VIEW view_doctor_info AS  
SELECT d.doctor_id, d.name AS doctor_name, s.specialization_name, d.experience_years  
FROM Doctor d  
JOIN Specialization s ON d.specialization_id = s.specialization_id;
```

📌 **View 2:** ***view_appointment_details*** (Combines Appointment, Doctor, & Patient)

```sql
CREATE VIEW view_appointment_details AS  
SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name, a.date, a.time  
FROM Appointment a  
JOIN Patient p ON a.patient_id = p.patient_id  
JOIN Doctor d ON a.doctor_id = d.doctor_id;
```

📌 **View 3:** ***view_patient_treatment_info*** (Combines Treatments & Patients)

```sql
CREATE VIEW view_patient_treatment_info AS  
SELECT pt.patient_id, p.name AS patient_name, t.treatment_name  
FROM Patient_Treatments pt  
JOIN Patient p ON pt.patient_id = p.patient_id  
JOIN Treatments t ON pt.treatment_id = t.treatment_id;

```

📌 Execution Result:


## 3️⃣ Queries for Views (Objective 3)

✅ **Queries for** ***view_doctor_info***

```sql
SELECT * FROM view_doctor_info WHERE specialization_name = 'Cardiology';
```

```sql
SELECT doctor_name, experience_years FROM view_doctor_info ORDER BY experience_years DESC;
```

✅ Queries for view_appointment_details

```sql
SELECT * FROM view_appointment_details WHERE date > '2025-02-01';
```

```sql
SELECT doctor_name, COUNT(*) AS total_appointments FROM view_appointment_details GROUP BY doctor_name;
```

📌 Execution Result:



