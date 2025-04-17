import Foundation
import XCTest

/// Login  screen data representation
enum LoginScreen: String, ApplicationAccessing {

    case accountTokenTextField = "account_token_text_field"
    case apiKeyTextField = "api_key_text_field"
    case loginButton = "login_button"

    var element: XCUIElement {
        switch self {
        case .accountTokenTextField:
            return app.textFields[rawValue]
        case .apiKeyTextField:
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
        iType(text: accountToken, inTextField: LoginScreen.accountTokenTextField.element)
        iType(text: apiKey, inTextField: LoginScreen.apiKeyTextField.element)
        iWaitForElementAndTap(LoginScreen.loginButton.element)
        return self
    }
}
