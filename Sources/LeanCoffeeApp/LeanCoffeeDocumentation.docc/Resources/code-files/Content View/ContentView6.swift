
import SwiftUI

struct ContentView: View {
    @State var signUp = false
    @State var signIn = false

    var body: some View {
        VStack(spacing: 16) {
            Text("Lean Coffee")
            Spacer()

            BoldButton("Sign Up", action: { signUp.toggle() })
                .padding(.horizontal)
                .sheet(isPresented: $signUp) { Text("Sign Up Tapped") }

            Button("Sign In", action: { signIn.toggle() })
                .padding() // increase visual and tappable area
                .sheet(isPresented: $signIn) { Text("Sign In Tapped") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPod touch (7th generation)")
    }
}
