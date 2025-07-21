import Foundation

struct Utils {

    static var accountToken: String {
        get {
            if CommandLine.arguments.contains("-isPerformanceTest") {
                return "b7fc6a5b44"
            }
            return UserDefaults.standard.string(forKey: "accountToken") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "accountToken")
        }
    }

    static var apiKey: String {
        get {
            if CommandLine.arguments.contains("-isPerformanceTest") {
                return "d39a2d1ec4fd5e1aee15c177631516fe600fc601"
            }
            return UserDefaults.standard.string(forKey: "apiKey") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "apiKey")
        }
    }

    public static let pricePerGallon: Double = 3
    public static let gallons: Double = 10
    public static let tripMiles: Double = 100
    public static let odometer: Double = 120000

}
