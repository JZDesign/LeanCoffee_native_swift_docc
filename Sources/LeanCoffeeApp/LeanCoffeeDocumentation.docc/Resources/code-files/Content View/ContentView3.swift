
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Lean Coffee")
            Spacer()
            Button("Sign Up", action: {})
            Button("Sign In", action: {})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPod touch (7th generation)")
    }
}
