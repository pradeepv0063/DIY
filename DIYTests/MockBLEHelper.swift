//
//  MockBLEHelper.swift
//  DIYTests
//
//  Created by Ram Voleti on 16/04/22.
//

import Foundation
@testable import DIY

extension BLEHelpProvidable {
    
    func initiate() {
        return
    }
    
    func getState() -> BLEState {
        .poweredOn
    }
}

struct MockBLEHelper: BLEHelpProvidable { }

struct MockBLEHelper_Off: BLEHelpProvidable {
    func getState() -> BLEState {
        .poweredOff
    }
}

struct MockBLEHelper_Unauthorised: BLEHelpProvidable {
    func getState() -> BLEState {
        .unauthorised
    }
}
