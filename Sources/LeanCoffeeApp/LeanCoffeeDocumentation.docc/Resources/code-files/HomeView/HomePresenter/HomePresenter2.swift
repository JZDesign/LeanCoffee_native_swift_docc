import SwiftUI

class HomePresenter: Presenter {
    let accessToken: AccessToken
    
    @Published var events: [LeanCoffee] = []

    init(_ accessToken: AccessToken) {
        self.accessToken = accessToken
    }
    
    func refreshEvents() async {
        
    }
}
