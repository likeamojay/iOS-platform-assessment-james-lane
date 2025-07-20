//
//  Credentials.swift
//  iOS Platform Assessment
//
//  Created by James Lane on 7/15/25.
//

import Foundation

class Credentials {

    static var accountToken: String {
        get {
            return UserDefaults.standard.string(forKey: "accountToken") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "accountToken")
        }
    }

    static var apiKey: String {
        get {
            return UserDefaults.standard.string(forKey: "apiKey") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "apiKey")
        }
    }
}
