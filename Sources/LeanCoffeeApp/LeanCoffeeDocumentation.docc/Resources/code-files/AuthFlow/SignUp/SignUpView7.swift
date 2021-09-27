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
        .fullScreenCover(isPresented: $presenter.didFinish) {
            HomeView()
        }
        .padding()
        .toAsyncHandlerView(presenter)
    }
}
