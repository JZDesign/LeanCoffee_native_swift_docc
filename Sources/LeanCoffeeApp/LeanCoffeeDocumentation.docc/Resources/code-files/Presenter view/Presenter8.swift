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
                didFinish = true
            }
        }
    }
}

struct PresenterView: View {
    @ObservedObject var presenter = MockPresenter()
    
    var body: some View {
        VStack {
            Text("Presenter View")
            Spacer()
            BoldButton(presenter.isLoading ? "Loading 😵‍💫" : "Present a new view", backgroundColor: .purple, action: {
                presenter.load()
            })
            BoldButton("Throw an Error", action: {})
        }
        .sheet(isPresented: $presenter.didFinish, content: { Text("It worked!") })
    }
}

struct PresenterView_Previews: PreviewProvider {
    static var previews: some View {
        PresenterView()
    }
}
