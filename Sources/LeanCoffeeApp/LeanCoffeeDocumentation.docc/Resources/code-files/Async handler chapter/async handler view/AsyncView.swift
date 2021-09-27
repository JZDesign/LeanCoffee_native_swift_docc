import SwiftUI

struct AsyncView<Content: View> : View {
    let content: () -> Content

    var body: some View {
        content()
    }
}
