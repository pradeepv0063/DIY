//
//  BLEHelper.swift
//  DIY
//
//  Created by Ram Voleti on 15/04/22.
//

import Foundation
import CoreBluetooth

enum BLEState {
    case poweredOn, poweredOff, unauthorised
}

class BLEHelper: NSObject {
    
    var centralManager: CBCentralManager!
    private var state: BLEState = .unauthorised
    
    static let shared: BLEHelper = {
        
        let instance = BLEHelper()
        
        return instance
    }()
    
    private override init() { }
    
    func initiate() {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func getState() -> BLEState {
        state
    }
}

extension BLEHelper: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            state = .poweredOff
            print("state = .poweredOff")
        case .poweredOn:
            state = .poweredOn
            print("state = .poweredOn")
        default:
            state = .unauthorised
            print("state = .unauthorised")
        }
    }
}
