//
//  Scrollable.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-22.
//

import Foundation
import XCTest

/// Provides a scrollable interface for a given screen
protocol Scrollable: ApplicationAccessing {
    
    /// Scroll up on the scrollable element
    /// - Returns: Self
    func scrollUp() -> Self
    
    /// Scroll down on the scrollable element
    /// - Returns: Self
    func scrollDown() -> Self
    
    /// Scroll until we find an element
    /// - Parameters:
    ///   - element: The element
    ///   - maxTries: The max number of scrolls
    ///   - file: File name
    ///   - line: Line number
    /// - Returns: Self
    func scrollDownUntilElementExists(_ element: XCUIElement, maxTries: Int, file: StaticString, line: UInt) -> Self
}

extension Scrollable {
    @discardableResult
    func scrollUp() -> Self {
        app.swipeDown()
        return self
    }
    
    @discardableResult
    func scrollDown() -> Self {
        app.swipeUp()
        return self
    }
    
    @discardableResult
    func scrollDownUntilElementExists(_ element: XCUIElement, maxTries: Int = 5, file: StaticString = #file, line: UInt = #line) -> Self {
        var maxTries = maxTries
        while (maxTries > 0) {
            _ = scrollDown()
            if element.exists {
                return self
            }
            maxTries -= 1
        }
        
        XCTFail("Element with identifier \(element.identifier) does not exist", file: file, line: line)
        return self
    }
}
