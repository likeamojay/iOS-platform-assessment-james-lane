import SwiftUI

struct RootView: View {
    var body: some View {
        Group {
            if CommandLine.arguments.contains("-isPerformanceTest") {
                VehicleListView() // If we're in performance testing mode, bypass login screen. browse, and vheicles tab, assumes API key and token are already set by Utils.swift
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
  RootView()
}
