//
//  UserDetailsViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class UserDetailsViewController: BaseViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var pinCode: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        validateField()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DevicesViewController ?? DevicesViewController()
        destination.userModel = setUserData()
    }
}

private extension UserDetailsViewController {
    
    func validateField() -> Bool {
        if firstName.text!.isEmpty ||
            lastName.text!.isEmpty ||
            emailId.text!.isEmpty ||
            address.text!.isEmpty ||
            pinCode.text!.isEmpty {
            
            showAlert(title: "Missing Details", message: "Please fill all Text Fields to continue")
            return false
        } else if !emailId.text!.isValidEmail {
            showAlert(title: "Alert", message: "Please enter valid Email Id")
        }
        return true
    }
    
    func setUserData() -> UserModel {
        let model = UserModel(firstName: firstName.text!,
                              lastName: lastName.text!,
                              emailId: emailId.text!,
                              address: address.text!,
                              pinCode: pinCode.text!)
        return model
    }
}
