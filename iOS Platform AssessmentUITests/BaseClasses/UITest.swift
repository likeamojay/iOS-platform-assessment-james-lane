import Foundation
import XCTest

class UITest: XCTestCase {
    
    let app = XCUIApplication()
    
    override  func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        addDebugDescriptionAttachment(app)
        addScreenshot(app)
    }
}
