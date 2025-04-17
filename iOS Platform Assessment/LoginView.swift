//
//  LoginView.swift
//  iOS Platform Assessment
//
//  Created by Brandon Yates on 4/15/25.
//
import Foundation
import SwiftUI

struct LoginView: View {
  
  @State private var email = ""
  @State private var password = ""
  @State private var showError = false
  @State private var isLoggedIn = false
  @State private var isLoading = false
  
  var body: some View {
    NavigationView {
      VStack {
        Image("fleetio-logo")
          .imageScale(.large)
          .foregroundStyle(.tint)
        
        TextField("Email", text: $email)
          .textFieldStyle(.roundedBorder)
          .padding()
          .accessibilityIdentifier(AccessibilityIdentifiers.LoginView.emailTextField)
        
        SecureField("Password", text: $password)
          .textFieldStyle(.roundedBorder)
          .padding()
          .accessibilityIdentifier(AccessibilityIdentifiers.LoginView.passwordTextField)
        
        if showError {
          Text("Invalid email or password")
            .foregroundColor(.red)
            .padding()
        }
        
        if isLoading {
          ProgressView("Logging in...")
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
        } else {
          Button(action: {
            if validateLogin() {
              isLoading = true
              showError = false
              // Simulate a delay
              DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isLoggedIn = true
                isLoading = false
              }
            } else {
              showError = true
            }
          }) {
            Text("Login")
              .foregroundColor(.white)
              .frame(maxWidth: .infinity)
              .padding()
              .background(.black)
              .cornerRadius(10)
          }
          .padding()
          .accessibilityIdentifier(AccessibilityIdentifiers.LoginView.loginButton)
        }
        
        NavigationLink(
          destination: VehicleList(),
          isActive: $isLoggedIn,
          label: { EmptyView() }
        )
      }
      .padding()
    }
  }
  
  func validateLogin() -> Bool {
    return !email.isEmpty && !password.isEmpty && email.lowercased() == "sdetcandidate" && password == "123"
  }
}

#Preview {
  LoginView()
}

