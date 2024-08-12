"""Michael Mulieri, mulierim@merrimack.edu
    08/10/2024, CSC6302, Mod 6 - Iteration 5 - Users and Connections
    
    A program that connects to a mysql database and facilitates calling stored procedures and functions.
    Info accessed via mysql stored proceedures and functions are then displayed via a Toga App.     
    
    To run program cd to csc6302_app folder in terminal and type 'python -m view'.
    If needed, install Toga into your virtual environment by 'typing python -m pip install toga' in terminal.
    Run database before running Toga App.
        
"""

import toga
from toga.style.pack import COLUMN, LEFT, RIGHT, ROW, CENTER, Pack
import businessLogic as BL

def button_handler_faculty_contact(widget, contact_input, contact_info_label):
    last_name = contact_input.value
    contact_info = BL.displayUsersContactInfo(last_name)
    contact_info_label.text = contact_info
    # print(contact_info)

def button_handler_patients_balance(widget, patient_input, patient_info_label):
    last_name = patient_input.value
    patient_balance_info = BL.displayPatientsBalance(last_name)
    patient_info_label.text = patient_balance_info
    # print(patient_balance_info)
    
def button_handler_patients_payment(widget, patient_balance_payment_LN_placeholder_box, patient_balance_payment_placeholder_box, patient_balance_payment_input_box):
    last_name = patient_balance_payment_LN_placeholder_box.value
    payment = patient_balance_payment_placeholder_box.value
    patient_balance_info = BL.displayUpdatedBalancePayment(last_name, payment)
    patient_balance_payment_input_box.text = patient_balance_info
    # print(patient_balance_info)
    
def button_handler_patients_copay(widget, patient_balance_copay_LN_placeholder_box, patient_balance_copay_placeholder_box, patient_balance_copay_input_box):
    last_name = patient_balance_copay_LN_placeholder_box.value
    copay = patient_balance_copay_placeholder_box.value
    patient_balance_info = BL.displayUpdatedBalanceCoPay(last_name, copay)
    patient_balance_copay_input_box.text = patient_balance_info
    # print(patient_balance_info)
    
def reset_handler(widget, *fields):
    for field in fields:
        field.value = ''
        if isinstance(field, toga.Label):
            field.text = ''
        
def build(app):
    
    box = toga.Box(style=Pack(direction=COLUMN, padding=10))

    faculty_contact_box = toga.Box(style=Pack(direction=COLUMN, padding=10))
    
    faculty_contact_placeholder = toga.TextInput(placeholder='Faculty Last Name', style=Pack(padding=(0, 100)))
    
    faculty_contact_input_box = toga.Label('', style=Pack(padding=(5, 5), text_align=CENTER))
    
    faculty_contact_button = toga.Button("Get Faculty Contact Info", on_press=lambda widget: button_handler_faculty_contact(widget, faculty_contact_placeholder, faculty_contact_input_box), style=Pack(padding=(0, 100)))
    
    faculty_contact_reset_button = toga.Button("Reset", on_press=lambda widget: reset_handler(widget, faculty_contact_placeholder, faculty_contact_input_box), style=Pack(padding=(10, 125)))
    
    faculty_contact_box.add(faculty_contact_placeholder)
    faculty_contact_box.add(faculty_contact_input_box)
    faculty_contact_box.add(faculty_contact_button)
    faculty_contact_box.add(faculty_contact_reset_button)
    
    box.add(faculty_contact_box)
    

    patient_balance_box = toga.Box(style=Pack(direction=COLUMN, padding=10))
    
    patient_balance_placeholder_box = toga.TextInput(placeholder='Patient Last Name', style=Pack(direction=COLUMN, padding=(0, 100)))
    
    patient_balance_input_box = toga.Label('', style=Pack(padding=(5, 5), text_align=CENTER))
    
    patient_balance_button = toga.Button("Get Patients Balance", on_press=lambda widget: button_handler_patients_balance(widget, patient_balance_placeholder_box, patient_balance_input_box), style=Pack(padding=(0, 100)))
    
    patient_balance_payment_reset_button = toga.Button("Reset", on_press=lambda widget: reset_handler(widget, patient_balance_placeholder_box, patient_balance_input_box), style=Pack(padding=(5, 125)))
    
    patient_balance_box.add(patient_balance_placeholder_box)
    patient_balance_box.add(patient_balance_input_box)
    patient_balance_box.add(patient_balance_button)
    patient_balance_box.add(patient_balance_payment_reset_button)
    
    box.add(patient_balance_box)
    
    
    patient_balance_payment_box = toga.Box(style=Pack(direction=COLUMN, padding=10))
    
    patient_balance_payment_LN_placeholder_box = toga.TextInput(placeholder='Patient Last Name', style=Pack(direction=COLUMN, padding=(5, 100)))
    patient_balance_payment_placeholder_box = toga.TextInput(placeholder='Payment', style=Pack(direction=COLUMN, padding=(0, 100)))
    
    patient_balance_payment_input_box = toga.Label('', style=Pack(padding=(5, 5), text_align=CENTER))
    
    patient_balance_payment_button = toga.Button("Update Patients Balance (- Payment)", on_press=lambda widget: button_handler_patients_payment(widget, patient_balance_payment_LN_placeholder_box, patient_balance_payment_placeholder_box, patient_balance_payment_input_box), style=Pack(padding=(0, 100)))
    
    patient_balance_payment_reset_button = toga.Button("Reset", on_press=lambda widget: reset_handler(widget, patient_balance_payment_LN_placeholder_box, patient_balance_payment_placeholder_box, patient_balance_payment_input_box), style=Pack(padding=(5, 125)))
    
    patient_balance_payment_box.add(patient_balance_payment_LN_placeholder_box)
    patient_balance_payment_box.add(patient_balance_payment_placeholder_box)
    patient_balance_payment_box.add(patient_balance_payment_input_box)
    patient_balance_payment_box.add(patient_balance_payment_button)
    patient_balance_payment_box.add(patient_balance_payment_reset_button)
    
    box.add(patient_balance_payment_box)
    
    
    patient_balance_copay_box = toga.Box(style=Pack(direction=COLUMN, padding=10))
    
    patient_balance_copay_LN_placeholder_box = toga.TextInput(placeholder='Patient Last Name', style=Pack(direction=COLUMN, padding=(5, 100)))
    patient_balance_copay_placeholder_box = toga.TextInput(placeholder='Co-pay', style=Pack(direction=COLUMN, padding=(0, 100)))
    
    patient_balance_copay_input_box = toga.Label('', style=Pack(padding=(5, 5), text_align=CENTER))
    
    patient_balance_copay_button = toga.Button("Update Patients Balance (+ Co-Pay)", on_press=lambda widget: button_handler_patients_copay(widget, patient_balance_copay_LN_placeholder_box, patient_balance_copay_placeholder_box, patient_balance_copay_input_box), style=Pack(padding=(0, 100)))
    
    patient_balance_copay_reset_button = toga.Button("Reset", on_press=lambda widget: reset_handler(widget, patient_balance_copay_LN_placeholder_box, patient_balance_copay_placeholder_box, patient_balance_copay_input_box), style=Pack(padding=(5, 125)))
    
    patient_balance_copay_box.add(patient_balance_copay_LN_placeholder_box)
    patient_balance_copay_box.add(patient_balance_copay_placeholder_box)
    patient_balance_copay_box.add(patient_balance_copay_input_box)
    patient_balance_copay_box.add(patient_balance_copay_button)
    patient_balance_copay_box.add(patient_balance_copay_reset_button)
    
    box.add(patient_balance_copay_box)
    
    
    return box

def main():
    return toga.App("CRM", "CRM App", startup=build)

if __name__ == "__main__":
    main().main_loop()
    