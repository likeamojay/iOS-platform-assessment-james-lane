import XCTest
import Foundation

final class CreateANewFuelEntryTest: UITest {

    func test_iLoginAndCreateANewFuelEntry() {

        LoginScreenActions()
          .iLogin(accountToken: Utils.accountToken, apiKey: Utils.apiKey)
        HomeScreenActions()
            .iTapBrowseTab()
        BrowseScreenActions()
            .iTapVehiclesButton()
        TypesOfVehiclesScreenActions()
            .iSelectTypeOfVehicle(vehicleType: .pickupTruck)
        VehicleDetailsScreenActions()
            .iTapFuelLog()
        FuelLogListScreenActions()
            .iTapAddNewFuel()
        AddNewFuelFormScreenActions()
            .iAddNewFuelEntry(fuelType: .fuelFlex, pricePerGallon: Utils.pricePerGallon, gallons: Utils.gallons, tripMiles: Utils.tripMiles, odometer: Utils.odometer)
        FuelLogListScreenActions()
            .iVerifyLastAddedFuelLog(pricePerGallon: Utils.pricePerGallon, gallons: Utils.gallons, tripMiles: Utils.tripMiles, odometer: Utils.odometer)
    }

    func test_saveFormWithEmptyFieldsTest() {
        LoginScreenActions()
            .iLogin(accountToken: Utils.accountToken, apiKey: Utils.apiKey)
        HomeScreenActions()
            .iTapBrowseTab()
        BrowseScreenActions()
            .iTapVehiclesButton()
        TypesOfVehiclesScreenActions()
            .iSelectTypeOfVehicle(vehicleType: .pickupTruck)
        VehicleDetailsScreenActions()
            .iTapFuelLog()
        FuelLogListScreenActions()
            .iTapAddNewFuel()
        AddNewFuelFormScreenActions()
            .iTapSaveButton()
            .iWaitForElement(AddNewFuelFormScreen.errorMessage.element)
    }
}
