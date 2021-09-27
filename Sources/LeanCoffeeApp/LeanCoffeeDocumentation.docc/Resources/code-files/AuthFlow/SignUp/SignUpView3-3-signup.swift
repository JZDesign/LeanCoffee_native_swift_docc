import SwiftUI

struct SignUpView: View {
    @State var name = ""
    @State var username = ""
    @State var password = ""
    @State var passwordValidation = ""
    @State var didFinish = false
    
    func signUp() {
        Task {
            do {
                guard password == passwordValidation else { return }
                try await HttpClient()
                    .post(
                        body: CreateUser(name: name, username: username, password: password),
                        url: rootURL + "/users"
                    )
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
