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
    
    
    @ViewBuilder func swipeActions(for topic: Topic) -> some View {
        if topic.completed {
            EmptyView() // If the topic is complete, there is no need to swipe
        } else {
            // The first button will trigger automatically on a full swipe
            Button(action: { print("Voted") }){
                Image(systemName: "hand.thumbsup.fill")
            }.tint(.green)
            
            Button(action: { print("Topic completed") })
            {
                Image(systemName: "checkmark")
            }.tint(Color.red)
        }
    }
    
    
    @ViewBuilder func listRow(for topic: Topic) -> some View {
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
    
    
    var body: some View {
        
        Text(leanCoffee.title)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .lineLimit(2)
        
        List(topics) { topic in
            VStack(spacing: 16) {
                listRow(for: topic)
            }
            .padding(.vertical)
            .navigationTitle(Text("Topics"))
            .swipeActions(edge: .trailing) { swipeActions(for: topic) }
        }
    }
}
