import SwiftUI

class AuthorizedHttpClient: HttpClient {
    @Environment(\.tokenStore) var tokenStore: TokenStore

    override init() { super.init() }
    
    override func createRequest<T: Codable>(
        fromURL url: URL,
        withBody body: T?,
        withHeaders headers: [String : String] = [:],
        withMethod method: HTTPMethod
    ) throws -> URLRequest {
        var request = try super.createRequest(
            fromURL: url,
            withBody: body,
            withHeaders: headers,
            withMethod: method
        )
        
        request.addValue(
            "Bearer \(tokenStore.accessToken?.value ?? "")", forHTTPHeaderField: "Authorization"
        )
        return request
    }
}
