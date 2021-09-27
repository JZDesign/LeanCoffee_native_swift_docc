import SwiftUI

struct AsyncView<Content: View> : View {
    @ObservedObject var presenter: Presenter
    let content: () -> Content
    
    init(
        presenter: Presenter,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.presenter = presenter
        self.content = content
    }

    var body: some View {
        content()
            .alert(
                "Something went wrong, try again.",
                isPresented: $presenter.didError,
                actions: { } // TODO: Allow the call site to provide alternate actions.
            )
    }
}
