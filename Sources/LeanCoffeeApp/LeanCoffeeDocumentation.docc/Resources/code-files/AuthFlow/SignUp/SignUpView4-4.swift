import SwiftUI

struct SignUpView: View {
    @ObservedObject var presenter = SignUpPresenter()
    
    func signUp() {
        Task {
            await presenter.submitForm()
        }
    }
    
    @ViewBuilder var form: some View {
        TextField("Name", text: $presenter.name, prompt: Text("Name"))
        TextField("Username", text: $presenter.username, prompt: Text("Username"))
        
        SecureField("Password", text: $presenter.password, prompt: Text("Password"))
        
        SecureField("Confirm Password", text: $presenter.passwordValidation, prompt: Text("Confirm Password"))
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
        .fullScreenCover(isPresented: $presenter.didFinish) {
            Text("Home View")
        }
        .toAsyncView(presenter, errorMessageProvider: { _ in
            """
                There was an error!
                If your username is pretty common, it could be taken. Try another one!
            """
        })
    }
}
