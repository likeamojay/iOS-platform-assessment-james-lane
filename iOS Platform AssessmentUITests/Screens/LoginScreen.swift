import Foundation
import XCTest

/// Login  screen data representation
enum LoginScreen: String, ApplicationAccessing {
    
    case accountTokenField = "account_token_text_field"
    case apiKeyField = "api_key_text_field"
    case loginButton = "login_button"
    
    var element: XCUIElement {
        switch self {
        case .accountTokenField:
            return app.textFields[rawValue]
        case .apiKeyField:
            return app.secureTextFields[rawValue]
        case .loginButton:
            return app.buttons[rawValue]
        }
    }
}

/// Login screen actions representation
class LoginScreenActions: ElementWaitable, TextFieldActionable {
    
    @discardableResult
    func iTapLoginButton() -> Self {
      iWaitForElementAndTap(LoginScreen.loginButton.element)
        return self
    }
    
    @discardableResult
    func iLogin(accountToken:  String, apiKey: String) -> Self {
        iType(text: accountToken, inTextField: LoginScreen.accountTokenField.element)
        iType(text: apiKey, inTextField: LoginScreen.apiKeyField.element)
        iWaitForElementAndTap(LoginScreen.loginButton.element)
        return self
    }
}
