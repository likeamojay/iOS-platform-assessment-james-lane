import Foundation
import XCTest

/// AddNewFuelEntryScreen  data representation
enum AddNewFuelFormScreen: String, ApplicationAccessing {

    case priceField = "fuel_log_price_per_gallon"
    case gallonsField = "fuel_log_gallons"
    case totalField = "fuel_log_total_cost"
    case milesField = "fuel_log_total_milage"
    case odometerField = "fuel_log_odometer"
    case fuelTypeButton = "Fuel Type, *"
    case saveButton = "fuel_log_save"
    case errorMessage = "validation_message"

    var element: XCUIElement {
        switch self {
        case .fuelTypeButton, .saveButton:
            return app.buttons[rawValue]
        case .priceField, .gallonsField, .totalField, .milesField, .odometerField:
            return app.textFields[rawValue]
        case .errorMessage:
            return app.staticTexts[rawValue]
        }
    }
}

///AddNewFuelFormScreen Actions representation
class AddNewFuelFormScreenActions: ElementWaitable, Scrollable, TextFieldActionable {

    @discardableResult
    func iTapSaveButton() -> Self {
        iWaitForElementAndTap(AddNewFuelFormScreen.saveButton.element)
        return self
    }

    @discardableResult
    func iTapFuelTypeButton() -> Self {
        scrollDownUntilElementExists(AddNewFuelFormScreen.fuelTypeButton.element)
        iWaitForElementAndTap(AddNewFuelFormScreen.fuelTypeButton.element)
        return self
    }

    @discardableResult
    func iAddNewFuelEntry(fuelType: SelectFuelTypeScreen, pricePerGallon: Double, gallons: Double, tripMiles: Double, odometer: Double) -> Self {
        iType(text: String(pricePerGallon), inTextField: AddNewFuelFormScreen.priceField.element)
        iType(text: String(gallons), inTextField: AddNewFuelFormScreen.gallonsField.element)
        iType(text: String(tripMiles), inTextField: AddNewFuelFormScreen.milesField.element)
        iType(text: String(odometer), inTextField: AddNewFuelFormScreen.odometerField.element)
        iTapFuelTypeButton()
        SelectFuelTypeScreenActions()
            .iSelectFuelType(fuelType: fuelType)
            .iTapDoneButton()
        iTapSaveButton()
        return self
    }
}


