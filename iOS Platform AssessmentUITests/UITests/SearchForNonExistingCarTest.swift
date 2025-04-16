//
//  NegativeFlow.swift
//  fleetio-go-e2e-sampleUITests
//
//  Created by Luiza on 2024-07-25.
//

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
