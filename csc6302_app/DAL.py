"""Michael Mulieri, mulierim@merrimack.edu
    08/10/2024, CSC6302, Mod 6 - Iteration 5 - Users and Connections
    
    A program that connects to a mysql database and facilitates calling stored procedures and functions.
    Info accessed via mysql stored proceedures and functions are then displayed in the terminal.    
    
    *** To run program cd to csc6302_app folder and type 'python -m view' ***
"""

"""mysql connector module used to connect to outside mysql database."""
import mysql.connector
from mysql.connector import errorcode

class Connection:
    """This class instatiates a connection variable as well as a cursor variale set to None as default.
    """
    
    def __init__(self):
        self.dbCnx = None
        self.cursor = None
    
    def refreshCursor(self):
        """This class method supplies specific functionality to close cursor. 
        """
        if self.cursor:
            self.cursor.close()
        if self.dbCnx:
            self.dbCnx.close()
        self.dbCnx = None
        self.cursor = None

    def setCredentials(self, type):
        """This method connects the proper user to a mysql database .
        """
        try:
            if type == 'read':
                self.dbCnx = mysql.connector.connect(host = 'localhost', user = 'read_user', password = 'read1234', database = 'crm')

            elif type == 'write':
                self.dbCnx = mysql.connector.connect(host = 'localhost', user = 'write_user', password = 'write1234', database = 'crm')
                    
            elif type == 'dev':
                self.dbCnx = mysql.connector.connect(host="localhost", user= 'dev_main_user', password = 'dev1234', database = 'crm')
            
            if self.dbCnx:    
                return self.dbCnx
        
        except mysql.connector.Error as e:
            if e.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                print('Unable to log in, please try again.')
            elif e.errno == errorcode.ER_BAD_DB_ERROR:
                print('Unable to locate database.')
            else:
                print(e)
                
    """The methods below retrieve info via stored proceedures and functions of the connected
    database. connection_type variable is passed to the setCredentials() method to ensure the 
    proper user is accessing the database with coresponding privileges.  
    """   
    def getPatientsBalance(self, lastName):
        connection_type = 'read'
        self.connection = Con.setCredentials(connection_type)
        
        if self.connection:
            self.cursor = self.connection.cursor()
        
            self.cursor.callproc('get_patients_balance', (lastName,))
        
            for result in self.cursor.stored_results():
                return result.fetchall()
            self.refreshCursor()
            
    def getUsersContactInfo(self, lastName):
        connection_type = 'read'
        self.connection = Con.setCredentials(connection_type)
        
        if self.connection:
            self.cursor = self.connection.cursor()
            self.cursor.callproc('get_users_contact_info', (lastName,))
        
            for result in self.cursor.stored_results():
                return result.fetchall()
            self.refreshCursor()
            
    def updateBalancePayment(self, lastName, payment):
        connection_type = 'write'
        self.connection = Con.setCredentials(connection_type)
        if self.connection:
            self.cursor = self.connection.cursor()
        """This function updates a patients balance in the database after a 
        payment is received.

        Args:
            lastName (string): patients last name
            payment (int): payment received

        Returns:
            int, int: previous balance, updated balance
        """
        try:
            self.cursor.execute('SELECT get_current_balance(%s)', (lastName,))
            currentBalance = self.cursor.fetchone()[0]
            
            self.cursor.execute('SELECT calculate_new_balance_payment(%s, %s)', (payment, currentBalance))
            newBalance = self.cursor.fetchone()[0]
            
            self.cursor.callproc('update_balance', (lastName, newBalance,))
            
            self.refreshCursor()
            
            return currentBalance, newBalance
            
        except Exception as e:
            print(f"An error occurred: {e}")
            self.refreshCursor()
            
    def updateBalanceCopay(self, lastName, coPay):
        connection_type = 'write'
        self.connection = Con.setCredentials(connection_type)
        if self.connection:
            self.cursor = self.connection.cursor()
        """This function updates a patients balance in the database after coPay is added.

        Args:
            lastName (string): patients last name
            coPay (int): coPay amount

        Returns:
            int, int: previous balance, updated balance
        """
        try:
            self.cursor.execute('SELECT get_current_balance(%s)', (lastName,))
            currentBalance = self.cursor.fetchone()[0]
        
            self.cursor.execute('SELECT calculate_new_balance_copay(%s, %s)', (coPay, currentBalance))
            newBalance = self.cursor.fetchone()[0]
        
            self.cursor.callproc('update_balance', (lastName, newBalance,))
        
            self.refreshCursor()
            
            return currentBalance, newBalance
        
        except Exception as e:
            print(f"An error occurred: {e}")
            self.refreshCursor()
            
Con = Connection()
# Con.setCredentials()
        
        