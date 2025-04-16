//
//  AccessibilityIdentifiers.swift
//  iOS Platform Assessment
//
//  Created by Brandon Yates on 4/15/25.
//

import Foundation

struct AccessibilityIdentifiers {
  
  struct SearchBar {
    static let searchTextField = "search_text_field"
  }
  
  struct LoginView {
    static let accountTokenTextField = "account_token_text_field"
    static let apiKeyTextField = "api_key_text_field"
    static let loginButton = "login_button"
  }
  
  
  struct FleetioLogo {
    static let fleetioLogo = "fleetio_logo"
  }
  
  struct VehicleList {
    static let vehicleList = "vehicle_list"
    
    static func vehicleListItem(id: Int) -> String {
      return "vehicle_list_item_\(id)"
    }
  }
  
  struct VehicleView {
    static let vehicleView = "vehicle_view"
    
    static func vehicleOption(name: String) -> String {
      return "vehicle_option_\(name)"
    }
  }
}
