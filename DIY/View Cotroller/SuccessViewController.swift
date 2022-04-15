//
//  SuccessViewController.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import UIKit

class SuccessViewController: UIViewController {

    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func finishTapped() {
        if save() {
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

private extension SuccessViewController {
    
    func save() -> Bool {
        do {
            let timeStamp: UInt32 = UInt32(Date().timeIntervalSince1970)
            let user = userModel?.firstName ?? ""
            let fileName = "\(user)_\(timeStamp)"
            let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let url = documentUrl.appendingPathComponent(fileName)
            let data = try JSONEncoder().encode(userModel)
            try data.write(to: url)
            return true
        } catch {
            showAlert(title: "Error", message: error.localizedDescription)
        }
        return false
    }
}
