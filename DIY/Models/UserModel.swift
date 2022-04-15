//
//  UserModel.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import Foundation

enum DeviceType {
    case bgm, pen, unknown
}

struct UserModel {
    
    let firstName: String
    let lastName: String
    let emailId: String
    let address: String
    let pinCode: String
    var deviceType: DeviceType = .unknown
    var date: String = ""
}
