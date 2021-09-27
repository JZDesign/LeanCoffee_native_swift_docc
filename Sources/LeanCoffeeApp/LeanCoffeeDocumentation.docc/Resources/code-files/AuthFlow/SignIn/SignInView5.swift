import SwiftUI

struct SignInView: View {
    @State var username = ""
    @State var password = ""
    
    func signIn() {
        guard let token = "\(username):\(password)".data(using: .utf8) else {
            return
        }
        
        let header = ["Authorization" : "Basic " + token.base64EncodedString()]
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
