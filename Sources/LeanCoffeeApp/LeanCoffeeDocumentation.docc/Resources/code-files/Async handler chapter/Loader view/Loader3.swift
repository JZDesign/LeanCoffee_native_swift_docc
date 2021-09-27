
import SwiftUI

struct Loader: View {
    let isLoading: Bool

    var body: some View {
        if isLoading {
            ProgressView()
                .tint(.accentColor)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .background(.green)
        } else {
            EmptyView()
        }
    }
}
