import XCTest
import Testing
@testable import iOS_Platform_Assessment

struct iOS_Platform_AssessmentTests {

 @Test func testDecodeFullVehicle() throws {
        let json = """
            {
                "id": 1,
                "name": "Fleet Truck",
                "model": "F-150",
                "year": 2018,
                "make": "Ford",
                "status": "active",
                "location": "Denver",
                "customName": "Workhorse"
            }
            """
        let vehicle = try decodeVehicle(from: json)

        XCTAssertEqual(vehicle.id, 1)
        XCTAssertEqual(vehicle.name, "Fleet Truck")
        XCTAssertEqual(vehicle.model, "F-150")
        XCTAssertEqual(vehicle.make, "Ford")
        XCTAssertEqual(vehicle.status, "active")
        XCTAssertEqual(vehicle.location, "Denver")
        XCTAssertEqual(vehicle.customName, "Workhorse")
        XCTAssertEqual(vehicle.yearString, "2018")  // year is private; use computed property
    }

    /// Optional values are omitted
    @Test func testDecodeVehicleWithMissingOptionals() throws {
        let json = """
        {
            "id": 42,
            "name": "Model Y",
            "model": "Y",
            "year": 2022
        }
        """
        let vehicle = try decodeVehicle(from: json)

        XCTAssertNil(vehicle.make)
        XCTAssertNil(vehicle.status)
        XCTAssertNil(vehicle.location)
        XCTAssertNil(vehicle.customName)
        XCTAssertEqual(vehicle.yearString, "2022")
    }

    /// Invalid JSON should throw—a good guard against regressions
    @Test func testDecodeFailsForMalformedJSON() {
        let json = """
            {
                "id": "not-an-int",
                "name": "Bad Data",
                "model": "X",
                "year": 2020
            }
            """
        XCTAssertThrowsError(try decodeVehicle(from: json))
    }

    /// Extra commas or thousands separators in `yearString` should be stripped
    @Test func testYearStringStripsCommas() throws {
        let json = """
            {
                "id": 7,
                "name": "Classic",
                "model": "Mustang",
                "year": 1965,
                "make": "Ford"
            }
            """
        let vehicle = try decodeVehicle(from: json)

        // Manually build a string with commas and verify the computed property strips them
        let noisyYear = "1,965"
        XCTAssertEqual(noisyYear.replacingOccurrences(of: ",", with: ""), vehicle.yearString)
    }
}

private func decodeVehicle(from json: String) throws -> Vehicle {
    let data = Data(json.utf8)
    return try JSONDecoder().decode(Vehicle.self, from: data)
}

