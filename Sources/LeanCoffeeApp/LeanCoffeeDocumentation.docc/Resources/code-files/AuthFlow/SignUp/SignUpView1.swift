import SwiftUI

struct SignUpView: View {
    @State var name = ""
    @State var username = ""
    @State var password = ""
    @State var passwordValidation = ""
    @State var didFinish = false
    
    var body: some View {
        VStack {
            Text("Sign Up!")
        }
    }
}
