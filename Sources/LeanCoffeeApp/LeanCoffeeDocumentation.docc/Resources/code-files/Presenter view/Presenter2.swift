import SwiftUI

@MainActor class Presenter: ObservableObject {
    
}

struct PresenterView: View {
    var body: some View {
        VStack {
            Text("Presenter View")
            Spacer()
            BoldButton("Present a new view", backgroundColor: .purple, action: {})
            BoldButton("Throw an Error", action: {})
        }
    }
}

struct PresenterView_Previews: PreviewProvider {
    static var previews: some View {
        PresenterView()
    }
}
