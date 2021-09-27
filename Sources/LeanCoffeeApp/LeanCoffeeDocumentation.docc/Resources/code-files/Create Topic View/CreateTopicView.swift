import SwiftUI

struct CreateTopicView: View {
    @State var title = ""
    @State var description = ""

    var body: some View {
        VStack {
            Text("Create a new topic to discuss")
                .font(.title).fontWeight(.black)
                .padding(.bottom, 24)
        }
        .padding()
    }
}
