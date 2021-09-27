import SwiftUI

class HomePresenter: Presenter {
    let accessToken: AccessToken
    
    @Published var events: [LeanCoffee] = []

    init(_ accessToken: AccessToken) {
        self.accessToken = accessToken
    }
    
    func refreshEvents() async {
        await perform {
            let header = ["Authorization": "Bearer \(self.accessToken.value)"]
            
            self.events = try await HttpClient()
                .get(
                    decodeReponse: [LeanCoffee].self,
                    url: rootURL + "/leancoffee",
                    withHeaders: header
                )
        }
    }
}
