import SwiftUI

struct SignInView: View {
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Text("Sign In!").font(.title).fontWeight(.black)
        }
    }
}
