//
//  BluetoothNotification.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import Foundation
import UIKit

protocol BluetoothNotification { }

extension BluetoothNotification where Self: UIViewController {
    
    func subscribe() {
        let bleObserver = NotificationCenter.default.addObserver(forName: NotificationName.bleTurnedOff, object: nil, queue: nil) { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        NotificationHandler.notificationInfo[NotificationName.bleTurnedOff.rawValue] = bleObserver
    }
    
    func unsubscribe() {
        let observer = NotificationHandler.notificationInfo[NotificationName.bleTurnedOff.rawValue] as Any
        NotificationCenter.default.removeObserver(observer)

    }
}
