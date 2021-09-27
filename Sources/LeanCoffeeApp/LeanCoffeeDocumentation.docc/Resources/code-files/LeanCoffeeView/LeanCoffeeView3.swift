import SwiftUI

struct LeanCoffeeView: View {
    let leanCoffee: LeanCoffee
    
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
        
        Text(leanCoffee.title)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .lineLimit(2)
        
        List(topics) { topic in
            VStack(spacing: 16) {
                Text(topic.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text(topic.description)
                    .font(.subheadline)
                    .padding(.bottom)
                    .lineLimit(6)
            }
            
        }
    }
}
