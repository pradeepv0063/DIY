//
//  DataValidationViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class DataValidationViewController: BaseViewController {

    @IBOutlet weak var selectedDevice: UITextField!
    @IBOutlet weak var serialNo: UITextField!
    @IBOutlet weak var deviceVersion: UITextField!
    @IBOutlet weak var deviceName: UITextField!
    
    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedDevice.text = userModel?.deviceType.rawValue
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let status = validate()
        return status
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? SuccessViewController ?? SuccessViewController()
        destination.userModel = userModel
    }
}

private extension DataValidationViewController {
    
    func validate() -> Bool {
        
        if serialNo.text == userModel?.serialNo, deviceVersion.text == userModel?.deviceVersion, deviceName.text == userModel?.deviceName {
            return true
        }
        showAlert(title: "Error", message: "Entered data did not match") {
            guard let deviceScreen = self.navigationController?.viewControllers[2] else { return }
            self.navigationController?.popToViewController(deviceScreen, animated: true)
        }
        return false
    }
}
