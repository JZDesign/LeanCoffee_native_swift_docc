import SwiftUI

struct SignInView: View {
    @ObservedObject var presenter = SignInPresenter()
    
    func signIn() {
        Task {
            try? await presenter.submitForm()
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
            HomeView()
        }
        .toAsyncView(presenter)
    }
}
