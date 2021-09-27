import SwiftUI

struct AsyncView<Content: View> : View {
    @ObservedObject var presenter: Presenter
    let errorMessageProvider: (Error?) -> String?
    let content: () -> Content
    
    init(
        presenter: Presenter,
        errorMessageProvider: @escaping (Error?) -> String?,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.presenter = presenter
        self.errorMessageProvider = errorMessageProvider
        self.content = content
    }

    var body: some View {
        content()
            .alert(
                errorMessageProvider(presenter.error) ?? "Something went wrong, try again.",
                isPresented: $presenter.didError,
                actions: { } // TODO: Allow the call site to provide alternate actions.
            )
            .overlay(Loader(isLoading: presenter.isLoading))
    }
}

extension View {
    func toAsyncView(
        _ presenter: Presenter,
        errorMessageProvider: @escaping (Error?) -> String? = { _ in nil }
    ) -> some View {
        AsyncView(
            presenter: presenter,
            errorMessageProvider: errorMessageProvider,
            content: { self }
        )
    }
}
