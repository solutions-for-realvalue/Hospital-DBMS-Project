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

📌 **ER Diagram:** *(Refer to the PDF for full details.)*  
![ER Diagram](Screenshots/ER_Diagram.png)  

---

## 🛠️ SQL Implementation  

### 1️⃣ **Data Insertion (Objective 1)**  
Inserted **at least 10 records** into each table, ensuring realistic data for a functioning hospital system.  

📌 **Example:** Insert data into `Doctor` table  
```sql
INSERT INTO Doctor (doctor_id, name, specialization_id, experience_years)
VALUES (1, 'Dr. John Smith', 2, 10),
       (2, 'Dr. Emily Carter', 1, 8),
       (3, 'Dr. Daniel Lee', 3, 15);
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








