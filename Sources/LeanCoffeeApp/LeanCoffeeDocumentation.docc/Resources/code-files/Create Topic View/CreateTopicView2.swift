import SwiftUI

struct CreateTopicView: View {
    @ObservedObject var presenter: CreateTopicPresenter
    
    init(_ leanCoffee: LeanCoffee) {
        self.presenter = CreateTopicPresenter(leanCoffee)
    }

    var body: some View {
        VStack {
            Text("Create a new topic to discuss")
                .font(.title).fontWeight(.black)
                .padding(.bottom, 24)
            
            TextField("Topic title", text: $presenter.title, prompt: Text("Topic title"))
            
            TextField("Description", text: $presenter.description, prompt: Text("Description"))
            
            Spacer()
            
            BoldButton("Submit") { presenter.handleFormSubmission() }
            
        }
        .padding()
        .toAsyncView(presenter)
    }
}
