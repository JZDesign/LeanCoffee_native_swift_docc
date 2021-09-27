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
    
    @ViewBuilder func badge(for topic: Topic) -> some View {
        if topic.completed {
            Image(systemName: "checkmark")
                .frame(minWidth: 30, minHeight: 30)
                .background(Color.green.cornerRadius(.greatestFiniteMagnitude))
        } else {
            Text("\(topic.votes.count)")
                .frame(minWidth: 30, minHeight: 30)
                .background(Color.brown.cornerRadius(.greatestFiniteMagnitude))
        }
    }
    
    
    var body: some View {
        
        Text(leanCoffee.title)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .lineLimit(2)
        
        List(topics) { topic in
            VStack(spacing: 16) {
                HStack {
                    Spacer()
                    
                    badge(for: topic)
                        .font(.headline.bold())
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    Spacer()
                }
                
                Text(topic.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text(topic.description)
                    .font(.subheadline)
                    .padding(.bottom)
                    .lineLimit(6)
            }
            .padding(.vertical)
            .navigationTitle(Text("Topics"))
            
        }
    }
}
