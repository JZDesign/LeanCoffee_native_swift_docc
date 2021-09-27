import SwiftUI

open class FormSubmissionPresenter: Presenter {
    
    internal func formValidated() throws -> Bool {
        true // Override this function if you want to stop the button from working when a form is not correctly filled out
    }
    
    internal func submitForm() async throws {
        fatalError("This must be overridden")
    }
}
