import SwiftUI

struct PresenterView: View {
    @ObservedObject var presenter = MockPresenter()
    
    var body: some View {
        VStack {
            Text("Presenter View")
            Spacer()
            BoldButton(
                "Present a new view",
                backgroundColor: .purple, action: { presenter.load() }
            )
            BoldButton("Throw an Error", action: { presenter.throw() })
        }
        .sheet(isPresented: $presenter.didFinish, content: { Text("It worked!") })
        .alert("There was an error!", isPresented: $presenter.didError, actions: {})
        .overlay(Loader(isLoading: presenter.isLoading))
    }
}

struct PresenterView_Previews: PreviewProvider {
    static var previews: some View {
        PresenterView()
    }
}
