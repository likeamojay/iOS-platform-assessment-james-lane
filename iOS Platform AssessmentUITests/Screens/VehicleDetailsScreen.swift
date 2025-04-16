//
//  VehicleDetailsScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-25.
//

import Foundation
import XCTest

/// Vehicle details  screen data representation
enum VehicleDetailsScreen: String, ApplicationAccessing {
    
    case fuelLog = "vehicle_option_Fuel Log"
    case serviceHistory = "vehicle_option_Service History"
    case workOrders = "vehicle_option_Work Orders"
    case inspections = "vehicle_option_Inspections"
    case installedTires = "vehicle_option_Installed Tires"
    case serviceReminders = "vehicle_option_Service Reminders"
    case renewalReminders = "vehicle_option_Renewal reminders"
    case assignmentHistory = "vehicle_option_Assignment History"
    case meterHistory = "vehicle_option_Meter History"
    case lastKnownLocation = "vehicle_option_Last Known Location"
    case comments = "vehicle_option_Comments"
    case photos = "vehicle_option_Photos"
    case documents = "vehicle_option_Documents"
    
    var element: XCUIElement {
        return app.buttons[rawValue]
    }
}

/// Vehicle Details screen actions representation
class VehicleDetailsScreenActions: ElementWaitable, Scrollable, TextFieldActionable {
    
    @discardableResult
    func iTapFuelLog() -> Self {
        iWaitForElementAndTap(VehicleDetailsScreen.fuelLog.element)
        return self
    }
}


