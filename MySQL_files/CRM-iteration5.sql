/*
Michael Mulieri, mulierim@merrimack.edu
CSC6302, Project 6 - Iteration 5, 08/10/2024

Please run mysql files in following order: CRM

Database Schema:

contact_info(contact_id: int, contact_type: ENUM, email: varchar(50), phone_number: varchar(10), pager_number: int, address: varchar(200), created_at: Timestamp,
Primary Key: contact_id)

address(id: int, address_id: int, street: varchar, city: varchar, state: varchar, zip: varchar, created_at: Timestamp,
Primary Key: id, Foreign Key address_id references contact_info(contact_id))

users(user_id: int, first_name: varchar(50), last_name: varchar(50), regular_days_off: VARCHAR, contact_id: int, date_created: Timestamp,
Primary Key: user_id, Foreign Key contact_id REFERENCES contact_info(contact_id))

patients(patient_id: int, first_name: varchar(50), last_name: varchar(50), date_of_birth: varchar(8), date_created: Timestamp, Primary Key: patient_id)

user_roles(id: int, title: varchar(50), patient_records_access: boolean, date_created: Timestamp, Foreign Key: user references users(id)) 

billing(id: int, insurance: varchar(100), policy_number: varchar(10), balance: int, Primary Key: id,
Foreign Key: patient references patients(id))

patient_appointments(patient_appointment_id: int, patient_appointment_id: int, appointment_date: DATE, appointment_time: TIME, reason: VARCHAR, doctor: ENUM,
created_at: Timestamp, Primary Key: id, Foreign Key: patient_appointment_id REFERENCES patients(contact_id))

*/

-- Drop CRM Database each time script is run
DROP DATABASE IF EXISTS crm;

-- Check if database exists
CREATE DATABASE IF NOT EXISTS crm;

-- Specify database to use
USE crm;

/*Create the contact_info table if it does not exist.
Consolidated user_contact_info table and contact_info table into one
table: contact_info.
*/
CREATE TABLE IF NOT EXISTS contact_info(
contact_id INT AUTO_INCREMENT PRIMARY KEY,
contact_type ENUM('user', 'patient') NOT NULL,
email VARCHAR(50) NOT NULL,
phone_number VARCHAR(10) NOT NULL,
pager_number VARCHAR(10),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*Create address table if it does not exist
address table decomposed from contact_info table
*/
CREATE TABLE IF NOT EXISTS address(
id INT AUTO_INCREMENT PRIMARY KEY,
address_id INT,
street VARCHAR(200),
city VARCHAR(50),
state VARCHAR(5),
zip VARCHAR(5),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (address_id) REFERENCES contact_info(contact_id)
);

-- Create the users table if it does not exist
CREATE TABLE IF NOT EXISTS users(
user_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
regular_days_off VARCHAR(50) NOT NULL,
contact_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (contact_id) REFERENCES contact_info(contact_id)
);

-- Create the patients table if it does not exist
CREATE TABLE IF NOT EXISTS patients(
patient_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(100) NOT NULL,
date_of_birth DATE NOT NULL,
contact_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (contact_id) REFERENCES contact_info(contact_id)
);

/*Create the roles table if it does not exist.
Types of roles limited via title ENUM()
*/
CREATE TABLE IF NOT EXISTS user_roles(
id INT AUTO_INCREMENT PRIMARY KEY,
role_id INT NOT NULL,
title ENUM('General Surgeon', 'Neuro Surgeon', 'Billing Administrator', 'Surgical Scheduling Administrator', 'Human Resources'), 
patient_records_access BOOLEAN NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (role_id) REFERENCES users(user_id)
);

-- Create the billing table if it does not exist
CREATE TABLE IF NOT EXISTS billing(
id INT AUTO_INCREMENT PRIMARY KEY,
billing_id INT NOT NULL,
insurance_carrier VARCHAR(50) NOT NULL, 
policy_id VARCHAR(12) NOT NULL,
balance INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (billing_id) REFERENCES patients(patient_id)
);

-- Create patient_appointment table if it does not exist
CREATE TABLE IF NOT EXISTS patient_appointments(
id INT AUTO_INCREMENT PRIMARY KEY,
patient_appointment_id INT,
appointment_date DATE,
appointment_time TIME,
reason VARCHAR(50),
doctor ENUM('Grey', 'Shepherd', 'Karev', 'O\'\Malley', 'Stevens'),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (patient_appointment_id) REFERENCES patients(patient_id)
);
































