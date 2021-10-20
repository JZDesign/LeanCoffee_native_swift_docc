import SwiftUI

class FormSubmissionPresenter: Presenter {
    
    func handleFormSubmission() {
        
        Task {
            await perform {
                guard try self.formValidated() else {
                    return
                }
                try await self.submitForm()
                self.didFinish = true
            }
        }
    }

    internal func formValidated() throws -> Bool {
        true // Override this function if you want to stop the button from working when a form is not correctly filled out
    }
    
    internal func submitForm() async throws {
        fatalError("This must be overridden")
    }
}
