import SwiftUI

class HomePresenter: Presenter {
    @Environment(\.tokenStore) var tokenStore: TokenStore
    
    @Published var events: [LeanCoffee] = []
    
    func refreshEvents() async {
        await perform {
            let header = ["Authorization": "Bearer \(self.tokenStore.accessToken?.value ?? "")"]
            
            self.events = try await HttpClient()
                .get(
                    decodeReponse: [LeanCoffee].self,
                    url: rootURL + "/leancoffee",
                    withHeaders: header
                )
        }
    }
}
