import SwiftUI

class CreateTopicPresenter: FormSubmissionPresenter {
    
    let leanCoffee: LeanCoffee
    
    @Published var title = ""
    @Published var description = ""
    
    init(_ leanCoffee: LeanCoffee) {
        self.leanCoffee = leanCoffee
    }

    override func submitForm() async throws {
        try await AuthorizedHttpClient()
            .post(
                body: CreateTopic(
                    title: self.title,
                    description: self.description,
                    leanCoffeeId: self.leanCoffee.id
                ),
                url: rootURL + "/topics"
            )
    }
}

struct CreateTopic: Codable {
    let title: String
    let description: String
    let leanCoffeeId: String
}
