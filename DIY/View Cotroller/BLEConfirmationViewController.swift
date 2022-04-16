//
//  BLEConfirmationViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class BLEConfirmationViewController: BaseViewController {

    @IBOutlet weak var imageView: UIImageView!
    var userModel: UserModel?
    var bleHelper: BLEHelpProvidable = BLEHelper.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bleHelper.initiate()
        imageView.image = UIImage(named: getImageName())
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let values = isBluetoothOn()
        if !values.success {
            showAlert(title: values.title, message: values.message)
        }
        return values.success
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DateSelectionViewController ?? DateSelectionViewController()
        destination.userModel = userModel
    }
}

extension BLEConfirmationViewController {
    
    func getImageName() -> String {
        if userModel?.deviceType == .pen {
            return ImageNames.pen.rawValue
        } else {
            return ImageNames.bgm.rawValue
        }
    }
    
    func isBluetoothOn() -> (success: Bool, title: String, message: String) {

        let state = bleHelper.getState()
        if state == .poweredOff {
            
            return (false, "Alert", "Please enable Bluetooth to proceed")
        } else if state == .unauthorised {
            
            return (false, "Alert", "Please enable Bluetooth in App Settings to proceed")
        }
        return (true, "", "")
    }
}
