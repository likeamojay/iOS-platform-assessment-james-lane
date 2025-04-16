//
//  TextFieldActionable.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-22.
//

import Foundation
import XCTest


protocol TextFieldActionable: ApplicationAccessing, ElementWaitable {
    
    @discardableResult
    /// Types a text in a specific TextField
    /// - Parameters:
    ///   - text: String to be typed
    ///   - textField: which textField to type the text in
    ///   - shouldClear: defines if needed to clear a previous text, set to true by default
    ///   - file: caller file to show in which file the error happens
    ///   - line:line from where the function was called
    /// - Returns: self
    func iType(text: String, inTextField: XCUIElement, shouldClear: Bool, file: StaticString, line: UInt, timeout: Double) -> Self
}

extension TextFieldActionable {
    
    @discardableResult
    func iType(text: String, inTextField: XCUIElement, shouldClear: Bool = true, file: StaticString = #file, line: UInt = #line, timeout: Double = .standardTimeout) -> Self {
        iWaitForElement(inTextField, timeout: timeout, file: file, line: line)
        inTextField.tap()
        let value = inTextField.value as? String
        if shouldClear, !(value?.isEmpty ?? true) {
            inTextField.clearAndEnterText(text: text)
        } else {
            inTextField.typeText(text)
        }
        return self
    }
}
