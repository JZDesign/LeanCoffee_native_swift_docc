
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Lean Coffee")
            Spacer()

            Button(action: {}) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity, minHeight: 48)
                // increase tappable area
            }
                .font(.body.bold())
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.red)
                        .shadow(color: .black.opacity(0.5), radius: 20, x: 4, y: 5)
                )
                .foregroundColor(.white)

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
