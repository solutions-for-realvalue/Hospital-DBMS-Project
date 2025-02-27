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



