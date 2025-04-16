//
//  FuelLogScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-25.
//
import Foundation
import XCTest

enum FuelLogListScreen: String, ApplicationAccessing {
    
    case addNewFuelButton = "fuel_log_new_entry"
    
    var element: XCUIElement {
        app.navigationBars.buttons[rawValue]
    }
}

class FuelLogListScreenActions: ElementWaitable  {
    
    /// First fuel log cell has the starting index 5 as in identifier fuel_log_list_item_5
    private static let startingIndex = 5
    private static let baseFuelLogButtonIdentifier = "fuel_log_list_item_"
    
    @discardableResult
    func iTapAddNewFuel() -> Self {
        iWaitForElementAndTap(FuelLogListScreen.addNewFuelButton.element)
        return self
    }
    
    @discardableResult
    func iVerifyLastAddedFuelLog(howManyAdded: Int = 1, date: Date = .now, pricePerGallon: Double, gallons: Double, tripMiles: Double, odometer: Double) -> Self {
        let lastLogAdded = app.buttons[Self.baseFuelLogButtonIdentifier + "\(howManyAdded + Self.startingIndex)"]
        iWaitForElement(lastLogAdded)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d, yyyy"
        let formattedDate = dateFormatter.string(from: date).uppercased()
        XCTAssertTrue(lastLogAdded.staticTexts.firstMatch.label.contains(formattedDate))
        XCTAssertEqual(gallons, stringToDouble(lastLogAdded.staticTexts.element(boundBy: 2).label))
        XCTAssertEqual(tripMiles, stringToDouble(lastLogAdded.staticTexts.element(boundBy: 4).label))
        XCTAssertEqual(pricePerGallon, stringToDouble(lastLogAdded.staticTexts.element(boundBy: 8).label))
        XCTAssertEqual(odometer, stringToDouble(lastLogAdded.staticTexts.element(boundBy: 10).label))
        return self
    }
    
    /// Converts a String to a Double
    /// - Parameter string: the String you want to convert
    /// - Returns: returns the double value after stripping non-numeric characters or -1 if the string is invalid
    private func stringToDouble(_ string: String) -> Double {
        Double(string.filter("0123456789.".contains)) ?? -1
    }
}

