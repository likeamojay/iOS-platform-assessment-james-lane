//
//  VehicleList.swift
//  iOS Platform Assessment
//
//  Created by James Lane on 7/13/25.
//

import SwiftUI

struct VehicleList: View {

    @StateObject private var viewModel = VehicleListViewModel()

    var body: some View {
        Group {
            if viewModel.isInitialLoading {
                ProgressView("Loading Vehicles...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
            } else if !viewModel.errorString.isEmpty {
                Text(viewModel.errorString)
                    .foregroundColor(.red)
                    .padding()
            } else {
                VStack {
                    SearchBar(text: $viewModel.searchText)
                        .padding(.horizontal)
                        .background(Color(UIColor.secondarySystemGroupedBackground))
                    List {
                        ForEach(viewModel.filteredVehicles) { vehicle in
                            NavigationLink(destination: VehicleView(vehicle: vehicle)) {
                                VehicleRow(vehicle: vehicle)
                            }
                            .background(
                                viewModel.selectedVehicle?.id == vehicle.id
                                    ? Color.gray.opacity(0.1)
                                    : Color.clear
                            )
                            .accessibilityIdentifier(AccessibilityIdentifiers.VehicleList.vehicleListItem(id: vehicle.id))
                            .onAppear {
                                if viewModel.shouldLoadNextPage(currentItem: vehicle) {
                                    Task {
                                        await viewModel.fetchVehicles()
                                    }
                                }
                            }
                        }
                    }
                    .id(viewModel.searchText)
                    .listStyle(.plain)
                    .navigationTitle("Vehicles")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .onAppear {
            if viewModel.vehicles.isEmpty {
                Task {
                    await viewModel.fetchVehicles()
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
