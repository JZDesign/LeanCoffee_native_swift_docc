import SwiftUI

struct SignUpView: View {
    @ObservedObject var presenter = SignUpPresenter()
    
    func signUp() {
        Task {
            await presenter.submitForm()
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
