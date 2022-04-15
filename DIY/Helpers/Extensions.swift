//
//  Extensions.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import Foundation
import UIKit

extension String {

    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let isValid = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
        return isValid
    }
}

extension UIViewController {
    
    func showAlert(title: String = "", message: String = "") {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
