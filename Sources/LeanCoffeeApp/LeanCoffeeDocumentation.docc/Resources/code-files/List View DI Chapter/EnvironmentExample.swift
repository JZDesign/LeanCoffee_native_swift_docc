import SwiftUI

struct ExampleView: View {
    
    @EnvironmentObject var tokenStore: TokenStore
    @Environment(\.colorScheme) var colorScheme : ColorScheme
    
    var body: some View {
        EmptyView()
    }
}
