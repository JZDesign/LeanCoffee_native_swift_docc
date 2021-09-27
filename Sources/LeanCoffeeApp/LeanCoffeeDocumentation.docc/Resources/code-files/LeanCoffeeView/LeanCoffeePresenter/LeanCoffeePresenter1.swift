import SwiftUI

class LeanCoffeePresenter: Presenter {
    let leanCoffee: LeanCoffee
    
    @Published var topics: [Topic] = []
    
    init(_ leanCoffee: LeanCoffee) {
        self.leanCoffee = leanCoffee
    }
}
