//
//  SearchBar.swift
//  iOS Platform Assessment
//
//  Created by Brandon Yates on 4/15/25.
//

import SwiftUI

struct SearchBar: View {
  @Binding var text: String

  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
      TextField("Search", text: $text)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .accessibilityIdentifier(AccessibilityIdentifiers.SearchBar.searchTextField)
    }
    .padding()
  }
}
