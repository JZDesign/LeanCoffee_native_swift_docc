import SwiftUI

class SignInPresenter: Presenter: FormSubmissionPresenter {
    @Environment(\.tokenStore) var tokenStore: TokenStore
    
    @Published var username = ""
    @Published var password = ""
    
    
    override func formValidated() -> Bool {
        username.count > 0 && password.count > 0
    }
    
    override func submitForm() async throws {
        guard let token = "\(username):\(password)".data(using: .utf8) else {
            return
        }
        
        let header = ["Authorization" : "Basic " + token.base64EncodedString()]
    
        self.tokenStore.accessToken = try await HttpClient()
            .post(
                decodeReponse: AccessToken.self,
                url: rootURL + "/users/login",
                withHeaders: header
            )
    }
}
