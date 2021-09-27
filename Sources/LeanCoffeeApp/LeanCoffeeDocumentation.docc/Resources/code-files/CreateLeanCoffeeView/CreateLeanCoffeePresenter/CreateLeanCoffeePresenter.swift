import SwiftUI

class CreateLeanCoffeePresenter: Presenter {

    @Published var title = ""

}

struct CreateLeanCoffee: Codable {
    let title: String
}
