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

    var userModel: UserModel = UserModel(firstName: "", lastName: "", emailId: "", address: "", pinCode: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        userModel = setUserData()
        let values = validateField(usermodel: userModel)
        if !values.success {
            showAlert(title: values.title, message: values.message)
        }
        return values.success
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DevicesViewController ?? DevicesViewController()
        destination.userModel = userModel
    }
}

extension UserDetailsViewController {
    
    func validateField(usermodel: UserModel) -> (success: Bool, title: String, message: String) {
        
        if usermodel.firstName.isEmpty ||
            usermodel.lastName.isEmpty ||
            usermodel.emailId.isEmpty ||
            usermodel.address.isEmpty ||
            usermodel.pinCode.isEmpty {

            return (false, "Missing Details", "Please fill all Text Fields to continue")
            
        } else if !usermodel.emailId.isValidEmail {

            return (false, "Alert", "Please enter valid Email Id")
        }
        return (true, "", "")
    }
    
    func setUserData() -> UserModel {
        let model = UserModel(firstName: firstName.trimmedText,
                              lastName: lastName.trimmedText,
                              emailId: emailId.trimmedText,
                              address: address.trimmedText,
                              pinCode: pinCode.trimmedText)
        return model
    }
}
