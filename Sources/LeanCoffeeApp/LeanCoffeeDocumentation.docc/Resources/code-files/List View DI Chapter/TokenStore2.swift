import SwiftUI

class TokenStore: ObservableObject {
    var accessToken: AccessToken? = nil
}

struct TokenStoreKey: EnvironmentKey {
    static let defaultValue: TokenStore = .init()
}

