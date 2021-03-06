//
//  Extension Tests.swift
//  DIYTests
//
//  Created by Ram Voleti on 16/04/22.
//

import XCTest
@testable import DIY

class Extension_Tests: XCTestCase {

   
    func testStringExtension() {
        
        XCTAssertEqual("".isValidEmail, false)
        XCTAssertEqual("Hello".isValidEmail, false)
        XCTAssertEqual("email@em".isValidEmail, false)
        XCTAssertEqual("email@email.c".isValidEmail, false)
        XCTAssertEqual("email@email.co".isValidEmail, true)
    }

    func testDateExtension() {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YY"
        let dateString = formatter.string(from: date)
        XCTAssertEqual(date.toString(), dateString)
    }
    
    func testOptionalExtension() {
        
        var string: String?
        XCTAssertEqual(string.isBlank, true)
        string = ""
        XCTAssertEqual(string.isBlank, true)
        string = "Hello"
        XCTAssertEqual(string.isBlank, false)
        
        var string2: String?
        var string3: String?
        XCTAssertEqual(string2.isCaseInsensitiveEqual(to: string3), false)
        string2 = ""
        string3 = ""
        XCTAssertEqual(string2.isCaseInsensitiveEqual(to: string3), true)
        string2 = "Hello"
        string3 = "Hello"
        XCTAssertEqual(string2.isCaseInsensitiveEqual(to: string3), true)
        string2 = "Hello1"
        string3 = "Hello2"
        XCTAssertEqual(string2.isCaseInsensitiveEqual(to: string3), false)
        string2 = "Hello1"
        string3 = "Hello2 "
        XCTAssertEqual(string2.isCaseInsensitiveEqual(to: string3), false)
        string2 = "Hello"
        string3 = ""
        XCTAssertEqual(string2.isCaseInsensitiveEqual(to: string3), false)
        string2 = "Hello"
        string3 = nil
        XCTAssertEqual(string2.isCaseInsensitiveEqual(to: string3), false)
        string2 = nil
        string3 = "Hello"
        XCTAssertEqual(string2.isCaseInsensitiveEqual(to: string3), false)
        
    }
}
