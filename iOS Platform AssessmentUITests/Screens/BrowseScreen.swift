import Foundation
import XCTest

/// Browse  screen data representation
enum BrowseScreen: String, ApplicationAccessing {

    case browseTitle = "Browse"
    case equipment = "browse_list_item_Equipment"
    case parts = "browse_list_item_Parts"
    case vehicles = "browse_list_item_Vehicles"
    case inspections = "browse_list_item_Inspections"
    case issues = "browse_list_item_Issues"
    case serviceReminders = "browse_list_item_Service Reminders"
    case workOrders = "browse_list_item_Work Orders"
    case contacts = "browse_list_item_Contacts"
    case shopDirectory = "browse_list_item_Shop Directory"

    var element: XCUIElement {
        switch self {
        case .browseTitle:
            return app.staticTexts[rawValue]
        case .equipment, .parts, .vehicles, .inspections, .issues, .serviceReminders, .workOrders, .contacts, .shopDirectory:
            return app.buttons[rawValue]
        }
    }
}

///// Browse  screen actions representation
class BrowseScreenActions: ElementWaitable {

    @discardableResult
    func iTapVehiclesButton() -> Self {
        iWaitForElementAndTap(BrowseScreen.vehicles.element)
        return self
    }
}
