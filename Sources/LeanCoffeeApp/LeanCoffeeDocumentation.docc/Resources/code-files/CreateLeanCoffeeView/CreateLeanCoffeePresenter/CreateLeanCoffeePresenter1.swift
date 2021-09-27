import SwiftUI

class CreateLeanCoffeePresenter: FormSubmissionPresenter {

    @Published var title = ""

    override func submitForm() async throws {
        try await AuthorizedHttpClient()
            .post(
                body: CreateLeanCoffee(title: self.title),
                url: rootURL + "/leancoffee"
            )
    }
}

struct CreateLeanCoffee: Codable {
    let title: String
}
