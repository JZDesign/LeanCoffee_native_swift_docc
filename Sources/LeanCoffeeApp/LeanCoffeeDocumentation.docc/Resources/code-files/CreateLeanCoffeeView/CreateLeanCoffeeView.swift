import SwiftUI

struct CreateLeanCoffeeView: View {
    
    @State var title = ""
    
    var body: some View {
        VStack {
            
            Text("Create a new Lean Coffee Event")
                .font(.title).fontWeight(.black)
                .padding(.bottom, 24)
            
        }
        .padding()
    }
}
