//
//  UITest.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-22.
//

import Foundation
import XCTest

class UITest: XCTestCase {
    
    let app = XCUIApplication()
    
    override  func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        addDebugDescriptionAttachment(app)
        addScreenshot(app)
    }
}
