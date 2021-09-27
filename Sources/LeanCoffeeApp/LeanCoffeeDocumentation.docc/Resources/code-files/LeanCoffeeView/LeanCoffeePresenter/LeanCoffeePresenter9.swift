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
    
    func voteAndReload(forTopic topic: Topic) {
        Task {
            await voteOn(topic: topic)
            await getAllTopics()
        }
    }
    
    private func complete(topic: Topic) async throws {
        try await AuthorizedHttpClient()
            .post(
                body: nil as String?,
                url: rootURL + "/topics/\(topic.id)/complete"
            )
    }
    
    func completeAndReload(forTopic topic: Topic) {
        Task {
            await perform {
                try await self.complete(topic: topic)
                await self.getAllTopics()
            }
        }
    }
}
