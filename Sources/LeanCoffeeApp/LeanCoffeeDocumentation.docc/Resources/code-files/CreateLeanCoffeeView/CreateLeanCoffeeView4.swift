import SwiftUI

struct CreateLeanCoffeeView: View {
    
    @ObservedObject var presenter = CreateLeanCoffeePresenter()
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack {
            
            Text("Create a new Lean Coffee Event")
                .font(.title).fontWeight(.black)
                .padding(.bottom, 24)
            
            TextField("Lean Coffee title", text: $presenter.title, prompt: Text("Lean Coffee title"))
            
            Spacer()
            
            BoldButton("Submit") { presenter.handleFormSubmission() }
            
        }
        .padding()
        .toAsyncView(presenter)
        .onReceive(presenter.$didFinish) {
            if $0 {
                presentation.wrappedValue.dismiss()
            }
        }
    }
}
