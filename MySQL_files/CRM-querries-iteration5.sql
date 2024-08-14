
-- Create a view to see patient name, date of birth, past and future appointments as well as assigned doctor.
DROP VIEW IF EXISTS patient_info_with_appointments;
CREATE VIEW patient_info_with_appointments AS
SELECT first_name AS FN, last_name AS LN, date_of_birth AS DOB, appointment_date AS App_Date, appointment_time AS App_Time, reason AS Reason, 
doctor AS Doctor 
FROM patients INNER JOIN patient_appointments ON patient_appointment_id = patients.contact_id;

SELECT *
FROM patient_info_with_appointments; 

-- Show stored procedures of current database
SHOW PROCEDURE STATUS WHERE Db = 'CRM';

-- Call get_patients_balance procedure
CALL get_patients_balance('Mulieri');
CALL get_patients_balance('Jerimovich');
CALL get_patients_balance('Wonka');

-- Call get_users_contact_info procedure
CALL get_users_contact_info('Grey');
CALL get_users_contact_info('Stevens');
CALL get_users_contact_info('Shepherd');

-- Call stored functions

-- Create variable current_balance initialized to 0.
SET @current_balance:= 0;

-- Bind variable current_balance to return of function get_current_balance.
SET @current_balance = get_current_balance('Mulieri');

-- Display current_balance via variable current_balance
SELECT @current_balance;

/*Call function update_balance. First parameter is a payment, second parameter is the 
current balance derived from the variable current_balance. 
*/
SELECT update_balance(25, @current_balance) AS New_Balance;

SET @current_balance:= 0;

SET @current_balance = get_current_balance('Adamu');
SELECT @current_balance;
SELECT update_balance(500, @current_balance) AS New_Balance;

SET @current_balance:= 0;

SET @current_balance = get_current_balance('Fak');
SELECT @current_balance;
SELECT update_balance(50, @current_balance) AS New_Balance;

SET @current_balance = get_current_balance('Mulieri');
SELECT @current_balance;
SELECT calculate_new_balance_copay(100, @current_balance);

SELECT balance
FROM billing JOIN patients ON billing_id = patient_id
WHERE last_name = 'Mulieri';

-- Check if database exists
SHOW DATABASES LIKE 'crm';

-- Check that users and roles are granted proper privileges
SHOW GRANTS FOR 'read_user'@'%';
SHOW GRANTS FOR 'app_read';

SHOW GRANTS FOR 'write_user'@'%';
SHOW GRANTS FOR 'app_write';

SHOW GRANTS FOR 'dev_main_user'@'%';
SHOW GRANTS FOR 'dev_user';







                    





 

