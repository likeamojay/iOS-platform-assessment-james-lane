//
//  Vehicle.swift
//  iOS Platform Assessment
//
//  Created by James Lane on 7/17/25.
//

import Foundation

struct Vehicle: Identifiable, Codable {
  let id: Int
  let name: String
  let model: String
  private let year: Int
  let make: String?
  let status: String?
  let location: String?
  let customName: String?
}

extension Vehicle {

    var yearString: String {
        return "\(year)".replacingOccurrences(of: ",", with: "")
    }
}
