import XCTest

final class SearchForNonExistingCarTest: UITest {
    
    func test_iTryToSearchForNonExistingCar() {

        LoginScreenActions()
          .iLogin(accountToken: "1234123", apiKey: "akjsdfasdfasdf")
        TypesOfVehiclesScreenActions()
            .iSearchVehicle(vehicleSearch: "Missing")
        XCTAssertEqual(app.cells.count, 0)
    }
}
