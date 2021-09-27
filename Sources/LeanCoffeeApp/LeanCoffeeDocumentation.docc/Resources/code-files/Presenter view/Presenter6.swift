import SwiftUI

@MainActor class Presenter: ObservableObject {
    var error: Error?
    @Published var didError = false
    @Published var isLoading = false
    @Published var didFinish = false
    
    internal func perform(_ task: () async throws -> Void) async {
        isLoading = true
        do {
            try await task()
        } catch {
            self.error = error
            didError = true
        }
        isLoading = false
    }
}

class MockPresenter: Presenter {
    func load() {
        Task {
            await perform {
                try await Task.sleep(nanoseconds: 2_000_000_000)
            }
        }
    }
}

struct PresenterView: View {
    var body: some View {
        VStack {
            Text("Presenter View")
            Spacer()
            BoldButton("Present a new view", backgroundColor: .purple, action: {})
            BoldButton("Throw an Error", action: {})
        }
    }
}

struct PresenterView_Previews: PreviewProvider {
    static var previews: some View {
        PresenterView()
    }
}
