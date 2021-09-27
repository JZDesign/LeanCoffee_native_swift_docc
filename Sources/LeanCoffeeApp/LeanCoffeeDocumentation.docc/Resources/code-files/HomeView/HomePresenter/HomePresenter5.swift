import SwiftUI

class HomePresenter: Presenter {
    
    @Published var events: [LeanCoffee] = []
    
    func refreshEvents() async {
        await perform {
            self.events = try await AuthorizedHttpClient()
                .get(
                    decodeReponse: [LeanCoffee].self,
                    url: rootURL + "/leancoffee"
                )
        }
    }
}
