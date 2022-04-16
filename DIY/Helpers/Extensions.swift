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
    
    var trimmedString: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension UIViewController {
    
    func showAlert(title: String = "", message: String = "", action: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel) { _ in
            guard let action = action else { return }
            action()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension Date {
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YY"
        let dateString = formatter.string(from: self)
        return dateString
    }
}

extension Optional where Wrapped == String {
    
    var isBlank: Bool {
        return self?.isEmpty ?? true
    }
    
    var trimmedString: String {
        self?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
    
    func isCaseInsensitiveEqual(to compareString: String?) -> Bool {
        guard let self = self, let compareString = compareString else { return false }
        if self.trimmedString.lowercased() == compareString.trimmedString.lowercased() {
            return true
        }
        return false
    }
}

extension Optional where Wrapped == UITextField {
    
    var trimmedText: String {
        self?.text.trimmedString ?? ""
    }
}
