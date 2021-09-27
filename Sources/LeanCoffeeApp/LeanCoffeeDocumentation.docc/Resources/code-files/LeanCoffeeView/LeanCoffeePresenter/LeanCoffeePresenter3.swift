import SwiftUI

class LeanCoffeePresenter: Presenter {
    let leanCoffee: LeanCoffee
    @Environment(\.tokenStore) var tokenStore: TokenStore
    
    @Published var topics: [Topic] = []
    
    init(_ leanCoffee: LeanCoffee) {
        self.leanCoffee = leanCoffee
    }
    
    func getAllTopics() async {
        await perform {
            let header = ["Authorization": "Bearer \(self.tokenStore.accessToken?.value ?? "")"]
            self.topics = try await HttpClient()
                .get(
                    decodeReponse: [Topic].self,
                    url: rootURL + "/leancoffee/\(self.leanCoffee.id)/topics",
                    withHeaders: header
                )
        }
    }
}
