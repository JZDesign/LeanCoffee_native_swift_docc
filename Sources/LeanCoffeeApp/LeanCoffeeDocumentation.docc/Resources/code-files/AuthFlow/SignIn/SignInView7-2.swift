import SwiftUI

struct SignInView: View {
    @State var username = ""
    @State var password = ""
    @State var accessToken = ""
    @State var didFinish = false
    
    func signIn() {
        guard let token = "\(username):\(password)".data(using: .utf8) else {
            return
        }
        
        let header = ["Authorization" : "Basic " + token.base64EncodedString()]
        Task {
            do {
                self.accessToken = try await HttpClient()
                    .post(
                        decodeReponse: AccessToken.self,
                        url: rootURL + "/users/login",
                        withHeaders: header
                    ).value
                self.didFinish = true
            } catch (let error) {
                print(error) // We'll handle this later
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Sign In!").font(.title).fontWeight(.black)
            
            Spacer()
            
            TextField("Username", text: $username, prompt: Text("Username"))
            
            SecureField("Password", text: $password, prompt: Text("Password"))
            
            Spacer()
            
            BoldButton("Submit", action: signIn)
        }
        .padding()
    }
}

struct AccessToken: Codable {
    let value: String
}
