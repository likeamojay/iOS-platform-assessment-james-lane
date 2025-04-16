//
//  XCUIElement+Extension.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-22.
//

import XCTest

extension XCUIElement {
    
    /// Removes any current text in the field before typing in the new value
    /// - Parameter text: the text to enter into the field
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        tap()
        //For each character we add a backspace one
        let deleteString = stringValue.map { _ in "\u{8}" }.joined(separator: "")
        typeText(deleteString)
        typeText(text)
    }
}
