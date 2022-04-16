//
//  DevicesViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class DevicesViewController: BaseViewController {

    @IBOutlet weak var penSwitch: UISwitch!
    @IBOutlet weak var bgmSwitch: UISwitch!
    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        penSwitch.isOn = false
        bgmSwitch.isOn = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        penSwitch.isOn = (sender == penSwitch)
        bgmSwitch.isOn = (sender == bgmSwitch)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let values = validateSelection()
        if !values.success {
            showAlert(title: values.title, message: values.message)
        }
        return values.success
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? BLEConfirmationViewController ?? BLEConfirmationViewController()
        setDevice()
        destination.userModel = userModel
    }
}

extension DevicesViewController {
    
    func validateSelection() -> (success: Bool, title: String, message: String) {
        
        if !penSwitch.isOn && !bgmSwitch.isOn {
            return (false, "Alert", "Please select any one device")
        }
        return (true, "", "")
    }
    
    func setDevice() {
        if penSwitch.isOn {
            userModel?.deviceType = .pen
        } else {
            userModel?.deviceType = .bgm
        }
    }
}
