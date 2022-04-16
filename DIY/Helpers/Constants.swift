//
//  Constants.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import Foundation


struct NotificationName {
    static let bleTurnedOff = NSNotification.Name(rawValue: "bleTurnedOff")
}

struct NotificationHandler {

    static var notificationInfo: [String: Any] = [: ]
}

enum ImageNames: String {
    case pen = "BLE Pen"
    case bgm = "BGM Meter"
}
