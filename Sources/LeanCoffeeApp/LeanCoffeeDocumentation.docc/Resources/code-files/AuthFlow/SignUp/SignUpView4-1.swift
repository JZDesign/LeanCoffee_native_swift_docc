import SwiftUI

struct SignUpView: View {
    @ObservedObject var presenter = SignUpPresenter()
    
    func signUp() {
        Task {
            do {
                guard password == passwordValidation else { return }
                try await HttpClient()
                    .post(
                        body: CreateUser(name: name, username: username, password: password),
                        url: rootURL + "/users"
                    )
                
                guard let token = "\(username):\(password)".data(using: .utf8) else {
                    return
                }
                
                let header = ["Authorization" : "Basic " + token.base64EncodedString()]
        
                self.accessToken = try await HttpClient()
                    .post(
                        decodeReponse: AccessToken.self,
                        url: rootURL + "/users/login",
                        withHeaders: header
                    ).value
                self.didFinish = true
            } catch(let error) {
                print(error)
            }
        }
    }
    
    @ViewBuilder var form: some View {
        TextField("Name", text: $name, prompt: Text("Name"))
        TextField("Username", text: $username, prompt: Text("Username"))
        
        SecureField("Password", text: $password, prompt: Text("Password"))
        
        SecureField("Confirm Password", text: $passwordValidation, prompt: Text("Confirm Password"))
    }
    
    var body: some View {
        VStack {
            Text("Sign Up!").font(.title).fontWeight(.black)
            
            Spacer()
            
            form
            
            Spacer()
            
            BoldButton("Submit", action: signUp)
        }
        .padding()
        .fullScreenCover(isPresented: $didFinish) {
            Text("Home View")
        }
    }
}
