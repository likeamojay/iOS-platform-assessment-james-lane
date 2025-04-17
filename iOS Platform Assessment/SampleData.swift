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

struct SampleData {
  
  static var vehicleList: [Vehicle] = [
    Vehicle(id: 1, name: "Tesla Model S", model: "Model S", year: "2022", make: "Tesla", status: "Active", location: "San Francisco", customName: "Elon's Ride"),
    Vehicle(id: 2, name: "Ford Mustang", model: "Mustang GT", year: "2021", make: "Ford", status: "Inactive", location: "Los Angeles", customName: "The Stallion"),
    Vehicle(id: 3, name: "Chevrolet Bolt", model: "Bolt EV", year: "2023", make: "Chevrolet", status: "Active", location: "New York", customName: "Electric Dream"),
    Vehicle(id: 4, name: "Toyota Camry", model: "Camry SE", year: "2020", make: "Toyota", status: "Inactive", location: "Chicago", customName: "Reliable Ride"),
    Vehicle(id: 5, name: "Honda Civic", model: "Civic LX", year: "2024", make: "Honda", status: "Active", location: "Houston", customName: "Speedy"),
  ]
}
