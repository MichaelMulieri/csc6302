
-- Procedures

-- Procedure to display a patients balance, as well as first name, last name and DOB
DELIMITER $$

DROP PROCEDURE IF EXISTS get_patients_balance $$
CREATE PROCEDURE get_patients_balance 
( IN last_name VARCHAR(20) )
BEGIN
    SELECT p.first_name AS FN, p.last_name AS LN, p.date_of_birth AS DOB, b.balance AS Balance
    FROM patients p
    INNER JOIN billing b ON b.billing_id = p.patient_id
    WHERE p.last_name = last_name;
END $$

DELIMITER ;


-- Procedure to display a users contact info including first name, last name, email, phone number and pager number
DELIMITER $$

DROP PROCEDURE IF EXISTS get_users_contact_info $$
CREATE PROCEDURE get_users_contact_info
( IN last_name VARCHAR(20) )
BEGIN
	SELECT u.first_name AS FN, u.last_name AS LN, c.email AS Email, c.phone_number AS Phone, c.pager_number AS Pager
    FROM users u
    INNER JOIN contact_info c ON c.contact_id = u.contact_id
    WHERE u.last_name = last_name AND c.contact_type = 'user';
    
END $$

DELIMITER ;

-- Functions

-- Function to get a patients current balance
DELIMITER $$

DROP FUNCTION IF EXISTS get_current_balance $$

CREATE FUNCTION get_current_balance
( last_name VARCHAR(20) )
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE current_balance INT;
    
    SELECT b.balance
    INTO current_balance
    FROM billing b
    INNER JOIN patients p ON p.patient_id = b.billing_id
    WHERE p.last_name = last_name
    LIMIT 1; 

    RETURN current_balance;
END $$

DELIMITER ;

-- Function to calculate a patients new balance after payment
DELIMITER $$

DROP FUNCTION IF EXISTS calculate_new_balance_payment $$
CREATE FUNCTION calculate_new_balance_payment
( amount_paid INT, 
current_balance INT )
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE new_balance INT;
    SET new_balance =  current_balance - amount_paid;
    RETURN new_balance;
END $$

DELIMITER ;

-- Function to calculate a patients new balance after service provided
DELIMITER $$

DROP FUNCTION IF EXISTS calculate_new_balance_copay $$
CREATE FUNCTION calculate_new_balance_copay
( coPay INT, 
current_balance INT )
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE new_balance INT;
    SET new_balance =  current_balance + coPay;
    RETURN new_balance;
END $$

DELIMITER ;

-- Procedure to update a patients balance after payment
DELIMITER $$

DROP PROCEDURE IF EXISTS update_balance $$
CREATE PROCEDURE update_balance
( IN last_name VARCHAR(20), 
new_balance INT )
BEGIN
	UPDATE billing b
    INNER JOIN patients p ON b.billing_id = p.patient_id 
	SET balance = new_balance
    WHERE p.last_name = last_name;
    COMMIT;
END $$

DELIMITER ;


 
