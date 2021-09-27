import SwiftUI

struct SignUpView: View {
    @ObservedObject var presenter = SignUpPresenter()
    
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
            
            BoldButton("Submit", action: {
                Task {
                    try? await presenter.submitForm()
                }
            })
        }
        .fullScreenCover(isPresented: $presenter.didFinish) {
            Text("Home View")
        }
        .padding()
    }
}
