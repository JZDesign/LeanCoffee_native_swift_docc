import SwiftUI

struct SignInView: View {
    @ObservedObject var presenter = SignInPresenter()

    func signIn() {
        Task {
            await presenter.submitForm()
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
        .fullScreenCover(isPresented: $didFinish) {
            Text("Home view")
        }
    }
}

struct AccessToken: Codable {
    let value: String
} // Best practice, put this in its own file 👍
