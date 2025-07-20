//
//  VehicleRow.swift
//  iOS Platform Assessment
//
//  Created by James Lane on 7/18/25.
//

import SwiftUI

struct VehicleRow: View {
    let vehicle: Vehicle
    var body: some View {
        HStack {
            Image(systemName: "car")
                .imageScale(.large)
                .foregroundColor(.gray)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                Text(vehicle.customName ?? "Custom Name")
                    .font(.headline)
                    .lineLimit(1)

                HStack {
                    Text(vehicle.yearString)
                    Text(vehicle.make ?? "Make")
                    Text(vehicle.model)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                HStack {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(vehicle.status == "Active" ? .green : .red)
                    Text(vehicle.status ?? "Status")
                    Text("\u{2022}")
                    Text(vehicle.location ?? "Location")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}
