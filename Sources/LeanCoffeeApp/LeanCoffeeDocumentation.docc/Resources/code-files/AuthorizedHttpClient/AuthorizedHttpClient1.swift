import SwiftUI

class AuthorizedHttpClient: HttpClient {
    @Environment(\.tokenStore) var tokenStore: TokenStore

    override init() { super.init() }
}
