//
//  AppLaunchPerformance.swift
//  iOS Platform Assessment
//
//  Created by James Lane on 7/20/25.
//

import XCTest
import Foundation

final class AppLaunchPerformanceUITests: XCTestCase {

    private let iterations = 10

    func testPerformanceRuns() {
        let app = XCUIApplication()

        for i in 1...iterations {
            app.launchArguments = ["-isPerformanceTest"]
            if i == iterations {
                app.launchArguments.append("-isFinalPerformanceRun")
            }

            app.launch()

            XCTAssertTrue(
                app.textFields["search_text_field"].waitForExistence(timeout: .standardTimeout),
                "search_text_field did not appear in time"
            )
            app.terminate()
            sleep(1)
        }
    }
}

