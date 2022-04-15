//
//  UserModel.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import Foundation

enum DeviceType: String {
    case bgm = "BGM Meter"
    case pen = "BLE Pen"
    case unknown = ""
}

struct UserModel {
    
    let firstName: String
    let lastName: String
    let emailId: String
    let address: String
    let pinCode: String
    var deviceType: DeviceType = .unknown
    var date: String = ""
    var serialNo: String = "AXVBP89"
    var deviceVersion: String = "2.4.5"
    var deviceName: String = "Alpha"
}
