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

