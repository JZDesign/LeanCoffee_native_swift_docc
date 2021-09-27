import SwiftUI

class SignInPresenter: Presenter {    
    @Published var username = ""
    @Published var password = ""
    @Published var accessToken = ""
    
    func submitForm() async {
        guard let token = "\(username):\(password)".data(using: .utf8) else {
            return
        }
        
        let header = ["Authorization" : "Basic " + token.base64EncodedString()]
        
        await perform {
            self.accessToken = try await HttpClient()
                .post(
                    decodeReponse: AccessToken.self,
                    url: rootURL + "/users/login",
                    withHeaders: header
                ).value
        }
    }
}
