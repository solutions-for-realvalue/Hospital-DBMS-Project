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

