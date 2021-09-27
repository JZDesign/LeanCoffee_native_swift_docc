import SwiftUI

struct LeanCoffeeView: View {
    
    @State var topics: [Topic] = (1..<4).compactMap {
        Topic(
            id: "\($0)",
            title: " Topic \($0)",
            description: "Some Description",
            completed: $0 % 2 == 0 ? true : false,
            votes: [Vote(id: "\($0)")]
        )
    }
    
    var body: some View {
        List(topics) { topic in
            Text(topic.title)
        }
    }
}
