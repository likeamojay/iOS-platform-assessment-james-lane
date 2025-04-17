//
//  AccessibilityIdentifiers.swift
//  iOS Platform Assessment
//
//  Created by Brandon Yates on 4/15/25.
//

import Foundation

struct AccessibilityIdentifiers {
  
  struct HomeView {
    static let homeTab = "home_tab"
    static let browseTab = "browse_tab"
    static let notificationsTab = "notifications_tab"
    static let searchTab = "search_tab"
  }
  
  struct SearchBar {
    static let searchTextField = "search_text_field"
  }
  
  struct LoginView {
    static let emailTextField = "email_text_field"
    static let passwordTextField = "password_text_field"
    static let loginButton = "login_button"
  }
  
  struct BrowseView {
    static let browseList = "browse_list"
    
    static func browseListItem(type: String) -> String {
      return "browse_list_item_\(type)"
    }
  }
  
  struct FleetioLogo {
    static let fleetioLogo = "fleetio_logo"
  }
  
  struct RootView {
    static let rootView = "root_view"
  }
  
  struct TabBar {
    static let tabBar = "tab_bar"
  }
  
  struct TabBarItem {
    static let homeTabBarItem = "home_tab_bar_item"
    static let browseTabBarItem = "browse_tab_bar_item"
    static let notificationsTabBarItem = "notifications_tab_bar_item"
    static let searchTabBarItem = "search_tab_bar_item"
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
