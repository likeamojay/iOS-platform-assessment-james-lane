import SwiftUI

@main
struct iOS_Platform_AssessmentApp: App {

    init() {
         if CommandLine.arguments.contains("-isPerformanceTest") {
             JLAnalytics.shared.markStartTime(for: "AppStart") // Start app launch timer
         }
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .onAppear {
                    if CommandLine.arguments.contains("-isPerformanceTest") {
                        JLAnalytics.shared.markStopTime(for: "AppStart") // Stop app launch timer
                    }
                }
        }
    }
}
