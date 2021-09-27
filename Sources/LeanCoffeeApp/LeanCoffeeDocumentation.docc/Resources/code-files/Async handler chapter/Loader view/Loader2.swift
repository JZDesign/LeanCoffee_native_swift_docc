
import SwiftUI

struct Loader: View {
    let isLoading: Bool

    var body: some View {
        if isLoading {
            ProgressView()
                .tint(.accentColor)
                .background(.green)
        } else {
            EmptyView()
        }
    }
}
