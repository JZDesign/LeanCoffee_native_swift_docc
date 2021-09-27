import SwiftUI

struct SignInView: View {
    @ObservedObject var presenter = SignInPresenter()

    func signIn() {
        Task {
            presenter.submitForm()
        }
    }
    
    var body: some View {
        VStack {
            Text("Sign In!").font(.title).fontWeight(.black)
            
            Spacer()
            
            TextField("Username", text: $presenter.username, prompt: Text("Username"))
            
            SecureField("Password", text: $presenter.password, prompt: Text("Password"))
            
            Spacer()
            
            BoldButton("Submit", action: signIn)
        }
        .padding()
        .fullScreenCover(isPresented: $presenter.didFinish) {
            Text("Home view")
        }
        .toAsyncView(presenter)
    }
}

struct AccessToken: Codable {
    let value: String
} // Best practice, put this in its own file 👍
