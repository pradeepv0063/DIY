//
//  DataValidationViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class DataValidationViewController: BaseViewController, BluetoothNotification {

    @IBOutlet weak var selectedDevice: UITextField!
    @IBOutlet weak var serialNo: UITextField!
    @IBOutlet weak var deviceVersion: UITextField!
    @IBOutlet weak var deviceName: UITextField!
    
    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedDevice.text = userModel?.deviceType.rawValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribe()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribe()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let values = validate(serialNo: serialNo.text, deviceVersion: deviceVersion.text, deviceName: deviceName.text)
        if !values.success {
            showAlert(title: values.title, message: values.message) {
                guard let deviceScreen = self.navigationController?.viewControllers[2] else { return }
                self.navigationController?.popToViewController(deviceScreen, animated: true)
            }
        }
        return values.success
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? SuccessViewController ?? SuccessViewController()
        destination.userModel = userModel
    }
}

extension DataValidationViewController {
    
    func validate(serialNo: String?, deviceVersion: String?, deviceName: String?) -> (success: Bool, title: String, message: String) {
        
        if serialNo.isCaseInsensitiveEqual(to: userModel?.serialNo),
            deviceVersion.isCaseInsensitiveEqual(to: userModel?.deviceVersion),
            deviceName.isCaseInsensitiveEqual(to: userModel?.deviceName) {
            return (true, "", "")
        }
        
        return (false, "Error", "Entered data did not match")
    }
}
