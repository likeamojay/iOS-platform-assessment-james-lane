//
//  VehiclesScreen.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-25.
//

import Foundation
import XCTest

/// Types of vehicle  screen data representation
enum TypesOfVehicleScreen: String, ApplicationAccessing {
    
    case searchField = "search_text_field"
    case elon = "vehicle_list_item_1"
    case stallion = "vehicle_list_item_2"
    case electricDream = "vehicle_list_item_3"
    case reliable = "vehicle_list_item_4"
    case speedy = "vehicle_list_item_5"
    
    var element: XCUIElement {
        switch self {
        case .searchField:
            return app.textFields[rawValue]
        case .elon, .stallion, .electricDream, .reliable, .speedy:
            return app.buttons[rawValue]
        }
    }
}

/// Types of Vehicle screen actions representation
class TypesOfVehiclesScreenActions: ElementWaitable, TextFieldActionable {
    
    @discardableResult
    func iSelectTypeOfVehicle(vehicleType: TypesOfVehicleScreen) -> Self {
        assert(vehicleType != .searchField, "Only vehicles can be tapped here")
        iWaitForElementAndTap(vehicleType.element)
        return self
    }
    
    @discardableResult
    func iSearchVehicle(vehicleSearch: String) -> Self {
        iType(text: vehicleSearch, inTextField: TypesOfVehicleScreen.searchField.element)
        return self
    }
}

