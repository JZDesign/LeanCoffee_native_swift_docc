import SwiftUI

struct CreateLeanCoffeeView: View {
    
    @State var title = ""
    
    var body: some View {
        VStack {
            
            Text("Create a new Lean Coffee Event")
                .font(.title).fontWeight(.black)
                .padding(.bottom, 24)
            
            TextField("Lean Coffee title", text: $title, prompt: Text("Lean Coffee title"))
            
            Spacer()
            
            BoldButton("Submit") {}
            
        }
        .padding()
    }
}
