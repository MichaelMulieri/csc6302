-- Drop users if they exist
DROP USER IF EXISTS 'dev_main_user'@'%';
DROP USER IF EXISTS 'read_user'@'%';
DROP USER IF EXISTS 'write_user'@'%';

-- Create Users 
CREATE USER 'dev_main_user'@'%' IDENTIFIED BY 'dev1234';
CREATE USER 'read_user'@'%' IDENTIFIED BY 'read1234';
CREATE USER 'write_user'@'%' IDENTIFIED BY 'write1234';

-- Grant privileges and authorization to execute stored procedures and functions to users
GRANT EXECUTE ON PROCEDURE crm.get_patients_balance TO 'read_user'@'%';
GRANT EXECUTE ON PROCEDURE crm.get_users_contact_info TO 'read_user'@'%';
FLUSH PRIVILEGES;

GRANT EXECUTE ON PROCEDURE crm.get_patients_balance TO 'write_user'@'%';
GRANT EXECUTE ON PROCEDURE crm.get_users_contact_info TO 'write_user'@'%';
GRANT EXECUTE ON FUNCTION crm.get_current_balance TO 'write_user'@'%';
GRANT EXECUTE ON FUNCTION crm.calculate_new_balance_payment TO 'write_user'@'%';
GRANT EXECUTE ON FUNCTION crm.calculate_new_balance_copay TO 'write_user'@'%';
GRANT EXECUTE ON PROCEDURE crm.update_balance TO 'write_user'@'%';
FLUSH PRIVILEGES;

-- Drop roles if they exist
DROP ROLE IF EXISTS 'app_developer';
DROP ROLE IF EXISTS 'app_read';
DROP ROLE IF EXISTS 'app_write';

-- Create Roles 
CREATE ROLE 'app_developer';
CREATE ROLE 'app_read';
CREATE ROLE 'app_write';

-- Set privileges to roles
GRANT ALL ON crm.* TO 'app_developer';
GRANT SELECT ON crm.* TO 'app_read';
GRANT INSERT, UPDATE, DELETE ON crm.* TO 'app_write';

-- Grant priviliges to users
GRANT 'app_developer' TO 'dev_main_user'@'%';
FLUSH PRIVILEGES;

GRANT 'app_read' TO 'read_user'@'%';
FLUSH PRIVILEGES;

GRANT 'app_write', 'app_read' TO 'write_user'@'%';
FLUSH PRIVIlEGES;