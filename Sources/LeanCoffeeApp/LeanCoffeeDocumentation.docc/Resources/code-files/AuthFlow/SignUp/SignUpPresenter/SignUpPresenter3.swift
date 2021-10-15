import SwiftUI

class SignUpPresenter: SignInPresenter {
    @Published var name = ""
    @Published var passwordValidation = ""
    
    func formValidated() -> Bool {
        name.count > 0 && username.count > 0 && password.count > 0 && password == passwordValidation
    }
    
    override func submitForm() async {
        await perform {
            try await HttpClient()
                .post(
                    body: CreateUser(name: self.name, username: self.username, password: self.password),
                    url: rootURL + "/users"
                )
        }
    }
}
