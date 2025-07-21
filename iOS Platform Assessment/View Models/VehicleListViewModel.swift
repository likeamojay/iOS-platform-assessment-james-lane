//
//  VehicleListViewModel.swift
//  iOS Platform Assessment
//
//  Created by James Lane on 7/14/25.
//

import Foundation
import Combine

@MainActor
class VehicleListViewModel: ObservableObject {

    @Published var isInitialLoading = false
    @Published var errorString = ""
    @Published var searchText: String = ""
    @Published var selectedVehicle: Vehicle? = nil
    @Published private(set) var vehicles: [Vehicle] = []
    @Published var isFetchingNextPage = false
    @Published var lastUpdated: Date = Date()

    var vehicleFuelEntries: [Int: [FuelEntry]] = [:]

    private let kUrlString = "https://secure.fleetio.com/api/vehicles"
    private var startCursor: String?
    private var nextCursor: String?
    private var cancellables = Set<AnyCancellable>()
    private var perPage = 10

    var hasNextPage: Bool {
        nextCursor != nil
    }

    init() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .filter({ !$0.isEmpty })
            .sink { [weak self] term in
                guard let self else { return }
                self.lastUpdated = Date()
                Task {
                    await self.fetchVehicles()
                }
            }
            .store(in: &cancellables)
    }

    func fetchVehicles() async {
        guard !isFetchingNextPage else { return }
        if nextCursor == nil && startCursor != nil {
            return
        }

        isFetchingNextPage = nextCursor != nil
        if startCursor == nil {
            isInitialLoading = true
        }

        defer {
            isInitialLoading = false
            isFetchingNextPage = false
            lastUpdated = Date()
        }

        guard var urlComponents = URLComponents(string: kUrlString) else { return }

        var queryItems = [URLQueryItem(name: "per_page", value: "\(self.perPage)")]
        if let nextCursor {
            queryItems.append(URLQueryItem(name: "start_cursor", value: nextCursor))
        }

        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else {
            errorString = "Invalid URL"
            return
        }

        var request = URLRequest(url: url)
        request.setValue("Token \(Utils.apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue(Utils.accountToken, forHTTPHeaderField: "Account-Token")

        do {
            if  CommandLine.arguments.contains("-isPerformanceTest") {
                JLAnalytics.shared.markStartTime(for: "APICallDuration")
            }
            let (data, response) = try await URLSession.shared.data(for: request)
            if  CommandLine.arguments.contains("-isPerformanceTest") {
                JLAnalytics.shared.markStopTime(for: "APICallDuration")
            }

            if  CommandLine.arguments.contains("-isFinalPerformanceRun") {
                JLAnalytics.shared.saveReport()
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                errorString = "HTTP Error \(String(describing: (response as? HTTPURLResponse)?.statusCode))"
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let vehiclesResponse = try decoder.decode(VehiclesResponse.self, from: data)
            vehicles += vehiclesResponse.records

            if self.isFirstPage {
                if  CommandLine.arguments.contains("-isPerformanceTest") {
                    JLAnalytics.shared.markStopTime(for: "PageLoadTime")
                }
            }

            self.startCursor = vehiclesResponse.startCursor
            self.nextCursor = vehiclesResponse.nextCursor
        } catch {
            errorString = "Failed to fetch vehicles: \(error.localizedDescription)"
            self.nextCursor = nil
        }
    }

    func shouldLoadNextPage(currentItem: Vehicle) -> Bool {
        guard !isFetchingNextPage else { return false }
        guard hasNextPage else { return false }
        return currentItem.id == filteredVehicles.last?.id
    }

    var filteredVehicles: [Vehicle] {
        guard !searchText.isEmpty else { return vehicles }

        let terms = searchText.lowercased().split(separator: " ")
        return vehicles.filter { vehicle in
            terms.allSatisfy { term in
                vehicle.customName?.lowercased().contains(term) ?? false ||
                (vehicle.make ?? "").lowercased().contains(term) ||
                vehicle.model.lowercased().contains(term) ||
                vehicle.yearString.contains(term)
            }
        }
    }

    var isFirstPage: Bool {
        return self.vehicles.count == self.perPage
    }
}

