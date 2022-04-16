//
//  DIYTests.swift
//  DIYTests
//
//  Created by Ram Voleti on 16/04/22.
//

import XCTest
@testable import DIY

class DIYTests: XCTestCase {

    func testUserDetailsScreen() {
        
        let vc = UserDetailsViewController()
        
        var model = UserModel(firstName: "", lastName: "", emailId: "", address: "", pinCode: "")
        var values = vc.validateField(usermodel: model)
        XCTAssertEqual(values.success, false)
        XCTAssertEqual(values.title, "Missing Details")
        XCTAssertEqual(values.message, "Please fill all Text Fields to continue")
        
        model = UserModel(firstName: "Name", lastName: "Name", emailId: "", address: "address", pinCode: "1234")
        values = vc.validateField(usermodel: model)
        XCTAssertEqual(values.success, false)
        XCTAssertEqual(values.title, "Missing Details")
        XCTAssertEqual(values.message, "Please fill all Text Fields to continue")
        
        model = UserModel(firstName: "Name", lastName: "Name", emailId: "email", address: "address", pinCode: "1234")
        values = vc.validateField(usermodel: model)
        XCTAssertEqual(values.success, false)
        XCTAssertEqual(values.title, "Alert")
        XCTAssertEqual(values.message, "Please enter valid Email Id")
        
        model = UserModel(firstName: "Name", lastName: "Name", emailId: "email@em", address: "address", pinCode: "1234")
        values = vc.validateField(usermodel: model)
        XCTAssertEqual(values.success, false)
        XCTAssertEqual(values.title, "Alert")
        XCTAssertEqual(values.message, "Please enter valid Email Id")
        
        model = UserModel(firstName: "Name", lastName: "Name", emailId: "email@email.com", address: "address", pinCode: "1234")
        values = vc.validateField(usermodel: model)
        XCTAssertEqual(values.success, true)
        XCTAssertEqual(values.title, "")
        XCTAssertEqual(values.message, "")
    }

    func testDevicesScreen() {
        
        let vc = DevicesViewController()
        
        var values = vc.validateSelection(penStatus: false, bgmStatus: false)
        XCTAssertEqual(values.success, false)
        XCTAssertEqual(values.title, "Alert")
        XCTAssertEqual(values.message, "Please select any one device")
        
        values = vc.validateSelection(penStatus: true, bgmStatus: false)
        XCTAssertEqual(values.success, true)
        XCTAssertEqual(values.title, "")
        XCTAssertEqual(values.message, "")
        
        values = vc.validateSelection(penStatus: false, bgmStatus: true)
        XCTAssertEqual(values.success, true)
        XCTAssertEqual(values.title, "")
        XCTAssertEqual(values.message, "")
    }
    
    func testBLEConfirmationScreen() {
        
        let vc = BLEConfirmationViewController()
        vc.userModel = UserModel(firstName: "", lastName: "", emailId: "", address: "", pinCode: "", deviceType: .pen)
        var value = vc.getImageName()
        XCTAssertEqual(value, ImageNames.pen.rawValue)
        vc.userModel?.deviceType =  .bgm
        value = vc.getImageName()
        XCTAssertEqual(value, ImageNames.bgm.rawValue)
        
        vc.bleHelper = MockBLEHelper_Off()
        var bleVal = vc.isBluetoothOn()
        XCTAssertEqual(bleVal.success, false)
        XCTAssertEqual(bleVal.title, "Alert")
        XCTAssertEqual(bleVal.message, "Please enable Bluetooth to proceed")
        
        vc.bleHelper = MockBLEHelper_Unauthorised()
        bleVal = vc.isBluetoothOn()
        XCTAssertEqual(bleVal.success, false)
        XCTAssertEqual(bleVal.title, "Alert")
        XCTAssertEqual(bleVal.message, "Please enable Bluetooth in App Settings to proceed")
        
        vc.bleHelper = MockBLEHelper()
        bleVal = vc.isBluetoothOn()
        XCTAssertEqual(bleVal.success, true)
        XCTAssertEqual(bleVal.title, "")
        XCTAssertEqual(bleVal.message, "")
    }
    
    func testDataValidationScreen() {
        
        let vc = DataValidationViewController()
        vc.userModel = UserModel(firstName: "", lastName: "", emailId: "", address: "", pinCode: "")
        
        var values = vc.validate(serialNo: "AXVBP89", deviceVersion: "2.4.5", deviceName: "Alpha")
        XCTAssertEqual(values.success, true)
        XCTAssertEqual(values.title, "")
        XCTAssertEqual(values.message, "")
        
        values = vc.validate(serialNo: "AXVBP891", deviceVersion: "2.4.5", deviceName: "Alpha")
        XCTAssertEqual(values.success, false)
        XCTAssertEqual(values.title, "Error")
        XCTAssertEqual(values.message, "Entered data did not match")
        
        values = vc.validate(serialNo: "AXVBP89", deviceVersion: "", deviceName: "Alpha")
        XCTAssertEqual(values.success, false)
        XCTAssertEqual(values.title, "Error")
        XCTAssertEqual(values.message, "Entered data did not match")
    }
}
