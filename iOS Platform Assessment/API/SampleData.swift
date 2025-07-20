//
//  SampleData.swift
//  iOS Platform Assessment
//
//  Created by James Lane on 7/16/25.
//

import Foundation

struct SampleData {

  private static func generateRandomFuelEntries() -> [FuelEntry] {
    var entries: [FuelEntry] = []
    let baseDate = Date()
    let calendar = Calendar.current

    // Fuel types to randomly select from
    let fuelTypes = ["Gasoline", "Diesel", "Electric", "Hybrid", "Premium"]

    // Generate 995 random entries
    for id in 6...1000 {
      // Random vehicleId between 1 and 100
      let vehicleId = Int.random(in: 6...100)

      // Random date within last 2 years
      let daysAgo = Int.random(in: 1...730)
      let date = calendar.date(byAdding: .day, value: -daysAgo, to: baseDate)!

      // Generate realistic odometer reading (between 1000 and 150000)
      let odometer = Double.random(in: 1000...150000)

      // Generate realistic gallons (between 5 and 30)
      let gallons = Double.random(in: 5...30)

      // Generate realistic price per gallon (between 2.50 and 5.00)
      let pricePerGallon = Double.random(in: 2.50...5.00)
      let totalCost = gallons * pricePerGallon

      // Calculate realistic MPG (between 15 and 45)
      let milesPerGallon = Double.random(in: 15...45)
      let miles = gallons * milesPerGallon

      let dollarPerMile = totalCost / miles

      // Random fuel type
      let fuelType = fuelTypes[Int.random(in: 0..<fuelTypes.count)]

      let entry = FuelEntry(
        id: id,
        vehicleId: vehicleId,
        date: date,
        odometer: odometer.rounded(toPlaces: 1),
        gallons: gallons.rounded(toPlaces: 1),
        price: pricePerGallon.rounded(toPlaces: 2),
        totalCost: totalCost.rounded(toPlaces: 2),
        milesPerGallon: milesPerGallon.rounded(toPlaces: 1),
        miles: miles.rounded(toPlaces: 1),
        dollarPerMile: dollarPerMile.rounded(toPlaces: 3),
        dollarPerGallon: pricePerGallon.rounded(toPlaces: 2),
        fuelType: fuelType
      )

      entries.append(entry)
    }

    return entries
  }

  static var fuelEntries: [FuelEntry] = {
    // Start with existing 5 entries
    var entries = [
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
        date: Date(timeIntervalSinceNow: -60 * 60 * 24 * 180 * 1),
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
        date: Date(timeIntervalSinceNow: -60 * 60 * 24 * 90 * 1),
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
        date: Date(timeIntervalSinceNow: -60 * 60 * 24 * 60 * 1),
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
        date: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30 * 1),
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

    // Add 995 random entries
    entries.append(contentsOf: generateRandomFuelEntries())
    return entries
  }()
}

// Extension to round doubles to specified decimal places
extension Double {
  func rounded(toPlaces places: Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (self * divisor).rounded() / divisor
  }
}
