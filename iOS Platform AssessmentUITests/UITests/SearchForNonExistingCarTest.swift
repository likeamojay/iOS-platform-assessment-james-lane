import XCTest

final class SearchForNonExistingCarTest: UITest {
    
    func test_iTryToSearchForNonExistingCar() {
        LoginScreenActions()
          .iLogin(accountToken: Utils.accountToken, apiKey: Utils.apiKey)
        HomeScreenActions()
            .iTapBrowseTab()
        BrowseScreenActions()
            .iTapVehiclesButton()
        TypesOfVehiclesScreenActions()
            .iSearchVehicle(vehicleSearch: "Missing")
        XCTAssertEqual(app.cells.count, 0)
    }
}
