import SwiftUI

struct CreateTopicView: View {
    @State var title = ""
    @State var description = ""

    var body: some View {
        VStack {
            Text("Create a new topic to discuss")
                .font(.title).fontWeight(.black)
                .padding(.bottom, 24)

            TextField("Topic title", text: $title, prompt: Text("Topic title"))

            TextField("Description", text: $description, prompt: Text("Description"))

            Spacer()

            BoldButton("Submit") { }

        }
        .padding()
    }
}
