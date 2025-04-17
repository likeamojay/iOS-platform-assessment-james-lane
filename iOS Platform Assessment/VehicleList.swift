import Foundation
import SwiftUI

struct VehicleList: View {
  @State private var isLoading = true
  @State private var searchText = ""

  var filteredVehicles: [Vehicle] {
    if searchText.isEmpty {
      return SampleData.vehicleList
    } else {
      return SampleData.vehicleList.filter { vehicle in
        vehicle.customName.lowercased().contains(searchText.lowercased())
      }
    }
  }

  var body: some View {
    Group {
      if isLoading {
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
          .onAppear {

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
              isLoading = false
            }
          }
      } else {
        VStack {

          SearchBar(text: $searchText)
            .padding()
            .background(Color(UIColor.secondarySystemGroupedBackground))

          List {
            ForEach(filteredVehicles, id: \.id) { vehicle in
              NavigationLink(destination: VehicleView(vehicle: vehicle)) {
                VehicleRow(vehicle: vehicle)
              }
              .accessibilityIdentifier(AccessibilityIdentifiers.VehicleList.vehicleListItem(id: vehicle.id))
            }
          }
          .navigationTitle("Vehicles")
          .navigationBarTitleDisplayMode(.inline)
        }
      }
    }
  }
}

struct VehicleRow: View {
  let vehicle: Vehicle

  var body: some View {
    HStack {
      Image(systemName: "car")
        .imageScale(.large)
        .foregroundColor(.gray)
        .frame(width: 50, height: 50)

      VStack(alignment: .leading) {

        Text(vehicle.customName)

        HStack {
          Text(vehicle.year)
          Text(vehicle.make)
          Text(vehicle.model)
        }

        HStack {
          Circle().frame(width: 10, height: 10)
            .foregroundColor(vehicle.status == "Active" ? .green : .red)
          Text(vehicle.status)
          Text("\u{2022}")
          Text(vehicle.location)
        }
      }
    }
  }
}

#Preview {
  NavigationView {
    VehicleList()
  }
}
