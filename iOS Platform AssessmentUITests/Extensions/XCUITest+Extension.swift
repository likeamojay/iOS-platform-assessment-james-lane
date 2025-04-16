
//
//  XCUITest+Extension.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-22.
//

import Foundation
import XCTest

extension XCTestCase {
    
    /// Adds debug description at the end of a test
    /// - Parameters:
    ///   - app: The app instance
    ///   - file: The caller file used to generate the name of the description
    ///   - preserveIfSuccessfull: Flag determining if the attachement should be kept if the test is successful
    func addDebugDescriptionAttachment(_ app: XCUIApplication, file: StaticString = #file, preserveIfSuccessfull: Bool = false) {
        let stringAttachment = XCTAttachment(string: app.debugDescription)
        stringAttachment.lifetime = !preserveIfSuccessfull ? .deleteOnSuccess : .keepAlways
        stringAttachment.name = file.description + ".txt"
        add(stringAttachment)
    }
    
    /// Adds a screenshot at the time of a test
    /// - Parameters:
    ///   - app: The app instance
    ///   - preserveIfSuccessfull: Flag determining if the attachement should be kept if the test is successful
    func addScreenshot(_ app: XCUIApplication, preserveIfSuccessfull: Bool = false) {
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = !preserveIfSuccessfull ? .deleteOnSuccess : .keepAlways
        add(attachment)
    }
}
