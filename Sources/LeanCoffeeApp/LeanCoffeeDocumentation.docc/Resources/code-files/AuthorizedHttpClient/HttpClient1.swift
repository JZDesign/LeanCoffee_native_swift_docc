import Foundation

class HttpClient {

    func createRequest<T: Codable>(
        fromURL url: URL,
        withBody body: T?,
        withHeaders headers: [String : String] = [:],
        withMethod method: HTTPMethod
    ) throws -> URLRequest {
        
        var request = URLRequest(url: url)
        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        
        request.httpMethod = method.allCaps
        
        if method == .post {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }

}
