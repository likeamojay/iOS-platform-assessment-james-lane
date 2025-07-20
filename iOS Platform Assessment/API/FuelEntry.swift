//
//  FuelEntry.swift
//  iOS Platform Assessment
//
//  Created by James Lane on 7/17/25.
//

import Foundation

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
