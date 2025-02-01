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



