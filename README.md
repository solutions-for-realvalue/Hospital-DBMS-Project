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

📌 **Example:** Insert data into `Doctor` table  
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



