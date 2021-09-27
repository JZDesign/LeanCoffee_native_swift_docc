
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Lean Coffee")
            Spacer()

            BoldButton("Sign Up", action: {})
                .padding(.horizontal)

            Button("Sign In", action: {})
                .padding() // increase visual and tappable area
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPod touch (7th generation)")
    }
}
