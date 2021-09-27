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
    }
}
