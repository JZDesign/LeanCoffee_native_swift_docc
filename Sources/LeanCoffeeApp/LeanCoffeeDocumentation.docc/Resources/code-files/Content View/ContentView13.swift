
import SwiftUI

struct ContentView: View {
    @State var signUp = false
    @State var signIn = false
    @Environment(\.colorScheme) var colorScheme : ColorScheme

    var overlay: some View {
        colorScheme == .dark ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 16) {
            GeometryReader { bounds in
                Text("Lean Coffee")
                    .font(.system(size: bounds.size.width > 600 ? 75 : 45))
                    .fontWeight(.black)
                    .kerning(2.5)
                    .shadow(color: .brown, radius: 15, x: 0, y: 0)
                    .frame(width: bounds.size.width)
            }

            Spacer()

            BoldButton("Sign Up", action: { signUp.toggle() })
                .padding(.horizontal)
                .sheet(isPresented: $signUp) { Text("Sign Up Tapped") }

            Button("Sign In", action: { signIn.toggle() })
                .padding() // increase visual and tappable area
                .sheet(isPresented: $signIn) { SignInView() }
        }.background(
            Image("coffee-beans")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(overlay.opacity(0.6))
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPod touch (7th generation)")
            .preferredColorScheme(.dark)
    }
}
