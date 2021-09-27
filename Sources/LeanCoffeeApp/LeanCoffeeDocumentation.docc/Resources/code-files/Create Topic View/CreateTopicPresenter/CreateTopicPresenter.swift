import SwiftUI

class CreateTopicPresenter: Presenter {
    
    let leanCoffee: LeanCoffee
    
    @Published var title = ""
    @Published var description = ""
    
    init(_ leanCoffee: LeanCoffee) {
        self.leanCoffee = leanCoffee
    }
}

struct CreateTopic: Codable {
    let title: String
    let description: String
    let leanCoffeeId: String
}
