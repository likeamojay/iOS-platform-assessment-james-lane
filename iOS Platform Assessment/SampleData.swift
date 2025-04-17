import Foundation

struct Vehicle {
  let id: Int
  let name: String
  let model: String
  let year: String
  let make: String
  let status: String
  let location: String
  let customName: String
}

struct FuelEntry {

  var id: Int?
  var vehicleId: Int?
  var date: Date?
  var odometer: Double?
  var gallons: Double?
  var price: Double?
  var totalCost: Double?
  var milesPerGallon: Double?
  var miles: Double?
  var dollarPerMile: Double?
  var dollarPerGallon: Double?
  var fuelType: String?

  init() {}

  init(
    id: Int,
    vehicleId: Int,
    date: Date,
    odometer: Double,
    gallons: Double,
    price: Double,
    totalCost: Double,
    milesPerGallon: Double,
    miles: Double,
    dollarPerMile: Double,
    dollarPerGallon: Double,
    fuelType: String
  ) {
    self.id = id
    self.vehicleId = vehicleId
    self.date = date
    self.odometer = odometer
    self.gallons = gallons
    self.price = price
    self.totalCost = totalCost
    self.milesPerGallon = milesPerGallon
    self.miles = miles
    self.dollarPerMile = dollarPerMile
    self.dollarPerGallon = dollarPerGallon
    self.fuelType = fuelType
  }
}

struct SampleData {

  static var vehicleList: [Vehicle] = [
    Vehicle(id: 1, name: "Tesla Model S", model: "Model S", year: "2022", make: "Tesla", status: "Active", location: "San Francisco", customName: "Elon's Ride"),
    Vehicle(id: 2, name: "Ford Mustang", model: "Mustang GT", year: "2021", make: "Ford", status: "Inactive", location: "Los Angeles", customName: "The Stallion"),
    Vehicle(id: 3, name: "Chevrolet Bolt", model: "Bolt EV", year: "2023", make: "Chevrolet", status: "Active", location: "New York", customName: "Electric Dream"),
    Vehicle(id: 4, name: "Toyota Camry", model: "Camry SE", year: "2020", make: "Toyota", status: "Inactive", location: "Chicago", customName: "Reliable Ride"),
    Vehicle(id: 5, name: "Honda Civic", model: "Civic LX", year: "2024", make: "Honda", status: "Active", location: "Houston", customName: "Speedy"),
  ]

  static var fuelEntries: [FuelEntry] = [
    FuelEntry(
      id: 1,
      vehicleId: 1,
      date: Date(timeIntervalSinceNow: -60 * 60 * 24 * 365 * 1),
      odometer: 1200,
      gallons: 12.5,
      price: 37.5,
      totalCost: 37.5,
      milesPerGallon: 30.0,
      miles: 375.0,
      dollarPerMile: 0.1,
      dollarPerGallon: 3.0,
      fuelType: "Gasoline"
    ),
    FuelEntry(
      id: 2,
      vehicleId: 1,
      date: Date(
        timeIntervalSinceNow: -60 * 60 * 24 * 180 * 1
      ),
      odometer: 1500,
      gallons: 15.0,
      price: 45.0,
      totalCost: 45.0,
      milesPerGallon: 30.0,
      miles: 450.0,
      dollarPerMile: 0.1,
      dollarPerGallon: 3.0,
      fuelType: "Diesel"
    ),
    FuelEntry(
      id: 3,
      vehicleId: 2,
      date: Date(
        timeIntervalSinceNow: -60 * 60 * 24 * 90 * 1
      ),
      odometer: 1800,
      gallons: 18.0,
      price: 54.0,
      totalCost: 54.0,
      milesPerGallon: 30.0,
      miles: 540.0,
      dollarPerMile: 0.1,
      dollarPerGallon: 3.0,
      fuelType: "Jet Fuel"
    ),
    FuelEntry(
      id: 4,
      vehicleId: 2,
      date: Date(
        timeIntervalSinceNow: -60 * 60 * 24 * 60 * 1
      ),
      odometer: 2100,
      gallons: 21.0,
      price: 63.0,
      totalCost: 63.0,
      milesPerGallon: 30.0,
      miles: 630.0,
      dollarPerMile: 0.1,
      dollarPerGallon: 3.0,
      fuelType: "Gasoline"
    ),
    FuelEntry(
      id: 5,
      vehicleId: 3,
      date: Date(
        timeIntervalSinceNow: -60 * 60 * 24 * 30 * 1
      ),
      odometer: 2400,
      gallons: 24.0,
      price: 72.0,
      totalCost: 72.0,
      milesPerGallon: 30.0,
      miles: 720.0,
      dollarPerMile: 0.1,
      dollarPerGallon: 3.0,
      fuelType: "Diesel"
    )
  ]

}
