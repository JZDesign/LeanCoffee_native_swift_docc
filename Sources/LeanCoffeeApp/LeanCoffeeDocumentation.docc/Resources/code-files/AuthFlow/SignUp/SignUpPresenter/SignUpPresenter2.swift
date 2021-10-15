import SwiftUI

class SignUpPresenter: SignInPresenter {
    @Published var name = ""
    @Published var passwordValidation = ""
    
    func formValidated() -> Bool {
        name.count > 0 && username.count > 0 && password.count > 0 && password == passwordValidation
    }
}
