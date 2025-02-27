-- **********************************************************************************************
-- Title: Hospital Management System Database that populate the database
-- with meaningful data and perform a series of representative SQL queries.
-- Author: Arnaldo Sepulveda
-- **********************************************************************************************

DROP DATABASE IF EXISTS `hospital_management`;

CREATE DATABASE hospital_management;
USE hospital_management;

-- Doctor Specialization Table
CREATE TABLE specialization (
    specialization_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    specialization_name VARCHAR(50) NOT NULL,
    specialization_description TEXT,
    specialization_department VARCHAR(50)
);

-- Doctor Table
CREATE TABLE doctor (
    doctor_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    specialization_id INT NOT NULL,
    doctor_first_name VARCHAR(50) NOT NULL,
    doctor_last_name VARCHAR(50) NOT NULL,
    doctor_email VARCHAR(100) UNIQUE NOT NULL,
    doctor_phone_number VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (specialization_id) REFERENCES specialization(specialization_id)
);

-- Patient Table
CREATE TABLE patient (
    patient_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    patient_first_name VARCHAR(50) NOT NULL,
    patient_last_name VARCHAR(50) NOT NULL,
    patient_date_of_birth DATE NOT NULL,
    patient_phone_number VARCHAR(20) UNIQUE NOT NULL,
    patient_email VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

-- Appointment Table
CREATE TABLE appointment (
    appointment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

-- Treatments Table
CREATE TABLE treatments (
    treatment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    treatment_name VARCHAR(50) NOT NULL,
    treatment_cost DECIMAL(8, 2) NOT NULL,
    treatment_description TEXT NOT NULL
);

-- Patient Treatments Table
CREATE TABLE patient_treatments (
    patient_treatment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    treatment_id INT NOT NULL,
    treatment_insurance_coverage TINYINT(1) NOT NULL,
    treatment_prescription VARCHAR(100) NOT NULL,
    treatment_pharmacy VARCHAR(50) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);

-- Doctor Treatments Table
CREATE TABLE doctor_treatments (
    doctor_treatment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    treatment_id INT NOT NULL,
    treatment_need_consent TINYINT(1) NOT NULL,
    treatment_date DATE NOT NULL,
    treatment_research TEXT,
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);

-- **********************************************************************************************
-- Insert Data into specialization Table
-- **********************************************************************************************
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

-- **********************************************************************************************
-- Insert Data into doctor Table
-- **********************************************************************************************
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

-- **********************************************************************************************
-- Insert Data into patient Table
-- **********************************************************************************************
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

-- **********************************************************************************************
-- Insert into appointment Table
-- **********************************************************************************************
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

-- **********************************************************************************************
-- Insert into treatments Table
-- **********************************************************************************************
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

-- **********************************************************************************************
-- Insert into patient_treatments Table
-- **********************************************************************************************
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

-- **********************************************************************************************
-- Insert into doctor_treatments Table
-- **********************************************************************************************
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

-- **********************************************************************************************
-- Create 3 Views Derived from Multiple Tables
-- **********************************************************************************************

-- Join doctor and specialization for a complete doctor profile
CREATE VIEW view_doctor_info AS
SELECT d.doctor_id,
       d.doctor_first_name,
       d.doctor_last_name,
       s.specialization_name,
       s.specialization_department
FROM doctor d
JOIN specialization s ON d.specialization_id = s.specialization_id;

-- Combine appointment details with doctor and patient names
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

-- Show patient treatments with patient name and treatment info
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

-- **********************************************************************************************
-- For each view, write 2 representative queries that will extract meaningful data from them
-- **********************************************************************************************
-- Queries for view_doctor_info view
SELECT * FROM view_doctor_info WHERE specialization_department = "Orthopedics";
SELECT * FROM view_doctor_info WHERE specialization_name = 'Cardiology';

-- Queries for view_appointment_details view
SELECT * FROM view_appointment_details ORDER BY appointment_date DESC;
SELECT * FROM view_appointment_details WHERE appointment_type = 'Consultation';

-- Queries for view_patient_treatment_info view
SELECT * FROM view_patient_treatment_info WHERE treatment_name = "Chemotherapy";
SELECT * FROM view_patient_treatment_info WHERE treatment_pharmacy = 'City Pharmacy';

-- **********************************************************************************************
-- Write 2 representative queries for each of the main entity tables. Each query should
-- demonstrate different SQL statements learned in class.
-- **********************************************************************************************

-- For specialization table
SELECT * FROM specialization WHERE specialization_department = 'Surgery';
SELECT COUNT(*) AS total_specializations FROM specialization;

-- For doctor table
SELECT * FROM doctor WHERE doctor_last_name LIKE 'S%';
UPDATE doctor SET doctor_phone_number = '123-456-7890' WHERE doctor_email = 'james.smith@example.uk';

-- For patient table
SELECT patient_first_name, patient_last_name, patient_date_of_birth FROM patient WHERE patient_date_of_birth < '1990-01-01';
UPDATE patient SET patient_phone_number = '987-654-3210' WHERE patient_email = 'simon.keller@example.ch';

-- For appointment table
SELECT * FROM appointment WHERE appointment_type = 'Follow-up';
DELETE FROM appointment WHERE appointment_id = 10;

-- For treatments table
SELECT * FROM treatments WHERE treatment_cost > 500.00;
UPDATE treatments SET treatment_description = 'Updated treatment info' WHERE treatment_id = 6;

-- **********************************************************************************************
-- Write 10 representative queries that involve joining at least 2 tables. These queries should
-- demonstrate your ability to perform inner joins, outer joins, etc., to extract and combine
-- relevant data from multiple tables.
-- **********************************************************************************************

-- Inner join: Doctor with Specialization
SELECT d.doctor_first_name, d.doctor_last_name, s.specialization_name
FROM doctor d
INNER JOIN specialization s ON d.specialization_id = s.specialization_id;

-- Left join: Patient with Doctor
SELECT p.patient_first_name, p.patient_last_name, d.doctor_first_name AS doctor_fname, d.doctor_last_name AS doctor_lname
FROM patient p
LEFT JOIN doctor d ON p.doctor_id = d.doctor_id;

-- Right join: Appointment with Doctor
SELECT d.doctor_first_name, d.doctor_last_name, a.appointment_date
FROM appointment a
RIGHT JOIN doctor d ON a.doctor_id = d.doctor_id;

-- Inner join: Appointment with Patient
SELECT a.appointment_id, a.appointment_date, p.patient_first_name, p.patient_last_name
FROM appointment a
INNER JOIN patient p ON a.patient_id = p.patient_id;

-- Join: Doctor, Patient, Patient Treatments, and Treatments
SELECT d.doctor_first_name, d.doctor_last_name, p.patient_first_name, p.patient_last_name, t.treatment_name
FROM doctor d
INNER JOIN patient p ON d.doctor_id = p.doctor_id
INNER JOIN patient_treatments pt ON p.patient_id = pt.patient_id
INNER JOIN treatments t ON pt.treatment_id = t.treatment_id;

-- Join: Doctor Treatments with Doctor and Treatments
SELECT d.doctor_first_name, d.doctor_last_name, t.treatment_name, dt.treatment_date
FROM doctor_treatments dt
INNER JOIN doctor d ON dt.doctor_id = d.doctor_id
INNER JOIN treatments t ON dt.treatment_id = t.treatment_id;