import Foundation
import SwiftUI

struct FuelLogList: View {

  @State private var refreshID = UUID() // Hack to trigger SampleData.fullEntries to receive changes from FuelLogForm

  let vehicleId: Int

  var body: some View {
    List {
      ForEach(SampleData.fuelEntries.filter { $0.vehicleId == vehicleId }.sorted(by: { $0.date ?? Date() > $1.date ?? Date() }), id: \.id) { fuelEntry in
        FuelLogRow(fuelEntry: fuelEntry, vehicleId: vehicleId)
          .accessibilityIdentifier(AccessibilityIdentifiers.FuelLogList.fuelLogListItem(id: fuelEntry.id ?? 0))
      }
    }
    .id(refreshID)
    .navigationTitle("Fuel Log")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(trailing: NavigationLink(destination: FuelLogForm(vehicleId: vehicleId, refreshID: $refreshID)) {
      Image(systemName: "plus")
    }.accessibilityIdentifier(AccessibilityIdentifiers.FuelLogList.newFuelEntry))
  }
}

struct FuelLogRow: View {

  @State var fuelEntry: FuelEntry
  let vehicleId: Int

  var body: some View {

    NavigationLink(destination: FuelLogView(fuelEntry: fuelEntry, vehicleId: vehicleId)) {
      HStack {
        VStack {
          HStack {
            Text(fuelEntry.date!.formattedString())
            Spacer()
            Text(fuelEntry.date!.timeAgo())
          }
          .foregroundColor(.gray)
          .font(.subheadline)

          HStack {
            label(value: fuelEntry.gallons?.rounded(toDecimalPlaces: 3) ?? "-", unit: "gal")
            Spacer()
            label(value: fuelEntry.miles?.rounded(toDecimalPlaces: 3) ?? "-", unit: "mi")
            Spacer()
            label(value: fuelEntry.milesPerGallon?.rounded(toDecimalPlaces: 3) ?? "-", unit: "MPG")
          }

          HStack {
            label(value: "$\(fuelEntry.dollarPerGallon?.rounded(toDecimalPlaces: 3) ?? "-")", unit: "/gal")
            Spacer()
            label(value: "\(fuelEntry.odometer?.rounded(toDecimalPlaces: 2) ?? "-")", unit: "mi")
            Spacer()
            label(value: "$\(fuelEntry.dollarPerMile?.rounded(toDecimalPlaces: 3) ?? "-")", unit: "/gal")
          }
        }
      }
    }
  }

  func label(value: String, unit: String) -> some View {
    HStack(spacing: 2) {
      Text(value)
        .bold()

      Text(unit)
        .foregroundColor(.gray)
        .font(.subheadline)
    }
  }
}

#Preview {
  NavigationView {
    FuelLogList(vehicleId: 1)
  }
}
