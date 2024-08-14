/*
Michael Mulieri, mulierim@merrimack.edu
CSC6302, Project 6 - Iteration 5, 08/10/2024
*/

-- File to insert data into tables
INSERT INTO contact_info (contact_type, email, phone_number, pager_number) 
VALUES ('user', 'DrMGrey@GreySloanMemorialHospital.com', '8972256354', '8975866963');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('Meredith', 'Grey', 'Thursday/Friday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '5687 Scalpel Circle', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'General Surgeon', TRUE);

INSERT INTO contact_info (contact_type, email, phone_number, pager_number)
VALUES ('user', 'DrDShepherd@GreySloanMemorilHospital.com', '8974562521', '8976937818');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('Derek', 'Shepherd', 'Saturday/Sunday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '325 Suture Avenue', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'Neuro Surgeon', TRUE);

INSERT INTO contact_info (contact_type, email, phone_number, pager_number)
VALUES ('user', 'DrAKarev@GreySloanMemorilHospital.com', '8975462589', '8974714756'); 
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('Alex', 'Karev', 'Monday/Tuesday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '283 Surgery Lane', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'General Surgeon', TRUE);

INSERT INTO contact_info (contact_type, email, phone_number, pager_number)
VALUES ('user', 'SherryDay@GreySloanBilling.com', '5896542415', NULL);
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('Sherry', 'Day', 'Tuesday/Wednesday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '7963 Excell Court', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'Billing Administrator', TRUE);

INSERT INTO contact_info (contact_type, email, phone_number, pager_number)
VALUES ('user', 'MSmith@GreySloanSchedules', '6352589645', NULL);
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('Mick', 'Smith', 'Thursday/Friday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '25 Daisy Boulevard', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'Surgical Scheduling Administrator', FALSE);

INSERT INTO contact_info (contact_type, email, phone_number, pager_number)
VALUES ('user', 'NLevell@GreySloanHr.com', '8975525546', NULL);
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('Nancy', 'Levell', 'Saturday/Sunday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '782 5th Street', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'Human Resources', FALSE);

INSERT INTO contact_info (contact_type, email, phone_number, pager_number)
VALUES ('user', 'MRingwald@GreySloanBilling.com', '8975525563', NULL);
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('Molly', 'Ringwald', 'Thursday/Friday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '89 Pink Street', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'Human Resources', FALSE);

INSERT INTO contact_info (contact_type, email, phone_number, pager_number)
VALUES ('user', 'DrOMalley@GreySloanHospital.com', '8975822546', '8975552366');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('George', 'O\'\Malley', 'Thursday/Friday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '255 Oak Street', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'General Surgeon', TRUE);

INSERT INTO contact_info (contact_type, email, phone_number, pager_number)
VALUES ('user', 'DrStevens@GreySloanHospital.com', '3695545587', '8975233012');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('Izzie', 'Stevens', 'Mondy/Tuesday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '60-96 Crocs Circle', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'General Surgeon', TRUE);

INSERT INTO contact_info (contact_type, email, phone_number, pager_number)
VALUES ('user', 'JoeMacky@GreySloanHr.com', '8975566328', NULL);
SET @contact_id = LAST_INSERT_ID();
INSERT INTO users (first_name, last_name, regular_days_off, contact_id) 
VALUES ('Joe', 'Macky', 'Friday/Saturday', @contact_id);
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '7 125th Street', 'Seatle', 'WA', '11568');
SET @user_id = LAST_INSERT_ID();
INSERT INTO user_roles (role_id, title, patient_records_access) 
VALUES (@user_id, 'Billing Administrator', FALSE);

INSERT INTO contact_info (contact_type, email, phone_number) 
VALUES ('patient', 'mulierim@merrimack.edu', '5161234567');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO patients (first_name, last_name, date_of_birth, contact_id) 
VALUES ('Mike', 'Mulieri', '1981-12-24', @contact_id);
SET @patient_id = LAST_INSERT_ID();
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '456 CS Lane', 'New York', 'NY', '11435');
INSERT INTO billing (billing_id, insurance_carrier, policy_id, balance) 
VALUES (@patient_id, 'GHI','K23890034561', 250.00);
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2024-09-15', '07:00:00', 'miniscus surgery, right knee', 'O\'\Malley');
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2024-12-15', '10:15:00', 'Follow up to right knee miniscus surgery', 'O\'\Malley');

INSERT INTO contact_info (contact_type, email, phone_number) 
VALUES ('patient', 'carmen@thebear.com', '3127896541');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO patients (first_name, last_name, date_of_birth, contact_id) 
VALUES ('Carmen', 'Berzatto', '1988-09-07', @contact_id);
SET @patient_id = LAST_INSERT_ID();
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '123 One Star Road', 'Chicago', 'IL', '10236');
INSERT INTO billing (billing_id, insurance_carrier, policy_id, balance) 
VALUES (@patient_id, 'Blue Cross Blue Shield', 'M89675340766', 567.00);
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2024-08-25', '11:30:00', 'MRI of lower back', 'Grey');

INSERT INTO contact_info (contact_type, email, phone_number) 
VALUES ('patient', 'sydney@thebear.com', '3125622352');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO patients (first_name, last_name, date_of_birth, contact_id) 
VALUES ('Sydney', 'Adamu', '1995-05-19', @contact_id);
SET @patient_id = LAST_INSERT_ID();
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '787 ChiTown Lane', 'Chicago', 'IL', '10236');
INSERT INTO billing (billing_id, insurance_carrier, policy_id, balance) 
VALUES (@patient_id, 'GHI', 'K90071314557', 700.00);
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2025-01-18', '09:00:00', 'Repair rotator cuff, surgery', 'Stevens');

INSERT INTO contact_info (contact_type, email, phone_number) 
VALUES ('patient', 'Nfak@thebear.com', '3128596332');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO patients (first_name, last_name, date_of_birth, contact_id) 
VALUES ('Neil', 'Fak', '1988-09-03', @contact_id);
SET @patient_id = LAST_INSERT_ID();
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '65 Ditmars Street', 'Chicago', 'IL', '11589');
INSERT INTO billing (billing_id, insurance_carrier, policy_id, balance) 
VALUES (@patient_id, 'Blue Cros Blue Shield', 'K45222396587', 50.00);
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2023-07-03', '10:15:00', 'Consultation, pain in left elbow', 'Stevens');

INSERT INTO contact_info (contact_type, email, phone_number) 
VALUES ('patient', 'Rjerimovich@thebear.com', '3127885249');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO patients (first_name, last_name, date_of_birth, contact_id) 
VALUES ('Richard', 'Jerimovich', '1987-12-23', @contact_id);
SET @patient_id = LAST_INSERT_ID();
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '145-96 7th Avenue', 'Chicago', 'IL', '11587');
INSERT INTO billing (billing_id, insurance_carrier, policy_id, balance) 
VALUES (@patient_id, 'Cigna', 'C89666314452', 250.00);
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2024-11-11', '08:45:00', 'Replace pacemaker, surgery', 'Karev');
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2024-12-20', '10:00:00', 'Follow up to pacemaker replacement', 'Karev');
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2025-03-12', '10:00:00', 'Follow up to pacemaker replacement', 'Karev');

INSERT INTO contact_info (contact_type, email, phone_number) 
VALUES ('patient', 'Jkalinowski@thebear.com', '3126996936');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO patients (first_name, last_name, date_of_birth, contact_id) 
VALUES ('Jimmy', 'Kalinowski', '1969-09-28', @contact_id);
SET @patient_id = LAST_INSERT_ID();
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '36 Investment Lane', 'Chicago', 'IL', '11568');
INSERT INTO billing (billing_id, insurance_carrier, policy_id, balance) 
VALUES (@patient_id, 'Cigna', 'C88896521136', 630.00);
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2024-09-12', '08:15:00', 'MRI of brain', 'Shepherd');

INSERT INTO contact_info (contact_type, email, phone_number) 
VALUES ('patient', 'Willywonka@wonka.com', '5322558521');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO patients (first_name, last_name, date_of_birth, contact_id) 
VALUES ('Willy', 'Wonka', '2001-01-30', @contact_id);
SET @patient_id = LAST_INSERT_ID();
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '59 Oompa Loompa Lane', 'New York', 'NY', '11580');
INSERT INTO billing (billing_id, insurance_carrier, policy_id, balance) 
VALUES (@patient_id, 'Cigna', 'C89996322587', 100.00);
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2024-06-05', '10:45:00', 'MRI of neck', 'Karev');

INSERT INTO contact_info (contact_type, email, phone_number) 
VALUES ('patient', 'nova1@gmail.com', '2554563896');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO patients (first_name, last_name, date_of_birth, contact_id) 
VALUES ('Jesse', 'Nova', '1999-10-07', @contact_id);
SET @patient_id = LAST_INSERT_ID();
INSERT INTO address(address_id, street, city, state, zip)
VALUES (@contact_id, '125-25 Parsons Boulevard', 'New York', 'NY', '11435');
INSERT INTO billing (billing_id, insurance_carrier, policy_id, balance) 
VALUES (@patient_id, 'GHI', 'K88877522698', 25.00);
INSERT INTO patient_appointments (patient_appointment_id, appointment_date, appointment_time, reason, doctor)
VALUES (@patient_id, '2025-01-03', '08:15:00', 'MRI of left shoulder', 'Grey');




