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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        penSwitch.isOn = (sender == penSwitch)
        bgmSwitch.isOn = (sender == bgmSwitch)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        validateSelection()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setDevice()
    }
    
    private func validateSelection() -> Bool {
        
        if !penSwitch.isOn && !bgmSwitch.isOn {
            showAlert(title: "Alert", message: "Please select any one device")
            return false
        }
        return true
    }
    
    func setDevice() {
        if penSwitch.isOn {
            userModel?.deviceType = .pen
        } else {
            userModel?.deviceType = .bgm
        }
    }
}
