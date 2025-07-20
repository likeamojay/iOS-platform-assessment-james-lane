//
//  VehiclesResponse.swift
//  iOS Platform Assessment
//
//  Created by James Lane on 7/17/25.
//

import Foundation

struct VehiclesResponse: Decodable {
    let startCursor: String
    let nextCursor: String?
    let perPage: Int
    let filteredBy: [String]
    let sortedBy: [SortMethod]
    let records: [Vehicle]

    struct SortMethod: Decodable {
        let id: String
    }
}
