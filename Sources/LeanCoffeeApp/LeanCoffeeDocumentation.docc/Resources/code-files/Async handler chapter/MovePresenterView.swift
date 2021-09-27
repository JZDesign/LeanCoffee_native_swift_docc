import SwiftUI

struct PresenterView: View {
    @ObservedObject var presenter = MockPresenter()
    
    var body: some View {
        VStack {
            Text("Presenter View")
            Spacer()
            BoldButton(
                presenter.isLoading ? "Loading 😵‍💫" : "Present a new view",
                backgroundColor: .purple, action: { presenter.load() }
            )
            BoldButton("Throw an Error", action: { presenter.throw() })
        }
        .sheet(isPresented: $presenter.didFinish, content: { Text("It worked!") })
        .alert("There was an error!", isPresented: $presenter.didError, actions: {})
    }
}

struct PresenterView_Previews: PreviewProvider {
    static var previews: some View {
        PresenterView()
    }
}
