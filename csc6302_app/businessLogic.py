"""Michael Mulieri, mulierim@merrimack.edu
    08/10/2024, CSC6302, Mod 6 - Iteration 5 - Users and Connections  
"""

"""Rounding options via decimal library to be used in future iteration to ensure proper 
handling of decimals. Currently program rounds decimals down to the nearest whole number. """
from decimal import ROUND_DOWN, Decimal, InvalidOperation
"""Import DAL to enable methods in DAL file to be accessed by businessLogic file."""
import DAL

def displayPatientsBalance(last_name):
    """Function that displays a patients first name, last name, DOB and current balance.
    Pertinant info is gathered via the getPatientsBalance function of the DAL layer/file.
    Basic validation of input is being done within the executeChoice function. Currently 
    entering a name other than a viable patient will display no results or message, but will revert
    back to the input menu without breaking out of program.
    
    Patient Last Names: Mulieri, Berzatto, Adamu, Fak, Jerimovich, Kalinowski, Wonka, Nova   

    Args:
        last_name (string): Patients Last Name
    """
    """balance variable binds to return of getPatientsBalance method of DAL layer/file."""
    balance = DAL.Con.getPatientsBalance(last_name)
    """Display message if last name does not exist as a patient"""
    if balance == []:
        return 'No Records Found. Enter a valid patient.'
    
    """Iterate through tuple that is returned by getPatientsBalance, format and display info."""
    parsed_balance_info = ''
    for info in balance:
        date_obj = info[2]
        date_string = date_obj.strftime('%m/%d/%Y')
        balance_string = str(info[3])
        parsed_balance_info += 'First Name: ' +info[0]+'\n'' Last Name: '+info[1]+'\n'' DOB: '+date_string+'\n'' Current Balance: $'+balance_string
    return parsed_balance_info

def displayUsersContactInfo(last_name):
    """Function that displays a user(faculty) contact info including, first name, last name, email, phone number, and pager number.
    Info is gathered via the getUsersContactInfo function of the DAL layer/file.
    Basic validation of input is being done within the executeChoice function. Currently 
    entering a name other than a viable user will display no results or message, but will revert
    back to the input menu without breaking out of program.
    
    User Last Names: Grey, Shepherd, Karev, Day, Smith, Levell, Ringwald, Stevens, Macky  

    Args:
        last_name (string): Users Last Name
    """
    """Variable userContactInfo binds to return of getUserContactInfo of the DAL layer/file."""
    userContactInfo = DAL.Con.getUsersContactInfo(last_name)
    if userContactInfo == []:
        return 'No Records Found. Enter a valid faculty member.'
    
    """Iterate through userContactInfo tuple. Fromat and display info."""
    parsedInfo = ''
    for info in userContactInfo:
        parsedInfo += 'First Name: '+info[0]+'\n'' Last Name: ' +info[1]+'\n'' Email: ' +info[2]+'\n'' Phone Number: ' +info[3]+'\n'' Pager Number: '+info[4]
    return parsedInfo

def displayUpdatedBalancePayment(last_name, payment):
    """Function retrieves a patients current balance and updates it based on a received payment.
    Starting balance and updated balance are gathered via updateBalance method of the DAL layer/file.

    Args:
        last_name (string): Patient Last Name
        payment (int): Payment amount
    """
    """starting_balance and updated_balance variables bind to return of updateBalancePayment method of the DAL layer/file."""
    starting_balance, updated_balance = DAL.Con.updateBalancePayment(last_name, payment)
    if starting_balance == None:
        return 'Patient does not exist.'
        
    payment_str = str(payment)
    starting_balance_str = str(starting_balance)
    updated_balance_str = str(updated_balance)
    print('Balance updated successfully.')
    return 'Starting Balance: $'+starting_balance_str+'\n' 'Payment: $'+payment_str+'\n' 'Updated Balance: $'+updated_balance_str
    
def displayUpdatedBalanceCoPay(last_name, coPay):
    """Function retrieves a patients current balance and updates it based on a received payment.
    Starting balance and updated balance are gathered via updateBalance method of the DAL layer/file.

    Args:
        last_name (string): Patient Last Name
        payment (int): Payment amount
    """
    """starting_balance and updated_balance variables bind to return of updateBalancePayment method of the DAL layer/file."""
    starting_balance, updated_balance = DAL.Con.updateBalanceCopay(last_name, coPay)
    if starting_balance == None:
        return 'Patient does not exist.'
    coPay_str = str(coPay)
    starting_balance_str = str(starting_balance)
    updated_balance_str = str(updated_balance)
    print('Balance updated successfully.')
    return 'Starting Balance: $'+starting_balance_str+'\n' 'Co-Pay: $'+coPay_str+'\n' 'Updated Balance: $'+updated_balance_str


# def main(welcomePrompt):    
    
#     if welcomePrompt:
#         print('\nWelcome To Your Patient Management System!\n')
    
#     # displays menu of operation options
#     print('1. Display a Patients Balance.\n2. Display Faculty Members Contact Info\n3. Update Balance After Payment\n4. Update Balance With Co-Pay\n5. Quit')
    
#     # calls executeChoice() method 
#     executeChoice()
    
# def executeChoice():
#     """Function that allows user to choose operation to execute
#     """
    
#     # variable actionChoice binds to user input of desired operation
#     actionChoice = input('Enter number of desired task (1-4): ')
    
#     if actionChoice.strip() == '1':
        
#         """last_name variable bound to user input - strip() removes whitespace from 
#         beginning and end of string, title() capitilizes first character of each word"""
        
#         last_name = input('Enter patients last name?: ').strip().title()
        
#         # check if all characters are letters
#         for letter in last_name:
#             if letter.isalpha() == False:
                
#                 # user entered invalid character and is asked to try again
#                 print('\nERROR - Invalid entry, please try again.\n')
#                 main(False)
                
#         """call displayPatientBalance function with last_name variable as argument"""
                
#         displayPatientsBalance(last_name)

        
#     elif actionChoice.strip() == '2':
    
#         last_name = input('Enter faculty members last name?: ').strip().title()
        
#         # check if all characters are letters
#         for letter in last_name:
#             if letter.isalpha() == False:
                
#                 # user entered invalid character and is asked to try again
#                 print('\nERROR - Invalid entry, please try again.\n')
#                 main(False)
                
#         displayUsersContactInfo(last_name)
        
#     elif actionChoice.strip() == '3':
        
#         last_name = input('Enter patients last name?: ').strip().title()
#         payment = validateEnterAmount()
        
#         """call displayUpdatedBalance function with last_name and payment variables as arguments"""
#         displayUpdatedBalancePayment(last_name, payment)
        
#     elif actionChoice.strip() == '4':
        
#         last_name = input('Enter patients last name?: ').strip().title()
#         coPay = validateEnterAmount()
        
#         """call displayUpdatedBalance function with last_name and payment variables as arguments"""
#         displayUpdatedBalanceCoPay(last_name, coPay)
        
        
            
#     elif actionChoice.strip() == '5':
# #         # exits program and displays goodbye message
#         print('\nGoodbye\n')
#         return
    
# #     # error message displayed if user enters invalid input 
#     else:
#         print('\nERROR - Must enter a valid number.\n')
        
#         main(False)  
    
#     # continueOperation() method called after completion of every operation  
#     continueOperation()
    
# def continueOperation():
#     """method called recursively allowing user to continue operations or exit
# #     """
    
# #     # prompts user for input
#     answer = input('\nWould you like to do more? Y/N: ').strip().lower()
    
# #     # if user does not provide 'y' or 'n' error message displayed
#     while answer != 'y' and answer != 'n':
#         answer = input('\nERROR - Must type Y or N. Would you like to do more? Y/N: ').strip().lower()
    
# #     # calls main() function if user enters 'y' 
#     if answer == 'y':
#         main(False)
    
# #     # displays goodbye message and exits program 
#     elif answer == 'n':
#         print('\nGoodbye\n')
#         return 
    
# def validateEnterAmount():
#     """helper function that checks validity of user input

# #     Returns:
# #         obj: class Decimal
# #     """
    
#     while True:
# #         # prompts user to enter amount
#             try:
#                 amount = Decimal(input('Enter amount: $')).quantize(
#                     Decimal('.01'), rounding=ROUND_DOWN)
            
# #             # if user enters letter or special character, error raised
#             except InvalidOperation:
#                 print('\nERROR - Invalid Input')
                
#             else:
#                 return amount
            
    
# if __name__ == '__main__':
#     # instanciates Con, an instance of the connection class
#     Con = dal.connection()
#     Con.setCredentials()
#     # calls main() function, passes True so welcome prompt is only displayed once
#     main(True)
    

