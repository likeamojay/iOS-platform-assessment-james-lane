import XCTest

final class SearchForNonExistingCarTest: UITest {
    
    func test_iTryToSearchForNonExistingCar() {

        LoginScreenActions()
          .iLogin(accountToken: Utils.defaultAccountToken, apiKey: Utils.defaultApiKey)
        HomeScreenActions()
            .iTapBrowseTab()
        BrowseScreenActions()
            .iTapVehiclesButton()
        TypesOfVehiclesScreenActions()
            .iSearchVehicle(vehicleSearch: "Missing")
        XCTAssertEqual(app.cells.count, 0)
    }
}
