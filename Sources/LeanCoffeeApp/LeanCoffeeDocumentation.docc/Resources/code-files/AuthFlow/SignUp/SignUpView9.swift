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
                presenter.handleFormSubmission()
            })
        }
        .fullScreenCover(isPresented: $presenter.didFinish) {
            HomeView()
        }
        .toAsyncHandlerView(presenter)
    }
}
