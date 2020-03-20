//
//  AddContactViewController.swift
//  ContactsApp_AHiOS16
//
//  Created by Stephanie Ballard on 3/19/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

protocol ContactDelegate {
    func addContact(_ contact: Contact)
}

class AddContactViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var delegate: ContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        phoneNumberTextField.delegate = self
        nameTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text,
            !name.isEmpty else { return }
        guard let phoneNumber = phoneNumberTextField.text,
            !phoneNumber.isEmpty else { return }
        
        let contact = Contact(name: name, phoneNumber: phoneNumber)
        delegate?.addContact(contact)
        navigationController?.popToRootViewController(animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddContactViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            nameTextField.resignFirstResponder()
            phoneNumberTextField.becomeFirstResponder()
            return true
        } else if textField == phoneNumberTextField {
            phoneNumberTextField.resignFirstResponder()
            return false
        }
        return true
    }
}
