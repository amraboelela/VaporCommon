//
//  StringTests.swift
//  SwiftLevelDBTests
//
//  Created by Amr Aboelela on 7/28/22.
//

import XCTest
import Foundation
import Dispatch

@testable import VaporCommon

@available(iOS 13.0.0, *)
class StringTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHtmlMessage() {
        let message = """
Twister News link in #darknet

Note: you will need a Tor Browser to view it
"""
        let htmlMessage = message.htmlMessage
        print("htmlMessage: \(htmlMessage)")
        XCTAssertNotNil(htmlMessage.range(of: "#darknet</a>"))
    }
}
