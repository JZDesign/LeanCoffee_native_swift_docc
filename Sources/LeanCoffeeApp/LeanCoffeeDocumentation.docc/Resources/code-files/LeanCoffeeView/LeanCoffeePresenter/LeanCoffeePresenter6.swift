import SwiftUI

class LeanCoffeePresenter: Presenter {
    let leanCoffee: LeanCoffee
    
    @Published var topics: [Topic] = []
    
    init(_ leanCoffee: LeanCoffee) {
        self.leanCoffee = leanCoffee
    }
    
    func getAllTopics() async {
        await perform {
            let unsortedTopics = try await AuthorizedHttpClient()
                .get(
                    decodeReponse: [Topic].self,
                    url: rootURL + "/leancoffee/\(self.leanCoffee.id)/topics"
                )
            
            self.topics = unsortedTopics
                .sorted { $0.votes.count > $1.votes.count }
                .sorted { $0.completed == false && $1.completed }
        }
    }
    
    private func voteOn(topic: Topic) async {
        await perform {
            try await AuthorizedHttpClient()
                .post(body: CastVote(topicId: topic.id), url: rootURL + "/votes")
        }
    }
}
