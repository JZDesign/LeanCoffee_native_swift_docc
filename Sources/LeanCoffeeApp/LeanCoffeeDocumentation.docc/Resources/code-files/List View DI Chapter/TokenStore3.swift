import SwiftUI

class TokenStore: ObservableObject {
    var accessToken: AccessToken? = nil
}

extension EnvironmentValues {
    var tokenStore: TokenStore {
        get { self[TokenStoreKey.self] }
        set { self[TokenStoreKey.self] = newValue }
    }
}

struct TokenStoreKey: EnvironmentKey {
    static let defaultValue: TokenStore = .init()
}

