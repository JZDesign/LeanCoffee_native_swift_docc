import SwiftUI

struct LeanCoffeeView: View {
    
    @State var topics: [Topic] = []
    
    var body: some View {
        List(topics) { topic in
            Text(topic.title)
        }
    }
}
