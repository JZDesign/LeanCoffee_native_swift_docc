
import SwiftUI

struct Loader: View {
    let isLoading: Bool
    @Environment(\.colorScheme) var colorScheme : ColorScheme
    
    var background: some View {
        colorScheme == .dark ? Color.black : .white
    }

    var body: some View {
        if isLoading {
            ProgressView()
                .tint(.accentColor)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .background(background.opacity(0.85))
        } else {
            EmptyView()
        }
    }
}
